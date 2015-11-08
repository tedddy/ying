-- start: 13:29 2015-11-02	`s_xts_adj_sma` `amount5` d1	end: 	update d1 of field amount5 for table `s_xts_adj_sma`
-- 
-- 	going to replace `tableTMPL` with `s_xts_adj_sma`, `idTMPL` with `ids`, `dtTMPL` with `d`, `fieldTMPL` with `amount5`
-- 	save file proc_tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1.sql as proc_s_xts_adj_sma_ids_d_amount5_d1_cur_day.sql
-- 	replace
-- 		tableTMPL	with	`ying_calc`.`s_xts_adj_sma`	7 replaced
-- 		idTMPL		with	ids		7 replaced
-- 		dtTMPL		with	d		7 replaced
-- 		fieldTMPL	with	amount5		13 replaced
-- 	execute file proc_s_xts_adj_sma_ids_d_amount5.sql & test all procedures

-- ALTER TABLE `ying_calc`.`s_xts_adj_sma` 
-- DROP COLUMN `amount5_d1`;

-- add a column for value of d1
ALTER TABLE `ying_calc`.`s_xts_adj_sma` ADD COLUMN `amount5_d1` MEDIUMINT(8) NULL COMMENT '' AFTER `amount5`;

-- UPDATE value of d1 into s_xts_adj_sma

DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_cur_day`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_cur_day`()
BEGIN
	DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
	DECLARE cursor_fetch_tmp_ids VARCHAR(6);
        DECLARE d_latest DATE; -- variable for the latest date
        DECLARE amount5_latest MEDIUMINT(9); -- variable for the latest amount5
        DECLARE amount5_latest_2nd MEDIUMINT(9); -- variable for the 2nd latest amount5
	DECLARE cursor1 CURSOR FOR
	SELECT DISTINCT `ids` FROM `s_xts_adj_sma` ORDER BY ids;
	DECLARE CONTINUE HANDLER FOR NOT FOUND
	SET no_more_rows := TRUE;

	OPEN cursor1;
	LOOP1: LOOP
        
		FETCH cursor1 INTO cursor_fetch_tmp_ids;
			SELECT 
			    amount5
			INTO amount5_latest FROM
			    `s_xts_adj_sma`
			WHERE
			    ids = cursor_fetch_tmp_ids
			ORDER BY d DESC
			LIMIT 1;
                        
		SELECT 
		    amount5
		INTO amount5_latest_2nd FROM
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
		SET 
		    `amount5_d1` = amount5_latest - amount5_latest_2nd
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

CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_cur_day`;
-- Error Code: 1690. BIGINT UNSIGNED value is out of range in '(`ying_calc`.`t`.`amount5` - (@`amount5_lag`))' troubleshooting: mysql - BIGINT UNSIGNED value is out of range - Stack Overflow

SELECT * FROM `ying_calc`.`s_xts_adj_sma` ORDER BY ids, d DESC;

-- Reference: file E:\bYun\securities\ying\learning\learning.sql; search key words: learning and researching E:\bYun\securities\ying\proc\d1_TMPL\proc_s_xts_adj_sma_ids_d_amount5_d1_cur_day.sql 

