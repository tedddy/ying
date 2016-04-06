set @char_null = '0';
call ying_calc.xts_scheduler(@char_null);
select @char_null;

CREATE TABLE ying.`i_nmc` (
  `idi` char(6) NOT NULL COMMENT 'index code',
  `i_nmc` bigint(13) DEFAULT NULL COMMENT '流通市值',
  PRIMARY KEY (`idi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ying`.`i_nmc`
(`idi`,
`i_nmc`)
SELECT `i_nmc`.`idi`,
    `i_nmc`.`i_nmc`
FROM `ying_calc`.`i_nmc`;


CREATE TABLE ying.`i_s` (
  `idi` varchar(6) NOT NULL DEFAULT '' COMMENT 'code_index',
  `ids` varchar(6) NOT NULL DEFAULT '' COMMENT 'code',
  `dt_start` date DEFAULT NULL COMMENT 'dt_start',
  `dt_end` date DEFAULT NULL COMMENT 'dt_end',
  `DateSys` date DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`idi`,`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ying`.`i_s`
(`idi`,
`ids`,
`dt_start`,
`dt_end`,
`DateSys`)
SELECT `i_s`.`idi`,
    `i_s`.`ids`,
    `i_s`.`dt_start`,
    `i_s`.`dt_end`,
    `i_s`.`DateSys`
FROM `ying_calc`.`i_s`;

CREATE TABLE ying.`i_s_hst` (
  `idi` varchar(6) NOT NULL DEFAULT '' COMMENT 'code_index',
  `ids` varchar(6) NOT NULL DEFAULT '' COMMENT 'code',
  `dt_start` date DEFAULT NULL COMMENT 'dt_start',
  `dt_end` date NOT NULL DEFAULT '0000-00-00' COMMENT 'dt_end',
  `DateSys` date DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`idi`,`ids`,`dt_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ying`.`i_s_hst`
(`idi`,
`ids`,
`dt_start`,
`dt_end`,
`DateSys`)SELECT `i_s_hst`.`idi`,
    `i_s_hst`.`ids`,
    `i_s_hst`.`dt_start`,
    `i_s_hst`.`dt_end`,
    `i_s_hst`.`DateSys`
FROM `ying_calc`.`i_s_hst`;

drop table ying.`i_s_weight`;
CREATE TABLE ying.`i_s_weight` (
  `idi` varchar(6) NOT NULL DEFAULT '' COMMENT 'code_index',
  `ids` varchar(6) NOT NULL DEFAULT '' COMMENT 'code',
  `weight` decimal(5,3) DEFAULT NULL COMMENT 'weight',
  `weight_adj` decimal(5,3) DEFAULT NULL COMMENT 'adjuested weight',
  PRIMARY KEY (`idi`,`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ying`.`i_s_weight`
(`idi`,
`ids`,
`weight`,
`weight_adj`)
SELECT `i_s_weight`.`idi`,
    `i_s_weight`.`ids`,
    `i_s_weight`.`weight`,
    `i_s_weight`.`weight_adj`
FROM `ying_calc`.`i_s_weight`;

INSERT ignore INTO `ying`.`index_cons_stat_zd`
(`idi`,
`name_i`,
`n`,
`rate5`,
`zd`,
`zdW`,
`zd382`,
`zd382W`,
`zd618`,
`zd618W`,
`zd1000`,
`zd1000W`,
`dt`)
SELECT `index_cons_stat_zd`.`idi`,
    `index_cons_stat_zd`.`name_i`,
    `index_cons_stat_zd`.`n`,
    `index_cons_stat_zd`.`rate5`,
    `index_cons_stat_zd`.`zd`,
    `index_cons_stat_zd`.`zdW`,
    `index_cons_stat_zd`.`zd382`,
    `index_cons_stat_zd`.`zd382W`,
    `index_cons_stat_zd`.`zd618`,
    `index_cons_stat_zd`.`zd618W`,
    `index_cons_stat_zd`.`zd1000`,
    `index_cons_stat_zd`.`zd1000W`,
    `index_cons_stat_zd`.`dt`
FROM `ying_calc`.`index_cons_stat_zd`;

CREATE TABLE ying.`index_stock_info_all` (
  `idi` char(6) NOT NULL COMMENT 'index id',
  `ids` varchar(6) NOT NULL COMMENT 'stock id',
  `weight` decimal(6,3) DEFAULT NULL COMMENT 'weight of stock',
  `flag` varchar(6) DEFAULT NULL COMMENT '`hs_s` flag',
  `fWatch` varchar(6) DEFAULT NULL COMMENT '`hs_s` flag',
  `DateSys` date DEFAULT NULL,
  PRIMARY KEY (`idi`,`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `ying`.`index_stock_info_all`
(`idi`,
`ids`,
`weight`,
`flag`,
`fWatch`,
`DateSys`)
SELECT `index_stock_info_all`.`idi`,
    `index_stock_info_all`.`ids`,
    `index_stock_info_all`.`weight`,
    `index_stock_info_all`.`flag`,
    `index_stock_info_all`.`fWatch`,
    `index_stock_info_all`.`DateSys`
FROM `ying_calc`.`index_stock_info_all`;

CREATE TABLE ying.`index_xts_sma` (
  `dt` datetime NOT NULL,
  `idi` varchar(6) NOT NULL COMMENT 'idi',
  `close5` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close 5 periods均线',
  `close10` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close 10 periods均线',
  `close20` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close 20 periods均线',
  `close30` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close 30 periods均线',
  `close60` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close 60 periods均线',
  `close120` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close 120 periods均线',
  `amount5` int(9) unsigned DEFAULT NULL COMMENT 'amount 5 periods均线',
  `amount10` int(9) unsigned DEFAULT NULL COMMENT 'amount 10 periods均线',
  `amount20` int(9) unsigned DEFAULT NULL COMMENT 'amount 20 periods均线',
  `amount30` int(9) unsigned DEFAULT NULL COMMENT 'amount 30 periods均线',
  `amount60` int(9) unsigned DEFAULT NULL COMMENT 'amount 60 periods均线',
  `amount120` int(9) unsigned DEFAULT NULL COMMENT 'amount 120 periods均线',
  `cjezb5` decimal(6,2) unsigned DEFAULT NULL COMMENT 'cjezb 5 periods均线',
  `cjezb10` decimal(6,2) unsigned DEFAULT NULL COMMENT 'cjezb 10 periods均线',
  `cjezb20` decimal(6,2) unsigned DEFAULT NULL COMMENT 'cjezb 20 periods均线',
  `cjezb30` decimal(6,2) unsigned DEFAULT NULL COMMENT 'cjezb 30 periods均线',
  `cjezb60` decimal(6,2) unsigned DEFAULT NULL COMMENT 'cjezb 60 periods均线',
  `cjezb120` decimal(6,2) unsigned DEFAULT NULL COMMENT 'cjezb 120 periods均线',
  PRIMARY KEY (`idi`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `ying`.`index_xts_sma`
(`dt`,
`idi`,
`close5`,
`close10`,
`close20`,
`close30`,
`close60`,
`close120`,
`amount5`,
`amount10`,
`amount20`,
`amount30`,
`amount60`,
`amount120`,
`cjezb5`,
`cjezb10`,
`cjezb20`,
`cjezb30`,
`cjezb60`,
`cjezb120`)
SELECT `index_xts_sma`.`dt`,
    `index_xts_sma`.`idi`,
    `index_xts_sma`.`close5`,
    `index_xts_sma`.`close10`,
    `index_xts_sma`.`close20`,
    `index_xts_sma`.`close30`,
    `index_xts_sma`.`close60`,
    `index_xts_sma`.`close120`,
    `index_xts_sma`.`amount5`,
    `index_xts_sma`.`amount10`,
    `index_xts_sma`.`amount20`,
    `index_xts_sma`.`amount30`,
    `index_xts_sma`.`amount60`,
    `index_xts_sma`.`amount120`,
    `index_xts_sma`.`cjezb5`,
    `index_xts_sma`.`cjezb10`,
    `index_xts_sma`.`cjezb20`,
    `index_xts_sma`.`cjezb30`,
    `index_xts_sma`.`cjezb60`,
    `index_xts_sma`.`cjezb120`
FROM `ying_calc`.`index_xts_sma`;

drop TABLE ying.`lhb_s_trader`;
CREATE TABLE ying.`lhb_s_trader` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_trader` varchar(10) NOT NULL,
  `type` varchar(18) DEFAULT NULL COMMENT '连续三个交易日内收盘价格涨幅偏离值累计20% -> 20\n当日涨幅偏离值达7%的证券 -> 7\n当日跌幅偏离值达7%的证券 -> -7\n当日换手率达到20%的证券 -> t20 (t: turnover)\n当日价格振幅达到15%的证券 r15 (r: range)\nS、ST、*ST连续三个交易日内跌幅偏离值累计达到15% ->  s15\n连续三个交易日内收盘价跌幅偏离值累计20% -> -20\n日均换手率与前五个交易日的日均换手率的比值达到30倍，且换手率累计达20%的证券 ta3020(t: turnover; a: acumulated)',
  `amount_sell` varchar(18) DEFAULT NULL COMMENT 'amount_sell',
  `ids` varchar(18) DEFAULT NULL COMMENT 'ids',
  `amount_buy` varchar(18) DEFAULT NULL COMMENT 'amount_buy',
  `name_s` varchar(18) DEFAULT NULL COMMENT 'name_s',
  `dt` date DEFAULT NULL COMMENT 'dt',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`id_trader`,`ids`,`dt`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=174680 DEFAULT CHARSET=utf8;

INSERT INTO `ying`.`lhb_s_trader`
(`id`,
`id_trader`,
`type`,
`amount_sell`,
`ids`,
`amount_buy`,
`name_s`,
`dt`)
SELECT `lhb_s_trader`.`id`,
    `lhb_s_trader`.`id_trader`,
    `lhb_s_trader`.`type`,
    `lhb_s_trader`.`amount_sell`,
    `lhb_s_trader`.`ids`,
    `lhb_s_trader`.`amount_buy`,
    `lhb_s_trader`.`name_s`,
    `lhb_s_trader`.`dt`
FROM `ying_calc`.`lhb_s_trader`;

CREATE TABLE ying.`lhb_trader` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_trader` varchar(18) DEFAULT NULL COMMENT 'id_trader',
  `lhb` smallint(3) DEFAULT NULL COMMENT 'lhb',
  `lhb_buy` smallint(3) DEFAULT NULL COMMENT 'lhb_buy',
  `name_s` varchar(18) DEFAULT NULL COMMENT 'name_s',
  `amount_sell` bigint(10) DEFAULT NULL COMMENT 'amount_sell',
  `lhb_sell` smallint(3) DEFAULT NULL COMMENT 'lhb_sell',
  `area` varchar(18) DEFAULT NULL COMMENT 'area',
  `id_unknown` varchar(18) DEFAULT NULL COMMENT 'id_unknown',
  `amount_unknown` varchar(18) DEFAULT NULL COMMENT 'amount_unknown',
  `amount` bigint(10) DEFAULT NULL COMMENT 'amount',
  `amount_buy` bigint(10) DEFAULT NULL COMMENT 'amount_buy',
  `name_trader` varchar(88) DEFAULT NULL COMMENT 'name_trader',
  `ids_group` varchar(18) DEFAULT NULL COMMENT 'ids_group',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`id_trader`)
) ENGINE=InnoDB AUTO_INCREMENT=2201 DEFAULT CHARSET=utf8;

INSERT INTO `ying`.`lhb_trader`
(`id`,
`id_trader`,
`lhb`,
`lhb_buy`,
`name_s`,
`amount_sell`,
`lhb_sell`,
`area`,
`id_unknown`,
`amount_unknown`,
`amount`,
`amount_buy`,
`name_trader`,
`ids_group`)
SELECT `lhb_trader`.`id`,
    `lhb_trader`.`id_trader`,
    `lhb_trader`.`lhb`,
    `lhb_trader`.`lhb_buy`,
    `lhb_trader`.`name_s`,
    `lhb_trader`.`amount_sell`,
    `lhb_trader`.`lhb_sell`,
    `lhb_trader`.`area`,
    `lhb_trader`.`id_unknown`,
    `lhb_trader`.`amount_unknown`,
    `lhb_trader`.`amount`,
    `lhb_trader`.`amount_buy`,
    `lhb_trader`.`name_trader`,
    `lhb_trader`.`ids_group`
FROM `ying_calc`.`lhb_trader`;

CREATE TABLE ying.`s_loan_sma` (
  `dt` date NOT NULL,
  `ids` varchar(6) NOT NULL COMMENT 'ids',
  `bMargin_d1` decimal(5,2) DEFAULT NULL,
  `bMargin5_d1` decimal(5,2) DEFAULT NULL,
  `bMargin10_d1` decimal(5,2) DEFAULT NULL,
  `bMargin20_d1` decimal(5,2) DEFAULT NULL,
  `bMargin30_d1` decimal(5,2) DEFAULT NULL,
  `bMargin60_d1` decimal(5,2) DEFAULT NULL,
  `bMargin120_d1` decimal(5,2) DEFAULT NULL,
  `bMargin5` mediumint(8) DEFAULT NULL COMMENT 'bMargin 5 periods均线',
  `bMargin10` mediumint(8) DEFAULT NULL COMMENT 'bMargin 10 periods均线',
  `bMargin20` mediumint(8) DEFAULT NULL COMMENT 'bMargin 20 periods均线',
  `bMargin30` mediumint(8) DEFAULT NULL COMMENT 'bMargin 30 periods均线',
  `bMargin60` mediumint(8) DEFAULT NULL COMMENT 'bMargin 60 periods均线',
  `bMargin120` mediumint(8) DEFAULT NULL COMMENT 'bMargin 120 periods均线',
  PRIMARY KEY (`dt`,`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ying`.`s_loan_sma`
(`dt`,
`ids`,
`bMargin_d1`,
`bMargin5_d1`,
`bMargin10_d1`,
`bMargin20_d1`,
`bMargin30_d1`,
`bMargin60_d1`,
`bMargin120_d1`,
`bMargin5`,
`bMargin10`,
`bMargin20`,
`bMargin30`,
`bMargin60`,
`bMargin120`)
SELECT `s_loan_sma`.`dt`,
    `s_loan_sma`.`ids`,
    `s_loan_sma`.`bMargin_d1`,
    `s_loan_sma`.`bMargin5_d1`,
    `s_loan_sma`.`bMargin10_d1`,
    `s_loan_sma`.`bMargin20_d1`,
    `s_loan_sma`.`bMargin30_d1`,
    `s_loan_sma`.`bMargin60_d1`,
    `s_loan_sma`.`bMargin120_d1`,
    `s_loan_sma`.`bMargin5`,
    `s_loan_sma`.`bMargin10`,
    `s_loan_sma`.`bMargin20`,
    `s_loan_sma`.`bMargin30`,
    `s_loan_sma`.`bMargin60`,
    `s_loan_sma`.`bMargin120`
FROM `ying_calc`.`s_loan_sma`;

SELECT * FROM ying.s_xts_adj order by dt desc;

SELECT * FROM ying_calc.s_xts_adj order by dt desc;

INSERT ignore INTO `ying`.`s_xts_adj`
(`ids`,
`dt`,
`open`,
`high`,
`low`,
`close`,
`close_d1`,
`volume`,
`amount`,
`amount_d1`,
`cjezb`,
`cjezb_d1`)
SELECT `s_xts_adj`.`ids`,
    `s_xts_adj`.`dt`,
    `s_xts_adj`.`open`,
    `s_xts_adj`.`high`,
    `s_xts_adj`.`low`,
    `s_xts_adj`.`close`,
    `s_xts_adj`.`close_d1`,
    `s_xts_adj`.`volume`,
    `s_xts_adj`.`amount`,
    `s_xts_adj`.`amount_d1`,
    `s_xts_adj`.`cjezb`,
    `s_xts_adj`.`cjezb_d1`
FROM `ying_calc`.`s_xts_adj`;

SELECT * FROM ying.s_xts_adj_sma order by dt desc;

SELECT * FROM ying_calc.s_xts_adj_sma order by dt desc;

CREATE TABLE ying.`s_xts_adj_sma` (
  `dt` date NOT NULL,
  `ids` varchar(6) NOT NULL COMMENT 'ids',
  `close5` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close 5 periods均线',
  `close5_d1` decimal(10,2) DEFAULT NULL,
  `close10` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close 10 periods均线',
  `close10_d1` decimal(6,2) DEFAULT NULL,
  `close20` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close 20 periods均线',
  `close20_d1` decimal(6,2) DEFAULT NULL,
  `close30` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close 30 periods均线',
  `close30_d1` decimal(6,2) DEFAULT NULL,
  `close60` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close 60 periods均线',
  `close60_d1` decimal(6,2) DEFAULT NULL,
  `close120` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close 120 periods均线',
  `close120_d1` decimal(6,2) DEFAULT NULL,
  `amount5` mediumint(8) DEFAULT NULL COMMENT 'amount 5 periods均线',
  `amount5_d1` decimal(6,2) DEFAULT NULL,
  `amount10` mediumint(8) unsigned DEFAULT NULL COMMENT 'amount 10 periods均线',
  `amount10_d1` decimal(6,2) DEFAULT NULL,
  `amount20` mediumint(8) unsigned DEFAULT NULL COMMENT 'amount 20 periods均线',
  `amount20_d1` decimal(6,2) DEFAULT NULL,
  `amount30` mediumint(8) unsigned DEFAULT NULL COMMENT 'amount 30 periods均线',
  `amount30_d1` decimal(6,2) DEFAULT NULL,
  `amount60` mediumint(8) unsigned DEFAULT NULL COMMENT 'amount 60 periods均线',
  `amount60_d1` decimal(6,2) DEFAULT NULL,
  `amount120` mediumint(8) unsigned DEFAULT NULL COMMENT 'amount 120 periods均线',
  `amount120_d1` decimal(6,2) DEFAULT NULL,
  `cjezb5` decimal(7,2) unsigned DEFAULT NULL COMMENT 'cjezb 5 periods均线',
  `cjezb5_d1` decimal(5,2) DEFAULT NULL,
  `cjezb10` decimal(7,2) unsigned DEFAULT NULL COMMENT 'cjezb 10 periods均线',
  `cjezb10_d1` decimal(5,2) DEFAULT NULL,
  `cjezb20` decimal(7,2) unsigned DEFAULT NULL COMMENT 'cjezb 20 periods均线',
  `cjezb20_d1` decimal(5,2) DEFAULT NULL,
  `cjezb30` decimal(7,2) unsigned DEFAULT NULL COMMENT 'cjezb 30 periods均线',
  `cjezb30_d1` decimal(5,2) DEFAULT NULL,
  `cjezb60` decimal(7,2) unsigned DEFAULT NULL COMMENT 'cjezb 60 periods均线',
  `cjezb60_d1` decimal(5,2) DEFAULT NULL,
  `cjezb120` decimal(7,2) unsigned DEFAULT NULL COMMENT 'cjezb 120 periods均线',
  `cjezb120_d1` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ids`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `ying`.`s_xts_adj_sma`
(`dt`,
`ids`,
`close5`,
`close5_d1`,
`close10`,
`close10_d1`,
`close20`,
`close20_d1`,
`close30`,
`close30_d1`,
`close60`,
`close60_d1`,
`close120`,
`close120_d1`,
`amount5`,
`amount5_d1`,
`amount10`,
`amount10_d1`,
`amount20`,
`amount20_d1`,
`amount30`,
`amount30_d1`,
`amount60`,
`amount60_d1`,
`amount120`,
`amount120_d1`,
`cjezb5`,
`cjezb5_d1`,
`cjezb10`,
`cjezb10_d1`,
`cjezb20`,
`cjezb20_d1`,
`cjezb30`,
`cjezb30_d1`,
`cjezb60`,
`cjezb60_d1`,
`cjezb120`,
`cjezb120_d1`)
SELECT `s_xts_adj_sma`.`dt`,
    `s_xts_adj_sma`.`ids`,
    `s_xts_adj_sma`.`close5`,
    `s_xts_adj_sma`.`close5_d1`,
    `s_xts_adj_sma`.`close10`,
    `s_xts_adj_sma`.`close10_d1`,
    `s_xts_adj_sma`.`close20`,
    `s_xts_adj_sma`.`close20_d1`,
    `s_xts_adj_sma`.`close30`,
    `s_xts_adj_sma`.`close30_d1`,
    `s_xts_adj_sma`.`close60`,
    `s_xts_adj_sma`.`close60_d1`,
    `s_xts_adj_sma`.`close120`,
    `s_xts_adj_sma`.`close120_d1`,
    `s_xts_adj_sma`.`amount5`,
    `s_xts_adj_sma`.`amount5_d1`,
    `s_xts_adj_sma`.`amount10`,
    `s_xts_adj_sma`.`amount10_d1`,
    `s_xts_adj_sma`.`amount20`,
    `s_xts_adj_sma`.`amount20_d1`,
    `s_xts_adj_sma`.`amount30`,
    `s_xts_adj_sma`.`amount30_d1`,
    `s_xts_adj_sma`.`amount60`,
    `s_xts_adj_sma`.`amount60_d1`,
    `s_xts_adj_sma`.`amount120`,
    `s_xts_adj_sma`.`amount120_d1`,
    `s_xts_adj_sma`.`cjezb5`,
    `s_xts_adj_sma`.`cjezb5_d1`,
    `s_xts_adj_sma`.`cjezb10`,
    `s_xts_adj_sma`.`cjezb10_d1`,
    `s_xts_adj_sma`.`cjezb20`,
    `s_xts_adj_sma`.`cjezb20_d1`,
    `s_xts_adj_sma`.`cjezb30`,
    `s_xts_adj_sma`.`cjezb30_d1`,
    `s_xts_adj_sma`.`cjezb60`,
    `s_xts_adj_sma`.`cjezb60_d1`,
    `s_xts_adj_sma`.`cjezb120`,
    `s_xts_adj_sma`.`cjezb120_d1`
FROM `ying_calc`.`s_xts_adj_sma`;


CREATE TABLE ying.`s_xts_adj_sma_sma` (
  `dt` date NOT NULL,
  `ids` varchar(6) NOT NULL COMMENT 'ids',
  `close5_d15` decimal(6,2) DEFAULT NULL COMMENT 'close5_d1 5 periods均线',
  `close5_d110` decimal(6,2) DEFAULT NULL COMMENT 'close5_d1 10 periods均线',
  `close5_d120` decimal(6,2) DEFAULT NULL COMMENT 'close5_d1 20 periods均线',
  `close5_d130` decimal(6,2) DEFAULT NULL COMMENT 'close5_d1 30 periods均线',
  `close5_d160` decimal(6,2) DEFAULT NULL COMMENT 'close5_d1 60 periods均线',
  `close5_d1120` decimal(6,2) DEFAULT NULL COMMENT 'close5_d1 120 periods均线',
  PRIMARY KEY (`ids`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ying`.`s_xts_adj_sma_sma`
(`dt`,
`ids`,
`close5_d15`,
`close5_d110`,
`close5_d120`,
`close5_d130`,
`close5_d160`,
`close5_d1120`)
SELECT `s_xts_adj_sma_sma`.`dt`,
    `s_xts_adj_sma_sma`.`ids`,
    `s_xts_adj_sma_sma`.`close5_d15`,
    `s_xts_adj_sma_sma`.`close5_d110`,
    `s_xts_adj_sma_sma`.`close5_d120`,
    `s_xts_adj_sma_sma`.`close5_d130`,
    `s_xts_adj_sma_sma`.`close5_d160`,
    `s_xts_adj_sma_sma`.`close5_d1120`
FROM `ying_calc`.`s_xts_adj_sma_sma`;

drop TABLE ying.`tableTMPL`;
CREATE TABLE ying.`tableTMPL` (
  `idTMPL` varchar(6) NOT NULL COMMENT 'stock id',
  `dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fieldTMPL` decimal(6,2) unsigned NOT NULL COMMENT 'close',
  `fieldTMPL_d1` decimal(6,2) DEFAULT NULL,
  `volume` int(10) unsigned NOT NULL COMMENT '成交量',
  `amount` int(10) unsigned NOT NULL COMMENT '成交额',
  `chgrate` decimal(5,2) NOT NULL COMMENT '涨跌幅',
  `WeiBi` decimal(6,2) unsigned NOT NULL COMMENT '委比',
  `chgrate5` decimal(5,2) NOT NULL COMMENT '五分钟涨幅',
  `LiangBi` decimal(6,2) unsigned NOT NULL COMMENT '量比',
  PRIMARY KEY (`idTMPL`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `ying`.`tableTMPL`
(`idTMPL`,
`dt`,
`fieldTMPL`,
`fieldTMPL_d1`,
`volume`,
`amount`,
`chgrate`,
`WeiBi`,
`chgrate5`,
`LiangBi`)
SELECT `tableTMPL`.`idTMPL`,
    `tableTMPL`.`dt`,
    `tableTMPL`.`fieldTMPL`,
    `tableTMPL`.`fieldTMPL_d1`,
    `tableTMPL`.`volume`,
    `tableTMPL`.`amount`,
    `tableTMPL`.`chgrate`,
    `tableTMPL`.`WeiBi`,
    `tableTMPL`.`chgrate5`,
    `tableTMPL`.`LiangBi`
FROM `ying_calc`.`tableTMPL`;


SELECT * FROM ying.tableTMPL_sma order by dt desc;

SELECT * FROM ying_calc.tableTMPL_sma order by dt desc;

drop TABLE ying.`tableTMPL_sma`;
CREATE TABLE ying.`tableTMPL_sma` (
  `dt` datetime NOT NULL,
  `idTMPL` varchar(6) NOT NULL COMMENT 'ids',
  `fieldTMPL5` decimal(6,2) unsigned DEFAULT NULL COMMENT 'fieldTMPL 5 periods均线',
  `fieldTMPL10` decimal(6,2) unsigned DEFAULT NULL COMMENT 'fieldTMPL 10 periods均线',
  `fieldTMPL20` decimal(6,2) unsigned DEFAULT NULL COMMENT 'fieldTMPL 20 periods均线',
  `fieldTMPL30` decimal(6,2) unsigned DEFAULT NULL COMMENT 'fieldTMPL 30 periods均线',
  `fieldTMPL60` decimal(6,2) unsigned DEFAULT NULL COMMENT 'fieldTMPL 60 periods均线',
  `fieldTMPL120` decimal(6,2) unsigned DEFAULT NULL COMMENT 'fieldTMPL 120 periods均线',
  PRIMARY KEY (`idTMPL`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ying`.`tableTMPL_sma`
(`dt`,
`idTMPL`,
`fieldTMPL5`,
`fieldTMPL10`,
`fieldTMPL20`,
`fieldTMPL30`,
`fieldTMPL60`,
`fieldTMPL120`)
SELECT `tableTMPL_sma`.`dt`,
    `tableTMPL_sma`.`idTMPL`,
    `tableTMPL_sma`.`fieldTMPL5`,
    `tableTMPL_sma`.`fieldTMPL10`,
    `tableTMPL_sma`.`fieldTMPL20`,
    `tableTMPL_sma`.`fieldTMPL30`,
    `tableTMPL_sma`.`fieldTMPL60`,
    `tableTMPL_sma`.`fieldTMPL120`
FROM `ying_calc`.`tableTMPL_sma`;






