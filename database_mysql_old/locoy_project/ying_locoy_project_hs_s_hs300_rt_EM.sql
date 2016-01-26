-- ying locoy project hs_s_hs300_rt_EM

-- DROP TABLE `ying`.`hs_s_hs300_rt_EM`;
CREATE TABLE `hs_s_hs300_rt_EM` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL COMMENT 'code',
  `close` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close',
  `amount` int(10) unsigned DEFAULT NULL COMMENT 'amount',
  `volume` int(10) unsigned DEFAULT NULL COMMENT 'volume',
  `chgrate` decimal(5,2) DEFAULT NULL COMMENT 'chgrate',
  `WeiBi` decimal(6,2) unsigned DEFAULT NULL COMMENT 'WeiBi',
  `chgrate5` decimal(5,2) DEFAULT NULL COMMENT 'chgrate5',
  `LiangBi` decimal(6,2) unsigned DEFAULT NULL COMMENT 'LiangBi',
  `date` date DEFAULT NULL COMMENT 'date',
  `time` time DEFAULT NULL COMMENT 'time',
  `TimeSlot` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code`,`time`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- DROP PROCEDURE `ying`.`hs_s_hs300_rt_EM`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_hs300_rt_EM`(IN code VARCHAR(18), close VARCHAR(18), amount VARCHAR(18), volume VARCHAR(18), chgrate VARCHAR(18), WeiBi VARCHAR(18), chgrate5 VARCHAR(18), LiangBi VARCHAR(18), date VARCHAR(18), time VARCHAR(18), TimeSlot datetime)
BEGIN
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
SET TimeSlot =  cast(CONCAT(date, ' ', CASE WHEN time <= '09:27:00' THEN '09:25:00' WHEN time <= '09:32:00' THEN '09:30:00' WHEN time <= '09:37:00' THEN '09:35:00' WHEN time <= '09:42:00' THEN '09:40:00' WHEN time <= '09:47:00' THEN '09:45:00' WHEN time <= '09:52:00' THEN '09:50:00' WHEN time <= '09:57:00' THEN '09:55:00' WHEN time <= '10:02:00' THEN '10:00:00' WHEN time <= '10:07:00' THEN '10:05:00' WHEN time <= '10:12:00' THEN '10:10:00' WHEN time <= '10:17:00' THEN '10:15:00' WHEN time <= '10:22:00' THEN '10:20:00' WHEN time <= '10:27:00' THEN '10:25:00' WHEN time <= '10:32:00' THEN '10:30:00' WHEN time <= '10:37:00' THEN '10:35:00' WHEN time <= '10:42:00' THEN '10:40:00' WHEN time <= '10:47:00' THEN '10:45:00' WHEN time <= '10:52:00' THEN '10:50:00' WHEN time <='10:57:00' THEN '10:55:00' WHEN time <='11:02:00' THEN '11:00:00' WHEN time <='11:07:00' THEN '11:05:00' WHEN time <='11:12:00' THEN '11:10:00' WHEN time <='11:17:00' THEN '11:15:00' WHEN time <='11:22:00' THEN '11:20:00' WHEN time <='11:27:00' THEN '11:25:00' WHEN time <='11:33:00' THEN '11:30:00' WHEN (time <='13:07:00' and time > '13:00:00') THEN '13:05:00' WHEN time <='13:12:00' THEN '13:10:00' WHEN time <='13:17:00' THEN '13:15:00' WHEN time <='13:22:00' THEN '13:20:00' WHEN time <='13:27:00' THEN '13:25:00' WHEN time <='13:32:00' THEN '13:30:00' WHEN time <='13:37:00' THEN '13:35:00' WHEN time <='13:42:00' THEN '13:40:00' WHEN time <='13:47:00' THEN '13:45:00' WHEN time <='13:52:00' THEN '13:50:00' WHEN time <='13:57:00' THEN '13:55:00' WHEN time <='14:02:00' THEN '14:00:00' WHEN time <='14:07:00' THEN '14:05:00' WHEN time <='14:12:00' THEN '14:10:00' WHEN time <='14:17:00' THEN '14:15:00' WHEN time <='14:22:00' THEN '14:20:00' WHEN time <='14:27:00' THEN '14:25:00' WHEN time <='14:32:00' THEN '14:30:00' WHEN time <='14:37:00' THEN '14:35:00' WHEN time <='14:42:00' THEN '14:40:00' WHEN time <='14:47:00' THEN '14:45:00' WHEN time <='14:52:00' THEN '14:50:00' WHEN time <='14:57:00' THEN '14:55:00' WHEN time <='15:01:00' THEN '15:00:00' WHEN time <='15:07:00' THEN '15:05:00' end) as datetime);


