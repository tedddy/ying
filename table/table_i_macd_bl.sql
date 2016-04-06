SELECT * FROM ying_calc.temp_i_macd_bl order by dt desc;

SELECT * FROM ying_calc.i_macd_bl order by dt desc;

SELECT * FROM ying_calc.i_macd_bl where `idi` = '399006' order by dt desc;

SELECT * FROM ying_calc.i_macd_bl where `idi` = '399959' order by dt desc;

SELECT * FROM ying_calc.i_macd_bl where `idi` = '399393' order by dt desc;

SELECT * FROM ying_calc.i_macd_bl where `idi` = '399934' order by dt desc;


SELECT * FROM ying_calc.i_macd_bl where `idi` = '000974' order by dt desc;


SELECT * FROM ying_calc.i_macd_bl where `dt` = '2016-03-04' order by close_d1 desc;

SELECT * FROM ying_calc.i_macd_bl where `dt` = '2016-03-04' order by macdOsc_cl_d1 desc;

SELECT * FROM ying_calc.i_macd_bl join ying_calc.i_info on i_macd_bl.idi = i_info.idi where i_macd_bl.`dt` = '2016-03-04' and i_macd_bl.macdOsc_cl > -10 and i_macd_bl.macdOsc_cl < 10 order by i_macd_bl.macdOsc_cl desc;

SELECT * FROM ying_calc.i_macd_bl where `dt` = '2016-03-03' order by macdOsc_cl_d1 desc;

SELECT * FROM ying_calc.i_macd_bl where `dt` = '2016-03-02' order by macdOsc_cl_d1 desc;

SELECT * FROM ying_calc.i_macd_bl where `dt` = '2016-03-01' order by macdOsc_cl_d1 desc;


-- DROP TABLE `ying_calc`.`i_macd_bl`;
CREATE TABLE `ying_calc`.`i_macd_bl` (
  `idi` CHAR(6),
  `dt` DATE,
  `close` DECIMAL(8,2) DEFAULT NULL,
  `macd_cl` DECIMAL(8,2) DEFAULT NULL,
  `signal_cl` DECIMAL(8,2) DEFAULT NULL,
  `macdOsc_cl` DECIMAL(8,2) DEFAULT NULL,
  `close_d1` DECIMAL(8,2) DEFAULT NULL,
  `macdOsc_cl_d1` DECIMAL(8,2) DEFAULT NULL,
  `amount` int(9) DEFAULT NULL,
  `macd_amount` int(9) DEFAULT NULL,
  `signal_amount` int(9) DEFAULT NULL,
  `macdOsc_amount` int(9) DEFAULT NULL,
  `amount_d1` int(9) DEFAULT NULL,
  `macdOsc_amount_d1` int(9) DEFAULT NULL,
  `bl` DECIMAL(15,2) DEFAULT NULL  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CALL `ying_calc`.`i_macd_bl_import`;

TRUNCATE `ying_calc`.`i_macd_bl`;
DROP PROCEDURE `ying_calc`.`i_macd_bl_import`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`i_macd_bl_import`()
BEGIN
INSERT INTO `ying_calc`.`i_macd_bl`
(`idi`,
`dt`,
`close`,
`macd_cl`,
`signal_cl`,
`macdOsc_cl`,
`close_d1`,
`macdOsc_cl_d1`,
`amount`,
`macd_amount`,
`signal_amount`,
`macdOsc_amount`,
`amount_d1`,
`macdOsc_amount_d1`,
`bl`)
SELECT `temp_i_macd_bl`.`idi`,
    `temp_i_macd_bl`.`dt`,
    `temp_i_macd_bl`.`value.close`,
    `temp_i_macd_bl`.`value.macd_cl`,
    `temp_i_macd_bl`.`value.signal_cl`,
    `temp_i_macd_bl`.`value.macdOsc_cl`,
    `temp_i_macd_bl`.`value.close_d1`,
    `temp_i_macd_bl`.`value.macdOsc_cl_d1`,
    `temp_i_macd_bl`.`value.amount`,
    `temp_i_macd_bl`.`value.macd_amount`,
    `temp_i_macd_bl`.`value.signal_amount`,
    `temp_i_macd_bl`.`value.macdOsc_amount`,
    `temp_i_macd_bl`.`value.amount_d1`,
    `temp_i_macd_bl`.`value.macdOsc_amount_d1`,
    `temp_i_macd_bl`.`value.bl`
FROM `ying_calc`.`temp_i_macd_bl` ON DUPLICATE KEY UPDATE
    `close`=`temp_i_macd_bl`.`value.close`,
    `macd_cl`=`temp_i_macd_bl`.`value.macd_cl`,
    `signal_cl`=`temp_i_macd_bl`.`value.signal_cl`,
    `macdOsc_cl`=`temp_i_macd_bl`.`value.macdOsc_cl`,
    `close_d1`=`temp_i_macd_bl`.`value.close_d1`,
    `macdOsc_cl_d1`=`temp_i_macd_bl`.`value.macdOsc_cl_d1`,
    `amount`=`temp_i_macd_bl`.`value.amount`,
    `macd_amount`=`temp_i_macd_bl`.`value.macd_amount`,
    `signal_amount`=`temp_i_macd_bl`.`value.signal_amount`,
    `macdOsc_amount`=`temp_i_macd_bl`.`value.macdOsc_amount`,
    `amount_d1`=`temp_i_macd_bl`.`value.amount_d1`,
    `macdOsc_amount_d1`=`temp_i_macd_bl`.`value.macdOsc_amount_d1`,
    `macdOsc_amount_d1`=`temp_i_macd_bl`.`value.bl`;
END$$
DELIMITER ;
