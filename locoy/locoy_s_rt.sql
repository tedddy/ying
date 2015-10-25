SELECT * FROM `s_rt` order by dt desc, ids;
SELECT * FROM `s_rt` where close <=0 and volume <= 0 and amount <=0 and weibi<=0;
SELECT * FROM `s_rt` where time(dt) = '15:00:00' order by volume;

-- DELETE FROM `s_rt` where close <=0 and volume <= 0 and amount <=0 and weibi<=0;
-- DELETE FROM `s_rt` where dt = '0000-00-00 00:00:00'; 
-- DELETE FROM `hs_s_rt_EM` where TimeSlot = '0000-00-00 00:00:00'; 


-- DROP TABLE IF EXISTS `s_rt`;

CREATE TABLE `s_rt` (
  `ids` VARCHAR(6) NOT NULL COMMENT 'stock id',
  `close` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT '收盘价或当前价',
  `volume` INT(10) UNSIGNED NOT NULL COMMENT '成交量',
  `amount` INT(10) UNSIGNED NOT NULL COMMENT '成交额',
  `chgrate` DECIMAL(5,2) NOT NULL COMMENT '涨跌幅',
  `WeiBi` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT '委比',
  `chgrate5` DECIMAL(5,2) NOT NULL COMMENT '五分钟涨幅',
  `LiangBi` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT '量比',
  `dt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ids`,`dt`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

DROP PROCEDURE `s_rt_locoy`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `s_rt_locoy`(IN code VARCHAR(18), close VARCHAR(18), amount VARCHAR(18), volume VARCHAR(18), chgrate VARCHAR(18), WeiBi VARCHAR(18), chgrate5 VARCHAR(18), LiangBi VARCHAR(18), date VARCHAR(18), time VARCHAR(18))
BEGIN
DECLARE TimeSlot DATETIME;
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
SET TimeSlot =  cast(CONCAT(date, ' ', CASE WHEN time <= '09:27:00' THEN '09:25:00' WHEN time <= '09:32:00' THEN '09:30:00' WHEN time <= '09:37:00' THEN '09:35:00' WHEN time <= '09:42:00' THEN '09:40:00' WHEN time <= '09:47:00' THEN '09:45:00' WHEN time <= '09:52:00' THEN '09:50:00' WHEN time <= '09:57:00' THEN '09:55:00' WHEN time <= '10:02:00' THEN '10:00:00' WHEN time <= '10:07:00' THEN '10:05:00' WHEN time <= '10:12:00' THEN '10:10:00' WHEN time <= '10:17:00' THEN '10:15:00' WHEN time <= '10:22:00' THEN '10:20:00' WHEN time <= '10:27:00' THEN '10:25:00' WHEN time <= '10:32:00' THEN '10:30:00' WHEN time <= '10:37:00' THEN '10:35:00' WHEN time <= '10:42:00' THEN '10:40:00' WHEN time <= '10:47:00' THEN '10:45:00' WHEN time <= '10:52:00' THEN '10:50:00' WHEN time <='10:57:00' THEN '10:55:00' WHEN time <='11:02:00' THEN '11:00:00' WHEN time <='11:07:00' THEN '11:05:00' WHEN time <='11:12:00' THEN '11:10:00' WHEN time <='11:17:00' THEN '11:15:00' WHEN time <='11:22:00' THEN '11:20:00' WHEN time <='11:27:00' THEN '11:25:00' WHEN time <='11:33:00' THEN '11:30:00' WHEN (time <='13:07:00' and time > '13:00:00') THEN '13:05:00' WHEN time <='13:12:00' THEN '13:10:00' WHEN time <='13:17:00' THEN '13:15:00' WHEN time <='13:22:00' THEN '13:20:00' WHEN time <='13:27:00' THEN '13:25:00' WHEN time <='13:32:00' THEN '13:30:00' WHEN time <='13:37:00' THEN '13:35:00' WHEN time <='13:42:00' THEN '13:40:00' WHEN time <='13:47:00' THEN '13:45:00' WHEN time <='13:52:00' THEN '13:50:00' WHEN time <='13:57:00' THEN '13:55:00' WHEN time <='14:02:00' THEN '14:00:00' WHEN time <='14:07:00' THEN '14:05:00' WHEN time <='14:12:00' THEN '14:10:00' WHEN time <='14:17:00' THEN '14:15:00' WHEN time <='14:22:00' THEN '14:20:00' WHEN time <='14:27:00' THEN '14:25:00' WHEN time <='14:32:00' THEN '14:30:00' WHEN time <='14:37:00' THEN '14:35:00' WHEN time <='14:42:00' THEN '14:40:00' WHEN time <='14:47:00' THEN '14:45:00' WHEN time <='14:52:00' THEN '14:50:00' WHEN time <='14:57:00' THEN '14:55:00' WHEN time <='15:01:00' THEN '15:00:00' WHEN time <='23:59:59' THEN '15:05:00' end) as datetime);

INSERT INTO `s_rt` (`ids`, `close`, `amount`, `volume`, `chgrate`, `WeiBi`, `chgrate5`, `LiangBi`, `dt`) VALUES (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, TimeSlot) 
ON DUPLICATE KEY UPDate 
`ids` = ids,
`close` = close,
`amount` = amount,
`volume` = volume,
`chgrate` = chgrate,
`WeiBi` = WeiBi,
`chgrate5` = chgrate5,
`LiangBi` = LiangBi,
`dt` = dt; 

CALL `s_rt_get_smaClose_rt_multiPeriods_rt`(code, close, 5, 10, 20, 30, 60, 120, @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6);
insert into `s_rt_sma` (`dt`,`ids`,`close5`,`close10`,`close20`,`close30`,`close60`,`close120`) values (TimeSlot,code,@out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6) ON DUPLICATE KEY UPDATE `close5` =  @out_sma_1, `close10` =  @out_sma_2, `close20` =  @out_sma_3, `close30` =  @out_sma_4, `close60` =  @out_sma_5, `close120` =  @out_sma_6;
END$$
DELIMITER ;

CALL hs_s_rt_EM('[标签:code]','[标签:close]','[标签:amount]','[标签:volume]','[标签:chgrate]','[标签:WeiBi]','[标签:chgrate5]','[标签:LiangBi]','[标签:date]','[标签:time]');
