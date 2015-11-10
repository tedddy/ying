SELECT * FROM `ying_calc`.`tableTMPL`;

-- DROP TABLE `ying_calc`.`tableTMPL`;

CREATE TABLE `ying_calc`.`tableTMPL` (
  `idTMPL` varchar(6) NOT NULL COMMENT 'stock id',
  `dtTMPL` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fieldTMPL` decimal(6,2) unsigned NOT NULL COMMENT 'close',
  `fieldTMPL_d1` decimal(6,2) DEFAULT NULL,
  `volume` int(10) unsigned NOT NULL COMMENT '成交量',
  `amount` int(10) unsigned NOT NULL COMMENT '成交额',
  `chgrate` decimal(5,2) NOT NULL COMMENT '涨跌幅',
  `WeiBi` decimal(6,2) unsigned NOT NULL COMMENT '委比',
  `chgrate5` decimal(5,2) NOT NULL COMMENT '五分钟涨幅',
  `LiangBi` decimal(6,2) unsigned NOT NULL COMMENT '量比',
  PRIMARY KEY (`idTMPL`,`dtTMPL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- import data from `ying_calc`.`s_rt_hst` to `ying_calc`.`tableTMPL`, where field name `close` is changed to fieldTMPL.
INSERT INTO `ying_calc`.`tableTMPL` 
	( 	
		`tableTMPL`.`idTMPL`,
		`tableTMPL`.`dtTMPL`,
		`tableTMPL`.`fieldTMPL`,
		`tableTMPL`.`volume`,
		`tableTMPL`.`amount`,
		`tableTMPL`.`chgrate`,
		`tableTMPL`.`WeiBi`,
		`tableTMPL`.`chgrate5`,
		`tableTMPL`.`LiangBi`
    )
SELECT 
		`ying_calc`.`s_rt_hst`.`ids`,
		`ying_calc`.`s_rt_hst`.`dt`,
		`ying_calc`.`s_rt_hst`.`close`,
		`ying_calc`.`s_rt_hst`.`volume`,
		`ying_calc`.`s_rt_hst`.`amount`,
		`ying_calc`.`s_rt_hst`.`chgrate`,
		`ying_calc`.`s_rt_hst`.`WeiBi`,
		`ying_calc`.`s_rt_hst`.`chgrate5`,
		`ying_calc`.`s_rt_hst`.`LiangBi`  
FROM `ying_calc`.`s_rt_hst`
WHERE `ids` in ('601318', '000001') order by `dt` desc
ON DUPLICATE KEY UPDATE
		`tableTMPL`.`fieldTMPL` = `ying_calc`.`s_rt_hst`.`close`,
		`tableTMPL`.`volume` = `ying_calc`.`s_rt_hst`.`volume`,
		`tableTMPL`.`amount` = `ying_calc`.`s_rt_hst`.`amount`,
		`tableTMPL`.`chgrate` = `ying_calc`.`s_rt_hst`.`chgrate`,
		`tableTMPL`.`WeiBi` = `ying_calc`.`s_rt_hst`.`WeiBi`,
		`tableTMPL`.`chgrate5` = `ying_calc`.`s_rt_hst`.`chgrate5`,
		`tableTMPL`.`LiangBi` = `ying_calc`.`s_rt_hst`.`LiangBi`;