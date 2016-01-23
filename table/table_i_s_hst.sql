CREATE TABLE `i_s_hst` (
  `idi` varchar(6) NOT NULL DEFAULT '' COMMENT 'code_index',
  `ids` varchar(6) NOT NULL DEFAULT '' COMMENT 'code',
  `dt_start` date DEFAULT NULL COMMENT 'dt_start',
  `dt_end` date NOT NULL DEFAULT '0000-00-00' COMMENT 'dt_end',
  `DateSys` date DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`idi`,`ids`,`dt_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT IGNORE INTO `ying_calc`.`i_s_hst`
(`idi`,
`ids`,
`dt_start`,
`dt_end`,
`DateSys`)
SELECT `idi`,
`ids`,
`dt_start`,
`dt_end`,
`DateSys` FROM `ying_calc`.`i_s` WHERE dt_end <> '0000-00-00';

DELETE FROM `ying_calc`.`i_s` WHERE dt_end <> '0000-00-00';