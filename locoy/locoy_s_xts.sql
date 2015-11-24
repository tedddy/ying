-- Task: Migrate locoy project `hs_s_xts` to `s_xts`

/* Migrate locoy project `hs_s_xts` to `s_xts` step 1:  migrate table
	10:16 2015-10-21 
    1. change table name
	2. delete id, time, fR
	3. change code to ids, date to dt
    4. change primary key and delete unique key, delete AUTO_INCREMENT */

-- 10:15 2015-10-21

-- DROP TABLE `s_xts`;

CREATE TABLE `s_xts` (
  `ids` varchar(6) NOT NULL COMMENT 'stock id 股票代码',
  `dt` date NOT NULL DEFAULT '0000-00-00' COMMENT 'trade date 交易日期',
  `open` decimal(6,2) unsigned NOT NULL COMMENT 'open 开盘价',
  `high` decimal(6,2) unsigned NOT NULL COMMENT 'high 最高价',
  `low` decimal(6,2) unsigned NOT NULL COMMENT 'low 最低价',
  `close` decimal(6,2) unsigned NOT NULL COMMENT 'close 收盘价',
  `volume` int(11) unsigned NOT NULL COMMENT 'volume 成交量',
  `amount` bigint(12) unsigned NOT NULL COMMENT 'amount 股票成交额',
  PRIMARY KEY (`ids`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* Migrate locoy project `hs_s_xts` to `s_xts` step 1: migrate table 
	10:58 2015-10-21 
    5. import date from table `hs_s_xts` to table `s_xts` */
    

/* Migrate locoy project `hs_s_xts` to `s_xts` step 2: migrate procedure
	10:16 2015-10-21 
    change procedure name
	delete time
	change code to ids, date to dt 
    a record is inserted when volume > 0 AND volume IS NOT NULL*/

DROP PROCEDURE `s_xts`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `s_xts`(IN ids VARCHAR(6), dt DATE, open DECIMAL(7,3), high DECIMAL(7,3), low DECIMAL(7,3), close DECIMAL(7,3), volume INT(9) UNSIGNED, amount MEDIUMINT(12) UNSIGNED)

BEGIN
	SET `ids` = IF(ids = '', NULL, ids);
	SET `dt` = IF(dt = '', NULL, dt);
	SET `open` = IF(open = '', NULL, open);
	SET `high` = IF(high = '', NULL, high);
	SET `low` = IF(low = '', NULL, low);
	SET `close` = IF(close = '', NULL, close);
	SET `volume` = IF(volume = '', NULL, volume);
	SET `amount` = IF(amount = '', NULL, amount);

	IF volume > 0 AND volume IS NOT NULL THEN
		INSERT INTO `s_xts` (`ids`, `dt`, `open`, `high`, `low`, `close`, `volume`, `amount`) VALUES (ids, dt, open, high, low, close, volume, amount) 
		ON DUPLICATE KEY UPDATE
			`open` = open,
			`high` =high,
			`low` = low,
			`close` = close,
			`volume` = volume,
			`amount` = amount;
		INSERT INTO `ying_calc`.`s_xts_adj` (`ids`, `dt`, `open`, `high`, `low`, `close`, `volume`, `amount`) VALUES (ids, dt, open, high, low, close, volume, amount) 
		ON DUPLICATE KEY UPDATE
			`open` = open,
			`high` =high,
			`low` = low,
			`close` = close,
			`volume` = volume,
			`amount` = amount;
	END IF;
END$$
DELIMITER ;


CALL s_xts('[标签:ids]', '[标签:dt]', '[标签:open]', '[标签:high]', '[标签:low]', '[标签:close]', '[标签:volume]', '[标签:amount]');

INSERT INTO `s_xts`
	(`ids`,
	`dt`,
	`open`,
	`high`,
	`low`,
	`close`,
	`volume`,
	`amount`)
SELECT 
    `hs_s_xts`.`code`,
    `hs_s_xts`.`date`,
    `hs_s_xts`.`open`,
    `hs_s_xts`.`high`,
    `hs_s_xts`.`low`,
    `hs_s_xts`.`close`,
    `hs_s_xts`.`volume`,
    `hs_s_xts`.`amount`
FROM `hs_s_xts` WHERE date = '2015-10-21' ;
-- 
SELECT COUNT(*) FROM `hs_s_xts`;
SELECT COUNT(*) FROM `s_xts`;
SELECT * FROM `hs_s_xts_fast` ORDER BY date DESC;
SELECT * FROM `s_xts` WHERE dt = '2015-10-22' ORDER BY dt DESC;

-- clean data
SELECT COUNT(*) FROM `s_xts` WHERE `amount` = 0 OR volume = 0;
SELECT * FROM `s_xts` WHERE `amount` = 0 OR volume = 0;
DELETE FROM `s_xts` WHERE `amount` = 0 OR volume = 0;