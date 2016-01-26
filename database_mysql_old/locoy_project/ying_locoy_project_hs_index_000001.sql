-- the urls for data collectoin of `hs_index_000001`
SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/000001/type/S.phtml?year=', year,'&jidu=', quarter) AS 'hs_index_000001' FROM `ying`.`year_quarter` where year >= '2007' and year <= '2015';


SELECT * FROM `ying`.`hs_index_000001`;		
CREATE TABLE `hs_index_000001` (
  `date` date NOT NULL COMMENT 'date',
  `open_index` decimal(8,3) unsigned DEFAULT NULL COMMENT 'open_index',
  `high_index` decimal(8,3) unsigned DEFAULT NULL COMMENT 'high_index',
  `low_index` decimal(8,3) unsigned DEFAULT NULL COMMENT 'low_index',
  `close_index` decimal(8,3) unsigned DEFAULT NULL COMMENT 'close_index',
  `volume_index` int(10) unsigned DEFAULT NULL COMMENT 'volume_index',
  `amount_index` int(10) unsigned DEFAULT NULL COMMENT 'amount_index',
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `code_index` varchar(6) NOT NULL COMMENT 'code_index',
  `m5` decimal(8,3) DEFAULT NULL COMMENT 'moving average',
  `m10` decimal(8,3) DEFAULT NULL COMMENT 'moving average',
  `m20` decimal(8,3) DEFAULT NULL COMMENT 'moving average',
  `m30` decimal(8,3) DEFAULT NULL COMMENT 'moving average',
  `m60` decimal(8,3) DEFAULT NULL COMMENT 'moving average',
  `m120` decimal(8,3) DEFAULT NULL COMMENT 'moving average',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code_index`,`date`),
  UNIQUE KEY `date_UNIQUE` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=2611 DEFAULT CHARSET=utf8;


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
`id` = id,
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

CALL hs_index_000001('[标签:code_index]','[标签:date]','[标签:open_index]','[标签:high_index]','[标签:low_index]','[标签:close_index]','[标签:volume_index]','[标签:amount_index]');

-- 5 days moving average, updated in field m5
CALL `hs_index_000001_m_all_by_id`(); -- 0 row(s) affected, 1 warning(s): 1329 No data - zero rows fetched, selected, or processed

DROP PROCEDURE `hs_index_000001_m_all_by_id`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_index_000001_m_all_by_id`()
BEGIN

    DECLARE mv5 DOUBLE;
    DECLARE mv10 DOUBLE;
    DECLARE mv20 DOUBLE;
    DECLARE mv30 DOUBLE;
    DECLARE mv60 DOUBLE;
    DECLARE mv120 DOUBLE;
    DECLARE t INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur_t CURSOR FOR
         SELECT DISTINCT id FROM `ying`.`hs_index_000001`
         ORDER BY id;	    
    DECLARE cur_mv5 CURSOR FOR
         SELECT AVG(close_index) FROM `ying`.`hs_index_000001`
         WHERE id >= (t - (5-1)) AND id <= t;	    
    DECLARE cur_mv10 CURSOR FOR
         SELECT AVG(close_index) FROM `ying`.`hs_index_000001`
         WHERE id >= (t - (10-1)) AND id <= t; 
    DECLARE cur_mv20 CURSOR FOR
         SELECT AVG(close_index) FROM `ying`.`hs_index_000001`
         WHERE id >= (t - (20-1)) AND id <= t;	    
    DECLARE cur_mv30 CURSOR FOR
         SELECT AVG(close_index) FROM `ying`.`hs_index_000001`
         WHERE id >= (t - (30-1)) AND id <= t; 
    DECLARE cur_mv60 CURSOR FOR
         SELECT AVG(close_index) FROM `ying`.`hs_index_000001`
         WHERE id >= (t - (60-1)) AND id <= t;	    
    DECLARE cur_mv120 CURSOR FOR
         SELECT AVG(close_index) FROM `ying`.`hs_index_000001`
         WHERE id >= (t - (120-1)) AND id <= t;
         -- Here you define the interval of your MV.
         -- If you want a mv_length-day MV, then the interval is between t-(mv_length - 1)s and t         
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
    
    OPEN cur_t;
    LOOP_ID: LOOP
        FETCH cur_t INTO t;
        IF NOT done THEN
            OPEN cur_mv5;
            FETCH cur_mv5 INTO mv5;
            CLOSE cur_mv5;
            UPDATE `ying`.`hs_index_000001`
                SET m5 = mv5
                WHERE id=t;
            OPEN cur_mv10;
            FETCH cur_mv10 INTO mv10;
            CLOSE cur_mv10;
            UPDATE `ying`.`hs_index_000001`
                SET m10 = mv10
                WHERE id=t;
            OPEN cur_mv20;
            FETCH cur_mv20 INTO mv20;
            CLOSE cur_mv20;
            UPDATE `ying`.`hs_index_000001`
                SET m20 = mv20
                WHERE id=t;
            OPEN cur_mv30;
            FETCH cur_mv30 INTO mv30;
            CLOSE cur_mv30;
            UPDATE `ying`.`hs_index_000001`
                SET m30 = mv30
                WHERE id=t;
            OPEN cur_mv60;
            FETCH cur_mv60 INTO mv60;
            CLOSE cur_mv60;
            UPDATE `ying`.`hs_index_000001`
                SET m60 = mv60
                WHERE id=t;
            OPEN cur_mv120;
            FETCH cur_mv120 INTO mv120;
            CLOSE cur_mv120;
            UPDATE `ying`.`hs_index_000001`
                SET m120 = mv120
                WHERE id=t;
        ELSE
            LEAVE LOOP_ID;
        END IF;
    END LOOP LOOP_ID;
    CLOSE cur_t;
END$$
DELIMITER ;

-- 5 days moving average, updated in field m5
CALL `hs_index_000001_m5_by_id`(5); -- 0 row(s) affected, 1 warning(s): 1329 No data - zero rows fetched, selected, or processed

DROP PROCEDURE `hs_index_000001_m5_by_id`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_index_000001_m5_by_id`(IN mv_length int(3))
BEGIN

    DECLARE mv DOUBLE;
    DECLARE t INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur_t CURSOR FOR
         SELECT DISTINCT id FROM `ying`.`hs_index_000001`
         ORDER BY id;	    
    DECLARE cur_mv CURSOR FOR
         SELECT AVG(close_index) FROM `ying`.`hs_index_000001`
         WHERE id >= (t - (mv_length - 1)) AND id <= t;
         -- Here you define the interval of your MV.
         -- If you want a mv_length-day MV, then the interval is between t-(mv_length - 1)s and t         
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
    
    OPEN cur_t;
    LOOP_ID: LOOP
        FETCH cur_t INTO t;
        IF NOT done THEN
            OPEN cur_mv;
            FETCH cur_mv INTO mv;
            CLOSE cur_mv;
            UPDATE `ying`.`hs_index_000001`
                SET m5 = mv
                WHERE id=t;
        ELSE
            LEAVE LOOP_ID;
        END IF;
    END LOOP LOOP_ID;
    CLOSE cur_t;
END$$
DELIMITER ;


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
					<a target='_blank' href='http://vip.stock.finance.sina.com.cn/quotes_service/view/vMS_tradehistory.php?symbol=sh000001&date=2015-09-30'>
			2015-09-30			</a>
						</div></td>
			<td><div align="center">3052.841</div></td>
			<td><div align="center">3073.300</div></td>
			<td><div align="center">3052.781</div></td>
			<td class="tdr"><div align="center">3039.742</div></td>
			<td class="tdr"><div align="center">14664244800</div></td>
			<td class="tdr"><div align="center">156569190400</div></td>
		  
			<td><div align="center">
					<a target='_blank' href='http://vip.stock.finance.sina.com.cn/quotes_service/view/vMS_tradehistory.php?symbol=(*)&date=[参数]'>
			(*)			</a>
						</div></td>
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
