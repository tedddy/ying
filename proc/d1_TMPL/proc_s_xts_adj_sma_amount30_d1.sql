-- start: 13:29 2015-11-02	`s_xts_adj_sma` `amount30` d1	end: 	update d1 of field amount30 for table `s_xts_adj_sma`
-- 
-- 	going to replace `tableTMPL` with `s_xts_adj_sma`, `idTMPL` with `ids`, `dtTMPL` with `dt`, `fieldTMPL` with `amount30`
-- 	save file proc_tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1.sql as proc_s_xts_adj_sma_amount30_d1.sql
-- 	replace
-- 		tableTMPL	with	`ying_calc`.`s_xts_adj_sma`	7 replaced
-- 		idTMPL		with	ids		7 replaced
-- 		dtTMPL		with	dt		7 replaced
-- 		fieldTMPL	with	amount30		13 replaced
-- 	execute file proc_s_xts_adj_sma_amount30.sql & test all procedures

-- ALTER TABLE `ying_calc`.`s_xts_adj_sma` 
-- DROP COLUMN `amount30_d1`;

-- add a column for value of d1
ALTER TABLE `ying_calc`.`s_xts_adj_sma` ADD COLUMN `amount30_d1` MEDIUMINT(8) NULL COMMENT '' AFTER `amount30`;

-- UPDATE value of d1 into s_xts_adj_sma

DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_amount30_d1`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_xts_adj_sma_amount30_d1`()
BEGIN
     DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
     DECLARE cursor_fetch_tmp_ids VARCHAR(6);
        DECLARE dt_latest DATE; -- variable for the latest date
        DECLARE amount30_earlest MEDIUMINT(8); -- variable for the earlest amount30
     DECLARE cursor1 CURSOR FOR
     SELECT DISTINCT `ids` FROM `s_xts_adj_sma` ORDER BY `ids`;
     DECLARE CONTINUE HANDLER FOR NOT FOUND
     SET no_more_rows := TRUE;

     OPEN cursor1;
     LOOP1: LOOP
       
          FETCH cursor1 INTO cursor_fetch_tmp_ids;
               
               SELECT
                   amount30
               INTO amount30_earlest FROM
                   `s_xts_adj_sma`
               WHERE
                   `ids` = cursor_fetch_tmp_ids
               ORDER BY dt
               LIMIT 1;
                               
               SET @amount30_lag := amount30_earlest;
               UPDATE `ying_calc`.`s_xts_adj_sma` t
                    INNER JOIN
                   (SELECT
                    `dt`,
                        `ids`,
                        ROUND(100 * (cast(amount30 as signed) - cast(@amount30_lag as signed)) / @amount30_lag, 2) AS `amount30_d1`,
                        @amount30_lag:=amount30
                   FROM
                    `ying_calc`.`s_xts_adj_sma`
                   WHERE
                    `ids` = cursor_fetch_tmp_ids
                   ORDER BY `dt`) d1 ON (t.ids = d1.ids AND t.dt = d1.dt)
               SET
                   t.amount30_d1 = d1.amount30_d1; 
   
          IF no_more_rows THEN
               CLOSE cursor1;
               LEAVE LOOP1;
          END IF;
     END LOOP LOOP1;
END$$
DELIMITER ;

CALL `ying_calc`.`s_xts_adj_sma_amount30_d1`;
-- Error Code: 1690. BIGINT UNSIGNED value is out of range in '(`ying_calc`.`t`.`amount30` - (@`amount30_lag`))' troubleshooting: mysql - BIGINT UNSIGNED value is out of range - Stack Overflow

SELECT * FROM `ying_calc`.`s_xts_adj_sma` ORDER BY ids, dt DESC;

-- Reference: file E:\bYun\securities\ying\learning\learning.sql; search key words: learning and researching E:\bYun\securities\ying\proc\d1_TMPL\proc_s_xts_adj_sma_amount30_d1.sql 

