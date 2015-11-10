-- 前复权表

SELECT * FROM `s_xts_adj` ORDER BY d DESC, ids;

CREATE TABLE `s_xts_adj` (
  `ids` VARCHAR(6) NOT NULL COMMENT 'stock id 股票代码',
  `d` DATE DEFAULT NULL COMMENT 'trade date 交易日期',
  `open` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'open 开盘价',
  `high` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'high 最高价',
  `low` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'low 最低价',
  `close` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'close 收盘价',
  `volume` INT(11) UNSIGNED NOT NULL COMMENT 'volume 成交量',
  `amount` BIGINT(12) UNSIGNED NOT NULL COMMENT 'amount 股票成交额',
  PRIMARY KEY (`ids`,`d`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

ALTER TABLE `ying`.`s_xts_adj` 
CHANGE COLUMN `volume` `volume` INT(9) UNSIGNED NOT NULL COMMENT 'volume 成交量' ,
CHANGE COLUMN `amount` `amount` MEDIUMINT(8) UNSIGNED NOT NULL COMMENT 'amount 股票成交额' ;

-- 151110
ALTER TABLE `ying_calc`.`s_xts_adj`
ADD COLUMN `cjezb` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT '10000*amount_stock / amount_all_stock 成交额占比' ;

-- insert data into `s_xts_adj` from `s_xts`

INSERT IGNORE INTO `ying_calc`.`s_xts_adj`
	(
	    `ids`,
	    `d`,
	    `open`,
	    `high`,
	    `low`,
	    `close`,
	    `volume`,
	    `amount`
        )
SELECT 
	    `s_xts`.`ids`,
	    `s_xts`.`d`,
	    `s_xts`.`open`,
	    `s_xts`.`high`,
	    `s_xts`.`low`,
	    `s_xts`.`close`,
	    `s_xts`.`volume`,
	    `s_xts`.`amount`
FROM
    `s_xts` WHERE `s_xts`.`d` = '2015-10-29'; 

-- insert data into `s_xts_adj` from `s_xts_adj_hst_sina`

INSERT INTO `s_xts_adj`
	(
	    `ids`,
	    `d`,
	    `open`,
	    `high`,
	    `low`,
	    `close`,
	    `volume`,
	    `amount`
        )
SELECT 
    `s_xts_adj_hst_sina`.`ids`,
    `s_xts_adj_hst_sina`.`d`,
    ROUND(`s_xts_adj_hst_sina`.`open` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`high` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`low` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`close` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`volume`, 2),
    ROUND(`s_xts_adj_hst_sina`.`amount`, 2)
FROM
    `s_xts_adj_hst_sina`  
        JOIN
    s_xts_adj_hst_sina_faL faL ON `s_xts_adj_hst_sina`.`ids` = faL.ids
ON DUPLICATE KEY UPDATE 
    `open` = ROUND(`s_xts_adj_hst_sina`.`open`/faL.fa,2),
    `high` = ROUND(`s_xts_adj_hst_sina`.`high`/faL.fa,2),
    `low`  = ROUND(`s_xts_adj_hst_sina`.`low`/faL.fa,2),
    `close` = ROUND(`s_xts_adj_hst_sina`.`close`/faL.fa,2),
    `volume` = ROUND(`s_xts_adj_hst_sina`.`volume`,2),
    `amount` = ROUND(`s_xts_adj_hst_sina`.`amount`,2) ;

-- insert data into `s_xts_adj` from `s_xts_adj_hst_sina` for selected stocks

INSERT INTO `s_xts_adj`
	(
	    `ids`,
	    `d`,
	    `open`,
	    `high`,
	    `low`,
	    `close`,
	    `volume`,
	    `amount`
        )
SELECT 
    `s_xts_adj_hst_sina`.`ids`,
    `s_xts_adj_hst_sina`.`d`,
    ROUND(`s_xts_adj_hst_sina`.`open` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`high` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`low` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`close` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`volume`, 2),
    ROUND(`s_xts_adj_hst_sina`.`amount`, 2)
FROM
    `s_xts_adj_hst_sina`  
        JOIN
    s_xts_adj_hst_sina_faL faL ON `s_xts_adj_hst_sina`.`ids` = faL.ids AND `s_xts_adj_hst_sina`.`ids` IN (000630,000725,600016,600028,600050,600795,601288,601328,601398,601668,601818,601899,601939,601985,601988,601989)
ON DUPLICATE KEY UPDATE 
    `open` = ROUND(`s_xts_adj_hst_sina`.`open`/faL.fa,2),
    `high` = ROUND(`s_xts_adj_hst_sina`.`high`/faL.fa,2),
    `low`  = ROUND(`s_xts_adj_hst_sina`.`low`/faL.fa,2),
    `close` = ROUND(`s_xts_adj_hst_sina`.`close`/faL.fa,2),
    `volume` = ROUND(`s_xts_adj_hst_sina`.`volume`,2),
    `amount` = ROUND(`s_xts_adj_hst_sina`.`amount`,2) ;

SELECT GROUP_CONCAT(DISTINCT ids) FROM ying.s_xts_adj WHERE volume = 16777215 ORDER BY volume DESC LIMIT 10000;


-- 5:39 2015-10-28 revise data type of volume and amount    
ALTER TABLE `ying_calc`.`s_xts_adj` 
CHANGE COLUMN `volume` `volume` MEDIUMINT(9) UNSIGNED NOT NULL COMMENT 'volume 成交量 手' ,
CHANGE COLUMN `amount` `amount` MEDIUMINT(8) UNSIGNED NOT NULL COMMENT 'amount 股票成交额 万' ;

-- insert data into `s_xts_adj` from `s_xts_adj_hst_sina` where date_diff(curdate(), `s_xts_adj_hst_sina`.`d`)<=7 

INSERT INTO `s_xts_adj`
	(
	    `ids`,
	    `d`,
	    `open`,
	    `high`,
	    `low`,
	    `close`,
	    `volume`,
	    `amount`
        )
SELECT 
    `s_xts_adj_hst_sina`.`ids`,
    `s_xts_adj_hst_sina`.`d`,
    ROUND(`s_xts_adj_hst_sina`.`open` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`high` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`low` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`close` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`volume`, 2),
    ROUND(`s_xts_adj_hst_sina`.`amount`, 2)
FROM
    `s_xts_adj_hst_sina`  
        JOIN
    s_xts_adj_hst_sina_faL faL ON `s_xts_adj_hst_sina`.`ids` = faL.ids AND DATEDIFF(CURDATE(), `s_xts_adj_hst_sina`.`d`)<=7
ON DUPLICATE KEY UPDATE 
    `open` = ROUND(`s_xts_adj_hst_sina`.`open`/faL.fa,2),
    `high` = ROUND(`s_xts_adj_hst_sina`.`high`/faL.fa,2),
    `low`  = ROUND(`s_xts_adj_hst_sina`.`low`/faL.fa,2),
    `close` = ROUND(`s_xts_adj_hst_sina`.`close`/faL.fa,2),
    `volume` = ROUND(`s_xts_adj_hst_sina`.`volume`,2),
    `amount` = ROUND(`s_xts_adj_hst_sina`.`amount`,2) ;
    
-- insert data into `ying_calc`.`s_xts_adj` from `s_xts_adj_hst_sina` where date_diff(curdate(), `s_xts_adj_hst_sina`.`d`)<=3 

INSERT INTO `ying_calc`.`s_xts_adj`
	(
	    `ids`,
	    `d`,
	    `open`,
	    `high`,
	    `low`,
	    `close`,
	    `volume`,
	    `amount`
        )
SELECT 
    `s_xts_adj_hst_sina`.`ids`,
    `s_xts_adj_hst_sina`.`d`,
    ROUND(`s_xts_adj_hst_sina`.`open` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`high` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`low` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`close` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`volume`, 2),
    ROUND(`s_xts_adj_hst_sina`.`amount`, 2)
FROM
    `s_xts_adj_hst_sina`  
        JOIN
    s_xts_adj_hst_sina_faL faL ON `s_xts_adj_hst_sina`.`ids` = faL.ids AND DATEDIFF(CURDATE(), `s_xts_adj_hst_sina`.`d`)<=3
ON DUPLICATE KEY UPDATE 
    `open` = ROUND(`s_xts_adj_hst_sina`.`open`/faL.fa,2),
    `high` = ROUND(`s_xts_adj_hst_sina`.`high`/faL.fa,2),
    `low`  = ROUND(`s_xts_adj_hst_sina`.`low`/faL.fa,2),
    `close` = ROUND(`s_xts_adj_hst_sina`.`close`/faL.fa,2),
    `volume` = ROUND(`s_xts_adj_hst_sina`.`volume`,2),
    `amount` = ROUND(`s_xts_adj_hst_sina`.`amount`,2) ;