select s.code, date.year, date.quarter from hs_s as s join year_quarter as date;

select count(*) from hs_s as s join year_quarter as date;

select count(*) from hs_s;

SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/', s.code, '.phtml?year=', dt.year,'&jidu=', dt.quarter) AS 'hs_s_xts_history_sina_current' FROM hs_s as s join year_quarter as dt  where dt.year = year(curdate()) and dt.quarter = quarter(curdate());

SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/', idi.code_index, '/type/S.phtml?year=', date.year,'&jidu=', date.quarter) AS 'hs_index_xts_history_sina_2012_2015' FROM (SELECT MIN(`code_index`) AS code_index FROM `ying`.`hs_index_info` GROUP BY `name_index`) as idi join year_quarter as date  where s.fW > 0 AND year > 2011 and year <= '2015';

SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/', s.code, '.phtml?year=', date.year,'&jidu=', date.quarter) AS 'hs_s_xts_history_sina' FROM hs_s as s join year_quarter as date  where s.fW > 0 AND date.year <= '2015';

-- tedd: 只采集股票发行后的季度：concat(year(s.pDate), quarter(s.pDate)) <= concat(date.year, date.quarter) 
SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/', s.code, '.phtml?year=', date.year,'&jidu=', date.quarter) AS 'hs_s_xts_history_sina' FROM hs_s as s join year_quarter as date  where s.fW > 0 AND date.year <= '2015' and concat(year(s.pDate), quarter(s.pDate)) <= concat(date.year, date.quarter);

SELECT count(*) FROM hs_s as s join year_quarter as date  where s.fW > 0 AND date.year <= '2015' and concat(year(s.pDate), quarter(s.pDate)) <= concat(date.year, date.quarter);

-- url_hs_s_xts_history_sina_2015, used in Project hs_s_xts_histroy_sina_2015
SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/', s.code, '.phtml?year=', date.year,'&jidu=', date.quarter) AS 'hs_s_xts_history_sina_2015' FROM hs_s as s join year_quarter as date  where s.fW > 0 AND year = 2015 and concat(year(s.pDate), quarter(s.pDate)) <= concat(date.year, date.quarter);

SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/', s.code, '.phtml?year=', date.year,'&jidu=', date.quarter) AS 'hs_s_xts_history_sina_3' FROM hs_s as s join year_quarter as date  where s.fW > 0 AND year > 2011 and year <= '2015' and concat(year(s.pDate), quarter(s.pDate)) <= concat(date.year, date.quarter);

SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/', s.code, '.phtml?year=', date.year,'&jidu=', date.quarter) AS 'hs_s_xts_history_sina_2' FROM hs_s as s join year_quarter as date  where s.fW > 0 AND year > 2008 AND year <= '2011' and concat(year(s.pDate), quarter(s.pDate)) <= concat(date.year, date.quarter);

-- hs_s_xts_history_sina_1, used in Project hs_s_xts_histroy_sina_before_2007
SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/', s.code, '.phtml?year=', date.year,'&jidu=', date.quarter) AS 'hs_s_xts_history_sina_1' FROM hs_s as s join year_quarter as date  where s.fW > 0 AND year <= '2006' and concat(year(s.pDate), quarter(s.pDate)) <= concat(date.year, date.quarter);

SELECT * FROM `ying`.`hs_s_xts_history_sina`;		
DROP TABLE `ying`.`hs_s_xts_history_sina`;
CREATE TABLE `hs_s_xts_history_sina` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(6)  NOT NULL COMMENT 'code',
  `date` date  NOT NULL COMMENT 'date',
  `open` decimal(8,3) unsigned DEFAULT NULL COMMENT 'open',
  `high` decimal(8,3) unsigned DEFAULT NULL COMMENT 'high',
  `low` decimal(8,3) unsigned DEFAULT NULL COMMENT 'low',
  `close` decimal(8,3) unsigned DEFAULT NULL COMMENT 'close',
  `volume` int(10) unsigned DEFAULT NULL COMMENT 'volume',
  `amount` int(10) unsigned DEFAULT NULL COMMENT 'amount',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

