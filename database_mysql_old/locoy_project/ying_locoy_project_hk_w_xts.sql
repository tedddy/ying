

SELECT * FROM `ying`.`hk_w_xts`;		
-- DROP TABLE `ying`.`hk_w_xts`;
CREATE TABLE `hk_w_xts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL COMMENT '代码id; code id in table hk_w and in table hk_s',
  `date` date DEFAULT NULL COMMENT '交易日期; trade date',
  `open` decimal(7,3) unsigned DEFAULT NULL COMMENT '开盘价',
  `high` decimal(7,3) unsigned DEFAULT NULL COMMENT '最高价',
  `low` decimal(7,3) unsigned DEFAULT NULL COMMENT '最低价',
  `close` decimal(7,3) unsigned DEFAULT NULL COMMENT '收盘价',
  `volume` int(11) unsigned DEFAULT NULL COMMENT '成交量',
  `turnover` int(11) unsigned DEFAULT NULL COMMENT '成交量',
  `fR` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Result of data collection\n0: fail; 1: success',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_date` (`code`,`date`),
  CONSTRAINT `FK_hk_w_xts_hk_w` FOREIGN KEY (`code`) REFERENCES `hk_w_xts` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- DROP PROCEDURE `ying`.`hk_w_xts`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hk_w_xts`(IN code VARCHAR(6), date DATE, open DECIMAL(7,3), high DECIMAL(7,3), low DECIMAL(7,3), close DECIMAL(7,3), volume INT(10) UNSIGNED, turnover INT(10) UNSIGNED)
BEGIN
SET code = IF(code = '', NULL, code);
SET date = IF(date = '', NULL, Date);
SET open = IF(open = '', NULL, open);
SET high = IF(high = '', NULL, high);
SET low = IF(low = '', NULL, low);
SET close = IF(close = '', NULL, close);
SET volume = IF(volume = '', NULL, volume);
SET turnover = IF(turnover = '', NULL, turnover);

INSERT INTO `hk_w_xts` (`code`, `date`, `open`, `high`, `low`, `close`, `volume`, `turnover`) VALUES (code, date, open, high, low, close, volume, turnover) 
ON DUPLICATE KEY UPDate
	`open` = open,
	`high` = high,
	`low` = low,
	`close` = close,
	`volume` = volume,
	`turnover` = turnover;
END$$
DELIMITER ;


CALL hk_w_xts('[标签:code]', '[标签:date]', '[标签:open]', '[标签:high]', '[标签:low]', '[标签:close]', '[标签:volume]', '[标签:turnover]') 


/*
ying locoy project hk_w_xts

Steps:
1. change hk_w_xts
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
	
网址：
数据：
参考：

[参数]
[参数1]: 
[参数2]: 
[参数3]: 
[参数4]: 
[参数5]: 
[参数6]: 
[参数7]: 
[参数8]: 
[参数9]: 
[参数10]: 
[参数11]: 
[参数12]: 
[参数13]: 
[参数14]: 
[参数15]: 
[参数16]: 
[参数17]: 
[参数18]: 
[参数19]: 
[参数]:DateSys
[参数]:TimeSys;
*/

/*
ying locoy project hk_w_xts

Steps:
1. change hk_w
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
	
网址：
数据：
参考：

[参数]
[参数1]: 
[参数2]: 
[参数3]: 
[参数4]: 
[参数5]: 
[参数6]: 
[参数7]: 
[参数8]: 
[参数9]: 
[参数10]: 
[参数11]: 
[参数12]: 
[参数13]: 
[参数14]: 
[参数15]: 
[参数16]: 
[参数17]: 
[参数18]: 
[参数19]: 
[参数]:DateSys
[参数]:TimeSys;
*/