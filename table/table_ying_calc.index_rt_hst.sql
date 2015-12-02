
SELECT * FROM `ying_calc`.`index_rt_hst` ORDER BY `dt` DESC;

CREATE TABLE `ying_calc`.`index_rt_hst` (
  `idi` varchar(6) NOT NULL COMMENT 'index id',
  `close` decimal(9,2) unsigned DEFAULT NULL COMMENT '收盘价',
  `volume` int(9) unsigned DEFAULT NULL COMMENT '股票成交额',
  `amount` int(9) unsigned DEFAULT NULL COMMENT '成交量',
  `dt` datetime NOT NULL,
  PRIMARY KEY (`idi`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT IGNORE INTO `ying_calc`.`index_rt_hst`
(`idi`,
`close`,
`volume`,
`amount`,
`dt`)
SELECT `index_rt`.`idi`,
    `index_rt`.`close`,
    `index_rt`.`volume`,
    `index_rt`.`amount`,
    `index_rt`.`dt`
FROM `ying`.`index_rt`;
