-- Version start from 150920.
-- 
CREATE TABLE `hk_w_rt` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(5) NOT NULL COMMENT '代码',
  `close` decimal(7,3) unsigned DEFAULT NULL COMMENT '当前价',
  `buy` decimal(7,3) unsigned DEFAULT NULL COMMENT '买一价',
  `sell` decimal(7,3) unsigned DEFAULT NULL COMMENT '卖一价',
  `volume` int(11) unsigned DEFAULT NULL COMMENT 'volume',
  `amount` int(11) unsigned DEFAULT NULL COMMENT '权证成交额',
  `TimeSlot` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_date_time` (`code`,`date`,`time`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hk_w_rt`(IN code CHAR(5), close DECIMAL(7,3), buy DECIMAL(7,3), sell DECIMAL(7,3), `volume` int(11) unsigned, `amount` int(11) unsigned, `TimeSlot` datetime)
BEGIN
SET code = IF(code = '', NULL, code);
SET close = IF(close = '', NULL, close);
SET buy = IF(buy = '', NULL, buy);
SET sell = IF(sell = '', NULL, sell);
SET volume = IF(volume = '', NULL, volume);
SET amount = IF(amount = '', NULL, amount);
SET TimeSlot =  cast(CONCAT(curdate(), ' ', CASE WHEN (curtime() <='09:45:00' and curtime() > '09:35:00') THEN '09:40:00' CASE WHEN (curtime() <='09:55:00' and curtime() > '09:45:00') THEN '09:50:00' CASE WHEN (curtime() <='10:05:00' and curtime() > '09:55:00') THEN '10:00:00' CASE WHEN (curtime() <='10:15:00' and curtime() > '10:05:00') THEN '10:10:00' CASE WHEN (curtime() <='10:25:00' and curtime() > '10:15:00') THEN '10:20:00' CASE WHEN (curtime() <='10:35:00' and curtime() > '10:25:00') THEN '10:30:00' CASE WHEN (curtime() <='10:45:00' and curtime() > '10:35:00') THEN '10:40:00' WHEN (curtime() <='10:55:00' and curtime() > '10:45:00') THEN '10:50:00' CASE WHEN (curtime() <='11:05:00' and curtime() > '10:55:00') THEN '11:00:00' CASE WHEN (curtime() <='11:15:00' and curtime() > '11:05:00') THEN '11:10:00' CASE WHEN (curtime() <='11:25:00' and curtime() > '11:15:00') THEN '11:20:00' CASE WHEN (curtime() <='11:35:00' and curtime() > '11:25:00') THEN '11:30:00' WHEN (curtime() <='11:45:00' and curtime() > '11:35:00') THEN '11:40:00' WHEN (curtime() <='11:55:00' and curtime() > '11:45:00') THEN '11:50:00' WHEN (curtime() <='12:05:00' and curtime() > '11:55:00') THEN '12:00:00' CASE WHEN (curtime() <='13:15:00' and curtime() > '13:05:00') THEN '13:10:00' CASE WHEN (curtime() <='13:25:00' and curtime() > '13:15:00') THEN '13:20:00' CASE WHEN (curtime() <='13:35:00' and curtime() > '13:25:00') THEN '13:30:00' CASE WHEN (curtime() <='13:45:00' and curtime() > '13:35:00') THEN '13:40:00' WHEN (curtime() <='13:55:00' and curtime() > '13:45:00') THEN '13:50:00'  CASE WHEN (curtime() <='14:05:00' and curtime() > '13:55:00') THEN '14:00:00' CASE WHEN (curtime() <='14:15:00' and curtime() > '14:05:00') THEN '14:10:00' CASE WHEN (curtime() <='14:25:00' and curtime() > '14:15:00') THEN '14:20:00' CASE WHEN (curtime() <='14:35:00' and curtime() > '14:25:00') THEN '14:30:00' CASE WHEN (curtime() <='14:45:00' and curtime() > '14:35:00') THEN '14:40:00' WHEN (curtime() <='14:55:00' and curtime() > '14:45:00') THEN '14:50:00' CASE WHEN (curtime() <='15:05:00' and curtime() > '14:55:00') THEN '15:00:00' CASE WHEN (curtime() <='15:15:00' and curtime() > '15:05:00') THEN '15:10:00' CASE WHEN (curtime() <='15:25:00' and curtime() > '15:15:00') THEN '15:20:00' CASE WHEN (curtime() <='15:35:00' and curtime() > '15:25:00') THEN '15:30:00' CASE WHEN (curtime() <='15:45:00' and curtime() > '15:35:00') THEN '15:40:00' WHEN (curtime() <='15:55:00' and curtime() > '15:45:00') THEN '15:50:00' WHEN (curtime() <='16:15:00' and curtime() > '15:55:00') THEN '16:00:00' end) as datetime);


