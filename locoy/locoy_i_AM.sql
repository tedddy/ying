CREATE TABLE `i_AM` (
  `idi` varchar(6) NOT NULL COMMENT 'index id',
  `dt` date NOT NULL COMMENT '交易日期 trade date',
  `open` decimal(7,2) unsigned DEFAULT NULL COMMENT '开盘价',
  `high` decimal(7,2) unsigned DEFAULT NULL COMMENT '最高',
  `low` decimal(7,2) unsigned DEFAULT NULL COMMENT '最低价',
  `close` decimal(7,2) unsigned DEFAULT NULL COMMENT '收盘价',
  `close_d1` decimal(6,2) DEFAULT NULL,
  `volume` int(9) unsigned DEFAULT NULL COMMENT '股票成交额',
  `amount` int(9) unsigned DEFAULT NULL COMMENT '成交量',
  `amount_d1` decimal(6,2) DEFAULT NULL,
  `cjezb` decimal(6,2) unsigned NOT NULL COMMENT '10000*amount_stock / amount_all_stock 成交额占比',
  `cjezb_d1` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`idi`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `i_AM`(IN idi VARCHAR(6), `dt` DATE, open DECIMAL(9,2), high DECIMAL(9,2), low DECIMAL(9,2), close DECIMAL(9,2), volume BIGINT(11) UNSIGNED, amount BIGINT(12) UNSIGNED)
BEGIN
SET idi = IF(idi = '', NULL, idi);
SET `dt` = IF(`dt` = '', NULL, `dt`);
SET open = IF(open = '', NULL, open);
SET high = IF(high = '', NULL, high);
SET low = IF(low = '', NULL, low);
SET close = IF(close = '', NULL, close);
SET volume = IF(volume = '', NULL, volume);
SET amount = IF(amount = '', NULL, amount);

INSERT INTO `ying`.`i_AM` (`idi`, `dt`, `open`, `high`, `low`, `close`, `volume`, `amount`) VALUES (idi, `dt`, open, high, low, close, volume, amount) 
ON DUPLICATE KEY UPDate
	`open` = open,
	`high` = high,
	`low` = low,
	`close` = close,
	`volume` = volume,
	`amount` = amount;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `i_macd_AM_import`()
BEGIN
INSERT INTO `ying`.`i_macd_AM`
(`idi`,
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
SELECT `temp_i_macd`.`idi`,
    `temp_i_macd`.`dt`,
    `temp_i_macd`.`value.close`,
    round(`temp_i_macd`.`value.macd_cl`,2),
    round(`temp_i_macd`.`value.signal_cl`,2),
    round(`temp_i_macd`.`value.mOsc_cl`,2),
    round(`temp_i_macd`.`value.close_d1`,2),
    round(`temp_i_macd`.`value.close_SD_relative`,3),
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
    round(`temp_i_macd`.`value.amount_SD_relative`,3),
    round(`temp_i_macd`.`value.mOsc_am_d1_EMA`,2),
    round(`temp_i_macd`.`value.mOsc_am_d2`,2),
    round(`temp_i_macd`.`value.mOsc_am_d2_EMA`,2),
    round(`temp_i_macd`.`value.bl_cl`,2),
    round(`temp_i_macd`.`value.bl_am`,2)
FROM `ying`.`temp_i_macd` ON DUPLICATE KEY UPDATE
    `close`=round(`temp_i_macd`.`value.close`,2),
    `macd_cl`=round(`temp_i_macd`.`value.macd_cl`,2),
    `signal_cl`=round(`temp_i_macd`.`value.signal_cl`,2),
    `mOsc_cl`=round(`temp_i_macd`.`value.mOsc_cl`,2),
    `close_d1`=round(`temp_i_macd`.`value.close_d1`,2),
    `close_SD_relative`=round(`temp_i_macd`.`value.close_SD_relative`,3),
    `mOsc_cl_d1`=round(`temp_i_macd`.`value.mOsc_cl_d1`,2),
    `mOsc_cl_d1_EMA`=round(`temp_i_macd`.`value.mOsc_cl_d1_EMA`,2),
    `mOsc_cl_d2`=round(`temp_i_macd`.`value.mOsc_cl_d2`,2),
    `mOsc_cl_d2_EMA`=round(`temp_i_macd`.`value.mOsc_cl_d2_EMA`,2),
    `amount`=`temp_i_macd`.`value.amount`,
    `macd_am`=round(`temp_i_macd`.`value.macd_am`,2),
    `signal_am`=round(`temp_i_macd`.`value.signal_am`,2),
    `mOsc_am`=round(`temp_i_macd`.`value.mOsc_am`,2),
    `amount_d1`=`temp_i_macd`.`value.amount_d1`,
    `amount_SD_relative`=round(`temp_i_macd`.`value.amount_SD_relative`,3),
    `mOsc_am_d1`=round(`temp_i_macd`.`value.mOsc_am_d1`,2),
    `mOsc_am_d1_EMA`=round(`temp_i_macd`.`value.mOsc_am_d1_EMA`,2),
    `mOsc_am_d2`=round(`temp_i_macd`.`value.mOsc_am_d2`,2),
    `mOsc_am_d2_EMA`=round(`temp_i_macd`.`value.mOsc_am_d2_EMA`,2),
    `bl_cl`=round(`temp_i_macd`.`value.bl_cl`,2),
    `bl_am`=round(`temp_i_macd`.`value.bl_am`,2);
END$$
DELIMITER ;

CREATE TABLE `i_macd_AM` (
  `idi` char(6) NOT NULL DEFAULT '',
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
  PRIMARY KEY (`idi`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
