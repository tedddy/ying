-- UPDATE the value of `close120_d1` on current day in table `s_xts_adj_sma`

DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_close120_d1_cur_day`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_xts_adj_sma_close120_d1_cur_day`()
BEGIN
	DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
	DECLARE cursor_fetch_tmp_ids VARCHAR(6);
        DECLARE dt_latest DATE; -- variable for the latest date
        DECLARE close120_latest DECIMAL(6,2); -- variable for the latest close120
        DECLARE close120_latest_2nd DECIMAL(6,2); -- variable for the 2nd latest close120
	DECLARE cursor1 CURSOR FOR
	SELECT DISTINCT `ids` FROM `s_xts_adj_sma` ORDER BY ids;
	DECLARE CONTINUE HANDLER FOR NOT FOUND
	SET no_more_rows := TRUE;

	OPEN cursor1;
	LOOP1: LOOP
        
		FETCH cursor1 INTO cursor_fetch_tmp_ids;
                
			SELECT 
			    close120
			INTO close120_latest FROM
			    `s_xts_adj_sma`
			WHERE
			    ids = cursor_fetch_tmp_ids
			ORDER BY dt DESC
			LIMIT 1;
                        
			SELECT 
			    close120
			INTO close120_latest_2nd FROM
			    `s_xts_adj_sma`
			WHERE
			    ids = cursor_fetch_tmp_ids
			ORDER BY dt DESC
			LIMIT 1 , 1;

			SELECT 
			    `dt`
			INTO dt_latest FROM
			    `s_xts_adj_sma`
			WHERE
			    ids = cursor_fetch_tmp_ids
			ORDER BY dt DESC
			LIMIT 1;

			UPDATE `ying_calc`.`s_xts_adj_sma` 
			SET `close120_d1` = IF(close120_latest_2nd > 0.00, ROUND(100 * (close120_latest - close120_latest_2nd) / close120_latest_2nd, 2), 0.00)
			WHERE
			    `dt` = dt_latest
				AND ids = cursor_fetch_tmp_ids;
                                
		IF no_more_rows THEN
			CLOSE cursor1;
			LEAVE LOOP1;
		END IF;
	END LOOP LOOP1;
END$$
DELIMITER ;

CALL `ying_calc`.`s_xts_adj_sma_close120_d1_cur_day`;

SELECT `ids`, `dt`, `close120`, `close120_d1` FROM `ying_calc`.`s_xts_adj_sma` ORDER BY ids, dt DESC;

