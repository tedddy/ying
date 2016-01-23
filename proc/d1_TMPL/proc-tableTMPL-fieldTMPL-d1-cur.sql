-- UPDATETIME the value of `fieldTMPL_d1` on current day in table `tableTMPL`

DROP PROCEDURE IF EXISTS `ying_calc`.`tableTMPL_fieldTMPL_d1_cur`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`tableTMPL_fieldTMPL_d1_cur`()
BEGIN
	DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
	DECLARE cursor_fetch_tmp_idTMPL VARCHAR(6);
        DECLARE dt_latest DATETIME; -- variable for the latest DATETIME
        DECLARE fieldTMPL_latest MEDIUMINT(9); -- variable for the latest fieldTMPL
        DECLARE fieldTMPL_latest_2nd MEDIUMINT(9); -- variable for the 2nd latest fieldTMPL
	DECLARE cursor1 CURSOR FOR
	SELECT DISTINCT `idTMPL` FROM `tableTMPL` ORDER BY idTMPL;
	DECLARE CONTINUE HANDLER FOR NOT FOUND
	SET no_more_rows := TRUE;

	OPEN cursor1;
	LOOP1: LOOP
        
		FETCH cursor1 INTO cursor_fetch_tmp_idTMPL;
                
			SELECT 
			    fieldTMPL
			INTO fieldTMPL_latest FROM
			    `tableTMPL`
			WHERE
			    idTMPL = cursor_fetch_tmp_idTMPL
			ORDER BY dt DESC
			LIMIT 1;
                        
			SELECT 
			    fieldTMPL
			INTO fieldTMPL_latest_2nd FROM
			    `tableTMPL`
			WHERE
			    idTMPL = cursor_fetch_tmp_idTMPL
			ORDER BY dt DESC
			LIMIT 1 , 1;

			SELECT 
			    `dt`
			INTO dt_latest FROM
			    `tableTMPL`
			WHERE
			    idTMPL = cursor_fetch_tmp_idTMPL
			ORDER BY dt DESC
			LIMIT 1;

			UPDATETIME `ying_calc`.`tableTMPL` 
			SET `fieldTMPL_d1` = ROUND(100 * (cast(fieldTMPL_latest as signed) - cast(fieldTMPL_latest_2nd as signed)) / fieldTMPL_latest_2nd, 2)
			WHERE
			    `dt` = dt_latest
				AND idTMPL = cursor_fetch_tmp_idTMPL;
                                
		IF no_more_rows THEN
			CLOSE cursor1;
			LEAVE LOOP1;
		END IF;
	END LOOP LOOP1;
END$$
DELIMITER ;

CALL `ying_calc`.`tableTMPL_fieldTMPL_d1_cur`;

SELECT `idTMPL`, `dt`, `fieldTMPL_d1` FROM `ying_calc`.`tableTMPL` ORDER BY idTMPL, dt DESC;

