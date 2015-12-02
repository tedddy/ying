SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/', info.idi, '/type/S.phtml?year=', dt.year,'&jidu=', dt.quarter) AS 'index_xts_hst_sina_cur_quarter' FROM (SELECT MIN(`idi`) AS idi FROM `ying`.`index_info` GROUP BY `name_i`) as info join year_quarter as dt  where dt.year = year(curdate()) and dt.quarter = quarter(curdate());

-- 2015
SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/', info.idi, '/type/S.phtml?year=', dt.year,'&jidu=', dt.quarter) AS 'index_xts_hst_sina_2015' FROM (SELECT MIN(`idi`) AS idi FROM `ying`.`index_info` GROUP BY `name_i`) as info join year_quarter as dt  where dt.year = 2015;

-- url_index_xts_hst_sina_2012_2015
SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/', info.idi, '/type/S.phtml?year=', dt.year,'&jidu=', dt.quarter) AS 'index_xts_hst_sina_2012_2015' FROM (SELECT MIN(`idi`) AS idi FROM `ying`.`index_info` GROUP BY `name_i`) as info join year_quarter as dt  where year >= 2012 and year <= 2015;

SELECT * FROM `ying`.`index_xts_hst_sina`;		
-- DROP TABLE `ying`.`index_xts_hst_sina`;
CREATE TABLE `index_xts_hst_sina` (
  `idi` varchar(6) NOT NULL COMMENT 'index id',
  `dt` date NOT NULL COMMENT 'date',
  `open` decimal(7,2) unsigned DEFAULT NULL COMMENT 'open',
  `high` decimal(7,2) unsigned DEFAULT NULL COMMENT 'high',
  `low` decimal(7,2) unsigned DEFAULT NULL COMMENT 'low',
  `close` decimal(7,2) unsigned DEFAULT NULL COMMENT 'close',
  `volume` int(9) unsigned DEFAULT NULL COMMENT 'volume',
  `amount` int(9) unsigned DEFAULT NULL COMMENT 'amount',
  PRIMARY KEY (`idi`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- DROP PROCEDURE `ying`.`index_xts_hst_sina`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `index_xts_hst_sina`(IN idi VARCHAR(18), `dt` VARCHAR(18), open VARCHAR(18), high VARCHAR(18), low VARCHAR(18), close VARCHAR(18), volume bigint(15), amount bigint(15))
BEGIN
SET `idi` = IF(idi = '', NULL, idi);
SET `dt` = IF(`dt` = '', NULL, `dt`);
SET `open` = IF(open = '', NULL, round(open,2));
SET `high` = IF(high = '', NULL, round(high,2));
SET `low` = IF(low = '', NULL, round(low,2));
SET `close` = IF(close = '', NULL, round(close,2));
SET `volume` = IF(volume = '', NULL, round(volume * 0.0001));
SET `amount` = IF(amount = '', NULL, round(amount * 0.0001));

INSERT INTO `index_xts_hst_sina` (`idi`, `dt`, `open`, `high`, `low`, `close`, `volume`, `amount`) VALUES (idi, `dt`, open, high, low, close, volume, amount) 
ON DUPLICATE KEY UPDate
	`open` = open,
	`high` = high,
	`low` = low,
	`close` = close,
	`volume` = volume,
	`amount` = amount;
END$$
DELIMITER ;


CALL index_xts_hst_sina('[标签:idi]','[标签:`dt`]','[标签:open]','[标签:high]','[标签:low]','[标签:close]','[标签:volume]','[标签:amount]');

/*
ying locoy project index_xts_hst_sina

Steps:
1. change index_xts_hst_sina
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