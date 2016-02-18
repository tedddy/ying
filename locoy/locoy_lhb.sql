/*
ying locoy project lhb

Steps:
1. change lhb
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
	
网址：http://data.eastmoney.com/stock/tradedetail.html
数据：view-source:http://data.eastmoney.com/stock/tradedetail.html
参考：
源码：

[参数]
[参数1]: ids 
[参数2]: dt;
*/

SELECT * FROM `ying_calc`.`lhb`;		
-- DROP TABLE `ying_calc`.`lhb`;

CREATE TABLE `ying_calc`.`lhb` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ids` CHAR(6) DEFAULT NULL COMMENT 'ids',
  `dt` DATE DEFAULT NULL COMMENT 'dt',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`ids`,`dt`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- DROP PROCEDURE `ying_calc`.`lhb`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`lhb`(IN ids VARCHAR(18), dt DATE)
BEGIN
	SET ids = IF(ids = '', NULL, ids);
	SET dt = IF(dt = '', NULL, dt);

	INSERT INTO `ying_calc`.`lhb` (`ids`, `dt`) VALUES (ids, dt) 
	ON DUPLICATE KEY UPDate 
		`ids` = ids,
		`dt` = dt;
END$$
DELIMITER ;

CALL `ying_calc`.`lhb`('[标签:ids]','[标签:dt]');