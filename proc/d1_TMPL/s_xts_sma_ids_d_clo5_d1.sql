-- add a column for value of d1
ALTER TABLE `ying`.`s_xts_sma` ADD COLUMN `clo5_d1` DECIMAL(6,2) NULL COMMENT '' AFTER `clo5`;

-- UPDATE value of d1 into s_xts_sma

DROP PROCEDURE IF EXISTS `s_xts_sma_ids_d_clo5_d1`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `s_xts_sma_ids_d_clo5_d1`()
BEGIN
UPDATE s_xts_sma t
        INNER JOIN
    (SELECT 
        `d`,
            `ids`,
            round((clo5 - @clo5_lag), 2) AS `clo5_d1`,
            @clo5_lag:=clo5 AS `curr_clo5`
    FROM
        `ying`.`s_xts_sma` t, (SELECT @clo5_lag:=0) r
    ORDER BY `ids` , `d`) d1 ON (t.ids = d1.ids
        AND t.d = d1.d) 
SET 
    t.clo5_d1 = d1.clo5_d1;
END$$
DELIMITER ;

call `s_xts_sma_ids_d_clo5_d1`;

SELECT * from s_xts_sma order by ids, d desc;



-- Reference: file E:\bYun\securities\ying\learning\learning.sql; search key words: learning and researching E:\bYun\securities\ying\proc\d1_TMPL\proc_s_xts_sma_ids_d_clo5_d1.sql 