INSERT INTO `hs_s_hs300_rt_EM` (`code`, `close`, `amount`, `volume`, `chgrate`, `WeiBi`, `chgrate5`, `LiangBi`, `date`, `time`, `TimeSlot`) VALUES (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot) 
ON DUPLICATE KEY UPDate 
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
`TimeSlot` = TimeSlot;
-- SET TimeSlot =  CASE WHEN time < '09:30:00' THEN '09:25:00' WHEN time < '09:40:00' THEN '09:35:00' WHEN time < '09:45:00' THEN '09:40:00' WHEN time < '09:55:00' THEN '09:50:00' WHEN time < '10:05:00' THEN '10:00:00' WHEN time < '10:15:00' THEN '10:10:00' WHEN time < '10:25:00' THEN '10:20:00' WHEN time < '10:35:00' THEN '10:30:00' WHEN time < '10:45:00' THEN '10:40:00' WHEN time < '10:55:00' THEN '10:50:00' WHEN time < '11:05:00' THEN '11:00:00' WHEN time < '11:15:00' THEN '11:10:00' WHEN time < '11:25:00' THEN '11:20:00' WHEN time < '11:35:00' THEN '11:30:00' WHEN (time < '13:15:00' and time > '13:05:00') THEN '13:10:00' WHEN time < '13:25:00' THEN '13:20:00' WHEN time < '13:35:00' THEN '13:30:00' WHEN time < '13:45:00' THEN '13:40:00' WHEN time < '13:55:00' THEN '13:50:00' WHEN time < '14:05:00' THEN '14:00:00' WHEN time < '14:15:00' THEN '14:10:00' WHEN time < '14:15:00' THEN '14:10:00' WHEN time < '14:25:00' THEN '14:20:00' WHEN time < '14:35:00' THEN '14:30:00' WHEN time < '14:45:00' THEN '14:40:00' WHEN time < '14:55:00' THEN '14:50:00' WHEN time < '15:05:00' THEN '15:00:00' end;

-- SET TimeSlot =  CASE WHEN time < '09:30:00' THEN '09:25:00' WHEN time < '09:35:00' THEN '09:30:00' WHEN time < '09:40:00' THEN '09:35:00' WHEN time < '09:45:00' THEN '09:40:00' WHEN time < '09:50:00' THEN '09:45:00' WHEN time < '09:55:00' THEN '09:50:00' WHEN time < '10:00:00' THEN '09:55:00' WHEN time < '10:05:00' THEN '10:00:00' WHEN time < '10:10:00' THEN '10:05:00' WHEN time < '10:15:00' THEN '10:10:00' WHEN time < '10:20:00' THEN '10:15:00' WHEN time < '10:25:00' THEN '10:20:00' WHEN time < '10:30:00' THEN '10:25:00' WHEN time < '10:35:00' THEN '10:30:00' WHEN time < '10:40:00' THEN '10:35:00' WHEN time < '10:45:00' THEN '10:40:00' WHEN time < '10:50:00' THEN '10:45:00' WHEN time < '10:55:00' THEN '10:50:00' WHEN time < '11:00:00' THEN '10:55:00' WHEN time < '11:05:00' THEN '11:00:00' WHEN time < '11:10:00' THEN '11:05:00' WHEN time < '11:15:00' THEN '11:10:00' WHEN time < '11:20:00' THEN '11:15:00' WHEN time < '11:25:00' THEN '11:20:00' WHEN time < '11:30:00' THEN '11:25:00' WHEN time < '11:35:00' THEN '11:30:00' WHEN (time < '13:10:00' and time > '13:00:00') THEN '13:05:00' WHEN time < '13:15:00' THEN '13:10:00' WHEN time < '13:20:00' THEN '13:15:00' WHEN time < '13:25:00' THEN '13:20:00' WHEN time < '13:30:00' THEN '13:25:00' WHEN time < '13:35:00' THEN '13:30:00' WHEN time < '13:40:00' THEN '13:35:00' WHEN time < '13:45:00' THEN '13:40:00' WHEN time < '13:50:00' THEN '13:45:00' WHEN time < '13:55:00' THEN '13:50:00' WHEN time < '14:00:00' THEN '13:55:00' WHEN time < '14:05:00' THEN '14:00:00' WHEN time < '14:10:00' THEN '14:05:00' WHEN time < '14:15:00' THEN '14:10:00' WHEN time < '14:20:00' THEN '14:15:00' WHEN time < '14:25:00' THEN '14:20:00' WHEN time < '14:30:00' THEN '14:25:00' WHEN time < '14:35:00' THEN '14:30:00' WHEN time < '14:40:00' THEN '14:35:00' WHEN time < '14:45:00' THEN '14:40:00' WHEN time < '14:50:00' THEN '14:45:00' WHEN time < '14:55:00' THEN '14:50:00' WHEN time < '15:00:00' THEN '14:55:00' WHEN time < '15:05:00' THEN '15:00:00' WHEN time < '15:10:00' THEN '15:05:00' end

