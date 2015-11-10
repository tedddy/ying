-- add a column for value of d1
ALTER TABLE `ying_calc`.`tableTMPL` ADD COLUMN `fieldTMPL_d1` DECIMAL(6,2) NULL COMMENT '' AFTER `fieldTMPL`;

-- UPDATE value of d1 into tableTMPL

DROP PROCEDURE IF EXISTS `ying_calc`.`tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1`()
BEGIN
	DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
	DECLARE cursor_fetch_tmp_idTMPL VARCHAR(6);
	DECLARE fieldTMPL_earlest DECIMAL(6,2); -- variable for the earlest fieldTMPL
	DECLARE cursor1 CURSOR FOR
	SELECT DISTINCT `idTMPL` FROM `ying_calc`.`tableTMPL` ORDER BY `idTMPL`;
	DECLARE CONTINUE HANDLER FOR NOT FOUND
	SET no_more_rows := TRUE;

	OPEN cursor1;
	LOOP1: LOOP
       
          FETCH cursor1 INTO cursor_fetch_tmp_idTMPL;
               
               SELECT
                   fieldTMPL
               INTO fieldTMPL_earlest FROM
                   `ying_calc`.`tableTMPL`
               WHERE
                   `idTMPL` = cursor_fetch_tmp_idTMPL
               ORDER BY `dtTMPL`
               LIMIT 1;
                               
               SET @fieldTMPL_lag := fieldTMPL_earlest;
               UPDATE `ying_calc`.`tableTMPL` t
                    INNER JOIN
                   (SELECT
			`dtTMPL`,
			`idTMPL`,
                        ROUND(100 * (fieldTMPL - @fieldTMPL_lag) / @fieldTMPL_lag, 2) AS `fieldTMPL_d1`,
                        @fieldTMPL_lag:=fieldTMPL
                   FROM
                    `ying_calc`.`tableTMPL`
                   WHERE
                    `idTMPL` = cursor_fetch_tmp_idTMPL
                   ORDER BY `dtTMPL`) d1 ON (t.`idTMPL` = d1.`idTMPL` AND t.`dtTMPL` = d1.`dtTMPL`)
               SET
                   t.fieldTMPL_d1 = d1.fieldTMPL_d1; 
   
          IF no_more_rows THEN
               CLOSE cursor1;
               LEAVE LOOP1;
          END IF;
	END LOOP LOOP1;
END$$
DELIMITER ;

CALL `ying_calc`.`tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1`;

SELECT * FROM tableTMPL ORDER BY idTMPL, dtTMPL DESC;

-- Reference: file E:\bYun\securities\ying\learning\learning.sql; search key words: learning and researching E:\bYun\securities\ying\proc\d1_TMPL\proc_tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1.sql 

