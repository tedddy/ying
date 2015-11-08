CALL `ying_calc`.`s_xts_adj_sma_ids_d_close5_d1`;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` ORDER BY ids, d DESC;

-- start: 13:29 2015-11-02     `s_xts_adj_sma` `close5` d1     end:      update d1 of field close5 for table `s_xts_adj_sma`
--
--      going to replace `tableTMPL` with `s_xts_adj_sma`, `idTMPL` with `ids`, `dtTMPL` with `d`, `fieldTMPL` with `close5`
--      save file proc_tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1.sql as proc_s_xts_adj_sma_ids_d_close5_d1.sql
--      replace
--           tableTMPL     with     `ying_calc`.`s_xts_adj_sma`     7 replaced
--           idTMPL          with     ids          7 replaced
--           dtTMPL          with     d          7 replaced
--           fieldTMPL     with     close5          13 replaced
--      execute file proc_s_xts_adj_sma_ids_d_close5.sql & test all procedures

-- add a column for value of d1
ALTER TABLE `ying_calc`.`s_xts_adj_sma` ADD COLUMN `close5_d1` DECIMAL(6,2) NULL COMMENT '' AFTER `close5`;

-- UPDATE value of d1 into s_xts_adj_sma

DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_ids_d_close5_d1`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_xts_adj_sma_ids_d_close5_d1`()
BEGIN
     DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
     DECLARE cursor_fetch_tmp_ids VARCHAR(6);
        DECLARE d_latest DATE; -- variable for the latest date
        DECLARE close5_earlest DECIMAL(6,2); -- variable for the earlest close5
     DECLARE cursor1 CURSOR FOR
     SELECT DISTINCT `ids` FROM `s_xts_adj_sma` ORDER BY `ids`;
     DECLARE CONTINUE HANDLER FOR NOT FOUND
     SET no_more_rows := TRUE;

     OPEN cursor1;
     LOOP1: LOOP
       
          FETCH cursor1 INTO cursor_fetch_tmp_ids;
               
               SELECT
                   close5
               INTO close5_earlest FROM
                   `s_xts_adj_sma`
               WHERE
                   `ids` = cursor_fetch_tmp_ids
               ORDER BY d
               LIMIT 1;
                               
               SET @close5_lag := close5_earlest;
               UPDATE `ying_calc`.`s_xts_adj_sma` t
                    INNER JOIN
                   (SELECT
                    `d`,
                        `ids`,
                        ROUND(100 * (close5 - @close5_lag) / @close5_lag, 2) AS `close5_d1`,
                        @close5_lag:=close5
                   FROM
                    `ying_calc`.`s_xts_adj_sma`
                   WHERE
                    `ids` = cursor_fetch_tmp_ids
                   ORDER BY `d`) d1 ON (t.ids = d1.ids AND t.d = d1.d)
               SET
                   t.close5_d1 = d1.close5_d1; 
   
          IF no_more_rows THEN
               CLOSE cursor1;
               LEAVE LOOP1;
          END IF;
     END LOOP LOOP1;
END$$
DELIMITER ;

CALL `ying_calc`.`s_xts_adj_sma_ids_d_close5_d1`;

-- 2017996 row(s) affected, 10 warning(s): 1264 Out of range value for column 'close5_d1' at row 1 1264 Out of range value for column 'close5_d1' at row 1 1264 Out of range value for column 'close5_d1' at row 1 1264 Out of range value for column 'close5_d1' at row 1 1264 Out of range value for column 'close5_d1' at row 1 1264 Out of range value for column 'close5_d1' at row 1 1264 Out of range value for column 'close5_d1' at row 1 1264 Out of range value for column 'close5_d1' at row 1 1264 Out of range value for column 'close5_d1' at row 1 1264 Out of range value for column 'close5_d1' at row 1


SELECT * FROM `ying_calc`.`s_xts_adj_sma` ORDER BY ids, d DESC;

-- Reference: file E:\bYun\securities\ying\learning\learning.sql; search key words: learning and researching E:\bYun\securities\ying\proc\d1_TMPL\proc_s_xts_adj_sma_ids_d_close5_d1.sql
