DROP TABLE `ying`.`hs_s_rt_EM_test`;
CREATE TABLE `hs_s_rt_EM_test` (
  `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idsub` MEDIUMINT(8) UNSIGNED DEFAULT '0',
  `code` VARCHAR(6) NOT NULL COMMENT 'code',
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
  UNIQUE KEY `TimeSlot` (`code`,`TimeSlot`)
) ENGINE=INNODB  AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;


-- 增加moving average列
ALTER TABLE `ying`.`hs_s_rt_EM_test` 
ADD COLUMN `m5` DECIMAL(6,2) UNSIGNED NULL DEFAULT NULL COMMENT '5日均线' AFTER `TimeSlot`,
ADD COLUMN `m10` DECIMAL(6,2) UNSIGNED NULL DEFAULT NULL COMMENT '10日均线' AFTER `TimeSlot`,
ADD COLUMN `m20` DECIMAL(6,2) UNSIGNED NULL DEFAULT NULL COMMENT '20日均线' AFTER `TimeSlot`,
ADD COLUMN `m30` DECIMAL(6,2) UNSIGNED NULL DEFAULT NULL COMMENT '30日均线' AFTER `TimeSlot`,
ADD COLUMN `m60` DECIMAL(6,2) UNSIGNED NULL DEFAULT NULL COMMENT '60日均线' AFTER `TimeSlot`,
ADD COLUMN `m120` DECIMAL(6,2) UNSIGNED NULL DEFAULT NULL COMMENT '120日均线' AFTER `TimeSlot`;

delete from hs_s_rt_EM_test where date = '2015-10-09';
SELECT * FROM hs_s_rt_EM_test order by TimeSlot desc;
SELECT * FROM hs_s_rt_EM_test order by code, TimeSlot desc;

DROP PROCEDURE `hs_s_rt_EM_test`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_rt_EM_test`(IN code VARCHAR(18), close VARCHAR(18), amount VARCHAR(18), volume VARCHAR(18), chgrate VARCHAR(18), WeiBi VARCHAR(18), chgrate5 VARCHAR(18), LiangBi VARCHAR(18), date VARCHAR(18), time VARCHAR(18), TimeSlot DATETIME)
BEGIN

call `hs_s_rt_EM_test_rownum`(code, @idsub);
call `hs_s_rt_EM_test_get_sma`(code, 5, close, @m5);
call `hs_s_rt_EM_test_get_sma`(code, 10, close, @m10);
call `hs_s_rt_EM_test_get_sma`(code, 20, close, @m20);
call `hs_s_rt_EM_test_get_sma`(code, 30, close, @m30);
call `hs_s_rt_EM_test_get_sma`(code, 60, close, @m60);
call `hs_s_rt_EM_test_get_sma`(code, 120, close, @m120);
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

INSERT INTO `hs_s_rt_EM_test` (`code`, `close`, `amount`, `volume`, `chgrate`, `WeiBi`, `chgrate5`, `LiangBi`, `date`, `time`, `TimeSlot`, idsub, `m5`, `m10`, `m20`, `m30`, `m60`, `m120`) VALUES (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot, @idsub, @m5, @m10, @m20, @m30, @m60, @m120) 
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
`m5` = @m5; 

-- CALL update_rownum(); -- This works! But only used at last resort. tedd
END$$
DELIMITER ;

call `hs_s_rt_EM_test_rownum`('600190', @idsub);
select @idsub;

DROP PROCEDURE `hs_s_rt_EM_test_rownum`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_rt_EM_test_rownum`(in ids varchar(6), out idsub_generated MEDIUMINT) 
-- tedd: Note that if idsub_generated is replaced with idsub, then the procedure doesn't work, conflict with field name?! 
BEGIN
DECLARE idsub_tmp MEDIUMINT; -- variable for cursor fetch into
DECLARE cur_idsub CURSOR FOR
	 SELECT `idsub` FROM `ying`.`hs_s_rt_EM_test` WHERE `code` = ids order by TimeSlot desc limit 1;
OPEN cur_idsub;
FETCH cur_idsub INTO idsub_tmp;
CLOSE cur_idsub;
SET idsub_generated = 1 + idsub_tmp;
-- select idsub_generated;
END$$
DELIMITER ;

-- Tutorial :: MYSQL :: Mysql Stored Procedure Cursor Tutorial Calculating Simple Moving Average
-- version 151010;

CALL `hs_s_rt_EM_test_get_sma`('600190', 2, 5.58, @m5);
SELECT @m5;

DROP PROCEDURE IF EXISTS `hs_s_rt_EM_test_get_sma`;
DELIMITER $$

CREATE PROCEDURE `hs_s_rt_EM_test_get_sma`(
	IN in_ids VARCHAR(25), -- variable stock id; 's' after id means stock
	IN in_period INT, -- variable in_period: 
	IN in_current_close DECIMAL(6,2), -- variable in_current_close: current close
	OUT m5 DECIMAL(6,2) -- 5 periods moving average
	)

BEGIN

DECLARE period_limit INT; -- variable for loop counter limit

DECLARE loop_cnt INT; -- variable for loop counter

DECLARE sum_sma DECIMAL(6,2); -- variable for total of close of periods

DECLARE close_tmp DECIMAL(6,2); -- variable for cursor fetch into

DECLARE record_not_found INTEGER DEFAULT 0; -- variable for error handler

DECLARE mysql_cursor CURSOR FOR -- variable for mysql cursor

SELECT `close` FROM hs_s_rt_EM_test WHERE `code` = in_ids ORDER BY TimeSlot DESC;
  
DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_not_found = 1;

-- initialize variables for use in procedure
SET period_limit = in_period;
SET period_limit = period_limit - 1;
SET loop_cnt = 0;
SET sum_sma = 0.00;

-- open cursor
OPEN mysql_cursor;
  
	THE_LOOP: LOOP
		FETCH mysql_cursor INTO close_tmp; -- fetch result row into close_tmp tedd
		
		SET loop_cnt = loop_cnt + 1; -- increment the loop counter
		
	-- set the conditional break for n-periods sma, we need the n-1 as the max
		IF loop_cnt > period_limit THEN
			LEAVE THE_LOOP;
		END IF;
		
	-- break from loop if reach the end
		IF record_not_found THEN
			LEAVE THE_LOOP;
		END IF;
		
		SET sum_sma = sum_sma + close_tmp; -- add the sum to sum_sma
    
	END LOOP THE_LOOP;
  
  SET m5 = ROUND(((sum_sma + in_current_close) / in_period),2); -- now calculate the n-period sma
  
CLOSE mysql_cursor;
-- output result
-- SELECT m5;
END $$

