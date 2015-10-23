-- DROP TABLE `tableTMPL`;
-- 

CREATE TABLE `tableTMPL` (
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


-- history

CREATE TABLE `tableTMPL` (
  `idTMPL` varchar(6) NOT NULL COMMENT 'stock id',
  `dtTMPL` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fieldTMPL` decimal(6,2) unsigned NOT NULL COMMENT 'close',
  `fieldTMPL_lag` decimal(6,2) DEFAULT NULL,
  `volume` int(10) unsigned NOT NULL COMMENT '成交量',
  `amount` int(10) unsigned NOT NULL COMMENT '成交额',
  `chgrate` decimal(5,2) NOT NULL COMMENT '涨跌幅',
  `WeiBi` decimal(6,2) unsigned NOT NULL COMMENT '委比',
  `chgrate5` decimal(5,2) NOT NULL COMMENT '五分钟涨幅',
  `LiangBi` decimal(6,2) unsigned NOT NULL COMMENT '量比',
  PRIMARY KEY (`idTMPL`,`dtTMPL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tableTMPL` (
  `idTMPL` varchar(6) NOT NULL COMMENT 'stock id',
  `dtTMPL` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fieldTMPL` decimal(6,2) unsigned NOT NULL COMMENT 'close',
  `volume` int(10) unsigned NOT NULL COMMENT '成交量',
  `amount` int(10) unsigned NOT NULL COMMENT '成交额',
  `chgrate` decimal(5,2) NOT NULL COMMENT '涨跌幅',
  `WeiBi` decimal(6,2) unsigned NOT NULL COMMENT '委比',
  `chgrate5` decimal(5,2) NOT NULL COMMENT '五分钟涨幅',
  `LiangBi` decimal(6,2) unsigned NOT NULL COMMENT '量比',
  PRIMARY KEY (`idTMPL`,`dtTMPL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tableTMPL` (
  `idTMPL` varchar(6) NOT NULL COMMENT 'stock id',
  `dtTMPL` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fieldTMPL` decimal(6,2) unsigned NOT NULL COMMENT 'close',
  `volume` int(10) unsigned NOT NULL COMMENT '成交量',
  `amount` int(10) unsigned NOT NULL COMMENT '成交额',
  `chgrate` decimal(5,2) NOT NULL COMMENT '涨跌幅',
  `WeiBi` decimal(6,2) unsigned NOT NULL COMMENT '委比',
  `chgrate5` decimal(5,2) NOT NULL COMMENT '五分钟涨幅',
  `LiangBi` decimal(6,2) unsigned NOT NULL COMMENT '量比',
  PRIMARY KEY (`idTMPL`,`dtTMPL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tableTMPL` (
  `ids` varchar(6) NOT NULL COMMENT 'stock id',
  `fieldTMPL` decimal(6,2) unsigned NOT NULL COMMENT 'close',
  `volume` int(10) unsigned NOT NULL COMMENT '成交量',
  `amount` int(10) unsigned NOT NULL COMMENT '成交额',
  `chgrate` decimal(5,2) NOT NULL COMMENT '涨跌幅',
  `WeiBi` decimal(6,2) unsigned NOT NULL COMMENT '委比',
  `chgrate5` decimal(5,2) NOT NULL COMMENT '五分钟涨幅',
  `LiangBi` decimal(6,2) unsigned NOT NULL COMMENT '量比',
  `dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ids`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 19:30 2015-10-20
ALTER TABLE `ying`.`tableTMPL` 
CHANGE COLUMN `dtTMPL` `dtTMPL` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '' AFTER `idTMPL`;

ALTER TABLE `ying`.`tableTMPL` 
ADD COLUMN `fieldTMPL_lag` DECIMAL(6,2) NULL COMMENT '' AFTER `fieldTMPL`;

ALTER TABLE `ying`.`tableTMPL` 
CHANGE COLUMN `fieldTMPL_lag` `fieldTMPL_d1` DECIMAL(6,2) NULL DEFAULT NULL COMMENT '' ;


-- 23:43 2015-10-19
ALTER TABLE `ying`.`tableTMPL` 
CHANGE COLUMN `ids` `idTMPL` VARCHAR(6) NOT NULL COMMENT 'stock id' ,
CHANGE COLUMN `dt` `dtTMPL` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '' AFTER `idTMPL` ;

SELECT * FROM `ying`.`tableTMPL` order by ids desc, dt;
SELECT count(*) FROM `ying`.`tableTMPL` order by ids desc, dt;

-- import data from `s_rt` to `tableTMPL`, where field name `close` is changed to fieldTMPL.
INSERT INTO `tableTMPL` 
	( 	
		`tableTMPL`.`ids`,
		`tableTMPL`.`fieldTMPL`,
		`tableTMPL`.`volume`,
		`tableTMPL`.`amount`,
		`tableTMPL`.`chgrate`,
		`tableTMPL`.`WeiBi`,
		`tableTMPL`.`chgrate5`,
		`tableTMPL`.`LiangBi`,
		`tableTMPL`.`dt`
    )
SELECT 
		`s_rt`.`ids`,
		`s_rt`.`close`,
		`s_rt`.`volume`,
		`s_rt`.`amount`,
		`s_rt`.`chgrate`,
		`s_rt`.`WeiBi`,
		`s_rt`.`chgrate5`,
		`s_rt`.`LiangBi`,
		`s_rt`.`dt`        
FROM `ying`.`s_rt`
WHERE `ids` in ('601318', '000001') order by `dt` desc;

-- SELECT * FROM `ying`.`tableTMPL` order by ids desc, dt;
-- SELECT count(*) FROM `ying`.`tableTMPL` order by ids desc, dt;
-- 
-- -- import data from `s_rt` to `tableTMPL`, where field name `close` is changed to fieldTMPL.
-- INSERT INTO `tableTMPL` 
-- 	( 	
-- 		`tableTMPL`.`ids`,
-- 		`tableTMPL`.`fieldTMPL`,
-- 		`tableTMPL`.`volume`,
-- 		`tableTMPL`.`amount`,
-- 		`tableTMPL`.`chgrate`,
-- 		`tableTMPL`.`WeiBi`,
-- 		`tableTMPL`.`chgrate5`,
-- 		`tableTMPL`.`LiangBi`,
-- 		`tableTMPL`.`dt`
--     )
-- SELECT 
-- 		`s_rt`.`ids`,
-- 		`s_rt`.`close`,
-- 		`s_rt`.`volume`,
-- 		`s_rt`.`amount`,
-- 		`s_rt`.`chgrate`,
-- 		`s_rt`.`WeiBi`,
-- 		`s_rt`.`chgrate5`,
-- 		`s_rt`.`LiangBi`,
-- 		`s_rt`.`dt`        
-- FROM `ying`.`s_rt`
-- WHERE `ids` in ('601318', '000001') order by `dt` desc;

