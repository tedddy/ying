-- add a column for value of d1
ALTER TABLE `ying_calc`.`index_xts` ADD COLUMN `amount_d1` DECIMAL(6,2) NULL COMMENT '' AFTER `amount`;

-- UPDATE value of d1 into index_xts

DROP PROCEDURE IF EXISTS `ying_calc`.`index_xts_amount_d1`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`index_xts_amount_d1`()
BEGIN
	DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
	DECLARE cursor_fetch_tmp_idi VARCHAR(6);
	DECLARE amount_earlest DECIMAL(6,2); -- variable for the earlest amount
	DECLARE cursor1 CURSOR FOR
	SELECT DISTINCT `idi` FROM `ying_calc`.`index_xts` ORDER BY `idi`;
	DECLARE CONTINUE HANDLER FOR NOT FOUND
	SET no_more_rows := TRUE;

	OPEN cursor1;
	LOOP1: LOOP
       
          FETCH cursor1 INTO cursor_fetch_tmp_idi;
               
               SELECT
                   amount
               INTO amount_earlest FROM
                   `ying_calc`.`index_xts`
               WHERE
                   `idi` = cursor_fetch_tmp_idi
               ORDER BY `dt`
               LIMIT 1;
                               
               SET @amount_lag := amount_earlest;
               UPDATE `ying_calc`.`index_xts` t
                    INNER JOIN
                   (SELECT
			`dt`,
			`idi`,
                        ROUND(100 * (amount - @amount_lag) / @amount_lag, 2) AS `amount_d1`,
                        @amount_lag:=amount
                   FROM
                    `ying_calc`.`index_xts`
                   WHERE
                    `idi` = cursor_fetch_tmp_idi
                   ORDER BY `dt`) d1 ON (t.`idi` = d1.`idi` AND t.`dt` = d1.`dt`)
               SET
                   t.amount_d1 = d1.amount_d1; 
   
          IF no_more_rows THEN
               CLOSE cursor1;
               LEAVE LOOP1;
          END IF;
	END LOOP LOOP1;
END$$
DELIMITER ;

CALL `ying_calc`.`index_xts_amount_d1`;

SELECT * FROM `ying_calc`.`index_xts` ORDER BY idi, dt DESC;

-- Reference: file E:\bYun\securities\ying\learning\learning.sql; search key words: learning and researching E:\bYun\securities\ying\proc\d1_TMPL\proc_index_xts_amount_d1.sql 

