SELECT * FROM `ying_calc`.`index_xts` ORDER BY `idi`, `dt` DESC;

SELECT `idi`, `dt`, `cjezb` FROM `ying_calc`.`index_xts` where `idi` IN ('000902', '000001') ORDER BY `cjezb` DESC, `dt` DESC;

SELECT `idi`, `dt`, cjezb FROM `ying_calc`.`index_xts` where `idi` IN ('000902', '000001') ORDER BY `dt` DESC;


-- DROP TABLE `index_xts`;	
CREATE TABLE `ying_calc`.`index_xts` (
  `idi` varchar(6) NOT NULL COMMENT 'index id',
  `dt` date NOT NULL COMMENT '交易日期 trade date',
  `open` decimal(7,2) unsigned DEFAULT NULL COMMENT '开盘价',
  `high` decimal(7,2) unsigned DEFAULT NULL COMMENT '最高',
  `low` decimal(7,2) unsigned DEFAULT NULL COMMENT '最低价',
  `close` decimal(7,2) unsigned DEFAULT NULL COMMENT '收盘价',
  `close_lead` decimal(6,2) DEFAULT NULL,
  `close_d1` decimal(6,2) DEFAULT NULL,
  `volume` int(9) unsigned DEFAULT NULL COMMENT '股票成交额',
  `amount` int(9) unsigned DEFAULT NULL COMMENT '成交量',
  `cjezb` decimal(6,2) unsigned NOT NULL COMMENT '10000*amount_stock / amount_all_stock 成交额占比',
  PRIMARY KEY (`idi`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- update cjezb

UPDATE `ying_calc`.`index_xts` a
        JOIN
    `ying_calc`.`index_xts` b ON (a.`dt` = b.`dt` AND b.`idi` = '000902') 
SET 
    a.`cjezb` = 100 * a.`volume` / b.`volume`;

-- update volume

-- 	UPDATE `ying_calc`.`index_xts` 
-- 	SET `volume` = 10 * `volume` where `dt` < '2015-11-01';
-- 
-- update amount

-- 	UPDATE `ying_calc`.`index_xts` 
-- 	SET `amount` = 10 * `amount` where `dt` < '2015-11-01';

INSERT INTO `ying_calc`.`index_xts`
(`idi`,
`dt`,
`open`,
`high`,
`low`,
`close`,
`volume`,
`amount`)
SELECT `index_xts`.`idi`,
    `index_xts`.`dt`,
    `index_xts`.`open`,
    `index_xts`.`high`,
    `index_xts`.`low`,
    `index_xts`.`close`,
    `index_xts`.`volume`,
    `index_xts`.`amount`
FROM `ying`.`index_xts`;
