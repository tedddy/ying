 CREATE TABLE `ying_calc`.`index_stock_info_all` (
  `idi` char(6) NOT NULL COMMENT 'index id',
  `ids` varchar(6) NOT NULL COMMENT 'stock id',
  `weight` decimal(6,3) DEFAULT NULL COMMENT 'weight of stock',
  `flag` varchar(6) DEFAULT NULL COMMENT '`hs_s` flag',
  `DateSys` date DEFAULT NULL,
  PRIMARY KEY (`idi`,`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT * FROM `ying_calc`.`index_stock_info_all` WHERE `ying_calc`.`index_stock_info_all`.`idi` = '000902';

select a.`date`, a.`open`, a.`high`, a.`low`, a.`close`, a.`volume`, a.`amount` from (SELECT `date`, `open`, `high`, `low`, `close`, `volume`, `amount` FROM `ying`.`hk_s_xts` where code = '02823' order by `date` desc limit 48) as a order by a.`date`;


SELECT * from `ying`.`index_info` order by fw desc;