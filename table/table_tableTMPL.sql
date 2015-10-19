DROP TABLE `tableTMPL`;
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