-- SET TimeSlot =  CASE WHEN time < '09:29:00' THEN '09:25:00' WHEN time < '09:34:00' THEN '09:30:00' WHEN time < '09:39:00' THEN '09:35:00' WHEN time < '09:44:00' THEN '09:40:00' WHEN time < '09:49:00' THEN '09:45:00' WHEN time < '09:54:00' THEN '09:50:00' WHEN time < '09:59:00' THEN '09:55:00' WHEN time < '10:04:00' THEN '10:00:00' WHEN time < '10:09:00' THEN '10:05:00' WHEN time < '10:14:00' THEN '10:10:00' WHEN time < '10:19:00' THEN '10:15:00' WHEN time < '10:24:00' THEN '10:20:00' WHEN time < '10:29:00' THEN '10:25:00' WHEN time < '10:34:00' THEN '10:30:00' WHEN time < '10:39:00' THEN '10:35:00' WHEN time < '10:44:00' THEN '10:40:00' WHEN time < '10:49:00' THEN '10:45:00' WHEN time < '10:54:00' THEN '10:50:00' WHEN time < '10:59:00' THEN '10:55:00' WHEN time < '11:04:00' THEN '11:00:00' WHEN time < '11:09:00' THEN '11:05:00' WHEN time < '11:14:00' THEN '11:10:00' WHEN time < '11:19:00' THEN '11:15:00' WHEN time < '11:24:00' THEN '11:20:00' WHEN time < '11:29:00' THEN '11:25:00' WHEN time < '11:35:00' THEN '11:30:00' WHEN (time < '13:09:00' and time > '13:00:00') THEN '13:05:00' WHEN time < '13:14:00' THEN '13:10:00' WHEN time < '13:19:00' THEN '13:15:00' WHEN time < '13:24:00' THEN '13:20:00' WHEN time < '13:29:00' THEN '13:25:00' WHEN time < '13:34:00' THEN '13:30:00' WHEN time < '13:39:00' THEN '13:35:00' WHEN time < '13:44:00' THEN '13:40:00' WHEN time < '13:49:00' THEN '13:45:00' WHEN time < '13:54:00' THEN '13:50:00' WHEN time < '13:59:00' THEN '13:55:00' WHEN time < '14:04:00' THEN '14:00:00' WHEN time < '14:09:00' THEN '14:05:00' WHEN time < '14:14:00' THEN '14:10:00' WHEN time < '14:19:00' THEN '14:15:00' WHEN time < '14:24:00' THEN '14:20:00' WHEN time < '14:29:00' THEN '14:25:00' WHEN time < '14:34:00' THEN '14:30:00' WHEN time < '14:39:00' THEN '14:35:00' WHEN time < '14:44:00' THEN '14:40:00' WHEN time < '14:49:00' THEN '14:45:00' WHEN time < '14:54:00' THEN '14:50:00' WHEN time < '14:59:00' THEN '14:55:00' WHEN time < '15:01:00' THEN '15:00:00' WHEN time < '15:09:00' THEN '15:05:00' end;

