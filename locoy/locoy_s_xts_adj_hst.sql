-- url_s_xts_adj_hst_sina_2015, used in Project hs_s_xts_histroy_sina_2015
SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_FuQuanMarketHistory/stockid/', s.code, '.phtml?year=', date.year,'&jidu=', date.quarter) AS 'url_s_xts_adj_hst_sina_2015' FROM hs_s AS s JOIN year_quarter AS date  WHERE s.fW > 0 AND year = 2015 AND CONCAT(YEAR(s.pDate), QUARTER(s.pDate)) <= CONCAT(date.year, date.quarter);

-- url_s_xts_adj_hst_sina_missing, used in Project hs_s_xts_histroy_sina_missing
SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_FuQuanMarketHistory/stockid/', s.code, '.phtml?year=', date.year,'&jidu=', date.quarter) AS 'url_s_xts_adj_hst_sina_missing_151025' FROM hs_s AS s JOIN year_quarter AS date  WHERE s.fW > 0 AND s.code IN (SELECT DISTINCT ids FROM `ying`.`s_xts_adj_hst_sina` WHERE high > 9999 ORDER BY `ids`, `d` DESC) AND year IN (2013,2014,2015) AND CONCAT(YEAR(s.pDate), QUARTER(s.pDate)) <= CONCAT(date.year, date.quarter);

SELECT * FROM `ying`.`s_xts_adj_hst_sina`;		
-- DROP TABLE `ying`.`s_xts_adj_hst_sina`;
CREATE TABLE `s_xts_adj_hst_sina` (
  `ids` varchar(6) NOT NULL COMMENT 'stock id 股票代码',
  `d` date NOT NULL DEFAULT '0000-00-00' COMMENT 'trade date 交易日期',
  `open` decimal(10,3) unsigned NOT NULL COMMENT 'open 开盘价',
  `high` decimal(10,3) unsigned NOT NULL COMMENT 'high 最高价',
  `low` decimal(10,3) unsigned NOT NULL COMMENT 'low 最低价',
  `close` decimal(10,3) unsigned NOT NULL COMMENT 'close 收盘价',
  `volume` int(11) unsigned NOT NULL COMMENT 'volume 成交量',
  `amount` bigint(12) unsigned NOT NULL COMMENT 'amount 股票成交额',
  `fa` decimal(10,3) unsigned NOT NULL DEFAULT '0.000' COMMENT 'fa 复权因子 (factor for adjusted close)',
  PRIMARY KEY (`ids`,`d`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- DROP PROCEDURE `ying`.`s_xts_adj_hst_sina`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `s_xts_adj_hst_sina`(IN ids VARCHAR(6), d DATE, open DECIMAL(10,3) UNSIGNED, high DECIMAL(10,3) UNSIGNED, low DECIMAL(10,3) UNSIGNED, close DECIMAL(10,3) UNSIGNED, volume DECIMAL(15,3) UNSIGNED, amount DECIMAL(16,3) UNSIGNED, fa DECIMAL(10,3) UNSIGNED)

BEGIN
	SET `ids` = IF(ids = '', NULL, ids);
	SET `d` = IF(d = '', NULL, d);
	SET `open` = IF(open = '', NULL, open);
	SET `high` = IF(high = '', NULL, high);
	SET `low` = IF(low = '', NULL, low);
	SET `close` = IF(close = '', NULL, close);
	SET `volume` = IF(volume = '', NULL, ROUND(volume * 0.01)); -- 单位：手
	SET `amount` = IF(amount = '', NULL, ROUND(amount * 0.0001)); -- 单位：万元
	SET `fa` = IF(fa = '', NULL, fa);
    -- SET `fa` = IF(fa = '', NULL, CASE WHEN fa > 4000 THEN ROUND(fa) WHEN fa > 1000 THEN ROUND(fa, 1) WHEN fa > 100 THEN ROUND(fa, 2) ELSE fa END);

	IF volume > 0 AND volume IS NOT NULL THEN
		INSERT INTO `s_xts_adj_hst_sina` (`ids`, `d`, `open`, `high`, `low`, `close`, `volume`, `amount`, `fa`) VALUES (ids, d, open, high, low, close, volume, amount, fa) 
		ON DUPLICATE KEY UPDATE
			`open` = open,
			`high` =high,
			`low` = low,
			`close` = close,
			`volume` = volume,
			`amount` = amount,
			`fa` = fa;
	END IF;
END$$
DELIMITER ;

CALL s_xts_adj_hst_sina('[标签:ids]','[标签:d]','[标签:open]','[标签:high]','[标签:low]','[标签:close]','[标签:volume]','[标签:amount]','[标签:fa]');

/*
ying locoy project s_xts_adj_hst_sina
	
网址： http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_FuQuanMarketHistory/stockid/601318.phtml?year=2015&jidu=4
数据：
参考：
源码：
		<a target='_blank' href='http://vip.stock.finance.sina.com.cn/quotes_service/view/vMS_tradehistory.php?symbol=sh601318&date=2015-10-23'>
					2015-10-23						</a>
						</div></td>
			<td><div align="center">73.008</div></td>
			<td><div align="center">75.220</div></td>
			<td><div align="center">74.623</div></td>
			<td class="tdr"><div align="center">72.919</div></td>
			<td class="tdr"><div align="center">99386424.000</div></td>
			<td class="tdr"><div align="center">3324918272.000</div></td>
			<td class="tdr"><div align="center">2.212</div></td>
			
		<a target='_blank' href='http://vip.stock.finance.sina.com.cn/quotes_service/view/vMS_tradehistory.php?symbol=(*)&date=[参数]'>
					(*)						</a>
						</div></td>
			<td><div align="center">[参数]</div></td>
			<td><div align="center">[参数]</div></td>
			<td><div align="center">[参数]</div></td>
			<td class="tdr"><div align="center">[参数]</div></td>
			<td class="tdr"><div align="center">[参数]</div></td>
			<td class="tdr"><div align="center">[参数]</div></td>
			<td class="tdr"><div align="center">[参数]</div></td>

[参数]
[参数1]: d 日期
[参数2]: open
[参数3]: high
[参数4]: close 收盘价
[参数5]: low
[参数6]: volume
[参数7]: amount
[参数8]: fa 复权因子 (factor for adjusted close)
*/