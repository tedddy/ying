-- `ying_calc`.`s_xts_adj_sma` 

CREATE TABLE `s_xts_adj_sma` (
  `d` date NOT NULL,
  `ids` varchar(6) NOT NULL COMMENT 'ids',
  `close5` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close 5 periods均线',
  `close10` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close 10 periods均线',
  `close20` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close 20 periods均线',
  `close30` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close 30 periods均线',
  `close60` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close 60 periods均线',
  `close120` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close 120 periods均线',
  `amount5` mediumint(8) unsigned DEFAULT NULL COMMENT 'amount 5 periods均线',
  `amount10` mediumint(8) unsigned DEFAULT NULL COMMENT 'amount 10 periods均线',
  `amount20` mediumint(8) unsigned DEFAULT NULL COMMENT 'amount 20 periods均线',
  `amount30` mediumint(8) unsigned DEFAULT NULL COMMENT 'amount 30 periods均线',
  `amount60` mediumint(8) unsigned DEFAULT NULL COMMENT 'amount 60 periods均线',
  `amount120` mediumint(8) unsigned DEFAULT NULL COMMENT 'amount 120 periods均线',
  PRIMARY KEY (`ids`,`d`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
