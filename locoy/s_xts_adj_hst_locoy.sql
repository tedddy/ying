-- url_s_xts_adj_hst_sina_2015, used in Project hs_s_xts_histroy_sina_2015
SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_FuQuanMarketHistory/stockid/', s.code, '.phtml?year=', date.year,'&jidu=', date.quarter) AS 'url_s_xts_adj_hst_sina_2015' FROM hs_s as s join year_quarter as date  where s.fW > 0 AND year = 2015 and concat(year(s.pDate), quarter(s.pDate)) <= concat(date.year, date.quarter);

SELECT * FROM `ying`.`s_xts_adj_hst_sina`;		
-- DROP TABLE `ying`.`s_xts_adj_hst_sina`;
CREATE TABLE `s_xts_adj_hst_sina` (
  `ids` VARCHAR(6) NOT NULL COMMENT 'stock id 股票代码',
  `d` DATE DEFAULT NULL COMMENT 'trade date 交易日期',
  `open` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'open 开盘价',
  `high` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'high 最高价',
  `low` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'low 最低价',
  `close` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'close 收盘价',
  `volume` INT(11) UNSIGNED NOT NULL COMMENT 'volume 成交量',
  `amount` BIGINT(12) UNSIGNED NOT NULL COMMENT 'amount 股票成交额',
  `fa` DECIMAL(7,3) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT 'fa 复权因子 (factor for adjusted close)',
  PRIMARY KEY (`ids`,`d`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

-- DROP PROCEDURE `ying`.`s_xts_adj_hst_sina`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `s_xts_adj_hst_sina`(IN ids VARCHAR(6), d DATE, open DECIMAL(7,3) UNSIGNED, high DECIMAL(7,3) UNSIGNED, low DECIMAL(7,3) UNSIGNED, close DECIMAL(7,3) UNSIGNED, volume DECIMAL(15,3) UNSIGNED, amount DECIMAL(16,3) UNSIGNED, fa DECIMAL(7,3) UNSIGNED)

BEGIN
	SET `ids` = IF(ids = '', NULL, ids);
	SET `d` = IF(d = '', NULL, d);
	SET `open` = IF(open = '', NULL, open);
	SET `high` = IF(high = '', NULL, high);
	SET `low` = IF(low = '', NULL, low);
	SET `close` = IF(close = '', NULL, close);
	SET `volume` = IF(volume = '', NULL, round(volume * 0.01)); -- 单位：手
	SET `amount` = IF(amount = '', NULL, round(amount * 0.0001)); -- 单位：万元
	SET `fa` = IF(fa = '', NULL, fa);

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