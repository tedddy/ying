DROP TABLE `ying`.`hs_s_rt_EM_test`;
CREATE TABLE `hs_s_rt_EM_test` (
  `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_sub` MEDIUMINT(8) UNSIGNED DEFAULT NULL,
  `code` VARCHAR(6) DEFAULT NULL COMMENT 'code',
  `close` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close',
  `amount` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount',
  `volume` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume',
  `chgrate` DECIMAL(5,2) DEFAULT NULL COMMENT 'chgrate',
  `WeiBi` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi',
  `chgrate5` DECIMAL(5,2) DEFAULT NULL COMMENT 'chgrate5',
  `LiangBi` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi',
  `date` DATE DEFAULT NULL COMMENT 'date',
  `time` TIME DEFAULT NULL COMMENT 'time',
  `TimeSlot` DATETIME DEFAULT NULL,
  `m5` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT '5日均线',
  `m10` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT '10日均线',
  `m20` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT '20日均线',
  `m30` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT '30日均线',
  `m60` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT '60日均线',
  `m120` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT '120日均线',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code`,`TimeSlot`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

-- 增加moving average列
ALTER TABLE `ying`.`hs_s_rt_EM_test` 
ADD COLUMN `m5` DECIMAL(6,2) UNSIGNED NULL DEFAULT NULL COMMENT '5日均线' AFTER `TimeSlot`,
ADD COLUMN `m10` DECIMAL(6,2) UNSIGNED NULL DEFAULT NULL COMMENT '10日均线' AFTER `TimeSlot`,
ADD COLUMN `m20` DECIMAL(6,2) UNSIGNED NULL DEFAULT NULL COMMENT '20日均线' AFTER `TimeSlot`,
ADD COLUMN `m30` DECIMAL(6,2) UNSIGNED NULL DEFAULT NULL COMMENT '30日均线' AFTER `TimeSlot`,
ADD COLUMN `m60` DECIMAL(6,2) UNSIGNED NULL DEFAULT NULL COMMENT '60日均线' AFTER `TimeSlot`,
ADD COLUMN `m120` DECIMAL(6,2) UNSIGNED NULL DEFAULT NULL COMMENT '120日均线' AFTER `TimeSlot`;


DROP PROCEDURE `hs_s_rt_EM_test`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_rt_EM_test`(IN code VARCHAR(18), close VARCHAR(18), amount VARCHAR(18), volume VARCHAR(18), chgrate VARCHAR(18), WeiBi VARCHAR(18), chgrate5 VARCHAR(18), LiangBi VARCHAR(18), date VARCHAR(18), time VARCHAR(18), TimeSlot DATETIME, m5 DECIMAL(6,2))
BEGIN

DECLARE loop_cnt INT; -- variable for loop counter
DECLARE record_not_found INTEGER DEFAULT 0;
DECLARE SMA_SUM DECIMAL(8,2); -- variable for total of price of days
DECLARE close_tmp DECIMAL(6,2); -- variable for cursor fetch into
DECLARE cur_close CURSOR FOR
	 SELECT close FROM `ying`.`hs_s_rt_EM_test` WHERE `code` = code ORDER BY TimeSlot desc;	
DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_not_found = 1;-- initialize variables for use in procedure
SET loop_cnt = 0;
SET  SMA_SUM = 0.0;
open cur_close;
	the_loop: LOOP
		FETCH cur_close into close_tmp;
        set loop_cnt = loop_cnt + 1; -- increment the loop counter
        IF loop_cnt > 4 THEN
		LEAVE the_loop;
		END IF;
		IF record_not_found THEN
		  LEAVE the_loop;
		END IF;
		SET SMA_SUM = SMA_SUM + close_tmp; -- add the sum to SMA_SUM
	END LOOP the_loop;
	SET SMA_SUM = ROUND(((SMA_SUM + close_tmp) / 5),2);
close cur_close;
SET m5 = SMA_SUM;
SET code = IF(code = '', NULL, code);
SET close = IF(close = '', NULL, close);
SET amount = IF(amount = '', NULL, amount);
SET volume = IF(volume = '', NULL, volume);
SET chgrate = IF(chgrate = '', NULL, chgrate);
SET WeiBi = IF(WeiBi = '', NULL, WeiBi);
SET chgrate5 = IF(chgrate5 = '', NULL, chgrate5);
SET LiangBi = IF(LiangBi = '', NULL, LiangBi);
SET date = IF(date = '', NULL, date);
SET time = IF(time = '', NULL, time);
SET TimeSlot =  CAST(CONCAT(date, ' ', CASE WHEN time <= '09:27:00' THEN '09:25:00' WHEN time <= '09:32:00' THEN '09:30:00' WHEN time <= '09:37:00' THEN '09:35:00' WHEN time <= '09:42:00' THEN '09:40:00' WHEN time <= '09:47:00' THEN '09:45:00' WHEN time <= '09:52:00' THEN '09:50:00' WHEN time <= '09:57:00' THEN '09:55:00' WHEN time <= '10:02:00' THEN '10:00:00' WHEN time <= '10:07:00' THEN '10:05:00' WHEN time <= '10:12:00' THEN '10:10:00' WHEN time <= '10:17:00' THEN '10:15:00' WHEN time <= '10:22:00' THEN '10:20:00' WHEN time <= '10:27:00' THEN '10:25:00' WHEN time <= '10:32:00' THEN '10:30:00' WHEN time <= '10:37:00' THEN '10:35:00' WHEN time <= '10:42:00' THEN '10:40:00' WHEN time <= '10:47:00' THEN '10:45:00' WHEN time <= '10:52:00' THEN '10:50:00' WHEN time <='10:57:00' THEN '10:55:00' WHEN time <='11:02:00' THEN '11:00:00' WHEN time <='11:07:00' THEN '11:05:00' WHEN time <='11:12:00' THEN '11:10:00' WHEN time <='11:17:00' THEN '11:15:00' WHEN time <='11:22:00' THEN '11:20:00' WHEN time <='11:27:00' THEN '11:25:00' WHEN time <='11:33:00' THEN '11:30:00' WHEN (time <='13:07:00' AND time > '13:00:00') THEN '13:05:00' WHEN time <='13:12:00' THEN '13:10:00' WHEN time <='13:17:00' THEN '13:15:00' WHEN time <='13:22:00' THEN '13:20:00' WHEN time <='13:27:00' THEN '13:25:00' WHEN time <='13:32:00' THEN '13:30:00' WHEN time <='13:37:00' THEN '13:35:00' WHEN time <='13:42:00' THEN '13:40:00' WHEN time <='13:47:00' THEN '13:45:00' WHEN time <='13:52:00' THEN '13:50:00' WHEN time <='13:57:00' THEN '13:55:00' WHEN time <='14:02:00' THEN '14:00:00' WHEN time <='14:07:00' THEN '14:05:00' WHEN time <='14:12:00' THEN '14:10:00' WHEN time <='14:17:00' THEN '14:15:00' WHEN time <='14:22:00' THEN '14:20:00' WHEN time <='14:27:00' THEN '14:25:00' WHEN time <='14:32:00' THEN '14:30:00' WHEN time <='14:37:00' THEN '14:35:00' WHEN time <='14:42:00' THEN '14:40:00' WHEN time <='14:47:00' THEN '14:45:00' WHEN time <='14:52:00' THEN '14:50:00' WHEN time <='14:57:00' THEN '14:55:00' WHEN time <='15:01:00' THEN '15:00:00' WHEN time <='15:07:00' THEN '15:05:00' END) AS DATETIME);

INSERT INTO `hs_s_rt_EM_test` (`code`, `close`, `amount`, `volume`, `chgrate`, `WeiBi`, `chgrate5`, `LiangBi`, `date`, `time`, `TimeSlot`, `m5`) VALUES (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot, m5) 
ON DUPLICATE KEY UPDATE 
`code` = code,
`close` = close,
`amount` = amount,
`volume` = volume,
`chgrate` = chgrate,
`WeiBi` = WeiBi,
`chgrate5` = chgrate5,
`LiangBi` = LiangBi,
`date` = date,
`time` = time,
`TimeSlot` = TimeSlot,
`m5` = m5; 

CALL update_rownum(); -- This works! tedd
END$$
DELIMITER ;

-- The procdure is Not working for id_sub. Why?????? tedd
DROP PROCEDURE `hs_s_rt_EM_test`;
-- The procdure is Not working for id_sub. tedd
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_rt_EM_test`(IN code VARCHAR(18), close VARCHAR(18), amount VARCHAR(18), volume VARCHAR(18), chgrate VARCHAR(18), WeiBi VARCHAR(18), chgrate5 VARCHAR(18), LiangBi VARCHAR(18), date VARCHAR(18), time VARCHAR(18), TimeSlot DATETIME, id_sub MEDIUMINT(8))
BEGIN

DECLARE id_sub_tmp MEDIUMINT; -- variable for cursor fetch into
DECLARE id_sub_out MEDIUMINT; -- variable outside of the cursor 
DECLARE cur_id_sub CURSOR FOR
	 SELECT round(avg(id_sub)) FROM `ying`.`hs_s_rt_EM_test` WHERE `code` = code;
set id_sub_out = 0; -- initialize variable outside of the cursor 	
open cur_id_sub;
FETCH cur_id_sub into id_sub_tmp;
set id_sub_out = id_sub_tmp;
close cur_id_sub;
SET id_sub = 1 + id_sub_out;
SET code = IF(code = '', NULL, code);
SET close = IF(close = '', NULL, close);
SET amount = IF(amount = '', NULL, amount);
SET volume = IF(volume = '', NULL, volume);
SET chgrate = IF(chgrate = '', NULL, chgrate);
SET WeiBi = IF(WeiBi = '', NULL, WeiBi);
SET chgrate5 = IF(chgrate5 = '', NULL, chgrate5);
SET LiangBi = IF(LiangBi = '', NULL, LiangBi);
SET date = IF(date = '', NULL, date);
SET time = IF(time = '', NULL, time);
SET TimeSlot =  CAST(CONCAT(date, ' ', CASE WHEN time <= '09:27:00' THEN '09:25:00' WHEN time <= '09:32:00' THEN '09:30:00' WHEN time <= '09:37:00' THEN '09:35:00' WHEN time <= '09:42:00' THEN '09:40:00' WHEN time <= '09:47:00' THEN '09:45:00' WHEN time <= '09:52:00' THEN '09:50:00' WHEN time <= '09:57:00' THEN '09:55:00' WHEN time <= '10:02:00' THEN '10:00:00' WHEN time <= '10:07:00' THEN '10:05:00' WHEN time <= '10:12:00' THEN '10:10:00' WHEN time <= '10:17:00' THEN '10:15:00' WHEN time <= '10:22:00' THEN '10:20:00' WHEN time <= '10:27:00' THEN '10:25:00' WHEN time <= '10:32:00' THEN '10:30:00' WHEN time <= '10:37:00' THEN '10:35:00' WHEN time <= '10:42:00' THEN '10:40:00' WHEN time <= '10:47:00' THEN '10:45:00' WHEN time <= '10:52:00' THEN '10:50:00' WHEN time <='10:57:00' THEN '10:55:00' WHEN time <='11:02:00' THEN '11:00:00' WHEN time <='11:07:00' THEN '11:05:00' WHEN time <='11:12:00' THEN '11:10:00' WHEN time <='11:17:00' THEN '11:15:00' WHEN time <='11:22:00' THEN '11:20:00' WHEN time <='11:27:00' THEN '11:25:00' WHEN time <='11:33:00' THEN '11:30:00' WHEN (time <='13:07:00' AND time > '13:00:00') THEN '13:05:00' WHEN time <='13:12:00' THEN '13:10:00' WHEN time <='13:17:00' THEN '13:15:00' WHEN time <='13:22:00' THEN '13:20:00' WHEN time <='13:27:00' THEN '13:25:00' WHEN time <='13:32:00' THEN '13:30:00' WHEN time <='13:37:00' THEN '13:35:00' WHEN time <='13:42:00' THEN '13:40:00' WHEN time <='13:47:00' THEN '13:45:00' WHEN time <='13:52:00' THEN '13:50:00' WHEN time <='13:57:00' THEN '13:55:00' WHEN time <='14:02:00' THEN '14:00:00' WHEN time <='14:07:00' THEN '14:05:00' WHEN time <='14:12:00' THEN '14:10:00' WHEN time <='14:17:00' THEN '14:15:00' WHEN time <='14:22:00' THEN '14:20:00' WHEN time <='14:27:00' THEN '14:25:00' WHEN time <='14:32:00' THEN '14:30:00' WHEN time <='14:37:00' THEN '14:35:00' WHEN time <='14:42:00' THEN '14:40:00' WHEN time <='14:47:00' THEN '14:45:00' WHEN time <='14:52:00' THEN '14:50:00' WHEN time <='14:57:00' THEN '14:55:00' WHEN time <='15:01:00' THEN '15:00:00' WHEN time <='15:07:00' THEN '15:05:00' END) AS DATETIME);

INSERT INTO `hs_s_rt_EM_test` (`code`, `close`, `amount`, `volume`, `chgrate`, `WeiBi`, `chgrate5`, `LiangBi`, `date`, `time`, `TimeSlot`, `id_sub`) VALUES (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot, id_sub) 
ON DUPLICATE KEY UPDATE 
`code` = code,
`close` = close,
`amount` = amount,
`volume` = volume,
`chgrate` = chgrate,
`WeiBi` = WeiBi,
`chgrate5` = chgrate5,
`LiangBi` = LiangBi,
`date` = date,
`time` = time,
`TimeSlot` = TimeSlot,
`id_sub` = id_sub; 
END$$
DELIMITER ;

SELECT MAX(id_sub) FROM `hs_s_rt_EM_test` WHERE code = code;