-- SET TimeSlot =  CASE WHEN time < '09:29:00' THEN '09:25:00' WHEN time < '09:34:00' THEN '09:30:00' WHEN time < '09:39:00' THEN '09:35:00' WHEN time < '09:44:00' THEN '09:40:00' WHEN time < '09:49:00' THEN '09:45:00' WHEN time < '09:54:00' THEN '09:50:00' WHEN time < '09:59:00' THEN '09:55:00' WHEN time < '10:04:00' THEN '10:00:00' WHEN time < '10:09:00' THEN '10:05:00' WHEN time < '10:14:00' THEN '10:10:00' WHEN time < '10:19:00' THEN '10:15:00' WHEN time < '10:24:00' THEN '10:20:00' WHEN time < '10:29:00' THEN '10:25:00' WHEN time < '10:33:00' THEN '10:30:00' WHEN time < '10:38:00' THEN '10:35:00' WHEN time < '10:43:00' THEN '10:40:00' WHEN time < '10:48:00' THEN '10:45:00' WHEN time < '10:53:00' THEN '10:50:00' WHEN time < '10:58:00' THEN '10:55:00' WHEN time < '11:03:00' THEN '11:00:00' WHEN time < '11:09:00' THEN '11:05:00' WHEN time < '11:14:00' THEN '11:10:00' WHEN time < '11:19:00' THEN '11:15:00' WHEN time < '11:24:00' THEN '11:20:00' WHEN time < '11:29:00' THEN '11:25:00' WHEN time < '11:35:00' THEN '11:30:00' WHEN (time < '13:09:00' and time > '13:00:00') THEN '13:05:00' WHEN time < '13:14:00' THEN '13:10:00' WHEN time < '13:19:00' THEN '13:15:00' WHEN time < '13:24:00' THEN '13:20:00' WHEN time < '13:29:00' THEN '13:25:00' WHEN time < '13:34:00' THEN '13:30:00' WHEN time < '13:39:00' THEN '13:35:00' WHEN time < '13:44:00' THEN '13:40:00' WHEN time < '13:49:00' THEN '13:45:00' WHEN time < '13:54:00' THEN '13:50:00' WHEN time < '13:59:00' THEN '13:55:00' WHEN time < '14:04:00' THEN '14:00:00' WHEN time < '14:09:00' THEN '14:05:00' WHEN time < '14:14:00' THEN '14:10:00' WHEN time < '14:19:00' THEN '14:15:00' WHEN time < '14:24:00' THEN '14:20:00' WHEN time < '14:29:00' THEN '14:25:00' WHEN time < '14:34:00' THEN '14:30:00' WHEN time < '14:39:00' THEN '14:35:00' WHEN time < '14:44:00' THEN '14:40:00' WHEN time < '14:49:00' THEN '14:45:00' WHEN time < '14:54:00' THEN '14:50:00' WHEN time < '14:59:00' THEN '14:55:00' WHEN time < '15:01:00' THEN '15:00:00' WHEN time < '15:09:00' THEN '15:05:00' end;
END$$
DELIMITER ;

CALL hs_s_hs300_rt_EM('[标签:code]','[标签:close]','[标签:amount]','[标签:volume]','[标签:chgrate]','[标签:WeiBi]','[标签:chgrate5]','[标签:LiangBi]','[标签:date]','[标签:time]','');




-- DROP TABLE `ying`.`hs_s_sh50_rt_EM`;
CREATE TABLE `hs_s_sh50_rt_EM` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL COMMENT 'code',
  `close` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close',
  `amount` int(10) unsigned DEFAULT NULL COMMENT 'amount',
  `volume` int(10) unsigned DEFAULT NULL COMMENT 'volume',
  `chgrate` decimal(5,2) DEFAULT NULL COMMENT 'chgrate',
  `WeiBi` decimal(6,2) unsigned DEFAULT NULL COMMENT 'WeiBi',
  `chgrate5` decimal(5,2) DEFAULT NULL COMMENT 'chgrate5',
  `LiangBi` decimal(6,2) unsigned DEFAULT NULL COMMENT 'LiangBi',
  `date` date DEFAULT NULL COMMENT 'date',
  `time` time DEFAULT NULL COMMENT 'time',
  `TimeSlot` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code`,`date`,`time`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- DROP PROCEDURE `ying`.`hs_s_sh50_rt_EM`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_sh50_rt_EM`(IN code VARCHAR(18), close VARCHAR(18), amount VARCHAR(18), volume VARCHAR(18), chgrate VARCHAR(18), WeiBi VARCHAR(18), chgrate5 VARCHAR(18), LiangBi VARCHAR(18), date VARCHAR(18), time VARCHAR(18), TimeSlot datetime)
