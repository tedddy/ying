-- start: 13:29 2015-11-02	`s_xts_adj_sma` `amount120` d1	end: 	update d1 of field amount120 for table `s_xts_adj_sma`
-- 
-- 	going to replace `tableTMPL` with `s_xts_adj_sma`, `idTMPL` with `ids`, `dtTMPL` with `d`, `fieldTMPL` with `amount120`
-- 	save file proc_tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1.sql as proc_s_xts_adj_sma_ids_d_amount120_d1.sql
-- 	replace
-- 		tableTMPL	with	`ying_calc`.`s_xts_adj_sma`	7 replaced
-- 		idTMPL		with	ids		7 replaced
-- 		dtTMPL		with	d		7 replaced
-- 		fieldTMPL	with	amount120		13 replaced
-- 	execute file proc_s_xts_adj_sma_ids_d_amount120.sql & test all procedures

-- ALTER TABLE `ying_calc`.`s_xts_adj_sma` 
-- DROP COLUMN `amount120_d1`;

-- add a column for value of d1
ALTER TABLE `ying_calc`.`s_xts_adj_sma` ADD COLUMN `amount120_d1` MEDIUMINT(8) NULL COMMENT '' AFTER `amount120`;

-- UPDATE value of d1 into s_xts_adj_sma

DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_ids_d_amount120_d1`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_xts_adj_sma_ids_d_amount120_d1`()
BEGIN
SET @amount120_lag:=0;
UPDATE `ying_calc`.`s_xts_adj_sma` t
        INNER JOIN
    (SELECT 
        `d`,
            `ids`,
            (cast(amount120 as signed) - cast(@amount120_lag as signed)) AS `amount120_d1`,
            @amount120_lag:=amount120 `curr_amount120`
    FROM
        `ying_calc`.`s_xts_adj_sma` t
    ORDER BY `ids` , `d`) d1 ON (t.ids = d1.ids
        AND t.d = d1.d) 
SET 
    t.amount120_d1 = d1.amount120_d1;
END$$
DELIMITER ;

CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount120_d1`;
-- Error Code: 1690. BIGINT UNSIGNED value is out of range in '(`ying_calc`.`t`.`amount120` - (@`amount120_lag`))'

SELECT * FROM `ying_calc`.`s_xts_adj_sma` ORDER BY ids, d DESC;

-- Reference: file E:\bYun\securities\ying\learning\learning.sql; search key words: learning and researching E:\bYun\securities\ying\proc\d1_TMPL\proc_s_xts_adj_sma_ids_d_amount120_d1.sql 

