CREATE TABLE `ying_calc`.`s_rt_hst_sma` (
  `dt` datetime NOT NULL,
  `ids` varchar(6) NOT NULL COMMENT 'ids',
  `amount5` mediumint(8) DEFAULT NULL COMMENT 'amount 5 periods均线',
  `amount10` mediumint(8) DEFAULT NULL COMMENT 'amount 10 periods均线',
  `amount20` mediumint(8) DEFAULT NULL COMMENT 'amount 20 periods均线',
  `amount30` mediumint(8) DEFAULT NULL COMMENT 'amount 30 periods均线',
  `amount60` mediumint(8) DEFAULT NULL COMMENT 'amount 60 periods均线',
  `amount120` mediumint(8) DEFAULT NULL COMMENT 'amount 120 periods均线',
  PRIMARY KEY (`dt`,`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT `s_rt_hst_sma`.`dt`,
    `s_rt_hst_sma`.`ids`,
    `s_rt_hst_sma`.`amount5`,
    `s_rt_hst_sma`.`amount10`,
    `s_rt_hst_sma`.`amount20`,
    `s_rt_hst_sma`.`amount30`,
    `s_rt_hst_sma`.`amount60`,
    `s_rt_hst_sma`.`amount120`
FROM `ying_calc`.`s_rt_hst_sma`;

