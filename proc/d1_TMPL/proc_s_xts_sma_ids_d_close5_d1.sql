-- Reference: file E:\bYun\securities\ying\learning\learn_research.sql; search key words: learning and researching E:\bYun\securities\ying\proc\d1_TMPL\proc_tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1.sql

-- add a column for value of d1
ALTER TABLE `ying`.`s_xts_sma` ADD COLUMN `close5_d1` DECIMAL(6,2) NULL COMMENT '' AFTER `close5`;

-- UPDATE value of d1 into s_xts_sma

DROP PROCEDURE IF EXISTS `s_xts_sma_ids_d_close5_d1`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `s_xts_sma_ids_d_close5_d1`()
BEGIN
UPDATE s_xts_sma t
        INNER JOIN
    (SELECT 
        `d`,
            `ids`,
            round((close5 - @close5_lag), 2) AS `close5_d1`,
            @close5_lag:=close5 AS `curr_close5`
    FROM
        `ying`.`s_xts_sma` t, (SELECT @close5_lag:=0) r
    ORDER BY `ids` , `d`) d1 ON (t.ids = d1.ids
        AND t.d = d1.d) 
SET 
    t.close5_d1 = d1.close5_d1;
END$$
DELIMITER ;

call `s_xts_sma_ids_d_close5_d1`;

SELECT * from s_xts_sma order by ids, d desc;



