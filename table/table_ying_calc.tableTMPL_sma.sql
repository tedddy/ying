SELECT * FROM `ying_calc`.`tableTMPL_sma`;

 DROP TABLE `ying_calc`.`tableTMPL_sma`;

CREATE TABLE `ying_calc`.`tableTMPL_sma` (
  `dtTMPL` datetime NOT NULL,
  `idTMPL` varchar(6) NOT NULL COMMENT 'ids',
  `fieldTMPL5` decimal(6,2) unsigned DEFAULT NULL COMMENT 'fieldTMPL 5 periods均线',
  `fieldTMPL10` decimal(6,2) unsigned DEFAULT NULL COMMENT 'fieldTMPL 10 periods均线',
  `fieldTMPL20` decimal(6,2) unsigned DEFAULT NULL COMMENT 'fieldTMPL 20 periods均线',
  `fieldTMPL30` decimal(6,2) unsigned DEFAULT NULL COMMENT 'fieldTMPL 30 periods均线',
  `fieldTMPL60` decimal(6,2) unsigned DEFAULT NULL COMMENT 'fieldTMPL 60 periods均线',
  `fieldTMPL120` decimal(6,2) unsigned DEFAULT NULL COMMENT 'fieldTMPL 120 periods均线',
  PRIMARY KEY (`idTMPL`,`dtTMPL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


