SELECT * FROM `ying_calc`.`index_xts` ORDER BY `dt` DESC, idi;
-- DROP TABLE `index_xts`;	
CREATE TABLE `ying_calc`.`index_xts` (
  `idi` varchar(6) NOT NULL COMMENT 'index id',
  `dt` date NOT NULL COMMENT '交易日期 trade date',
  `open` decimal(7,2) unsigned DEFAULT NULL COMMENT '开盘价',
  `high` decimal(7,2) unsigned DEFAULT NULL COMMENT '最高',
  `low` decimal(7,2) unsigned DEFAULT NULL COMMENT '最低价',
  `close` decimal(7,2) unsigned DEFAULT NULL COMMENT '收盘价',
  `volume` int(9) unsigned DEFAULT NULL COMMENT '股票成交额',
  `amount` int(9) unsigned DEFAULT NULL COMMENT '成交量',
  PRIMARY KEY (`idi`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
