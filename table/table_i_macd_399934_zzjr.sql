SELECT * FROM ying_calc.temp_i_macd order by dt desc;

SELECT * FROM ying_calc.i_macd_399934_zzjr order by dt desc, bl_cl;

SELECT mOsc_am_d1_EMA FROM ying_calc.i_macd_399934_zzjr order by dt desc, bl_cl;

SELECT * FROM ying_calc.i_macd_399934_zzjr where mOsc_cl > 0 and mOsc_am > 0 and mOsc_cl_d2_EMA > 0 order by dt desc, bl_cl;

SELECT * FROM ying_calc.i_macd_399934_zzjr where mOsc_cl > 0 and mOsc_am > 0 and mOsc_cl_d1_EMA > 0 and mOsc_am_d1_EMA > 0 order by dt desc, bl_cl;

-- DROP TABLE `ying_calc`.`i_macd_399934_zzjr`;
CREATE TABLE `ying_calc`.`i_macd_399934_zzjr` (
  `idi` char(6) NOT NULL DEFAULT '',
  `dt` date NOT NULL DEFAULT '0000-00-00',
  `close` decimal(8,2) DEFAULT NULL,
  `macd_cl` DECIMAL(6,2) DEFAULT NULL,
  `signal_cl` DECIMAL(6,2) DEFAULT NULL,
  `mOsc_cl` DECIMAL(6,2) DEFAULT NULL,
  `close_d1` decimal(8,2) DEFAULT NULL,
  `mOsc_cl_d1` DECIMAL(6,2) DEFAULT NULL,
  `mOsc_cl_d1_EMA` DECIMAL(6,2) DEFAULT NULL,
  `mOsc_cl_d2` DECIMAL(6,2) DEFAULT NULL,
  `mOsc_cl_d2_EMA` DECIMAL(6,2) DEFAULT NULL,
  `amount` int(9) DEFAULT NULL,
  `macd_am` DECIMAL(6,2) DEFAULT NULL,
  `signal_am` DECIMAL(6,2) DEFAULT NULL,
  `mOsc_am` DECIMAL(6,2) DEFAULT NULL,
  `amount_d1` int(9) DEFAULT NULL,
  `mOsc_am_d1` DECIMAL(6,2) DEFAULT NULL,
  `mOsc_am_d1_EMA` DECIMAL(6,2) DEFAULT NULL,
  `mOsc_am_d2` DECIMAL(6,2) DEFAULT NULL,
  `mOsc_am_d2_EMA` DECIMAL(6,2) DEFAULT NULL, 
  `bl_cl` DECIMAL(15,2) DEFAULT NULL,
  `bl_am` DECIMAL(15,2) DEFAULT NULL,
  PRIMARY KEY (`idi`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CALL `ying_calc`.`i_macd_399934_zzjr_import`;

-- DROP PROCEDURE `ying_calc`.`i_macd_399934_zzjr_import`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`i_macd_399934_zzjr_import`()
BEGIN
INSERT INTO `ying_calc`.`i_macd_399934_zzjr`
(`idi`,
`dt`,
`close`,
`macd_cl`,
`signal_cl`,
`mOsc_cl`,
`close_d1`,
`mOsc_cl_d1`,
`mOsc_cl_d1_EMA`,
`mOsc_cl_d2`,
`mOsc_cl_d2_EMA`,
`amount`,
`macd_am`,
`signal_am`,
`mOsc_am`,
`amount_d1`,
`mOsc_am_d1`,
`mOsc_am_d1_EMA`,
`mOsc_am_d2`,
`mOsc_am_d2_EMA`,
`bl_cl`,
`bl_am`)
SELECT `temp_i_macd`.`idi`,
    `temp_i_macd`.`dt`,
    `temp_i_macd`.`value.close`,
    round(`temp_i_macd`.`value.macd_cl`,2),
    round(`temp_i_macd`.`value.signal_cl`,2),
    round(`temp_i_macd`.`value.mOsc_cl`,2),
    round(`temp_i_macd`.`value.close_d1`,2),
    round(`temp_i_macd`.`value.mOsc_cl_d1`,2),
    round(`temp_i_macd`.`value.mOsc_cl_d1_EMA`,2),
    round(`temp_i_macd`.`value.mOsc_cl_d2`,2),
    round(`temp_i_macd`.`value.mOsc_cl_d2_EMA`,2),
    `temp_i_macd`.`value.amount`,
    round(`temp_i_macd`.`value.macd_am`,2),
    round(`temp_i_macd`.`value.signal_am`,2),
    round(`temp_i_macd`.`value.mOsc_am`,2),
    `temp_i_macd`.`value.amount_d1`,
    round(`temp_i_macd`.`value.mOsc_am_d1`,2),
    round(`temp_i_macd`.`value.mOsc_am_d1_EMA`,2),
    round(`temp_i_macd`.`value.mOsc_am_d2`,2),
    round(`temp_i_macd`.`value.mOsc_am_d2_EMA`,2),
    round(`temp_i_macd`.`value.bl_cl`,2),
    round(`temp_i_macd`.`value.bl_am`,2)
FROM `ying_calc`.`temp_i_macd` ON DUPLICATE KEY UPDATE
    `close`=round(`temp_i_macd`.`value.close`,2),
    `macd_cl`=round(`temp_i_macd`.`value.macd_cl`,2),
    `signal_cl`=round(`temp_i_macd`.`value.signal_cl`,2),
    `mOsc_cl`=round(`temp_i_macd`.`value.mOsc_cl`,2),
    `close_d1`=round(`temp_i_macd`.`value.close_d1`,2),
    `mOsc_cl_d1`=round(`temp_i_macd`.`value.mOsc_cl_d1`,2),
    `mOsc_cl_d1_EMA`=round(`temp_i_macd`.`value.mOsc_cl_d1_EMA`,2),
    `mOsc_cl_d2`=round(`temp_i_macd`.`value.mOsc_cl_d2`,2),
    `mOsc_cl_d2_EMA`=round(`temp_i_macd`.`value.mOsc_cl_d2_EMA`,2),
    `amount`=`temp_i_macd`.`value.amount`,
    `macd_am`=round(`temp_i_macd`.`value.macd_am`,2),
    `signal_am`=round(`temp_i_macd`.`value.signal_am`,2),
    `mOsc_am`=round(`temp_i_macd`.`value.mOsc_am`,2),
    `amount_d1`=`temp_i_macd`.`value.amount_d1`,
    `mOsc_am_d1`=round(`temp_i_macd`.`value.mOsc_am_d1`,2),
    `mOsc_am_d1_EMA`=round(`temp_i_macd`.`value.mOsc_am_d1_EMA`,2),
    `mOsc_am_d2`=round(`temp_i_macd`.`value.mOsc_am_d2`,2),
    `mOsc_am_d2_EMA`=round(`temp_i_macd`.`value.mOsc_am_d2_EMA`,2),
    `bl_cl`=round(`temp_i_macd`.`value.bl_cl`,2),
    `bl_am`=round(`temp_i_macd`.`value.bl_am`,2);
END$$
DELIMITER ;
