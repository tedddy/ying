SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/000001/type/S.phtml?year=', year,'&jidu=', quarter) AS 'hs_index_000001' FROM `ying`.`year_quarter` where year <= '2015';

SELECT * FROM `ying`.`hs_index_000001`;		
DROP TABLE `ying`.`hs_index_000001`;
CREATE TABLE `hs_index_000001` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code_index` VARCHAR(6)  NOT NULL COMMENT 'code_index',
  `date` date  NOT NULL COMMENT 'date',
  `open_index` decimal(8,3) unsigned DEFAULT NULL COMMENT 'open_index',
  `high_index` decimal(8,3) unsigned DEFAULT NULL COMMENT 'high_index',
  `low_index` decimal(8,3) unsigned DEFAULT NULL COMMENT 'low_index',
  `close_index` decimal(8,3) unsigned DEFAULT NULL COMMENT 'close_index',
  `volume_index` int(10) unsigned DEFAULT NULL COMMENT 'volume_index',
  `amount_index` int(10) unsigned DEFAULT NULL COMMENT 'amount_index',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code_index`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

ALTER TABLE `ying`.`hs_index_000001` 
CHANGE COLUMN `code_index` `code_index` VARCHAR(6) NOT NULL COMMENT 'code_index' ,
CHANGE COLUMN `date` `date` DATE NOT NULL COMMENT 'date' ;


-- USE `ying`;
-- 
-- DELIMITER $$
-- 
-- DROP TRIGGER IF EXISTS ying.hs_index_000001_BEFORE_INSERT$$
-- USE `ying`$$
-- CREATE DEFINER = CURRENT_USER TRIGGER `ying`.`hs_index_000001_BEFORE_INSERT` BEFORE INSERT ON `hs_index_000001` FOR EACH ROW
-- BEGIN
-- SET NEW.volume_index = round(NEW.volume_index * 0.00001);
-- SET NEW.amount_index = round(NEW.amount_index * 0.00001);
-- END
-- $$
-- DELIMITER ;
-- 
-- USE `ying`;
-- 
-- DELIMITER $$
-- 
-- USE `ying`$$
-- DROP TRIGGER IF EXISTS `ying`.`hs_index_000001_BEFORE_INSERT` $$
-- DELIMITER ;



DROP PROCEDURE `ying`.`hs_index_000001`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_index_000001`(IN code_index VARCHAR(18), date VARCHAR(18), open_index VARCHAR(18), high_index VARCHAR(18), low_index VARCHAR(18), close_index VARCHAR(18), volume_index bigint(15), amount_index bigint(15))
BEGIN
SET code_index = IF(code_index = '', NULL, code_index);
SET date = IF(date = '', NULL, date);
SET open_index = IF(open_index = '', NULL, open_index);
SET high_index = IF(high_index = '', NULL, high_index);
SET low_index = IF(low_index = '', NULL, low_index);
SET close_index = IF(close_index = '', NULL, close_index);
SET volume_index = IF(volume_index = '', NULL, round(volume_index * 0.00001));
SET amount_index = IF(amount_index = '', NULL, round(amount_index * 0.00001));

INSERT INTO `hs_index_000001` (`code_index`, `date`, `open_index`, `high_index`, `low_index`, `close_index`, `volume_index`, `amount_index`) VALUES (code_index, date, open_index, high_index, low_index, close_index, volume_index, amount_index) 
ON DUPLICATE KEY UPDate 
`code_index` = code_index,
`date` = date,
`open_index` = open_index,
`high_index` = high_index,
`low_index` = low_index,
`close_index` = close_index,
`volume_index` = volume_index,
`amount_index` = amount_index;
END$$
DELIMITER ;

CALL hs_index_000001('[标签:code_index]','[标签:date]','[标签:open_index]','[标签:high_index]','[标签:low_index]','[标签:close_index]','[标签:volume_index]','[标签:amount_index]')

/*
ying locoy project hs_index_000001

Steps:
1. change hs_index_000001
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
	
网址： http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/000001/type/S.phtml?year=2015&jidu=1
数据：
参考：
源码：

<td><div align="center">
			2005-03-31			</div></td>
			<td><div align="center">1168.828</div></td>
			<td><div align="center">1181.531</div></td>
			<td><div align="center">1181.236</div></td>
			<td class="tdr"><div align="center">1162.031</div></td>
			<td class="tdr"><div align="center">1043779000</div></td>
			<td class="tdr"><div align="center">5371672145</div></td>
			
<td><div align="center">
			2005-03-31			</div></td>
			<td><div align="center">1168.828</div></td>
			<td><div align="center">1181.531</div></td>
			<td><div align="center">1181.236</div></td>
			<td class="tdr"><div align="center">1162.031</div></td>
			<td class="tdr"><div align="center">1043779000</div></td>
			<td class="tdr"><div align="center">5371672145</div></td>	

<td><div align="center">
			[参数]			</div></td>
			<td><div align="center">[参数]</div></td>
			<td><div align="center">[参数]</div></td>
			<td><div align="center">[参数]</div></td>
			<td class="tdr"><div align="center">[参数]</div></td>
			<td class="tdr"><div align="center">[参数]</div></td>
			<td class="tdr"><div align="center">[参数]</div></td>		

[参数]
[参数1]: date
[参数2]: open_index
[参数3]: high_index
[参数4]: close_index
[参数5]: low_index
[参数6]: volume_index
[参数7]: amount_index

【code_index】：000001
【date】：2015-09-30
【open_index】：3052.841
【high_index】：3073.300
【low_index】：3039.742
【close_index】：3052.781
【volume_index】：14664244800
【amount_index】：156569190400

*/
