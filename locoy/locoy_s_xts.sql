-- Task: Migrate locoy project `hs_s_xts` to `s_xts`

/* Migrate locoy project `hs_s_xts` to `s_xts` step 1:  migrate table
	10:16 2015-10-21 
    1. change table name
	2. delete id, time, fR
	3. change code to ids, date to d
    4. change primary key and delete unique key, delete AUTO_INCREMENT */

-- 10:15 2015-10-21

-- DROP TABLE `s_xts`;

CREATE TABLE `s_xts` (
  `ids` VARCHAR(6) NOT NULL COMMENT 'stock id 股票代码',
  `d` DATE DEFAULT NULL COMMENT 'trade date 交易日期',
  `open` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'open 开盘价',
  `high` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'high 最高价',
  `low` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'low 最低价',
  `close` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'close 收盘价',
  `volume` INT(11) UNSIGNED NOT NULL COMMENT 'volume 成交量',
  `amount` BIGINT(12) UNSIGNED NOT NULL COMMENT 'amount 股票成交额',
  `clo` DECIMAL(6,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT 'adjusted close 复权后的收盘价',
  PRIMARY KEY (`ids`,`d`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

/* Migrate locoy project `hs_s_xts` to `s_xts` step 1: migrate table 
	10:58 2015-10-21 
    5. import date from table `hs_s_xts` to table `s_xts` */

INSERT INTO `ying`.`s_xts`
	(`ids`,
	`d`,
	`open`,
	`high`,
	`low`,
	`close`,
	`volume`,
	`amount`,
	`clo`)
SELECT 
    `hs_s_xts`.`code`,
    `hs_s_xts`.`date`,
    `hs_s_xts`.`open`,
    `hs_s_xts`.`high`,
    `hs_s_xts`.`low`,
    `hs_s_xts`.`close`,
    `hs_s_xts`.`volume`,
    `hs_s_xts`.`amount`,
    `hs_s_xts`.`clo`
FROM `ying`.`hs_s_xts`;

INSERT INTO `ying`.`s_xts`
	(`ids`,
	`d`,
	`open`,
	`high`,
	`low`,
	`close`,
	`volume`,
	`amount`,
	`clo`)
SELECT 
    `hs_s_xts`.`code`,
    `hs_s_xts`.`date`,
    `hs_s_xts`.`open`,
    `hs_s_xts`.`high`,
    `hs_s_xts`.`low`,
    `hs_s_xts`.`close`,
    `hs_s_xts`.`volume`,
    `hs_s_xts`.`amount`,
    `hs_s_xts`.`clo`
FROM `ying`.`hs_s_xts` where date = '2015-10-21' ;
-- 
SELECT COUNT(*) FROM `ying`.`hs_s_xts`;
SELECT COUNT(*) FROM `ying`.`s_xts`;
SELECT * FROM `ying`.`hs_s_xts_fast` ORDER BY date DESC;
SELECT * FROM `ying`.`s_xts` where d = '2015-10-22' ORDER BY d DESC;

-- clean data
SELECT COUNT(*) FROM `ying`.`s_xts` WHERE `amount` = 0 OR volume = 0;
SELECT * FROM `ying`.`s_xts` WHERE `amount` = 0 OR volume = 0;
DELETE FROM `ying`.`s_xts` WHERE `amount` = 0 OR volume = 0;

-- update field clo 
update `ying`.`s_xts` set `clo` = close;

/* Migrate locoy project `hs_s_xts` to `s_xts` step 2: migrate procedure
	10:16 2015-10-21 
    change procedure name
	delete time
	change code to ids, date to d 
    a record is inserted when volume > 0 AND volume IS NOT NULL*/

DROP PROCEDURE `s_xts`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `s_xts`(IN ids VARCHAR(6), d DATE, open DECIMAL(7,3), high DECIMAL(7,3), low DECIMAL(7,3), close DECIMAL(7,3), volume BIGINT(11) UNSIGNED, amount BIGINT(12) UNSIGNED)

BEGIN
	DECLARE clo DECIMAL(6,2);
	SET `ids` = IF(ids = '', NULL, ids);
	SET `d` = IF(d = '', NULL, d);
	SET `open` = IF(open = '', NULL, open);
	SET `high` = IF(high = '', NULL, high);
	SET `low` = IF(low = '', NULL, low);
	SET `close` = IF(close = '', NULL, close);
	SET `volume` = IF(volume = '', NULL, volume);
	SET `amount` = IF(amount = '', NULL, amount);
	SET `clo` = IF(close = '', NULL, close);

	IF volume > 0 AND volume IS NOT NULL THEN
		INSERT INTO `s_xts` (`ids`, `d`, `open`, `high`, `low`, `close`, `volume`, `amount`, `clo`) VALUES (ids, d, open, high, low, close, volume, amount, clo) 
		ON DUPLICATE KEY UPDATE
			`open` = open,
			`high` =high,
			`low` = low,
			`close` = close,
			`volume` = volume,
			`amount` = amount,
			`clo` = clo;
	END IF;
END$$
DELIMITER ;


CALL s_xts('[标签:ids]', '[标签:d]', '[标签:open]', '[标签:high]', '[标签:low]', '[标签:close]', '[标签:volume]', '[标签:amount]') 