BEGIN
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
SET TimeSlot =  cast(CONCAT(date, ' ', CASE WHEN time <= '09:27:00' THEN '09:25:00' WHEN time <= '09:32:00' THEN '09:30:00' WHEN time <= '09:37:00' THEN '09:35:00' WHEN time <= '09:42:00' THEN '09:40:00' WHEN time <= '09:47:00' THEN '09:45:00' WHEN time <= '09:52:00' THEN '09:50:00' WHEN time <= '09:57:00' THEN '09:55:00' WHEN time <= '10:02:00' THEN '10:00:00' WHEN time <= '10:07:00' THEN '10:05:00' WHEN time <= '10:12:00' THEN '10:10:00' WHEN time <= '10:17:00' THEN '10:15:00' WHEN time <= '10:22:00' THEN '10:20:00' WHEN time <= '10:27:00' THEN '10:25:00' WHEN time <= '10:32:00' THEN '10:30:00' WHEN time <= '10:37:00' THEN '10:35:00' WHEN time <= '10:42:00' THEN '10:40:00' WHEN time <= '10:47:00' THEN '10:45:00' WHEN time <= '10:52:00' THEN '10:50:00' WHEN time <='10:57:00' THEN '10:55:00' WHEN time <='11:02:00' THEN '11:00:00' WHEN time <='11:07:00' THEN '11:05:00' WHEN time <='11:12:00' THEN '11:10:00' WHEN time <='11:17:00' THEN '11:15:00' WHEN time <='11:22:00' THEN '11:20:00' WHEN time <='11:27:00' THEN '11:25:00' WHEN time <='11:32:00' THEN '11:30:00' WHEN (time <='13:07:00' and time > '13:00:00') THEN '13:05:00' WHEN time <='13:12:00' THEN '13:10:00' WHEN time <='13:17:00' THEN '13:15:00' WHEN time <='13:22:00' THEN '13:20:00' WHEN time <='13:27:00' THEN '13:25:00' WHEN time <='13:33:00' THEN '13:30:00' WHEN time <='13:37:00' THEN '13:35:00' WHEN time <='13:42:00' THEN '13:40:00' WHEN time <='13:47:00' THEN '13:45:00' WHEN time <='13:52:00' THEN '13:50:00' WHEN time <='13:57:00' THEN '13:55:00' WHEN time <='14:02:00' THEN '14:00:00' WHEN time <='14:07:00' THEN '14:05:00' WHEN time <='14:12:00' THEN '14:10:00' WHEN time <='14:17:00' THEN '14:15:00' WHEN time <='14:22:00' THEN '14:20:00' WHEN time <='14:27:00' THEN '14:25:00' WHEN time <='14:32:00' THEN '14:30:00' WHEN time <='14:37:00' THEN '14:35:00' WHEN time <='14:42:00' THEN '14:40:00' WHEN time <='14:47:00' THEN '14:45:00' WHEN time <='14:52:00' THEN '14:50:00' WHEN time <='14:57:00' THEN '14:55:00' WHEN time <='15:01:00' THEN '15:00:00' WHEN time <='15:07:00' THEN '15:05:00' end) as datetime);

if (code in ('600000','600010','600015','600016','600018','600028','600030','600036','600048','600050','600089','600104','600109','600111','600150','600256','600406','600518','600519','600583','600585','600637','600690','600837','600887','600893','600958','600999','601006','601088','601166','601169','601186','601288','601318','601328','601390','601398','601601','601628','601668','601688','601766','601800','601818','601857','601901','601988','601989','601998')) then INSERT INTO `hs_s_sh50_rt_EM` (`code`, `close`, `amount`, `volume`, `chgrate`, `WeiBi`, `chgrate5`, `LiangBi`, `date`, `time`, `TimeSlot`) VALUES (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot) 
ON DUPLICATE KEY UPDate 
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
`TimeSlot` = TimeSlot; end if;
END$$
DELIMITER ;

