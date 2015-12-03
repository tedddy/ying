SELECT * FROM `ying_calc`.`s_xts_adj` ORDER BY `dt` DESC, `cjezb` DESC LIMIT 10000; 
SELECT * FROM `ying_calc`.`s_xts_adj` where `ids` = '000002' ORDER BY `dt` DESC, `cjezb` DESC LIMIT 10000; 
SELECT * FROM `ying_calc`.`s_xts_adj` where `ids` = '002161' ORDER BY `dt` DESC, `cjezb` DESC LIMIT 10000; 
SELECT * FROM `ying_calc`.`s_xts_adj` where `ids` = '300251' ORDER BY `dt` DESC, `cjezb` DESC LIMIT 10000; 


-- add a column for value of d1
ALTER TABLE `ying_calc`.`s_xts_adj` ADD COLUMN `amount_d1` DECIMAL(5,2) NULL COMMENT '' AFTER `amount`;

-- UPDATE value of d1 into s_xts_adj

DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_amount_d1`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_xts_adj_amount_d1`()
BEGIN
	DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
	DECLARE cursor_fetch_tmp_ids VARCHAR(6);
	DECLARE amount_earlest DECIMAL(6,2); -- variable for the earlest amount
	DECLARE cursor1 CURSOR FOR
	SELECT DISTINCT `ids` FROM `ying_calc`.`s_xts_adj` ORDER BY `ids`;
	DECLARE CONTINUE HANDLER FOR NOT FOUND
	SET no_more_rows := TRUE;

	OPEN cursor1;
	LOOP1: LOOP
       
          FETCH cursor1 INTO cursor_fetch_tmp_ids;
               
               SELECT
                   amount
               INTO amount_earlest FROM
                   `ying_calc`.`s_xts_adj`
               WHERE
                   `ids` = cursor_fetch_tmp_ids
               ORDER BY `dt`
               LIMIT 1;
                               
               SET @amount_lag := amount_earlest;
               UPDATE `ying_calc`.`s_xts_adj` t
                    INNER JOIN
                   (SELECT
			`dt`,
			`ids`,
                        ROUND(100 * (amount - @amount_lag) / @amount_lag, 2) AS `amount_d1`,
                        @amount_lag:=amount
                   FROM
                    `ying_calc`.`s_xts_adj`
                   WHERE
                    `ids` = cursor_fetch_tmp_ids
                   ORDER BY `dt`) d1 ON (t.`ids` = d1.`ids` AND t.`dt` = d1.`dt`)
               SET
                   t.amount_d1 = d1.amount_d1; 
   
          IF no_more_rows THEN
               CLOSE cursor1;
               LEAVE LOOP1;
          END IF;
	END LOOP LOOP1;
END$$
DELIMITER ;

CALL `ying_calc`.`s_xts_adj_amount_d1`;

SELECT * FROM s_xts_adj ORDER BY ids, dt DESC;

-- Reference: file E:\bYun\securities\ying\learning\learning.sql; search key words: learning and researching E:\bYun\securities\ying\proc\d1_TMPL\proc_s_xts_adj_amount_d1.sql 

