-- DROP PROCEDURE `ying_calc`.`xts_scheduler`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`xts_scheduler`(IN char_null char(1))
BEGIN
-- sma for s_loan
	DECLARE dt_lastest_s_loan DATE;
	SELECT MAX(`dt`) INTO dt_lastest_s_loan FROM `ying_calc`.`s_loan`;
	IF (curtime() > '08:50:00' AND curtime() < '09:10:00') THEN 

		BEGIN
			CALL `ying_calc`.`s_loan_sma_bMargin_loop`(dt_lastest_s_loan, '2018-08-08');
                        CALL `ying_calc`.`s_loan_d1_bMargin`;
                        CALL `ying_calc`.`s_loan_sma_d1_bMargin5`;
			CALL `ying_calc`.`s_loan_sma_d1_bMargin10`;
			CALL `ying_calc`.`s_loan_sma_d1_bMargin20`;
			CALL `ying_calc`.`s_loan_sma_d1_bMargin30`;
			CALL `ying_calc`.`s_loan_sma_d1_bMargin60`;
			CALL `ying_calc`.`s_loan_sma_d1_bMargin120`;
		END;
	END IF;

-- sma and d1 for `ying_calc`.`s_xts_adj_sma`
IF (curtime() > '15:00:00' AND curtime() < '15:15:00')  THEN

	BEGIN
		CALL `ying_calc`.`s_xts_adj_close_d1`;
                -- sma for `s_xts_adj`
                CALL `ying_calc`.`s_xts_adj_sma_amount_loop`(curdate(), '2018-08-08', 5, 10, 20, 30, 60, 120);
		CALL `ying_calc`.`s_xts_adj_sma_close_loop`(curdate(), '2018-08-08', 5, 10, 20, 30, 60, 120);
		-- d1
		CALL `ying_calc`.`s_xts_adj_sma_amount5_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_amount10_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_amount20_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_amount30_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_amount60_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_amount120_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_close5_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_close10_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_close20_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_close30_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_close60_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_close120_d1`;
	END;
END IF;
END$$
DELIMITER ;

-- Test
-- SELECT MAX(`dt`) FROM `ying_calc`.`s_loan`;
-- CALL `ying_calc`.`s_loan_sma_bMargin_loop`('2015-11-27', '2018-08-08');

-- history
-- DELIMITER $$
-- CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`xts_scheduler`(IN char_null char(1))
-- BEGIN
-- -- sma
-- CALL `ying_calc`.`s_xts_adj_ids_d_amount_sma_multiPeriods_loop_dt_ids`(curdate(), '2018-08-08', 5, 10, 20, 30, 60, 120);
-- CALL `ying_calc`.`s_xts_adj_ids_d_close_sma_multiPeriods_loop_dt_ids`(curdate(), '2018-08-08', 5, 10, 20, 30, 60, 120);
-- -- d1
-- CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1`;
-- CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount10_d1`;
-- CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount20_d1`;
-- CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount30_d1`;
-- CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount60_d1`;
-- CALL `ying_calc`.`s_xts_-- adj_sma_ids_d_amount120_d1`;
-- CALL `ying_calc`.`s_xts_adj_sma_ids_d_close5_d1`;
-- CALL `ying_calc`.`s_xts_adj_sma_ids_d_close10_d1`;
-- CALL `ying_calc`.`s_xts_adj_sma_ids_d_close20_d1`;
-- CALL `ying_calc`.`s_xts_adj_sma_ids_d_close30_d1`;
-- CALL `ying_calc`.`s_xts_adj_sma_ids_d_close60_d1`;
-- CALL `ying_calc`.`s_xts_adj_sma_ids_d_close120_d1`;
-- 
-- END$$
-- DELIMITER ;
