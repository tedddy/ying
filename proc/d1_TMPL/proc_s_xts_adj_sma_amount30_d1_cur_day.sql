-- UPDATE the value of `amount30_d1` on current day in table `s_xts_adj_sma`

DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_ids_d_amount30_d1_cur_day`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_xts_adj_sma_ids_d_amount30_d1_cur_day`()
BEGIN
	DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
	DECLARE cursor_fetch_tmp_ids VARCHAR(6);
        DECLARE d_latest DATE; -- variable for the latest date
        DECLARE amount30_latest MEDIUMINT(9); -- variable for the latest amount30
        DECLARE amount30_latest_2nd MEDIUMINT(9); -- variable for the 2nd latest amount30
	DECLARE cursor1 CURSOR FOR
	SELECT DISTINCT `ids` FROM `s_xts_adj_sma` ORDER BY ids;
	DECLARE CONTINUE HANDLER FOR NOT FOUND
	SET no_more_rows := TRUE;

	OPEN cursor1;
	LOOP1: LOOP
        
		FETCH cursor1 INTO cursor_fetch_tmp_ids;
                
			SELECT 
			    amount30
			INTO amount30_latest FROM
			    `s_xts_adj_sma`
			WHERE
			    ids = cursor_fetch_tmp_ids
			ORDER BY d DESC
			LIMIT 1;
                        
			SELECT 
			    amount30
			INTO amount30_latest_2nd FROM
			    `s_xts_adj_sma`
			WHERE
			    ids = cursor_fetch_tmp_ids
			ORDER BY d DESC
			LIMIT 1 , 1;

			SELECT 
			    `d`
			INTO d_latest FROM
			    `s_xts_adj_sma`
			WHERE
			    ids = cursor_fetch_tmp_ids
			ORDER BY d DESC
			LIMIT 1;

			UPDATE `ying_calc`.`s_xts_adj_sma` 
			SET `amount30_d1` = ROUND(100 * (cast(amount30_latest as signed) - cast(amount30_latest_2nd as signed)) / amount30_latest_2nd, 2)
			WHERE
			    `d` = d_latest
				AND ids = cursor_fetch_tmp_ids;
                                
		IF no_more_rows THEN
			CLOSE cursor1;
			LEAVE LOOP1;
		END IF;
	END LOOP LOOP1;
END$$
DELIMITER ;

CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount30_d1_cur_day`;

SELECT `ids`, `d`, `amount30_d1` FROM `ying_calc`.`s_xts_adj_sma` ORDER BY ids, d DESC;
