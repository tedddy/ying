-- Task: Migrate locoy project `hs_s_xts` to `s_xts`

/* Migrate locoy project `hs_s_xts` to `s_xts`: step 2 
	10:16 2015-10-21 
    change table name
	delete id, time, fR
	change code to ids, date to d
    change primary key and delete unique key, delete AUTO_INCREMENT */

-- 10:15 2015-10-21

DROP TABLE `s_xts`;

CREATE TABLE `s_xts` (
  `ids` VARCHAR(6) NOT NULL COMMENT 'stock id 股票代码',
  `d` DATE DEFAULT NULL COMMENT 'trade date 交易日期',
  `open` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'open 开盘价',
  `high` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'high 最高价',
  `low` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'low 最低价',
  `close` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'close 收盘价',
  `volume` INT(11) UNSIGNED NOT NULL COMMENT 'volume 成交量',
  `amount` BIGINT(12) UNSIGNED NOT NULL COMMENT 'amount 股票成交额',
  `adjusted` DECIMAL(6,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT 'adjusted close 复权后的收盘价',
  PRIMARY KEY (`ids`,`d`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

/* Migrate locoy project `hs_s_xts` to `s_xts`: step 3 
	10:58 2015-10-21 
    import date from table `hs_s_xts` to table `s_xts` */

INSERT INTO `ying`.`s_xts`
(`ids`,
`d`,
`open`,
`high`,
`low`,
`close`,
`volume`,
`amount`,
`adjusted`)
SELECT 
    `hs_s_xts`.`code`,
    `hs_s_xts`.`date`,
    `hs_s_xts`.`open`,
    `hs_s_xts`.`high`,
    `hs_s_xts`.`low`,
    `hs_s_xts`.`close`,
    `hs_s_xts`.`volume`,
    `hs_s_xts`.`amount`,
    `hs_s_xts`.`adjusted`
FROM `ying`.`hs_s_xts`;

SELECT count(*) FROM `ying`.`hs_s_xts`;
SELECT count(*) FROM `ying`.`s_xts`;
SELECT * FROM `ying`.`s_xts` order by d desc;
SELECT count(*) FROM `ying`.`s_xts` where `amount` = 0 or volume = 0;

