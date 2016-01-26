DROP TABLE `ying`.`s_rt_sma`;
CREATE TABLE `s_rt_sma` (
  `dt` DATETIME NOT NULL,
  `ids` VARCHAR(6) NOT NULL COMMENT 'ids',
  `WeiBi` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi',
  `LiangBi` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi',
  `sma5c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 5 periods均线',
  `sma10c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 10 periods均线',
  `sma20c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 20 periods均线',
  `sma30c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 30 periods均线',
  `sma60c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 60 periods均线',
  `sma120c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 120 periods均线',
  `sma5v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 5 periods均线',
  `sma10v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 10 periods均线',
  `sma20v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 20 periods均线',
  `sma30v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 30 periods均线',
  `sma60v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 60 periods均线',
  `sma120v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 120 periods均线',
  `sma5a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 5 periods均线',
  `sma10a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 10 periods均线',
  `sma20a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 20 periods均线',
  `sma30a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 30 periods均线',
  `sma60a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 60 periods均线',
  `sma120a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 120 periods均线',
  `sma5wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 5 periods均线',
  `sma10wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 10 periods均线',
  `sma20wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 20 periods均线',
  `sma30wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 30 periods均线',
  `sma60wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 60 periods均线',
  `sma120wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 120 periods均线',
  `sma5lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 5 periods均线',
  `sma10lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 10 periods均线',
  `sma20lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 20 periods均线',
  `sma30lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 30 periods均线',
  `sma60lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 60 periods均线',
  `sma120lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 120 periods均线',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ids_dt` (`ids`,`dt`),
  INDEX `dt` (`dt` DESC)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;


DROP PROCEDURE `s_rt_sma`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `s_rt_sma`(IN ids VARCHAR(18), close VARCHAR(18), amount VARCHAR(18), volume VARCHAR(18), chgrate VARCHAR(18), WeiBi VARCHAR(18), chgrate5 VARCHAR(18), LiangBi VARCHAR(18), date VARCHAR(18), time VARCHAR(18), dt DATETIME)
BEGIN

CALL `s_rt_sma_rownum`(ids, @idsub);
CALL `s_rt_sma_get_sma`(ids, 5, close, @m5);
CALL `s_rt_sma_get_sma`(ids, 10, close, @m10);
CALL `s_rt_sma_get_sma`(ids, 20, close, @m20);
CALL `s_rt_sma_get_sma`(ids, 30, close, @m30);
CALL `s_rt_sma_get_sma`(ids, 60, close, @m60);
CALL `s_rt_sma_get_sma`(ids, 120, close, @m120);
SET ids = IF(ids = '', NULL, ids);
SET close = IF(close = '', NULL, close);
SET amount = IF(amount = '', NULL, amount);
SET volume = IF(volume = '', NULL, volume);
SET chgrate = IF(chgrate = '', NULL, chgrate);
SET WeiBi = IF(WeiBi = '', NULL, WeiBi);
SET chgrate5 = IF(chgrate5 = '', NULL, chgrate5);
SET LiangBi = IF(LiangBi = '', NULL, LiangBi);
SET date = IF(date = '', NULL, date);
SET time = IF(time = '', NULL, time);
SET dt =  CAST(CONCAT(date, ' ', CASE WHEN time <= '09:27:00' THEN '09:25:00' WHEN time <= '09:32:00' THEN '09:30:00' WHEN time <= '09:37:00' THEN '09:35:00' WHEN time <= '09:42:00' THEN '09:40:00' WHEN time <= '09:47:00' THEN '09:45:00' WHEN time <= '09:52:00' THEN '09:50:00' WHEN time <= '09:57:00' THEN '09:55:00' WHEN time <= '10:02:00' THEN '10:00:00' WHEN time <= '10:07:00' THEN '10:05:00' WHEN time <= '10:12:00' THEN '10:10:00' WHEN time <= '10:17:00' THEN '10:15:00' WHEN time <= '10:22:00' THEN '10:20:00' WHEN time <= '10:27:00' THEN '10:25:00' WHEN time <= '10:32:00' THEN '10:30:00' WHEN time <= '10:37:00' THEN '10:35:00' WHEN time <= '10:42:00' THEN '10:40:00' WHEN time <= '10:47:00' THEN '10:45:00' WHEN time <= '10:52:00' THEN '10:50:00' WHEN time <='10:57:00' THEN '10:55:00' WHEN time <='11:02:00' THEN '11:00:00' WHEN time <='11:07:00' THEN '11:05:00' WHEN time <='11:12:00' THEN '11:10:00' WHEN time <='11:17:00' THEN '11:15:00' WHEN time <='11:22:00' THEN '11:20:00' WHEN time <='11:27:00' THEN '11:25:00' WHEN time <='11:33:00' THEN '11:30:00' WHEN (time <='13:07:00' AND time > '13:00:00') THEN '13:05:00' WHEN time <='13:12:00' THEN '13:10:00' WHEN time <='13:17:00' THEN '13:15:00' WHEN time <='13:22:00' THEN '13:20:00' WHEN time <='13:27:00' THEN '13:25:00' WHEN time <='13:32:00' THEN '13:30:00' WHEN time <='13:37:00' THEN '13:35:00' WHEN time <='13:42:00' THEN '13:40:00' WHEN time <='13:47:00' THEN '13:45:00' WHEN time <='13:52:00' THEN '13:50:00' WHEN time <='13:57:00' THEN '13:55:00' WHEN time <='14:02:00' THEN '14:00:00' WHEN time <='14:07:00' THEN '14:05:00' WHEN time <='14:12:00' THEN '14:10:00' WHEN time <='14:17:00' THEN '14:15:00' WHEN time <='14:22:00' THEN '14:20:00' WHEN time <='14:27:00' THEN '14:25:00' WHEN time <='14:32:00' THEN '14:30:00' WHEN time <='14:37:00' THEN '14:35:00' WHEN time <='14:42:00' THEN '14:40:00' WHEN time <='14:47:00' THEN '14:45:00' WHEN time <='14:52:00' THEN '14:50:00' WHEN time <='14:57:00' THEN '14:55:00' WHEN time <='15:01:00' THEN '15:00:00' WHEN time <='15:07:00' THEN '15:05:00' END) AS DATETIME);

INSERT INTO `s_rt_sma` (`ids`, `dt`, idsub, `sma5`, `sma10`, `sma20`, `sma30`, `sma60`, `sma120`) VALUES (ids, dt, @idsub, @m5, @m10, @m20, @m30, @m60, @m120) 
ON DUPLICATE KEY UPDATE 
`ids` = ids,
`close` = close,
`amount` = amount,
`volume` = volume,
`chgrate` = chgrate,
`WeiBi` = WeiBi,
`chgrate5` = chgrate5,
`LiangBi` = LiangBi,
`date` = date,
`time` = time,
`dt` = dt,
`sma5` = @m5; 

-- CALL update_rownum(); -- This works! But only used at last resort. tedd
END$$
DELIMITER ;

CALL s_rt_sma('[标签:ids]','[标签:close]','[标签:amount]','[标签:volume]','[标签:chgrate]','[标签:WeiBi]','[标签:chgrate5]','[标签:LiangBi]','[标签:date]','[标签:time]','');


CALL `s_rt_sma_rownum`('600190', @idsub);
SELECT @idsub;

DROP PROCEDURE `s_rt_sma_rownum`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `s_rt_sma_rownum`(IN ids VARCHAR(6), OUT idsub_generated MEDIUMINT) 
-- tedd: Note that if idsub_generated is replaced with idsub, then the procedure doesn't work, conflict with field name?! 
BEGIN
DECLARE idsub_tmp MEDIUMINT; -- variable for cursor fetch into
DECLARE cur_idsub CURSOR FOR
	 SELECT `idsub` FROM `ying`.`s_rt_sma` WHERE `ids` = ids ORDER BY dt DESC LIMIT 1;
OPEN cur_idsub;
FETCH cur_idsub INTO idsub_tmp;
CLOSE cur_idsub;
SET idsub_generated = 1 + idsub_tmp;
-- select idsub_generated;
END$$
DELIMITER ;

-- Tutorial :: MYSQL :: Mysql Stored Procedure Cursor Tutorial Calculating Simple Moving Average
-- version 151010;

CALL `s_rt_sma_get_sma`('600190', 2, 5.58, @m5);
SELECT @m5;

DROP PROCEDURE IF EXISTS `s_rt_sma_get_sma`;
DELIMITER $$

CREATE PROCEDURE `s_rt_sma_get_sma`(
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

SELECT `close` FROM s_rt_sma WHERE `ids` = in_ids ORDER BY dt DESC;
  
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