ALTER TABLE `ying`.`hs_s_xts_history_sina` 
CHANGE COLUMN `code` `code` VARCHAR(6) NOT NULL COMMENT 'code' ,
CHANGE COLUMN `date` `date` DATE NOT NULL COMMENT 'date' ;



DROP PROCEDURE `ying`.`hs_s_xts_history_sina`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_xts_history_sina`(IN code VARCHAR(18), date VARCHAR(18), open VARCHAR(18), high VARCHAR(18), low VARCHAR(18), close VARCHAR(18), volume bigint(15), amount bigint(15))
BEGIN
SET code = IF(code = '', NULL, code);
SET date = IF(date = '', NULL, date);
SET open = IF(open = '', NULL, open);
SET high = IF(high = '', NULL, high);
SET low = IF(low = '', NULL, low);
SET close = IF(close = '', NULL, close);
SET volume = IF(volume = '', NULL, round(volume * 0.01)); -- 单位：手
SET amount = IF(amount = '', NULL, round(amount * 0.0001)); -- 单位：万元

INSERT INTO `hs_s_xts_history_sina` (`code`, `date`, `open`, `high`, `low`, `close`, `volume`, `amount`) VALUES (code, date, open, high, low, close, volume, amount) 
ON DUPLICATE KEY UPDate 
`code` = code,
`date` = date,
`open` = open,
`high` = high,
`low` = low,
`close` = close,
`volume` = volume,
`amount` = amount;
END$$
DELIMITER ;

CALL hs_s_xts_history_sina('[标签:code]','[标签:date]','[标签:open]','[标签:high]','[标签:low]','[标签:close]','[标签:volume]','[标签:amount]')

/*
ying locoy project hs_s_xts_history_sina

Steps:
1. change hs_s_xts_history_sina
2. change labels by replacing one by one.
	2.1 note: step 2 and step 3 can be done at the same time to save time
3. create table and setup mysql procedure
	3.1 note: add unique statement: UNIQUE KEY `UniqueKeyName` (``,``,``)
	3.2 note: change the data type of each field & change the length of VARCHAR
	3.3 note: for each field of the table, make a good comment including a standardized and consistant field, and the original label in the datasource. 
4. setup locoy project: 192.168.137.172 gxh locoy ying
	4.1 数据库地址：C:\火车采集器V8\Data\(*)\SpiderResult.db3
5. test
	5.1 note: test with a few records
	
网址： http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/600000.phtml?year=2015&jidu=1
数据：
参考：
源码：

<td><div align="center">
					<a target='_blank' href='http://vip.stock.finance.sina.com.cn/quotes_service/view/vMS_tradehistory.php?symbol=(*)&date=2015-03-27'>
			2015-03-27			</a>
						</div></td>
			<td><div align="center">15.320</div></td>
			<td><div align="center">15.550</div></td>
			<td><div align="center">15.360</div></td>
			<td class="tdr"><div align="center">15.170</div></td>
			<td class="tdr"><div align="center">218174976</div></td>
			<td class="tdr"><div align="center">3350088448</div></td>
		  
<td><div align="center">
					<a target='_blank' href='http://vip.stock.finance.sina.com.cn/quotes_service/view/vMS_tradehistory.php?symbol=sh600000&date=2015-03-27'>
			2015-03-27			</a>
						</div></td>
			<td><div align="center">15.320</div></td>
			<td><div align="center">15.550</div></td>
			<td><div align="center">15.360</div></td>
			<td class="tdr"><div align="center">15.170</div></td>
			<td class="tdr"><div align="center">218174976</div></td>
			<td class="tdr"><div align="center">3350088448</div></td>

[参数]
[参数1]: date
[参数2]: open
[参数3]: high
[参数4]: close
[参数5]: low
[参数6]: volume
[参数7]: amount

【code_index】：
【date】：2015-03-31
【open_index】：16.480
【high_index】：16.580
【low_index】：15.740
【close_index】：15.790
【volume_index】：494049248
【amount_index】：7990395392


*/
