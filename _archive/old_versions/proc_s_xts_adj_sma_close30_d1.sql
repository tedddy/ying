CALL `ying_calc`.`s_xts_adj_sma_ids_d_close30_d1`;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` ORDER BY ids, d DESC;

-- start: 13:29 2015-11-02	`s_xts_adj_sma` `close30` d1	end: 	update d1 of field close30 for table `s_xts_adj_sma`
-- 
-- 	going to replace `tableTMPL` with `s_xts_adj_sma`, `idTMPL` with `ids`, `dtTMPL` with `d`, `fieldTMPL` with `close30`
-- 	save file proc_tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1.sql as proc_s_xts_adj_sma_ids_d_close30_d1.sql
-- 	replace
-- 		tableTMPL	with	`ying_calc`.`s_xts_adj_sma`	7 replaced
-- 		idTMPL		with	ids		7 replaced
-- 		dtTMPL		with	d		7 replaced
-- 		fieldTMPL	with	close30		13 replaced
-- 	execute file proc_s_xts_adj_sma_ids_d_close30.sql & test all procedures

-- add a column for value of d1
ALTER TABLE `ying_calc`.`s_xts_adj_sma` ADD COLUMN `close30_d1` DECIMAL(6,2) NULL COMMENT '' AFTER `close30`;

-- UPDATE value of d1 into s_xts_adj_sma

DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_ids_d_close30_d1`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_xts_adj_sma_ids_d_close30_d1`()
BEGIN
SET @close30_lag:=0.00;
UPDATE `ying_calc`.`s_xts_adj_sma` t
        INNER JOIN
    (SELECT 
        `d`,
	`ids`,
	ROUND(100 * (close30 - @close30_lag) / close30, 2) AS `close30_d1`,
	@close30_lag:=close30
    FROM
        `ying_calc`.`s_xts_adj_sma`
    ORDER BY `ids` , `d`) d1 ON (t.ids = d1.ids AND t.d = d1.d) 
SET 
    t.close30_d1 = d1.close30_d1;
END$$
DELIMITER ;

CALL `ying_calc`.`s_xts_adj_sma_ids_d_close30_d1`;

-- 1275989 row(s) affected, 12 warning(s): 1264 Out of range value for column 'close30_d1' at row 1 1264 Out of range value for column 'close30_d1' at row 1 1264 Out of range value for column 'close30_d1' at row 1 1264 Out of range value for column 'close30_d1' at row 1 1264 Out of range value for column 'close30_d1' at row 1 1264 Out of range value for column 'close30_d1' at row 1 1264 Out of range value for column 'close30_d1' at row 1 1264 Out of range value for column 'close30_d1' at row 1 1264 Out of range value for column 'close30_d1' at row 1 1264 Out of range value for column 'close30_d1' at row 1 1264 Out of range value for column 'close30_d1' at row 1 1264 Out of range value for column 'close30_d1' at row 1

SELECT * FROM `ying_calc`.`s_xts_adj_sma` ORDER BY ids, d DESC;

-- Reference: file E:\bYun\securities\ying\learning\learning.sql; search key words: learning and researching E:\bYun\securities\ying\proc\d1_TMPL\proc_s_xts_adj_sma_ids_d_close30_d1.sql 
