-- ying locoy project index_rt
/* 
task: migrate project hs_index_xts_EM
	delete id field and remove "AUTO_INCREMENT=1"
	change primary key to (`code`,`date`)
	delete `ying`.
	replace hs_index_rt_EM with index_rt
	replace `code` with `idi`
	replace `TimeSlot` with `dt`
*/	
/* 
网址：http://quote.eastmoney.com/center/list.html#15_0_1 
数据：
	http://hqdigi2.eastmoney.com/EM_Quote2010NumericApplication/index.aspx?type=s&sortType=C&sortRule=-1&pageSize=800&page=1&jsName=quote_123&style=25#
	http://hqdigi2.eastmoney.com/EM_Quote2010NumericApplication/index.aspx?type=s&sortType=C&sortRule=-1&pageSize=800&page=1&jsName=quote_123&style=15#
参考：
源码： 
*/
	
SELECT * FROM `index_rt`;
-- DROP TABLE `index_rt`;	
CREATE TABLE `index_rt` (
  `idi` VARCHAR(6) NOT NULL COMMENT 'index id',
  `close` DECIMAL(9,2) UNSIGNED DEFAULT NULL COMMENT '收盘价',
  `volume` INT(11) UNSIGNED DEFAULT NULL COMMENT '成交量 手',
  `amount` BIGINT(12) UNSIGNED DEFAULT NULL COMMENT '股票成交额 万',
  `dt` DATETIME NOT NULL,
  PRIMARY KEY (`idi`,`dt`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;


-- DROP procedure IF EXISTS `index_rt`;
DELIMITER $$
USE `ying`$$
CREATE DEFINER=`gxh`@`%` PROCEDURE `index_rt`(IN idi VARCHAR(6), close DECIMAL(9,2), volume BIGINT(11) UNSIGNED, amount BIGINT(12) UNSIGNED, time VARCHAR(9))
BEGIN
DECLARE dt DATETIME;
SET idi = IF(idi = '', NULL, idi);
SET close = IF(close = '', NULL, close);
SET volume = IF(volume = '', NULL, volume);
SET amount = IF(amount = '', NULL, amount);
SET time = IF(time = '', NULL, time);
SET dt =  CAST(CONCAT(CURDATE(), ' ', CASE WHEN time <= '09:27:00' THEN '09:25:00' WHEN time <= '09:32:00' THEN '09:30:00' WHEN time <= '09:37:00' THEN '09:35:00' WHEN time <= '09:42:00' THEN '09:40:00' WHEN time <= '09:47:00' THEN '09:45:00' WHEN time <= '09:52:00' THEN '09:50:00' WHEN time <= '09:57:00' THEN '09:55:00' WHEN time <= '10:02:00' THEN '10:00:00' WHEN time <= '10:07:00' THEN '10:05:00' WHEN time <= '10:12:00' THEN '10:10:00' WHEN time <= '10:17:00' THEN '10:15:00' WHEN time <= '10:22:00' THEN '10:20:00' WHEN time <= '10:27:00' THEN '10:25:00' WHEN time <= '10:32:00' THEN '10:30:00' WHEN time <= '10:37:00' THEN '10:35:00' WHEN time <= '10:42:00' THEN '10:40:00' WHEN time <= '10:47:00' THEN '10:45:00' WHEN time <= '10:52:00' THEN '10:50:00' WHEN time <='10:57:00' THEN '10:55:00' WHEN time <='11:02:00' THEN '11:00:00' WHEN time <='11:07:00' THEN '11:05:00' WHEN time <='11:12:00' THEN '11:10:00' WHEN time <='11:17:00' THEN '11:15:00' WHEN time <='11:22:00' THEN '11:20:00' WHEN time <='11:27:00' THEN '11:25:00' WHEN time <='13:00:00' THEN '11:30:00' WHEN (time <='13:07:00' AND time > '13:00:00') THEN '13:05:00' WHEN time <='13:12:00' THEN '13:10:00' WHEN time <='13:17:00' THEN '13:15:00' WHEN time <='13:22:00' THEN '13:20:00' WHEN time <='13:27:00' THEN '13:25:00' WHEN time <='13:32:00' THEN '13:30:00' WHEN time <='13:37:00' THEN '13:35:00' WHEN time <='13:42:00' THEN '13:40:00' WHEN time <='13:47:00' THEN '13:45:00' WHEN time <='13:52:00' THEN '13:50:00' WHEN time <='13:57:00' THEN '13:55:00' WHEN time <='14:02:00' THEN '14:00:00' WHEN time <='14:07:00' THEN '14:05:00' WHEN time <='14:12:00' THEN '14:10:00' WHEN time <='14:17:00' THEN '14:15:00' WHEN time <='14:22:00' THEN '14:20:00' WHEN time <='14:27:00' THEN '14:25:00' WHEN time <='14:32:00' THEN '14:30:00' WHEN time <='14:37:00' THEN '14:35:00' WHEN time <='14:42:00' THEN '14:40:00' WHEN time <='14:47:00' THEN '14:45:00' WHEN time <='14:52:00' THEN '14:50:00' WHEN time <='14:57:00' THEN '14:55:00' WHEN time <='15:01:00' THEN '15:00:00' WHEN time <='15:07:00' THEN '15:05:00' END) AS DATETIME);

INSERT INTO `index_rt` (`idi`, `close`, `volume`, `amount`, `dt`) VALUES (idi, close, volume, amount, dt) 
ON DUPLICATE KEY UPDATE
`close` = IF(close IS NULL, `close`, close),
`volume` = IF(volume IS NULL, `volume`, volume),
`amount` = IF(amount IS NULL, `amount`, amount);
END$$
DELIMITER ;

CALL index_rt('[标签:idi]', '[标签:close]', '[标签:volume]', '[标签:amount]', '[标签:time]') 