-- SET TimeSlot =  CASE WHEN time < '09:30:00' THEN '09:25:00' WHEN time < '09:40:00' THEN '09:35:00' WHEN time < '09:45:00' THEN '09:40:00' WHEN time < '09:55:00' THEN '09:50:00' WHEN time < '10:05:00' THEN '10:00:00' WHEN time < '10:15:00' THEN '10:10:00' WHEN time < '10:25:00' THEN '10:20:00' WHEN time < '10:35:00' THEN '10:30:00' WHEN time < '10:45:00' THEN '10:40:00' WHEN time < '10:55:00' THEN '10:50:00' WHEN time < '11:05:00' THEN '11:00:00' WHEN time < '11:15:00' THEN '11:10:00' WHEN time < '11:25:00' THEN '11:20:00' WHEN time < '11:35:00' THEN '11:30:00' WHEN (time < '13:15:00' and time > '13:05:00') THEN '13:10:00' WHEN time < '13:25:00' THEN '13:20:00' WHEN time < '13:35:00' THEN '13:30:00' WHEN time < '13:45:00' THEN '13:40:00' WHEN time < '13:55:00' THEN '13:50:00' WHEN time < '14:05:00' THEN '14:00:00' WHEN time < '14:15:00' THEN '14:10:00' WHEN time < '14:15:00' THEN '14:10:00' WHEN time < '14:25:00' THEN '14:20:00' WHEN time < '14:35:00' THEN '14:30:00' WHEN time < '14:45:00' THEN '14:40:00' WHEN time < '14:55:00' THEN '14:50:00' WHEN time < '15:05:00' THEN '15:00:00' end;

-- SET TimeSlot =  CASE WHEN time < '09:30:00' THEN '09:25:00' WHEN time < '09:35:00' THEN '09:30:00' WHEN time < '09:40:00' THEN '09:35:00' WHEN time < '09:45:00' THEN '09:40:00' WHEN time < '09:50:00' THEN '09:45:00' WHEN time < '09:55:00' THEN '09:50:00' WHEN time < '10:00:00' THEN '09:55:00' WHEN time < '10:05:00' THEN '10:00:00' WHEN time < '10:10:00' THEN '10:05:00' WHEN time < '10:15:00' THEN '10:10:00' WHEN time < '10:20:00' THEN '10:15:00' WHEN time < '10:25:00' THEN '10:20:00' WHEN time < '10:30:00' THEN '10:25:00' WHEN time < '10:35:00' THEN '10:30:00' WHEN time < '10:40:00' THEN '10:35:00' WHEN time < '10:45:00' THEN '10:40:00' WHEN time < '10:50:00' THEN '10:45:00' WHEN time < '10:55:00' THEN '10:50:00' WHEN time < '11:00:00' THEN '10:55:00' WHEN time < '11:05:00' THEN '11:00:00' WHEN time < '11:10:00' THEN '11:05:00' WHEN time < '11:15:00' THEN '11:10:00' WHEN time < '11:20:00' THEN '11:15:00' WHEN time < '11:25:00' THEN '11:20:00' WHEN time < '11:30:00' THEN '11:25:00' WHEN time < '11:35:00' THEN '11:30:00' WHEN (time < '13:10:00' and time > '13:00:00') THEN '13:05:00' WHEN time < '13:15:00' THEN '13:10:00' WHEN time < '13:20:00' THEN '13:15:00' WHEN time < '13:25:00' THEN '13:20:00' WHEN time < '13:30:00' THEN '13:25:00' WHEN time < '13:35:00' THEN '13:30:00' WHEN time < '13:40:00' THEN '13:35:00' WHEN time < '13:45:00' THEN '13:40:00' WHEN time < '13:50:00' THEN '13:45:00' WHEN time < '13:55:00' THEN '13:50:00' WHEN time < '14:00:00' THEN '13:55:00' WHEN time < '14:05:00' THEN '14:00:00' WHEN time < '14:10:00' THEN '14:05:00' WHEN time < '14:15:00' THEN '14:10:00' WHEN time < '14:20:00' THEN '14:15:00' WHEN time < '14:25:00' THEN '14:20:00' WHEN time < '14:30:00' THEN '14:25:00' WHEN time < '14:35:00' THEN '14:30:00' WHEN time < '14:40:00' THEN '14:35:00' WHEN time < '14:45:00' THEN '14:40:00' WHEN time < '14:50:00' THEN '14:45:00' WHEN time < '14:55:00' THEN '14:50:00' WHEN time < '15:00:00' THEN '14:55:00' WHEN time < '15:05:00' THEN '15:00:00' WHEN time < '15:10:00' THEN '15:05:00' end


CALL hs_s_sh50_rt_EM('[标签:code]','[标签:close]','[标签:amount]','[标签:volume]','[标签:chgrate]','[标签:WeiBi]','[标签:chgrate5]','[标签:LiangBi]','[标签:date]','[标签:time]','');