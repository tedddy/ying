-- 4:54 2015-10-28

CREATE TABLE `s_xts_sma` (
  `dt` date NOT NULL,
  `ids` varchar(6) NOT NULL COMMENT 'ids',
  `close5` decimal(6,2) unsigned DEFAULT NULL COMMENT 'clo 5 periods均线',
  `close5_d1` decimal(6,2) DEFAULT NULL,
  `close10` decimal(6,2) unsigned DEFAULT NULL COMMENT 'clo 10 periods均线',
  `close20` decimal(6,2) unsigned DEFAULT NULL COMMENT 'clo 20 periods均线',
  `close30` decimal(6,2) unsigned DEFAULT NULL COMMENT 'clo 30 periods均线',
  `close60` decimal(6,2) unsigned DEFAULT NULL COMMENT 'clo 60 periods均线',
  `close120` decimal(6,2) unsigned DEFAULT NULL COMMENT 'clo 120 periods均线',
  PRIMARY KEY (`ids`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