INSERT INTO `hk_s_rt` (`code`, `close`, `buy`, `sell`, `amount`, `date`, `time`) VALUES (code, close, buy, sell, amount, date, time) 
ON DUPLICATE KEY UPDATE 
	`code` = IF(code IS NULL, `code`, code),
	`close` = IF(close IS NULL, `close`, close),
	`buy` = IF(buy IS NULL, `buy`, buy),
	`sell` = IF(sell IS NULL, `sell`, sell),
	`volume` = volume,
	`amount` = amount;
END$$
DELIMITER ;

CALL hk_w_rt('[标签:code]', '[标签:close]', '[标签:buy]', '[标签:sell]', '[标签:volume]', '[标签:amount]', '') 

-- Version before 150920. Backuped in archive folder 
-- 11:40:54 Dumping ying (hk_w_rt)
-- Running: mysqldump.exe --defaults-file="d:\users\tony\appdata\local\temp\tmp1shcdb.cnf"  --set-gtid-purged=OFF --user=gxh --host=192.168.137.172 --protocol=tcp --port=3306 --default-character-set=utf8 "ying" "hk_w_rt"
-- 11:40:56 Dumping ying views and/or routines and/or events
-- Running: mysqldump.exe --defaults-file="d:\users\tony\appdata\local\temp\tmpupka2k.cnf"  --set-gtid-purged=OFF --user=gxh --host=192.168.137.172 --protocol=tcp --port=3306 --default-character-set=utf8 --skip-triggers  --no-data  --no-create-db --no-create-info --routines --events "ying"
-- 11:40:57 Export of E:\bYun\securities\database_mysql\backup\dump\Dump20150921_hk_w_rt has finished


CREATE TABLE `hk_w_rt` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(5) NOT NULL COMMENT '代码',
  `price` decimal(7,3) unsigned DEFAULT NULL COMMENT '当前价',
  `buy` decimal(7,3) unsigned DEFAULT NULL COMMENT '买一价',
  `sell` decimal(7,3) unsigned DEFAULT NULL COMMENT '卖一价',
  `turnover` int(11) unsigned DEFAULT NULL COMMENT '权证成交额',
  `date` date DEFAULT NULL COMMENT '日期',
  `time` time DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_date_time` (`code`,`date`,`time`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hk_w_rt`(IN code CHAR(5), price DECIMAL(7,3), buy DECIMAL(7,3), sell DECIMAL(7,3), turnover BIGINT(12) UNSIGNED, date DATE, time TIME)
BEGIN
SET code = IF(code = '', NULL, code);
SET price = IF(price = '', NULL, price);
SET buy = IF(buy = '', NULL, buy);
SET sell = IF(sell = '', NULL, sell);
SET turnover = IF(turnover = '', NULL, turnover);
SET date = IF(date = '', NULL, date);
SET time = IF(time = '', NULL, time);

INSERT INTO `hk_s_rt` (`code`, `price`, `buy`, `sell`, `amount`, `date`, `time`) VALUES (code, price, buy, sell, amount, date, time) 
ON DUPLICATE KEY UPDATE 
	`code` = IF(code IS NULL, `code`, code),
	`price` = IF(price IS NULL, `price`, price),
	`buy` = IF(buy IS NULL, `buy`, buy),
	`sell` = IF(sell IS NULL, `sell`, sell),
	`amount` = IF(amount IS NULL, `amount`, amount);
END$$
DELIMITER ;

CALL hk_w_rt('[标签:code]', '[标签:price]', '[标签:buy]', '[标签:sell]', '[标签:turnover]', '[标签:date]', '[标签:time]') 
