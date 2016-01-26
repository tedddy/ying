-- 网址：http://vip.stock.finance.sina.com.cn/quotes_service/view/hk_warrant_search.php?stock_symbol=&publisher=&class=a

SELECT * FROM `ying`.`hk_w`;		
-- DROP TABLE `ying`.`hk_w`;
CREATE TABLE `hk_w` (
  `code` varchar(5) NOT NULL COMMENT 'HK warrant code',
  `uCode` varchar(5) DEFAULT NULL COMMENT 'underlining code',
  `enName` varchar(18) DEFAULT NULL COMMENT 'english name',
  `name` varchar(18) DEFAULT NULL COMMENT 'chinese name',
  `nature` tinyint(1) NOT NULL COMMENT 'call->1 and put-> 0',
  `strike` decimal(7,3) NOT NULL COMMENT 'strike price',
  `cRatio` decimal(4,2) DEFAULT NULL COMMENT 'conversion rate',
  `pDate` date DEFAULT NULL COMMENT 'publish date',
  `eDate` date DEFAULT NULL COMMENT 'expiry date',
  `publisher` varchar(10) DEFAULT NULL,
  `fW` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: never watch; 1: watch daily; 2: watch hourly; 3: watch every 20 min; 4: watch every 10 min; 5: watch every 5 min; 8: hold for mid or short term; 9: hold for long term',
  `fD` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Delete 0: Delete from database; 1: don''t collect data anymore; ',
  `dateSys` date DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- DROP PROCEDURE `ying`.`hk_w`;
DELIMITER $$
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hk_w`(IN code VARCHAR(18), uCode VARCHAR(18), enName VARCHAR(18), name VARCHAR(18), nature VARCHAR(18), strike VARCHAR(18), cRatio VARCHAR(18), pDate VARCHAR(18), eDate VARCHAR(18), publisher VARCHAR(18), dateSys DATE)
BEGIN
SET code = IF(code = '', NULL, code);
SET uCode = IF(uCode = '', NULL, uCode);
SET enName = IF(enName = '', NULL, enName);
SET name = IF(name = '', NULL, name);
SET nature = IF(nature = '', NULL, nature);
SET strike = IF(strike = '', NULL, strike);
SET cRatio = IF(cRatio = '', NULL, cRatio);
SET pDate = IF(pDate = '', NULL, pDate);
SET eDate = IF(eDate = '', NULL, eDate);
SET publisher = IF(publisher = '', NULL, publisher);
SET DateSys = CURDATE();

INSERT INTO `hk_w` (`code`, `uCode`, `enName`, `name`, `nature`, `strike`, `cRatio`, `pDate`, `eDate`, `publisher`, `DateSys`) VALUES (code, uCode, enName, name, nature, strike, cRatio, pDate, eDate, publisher, DateSys) 
ON DUPLICATE KEY UPDate 
`uCode` = uCode,
`enName` = enName,
`name` = name,
`nature` = nature,
`strike` = strike,
`cRatio` = cRatio,
`pDate` = pDate,
`eDate` = eDate,
`publisher` = publisher,
`DateSys` = DateSys;
END$$
DELIMITER ;

CALL hk_w('[标签:code]','[标签:uCode]','','[标签:name]','[标签:nature]','[标签:strike]','[标签:cRatio]','[标签:pDate]','[标签:eDate]','[标签:publisher]','')

/*
ying locoy project hk_w

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