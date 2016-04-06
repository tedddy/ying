SELECT * FROM ying_calc.temp_s_macd order by dt desc;

SELECT * FROM ying_calc.s_macd order by dt desc, bl_cl;

SELECT count(*) FROM ying_calc.s_macd order by dt desc, bl_cl;


-- DROP TABLE `ying_calc`.`s_macd`;
CREATE TABLE `ying_calc`.`s_macd` (
  `ids` char(6) NOT NULL DEFAULT '',
  `dt` date NOT NULL DEFAULT '0000-00-00',
  `close` decimal(8,2) DEFAULT NULL,
  `macd_cl` decimal(6,2) DEFAULT NULL,
  `signal_cl` decimal(6,2) DEFAULT NULL,
  `mOsc_cl` decimal(6,2) DEFAULT NULL,
  `close_d1` decimal(8,2) DEFAULT NULL,
  `close_SD_relative` decimal(8,2) DEFAULT NULL,
  `mOsc_cl_d1` decimal(6,2) DEFAULT NULL,
  `mOsc_cl_d1_EMA` decimal(6,2) DEFAULT NULL,
  `mOsc_cl_d2` decimal(6,2) DEFAULT NULL,
  `mOsc_cl_d2_EMA` decimal(6,2) DEFAULT NULL,
  `amount` int(9) DEFAULT NULL,
  `macd_am` decimal(6,2) DEFAULT NULL,
  `signal_am` decimal(6,2) DEFAULT NULL,
  `mOsc_am` decimal(6,2) DEFAULT NULL,
  `amount_d1` int(9) DEFAULT NULL,
  `amount_SD_relative` decimal(8,2) DEFAULT NULL,
  `mOsc_am_d1` decimal(6,2) DEFAULT NULL,
  `mOsc_am_d1_EMA` decimal(6,2) DEFAULT NULL,
  `mOsc_am_d2` decimal(6,2) DEFAULT NULL,
  `mOsc_am_d2_EMA` decimal(6,2) DEFAULT NULL,
  `bl_cl` decimal(15,2) DEFAULT NULL,
  `bl_am` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`ids`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- add one more field
ALTER TABLE `ying_calc`.`s_macd` 
ADD COLUMN `close_SD_relative` DECIMAL(8,2) NULL DEFAULT NULL AFTER `close_d1`;

ALTER TABLE `ying_calc`.`s_macd` 
ADD COLUMN `amount_SD_relative` DECIMAL(8,2) NULL DEFAULT NULL AFTER `amount_d1`;

CALL `ying_calc`.`s_macd_import`;

-- DROP PROCEDURE `ying_calc`.`s_macd_import`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_macd_import`()
BEGIN
INSERT INTO `ying_calc`.`s_macd`
(`ids`,
`dt`,
`close`,
`macd_cl`,
`signal_cl`,
`mOsc_cl`,
`close_d1`,
`close_SD_relative`,
`mOsc_cl_d1`,
`mOsc_cl_d1_EMA`,
`mOsc_cl_d2`,
`mOsc_cl_d2_EMA`,
`amount`,
`macd_am`,
`signal_am`,
`mOsc_am`,
`amount_d1`,
`amount_SD_relative`,
`mOsc_am_d1`,
`mOsc_am_d1_EMA`,
`mOsc_am_d2`,
`mOsc_am_d2_EMA`,
`bl_cl`,
`bl_am`)
SELECT `temp_s_macd`.`ids`,
    `temp_s_macd`.`dt`,
    `temp_s_macd`.`value.close`,
    round(`temp_s_macd`.`value.macd_cl`,2),
    round(`temp_s_macd`.`value.signal_cl`,2),
    round(`temp_s_macd`.`value.mOsc_cl`,2),
    round(`temp_s_macd`.`value.close_d1`,2),
    round(`temp_s_macd`.`value.close_SD_relative`,3),
    round(`temp_s_macd`.`value.mOsc_cl_d1`,2),
    round(`temp_s_macd`.`value.mOsc_cl_d1_EMA`,2),
    round(`temp_s_macd`.`value.mOsc_cl_d2`,2),
    round(`temp_s_macd`.`value.mOsc_cl_d2_EMA`,2),
    `temp_s_macd`.`value.amount`,
    round(`temp_s_macd`.`value.macd_am`,2),
    round(`temp_s_macd`.`value.signal_am`,2),
    round(`temp_s_macd`.`value.mOsc_am`,2),
    `temp_s_macd`.`value.amount_d1`,
    round(`temp_s_macd`.`value.mOsc_am_d1`,2),
    round(`temp_s_macd`.`value.amount_SD_relative`,3),
    round(`temp_s_macd`.`value.mOsc_am_d1_EMA`,2),
    round(`temp_s_macd`.`value.mOsc_am_d2`,2),
    round(`temp_s_macd`.`value.mOsc_am_d2_EMA`,2),
    round(`temp_s_macd`.`value.bl_cl`,2),
    round(`temp_s_macd`.`value.bl_am`,2)
FROM `ying_calc`.`temp_s_macd` ON DUPLICATE KEY UPDATE
    `close`=round(`temp_s_macd`.`value.close`,2),
    `macd_cl`=round(`temp_s_macd`.`value.macd_cl`,2),
    `signal_cl`=round(`temp_s_macd`.`value.signal_cl`,2),
    `mOsc_cl`=round(`temp_s_macd`.`value.mOsc_cl`,2),
    `close_d1`=round(`temp_s_macd`.`value.close_d1`,2),
    `close_SD_relative`=round(`temp_s_macd`.`value.close_SD_relative`,3),
    `mOsc_cl_d1`=round(`temp_s_macd`.`value.mOsc_cl_d1`,2),
    `mOsc_cl_d1_EMA`=round(`temp_s_macd`.`value.mOsc_cl_d1_EMA`,2),
    `mOsc_cl_d2`=round(`temp_s_macd`.`value.mOsc_cl_d2`,2),
    `mOsc_cl_d2_EMA`=round(`temp_s_macd`.`value.mOsc_cl_d2_EMA`,2),
    `amount`=`temp_s_macd`.`value.amount`,
    `macd_am`=round(`temp_s_macd`.`value.macd_am`,2),
    `signal_am`=round(`temp_s_macd`.`value.signal_am`,2),
    `mOsc_am`=round(`temp_s_macd`.`value.mOsc_am`,2),
    `amount_d1`=`temp_s_macd`.`value.amount_d1`,
    `amount_SD_relative`=round(`temp_s_macd`.`value.amount_SD_relative`,3),
    `mOsc_am_d1`=round(`temp_s_macd`.`value.mOsc_am_d1`,2),
    `mOsc_am_d1_EMA`=round(`temp_s_macd`.`value.mOsc_am_d1_EMA`,2),
    `mOsc_am_d2`=round(`temp_s_macd`.`value.mOsc_am_d2`,2),
    `mOsc_am_d2_EMA`=round(`temp_s_macd`.`value.mOsc_am_d2_EMA`,2),
    `bl_cl`=round(`temp_s_macd`.`value.bl_cl`,2),
    `bl_am`=round(`temp_s_macd`.`value.bl_am`,2);
END$$
DELIMITER ;
