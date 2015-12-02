-- E:\user_tony\Documents\GitHub\ying\proc\sma_TMPL\proc-run_s_loan_sma_bMargin_loop.sql

-- call `ying_calc`.`run_s_loan_sma_bMargin_loop`();

DROP PROCEDURE `ying_calc`.`run_s_loan_sma_bMargin_loop`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`run_s_loan_sma_bMargin_loop`()
BEGIN
-- 	DECLARE variables
	DECLARE in_low_dt MEDIUMINT;
	DECLARE in_high_dt MEDIUMINT;
	DECLARE dt_earliest_s_loan DATETIME;
	DECLARE dt_earliest_s_loan_sma DATETIME;
	DECLARE loop_cnt MEDIUMINT; -- variable for loop counter
-- 	initialize variables for use in procedure
	SET loop_cnt = 0;	
	SELECT min(`dt`) INTO dt_earliest_s_loan FROM `ying_calc`.`s_loan`;
        SELECT date_add(min(date(`dt`)), INTERVAL 1 DAY) INTO dt_earliest_s_loan_sma FROM `ying_calc`.`s_loan_sma`;
        SET dt_earliest_s_loan_sma = IF(dt_earliest_s_loan_sma is NULL, date_add(curdate(), INTERVAL 1 DAY), dt_earliest_s_loan_sma);
	SET in_low_dt = 1;
	SET in_high_dt = 0;

WHILE date_sub(current_timestamp(), INTERVAL in_low_dt DAY ) > dt_earliest_s_loan 
	DO CALL `ying_calc`.`s_loan_sma_bMargin_loop`(date_sub(dt_earliest_s_loan_sma, INTERVAL in_low_dt DAY ), date_sub(dt_earliest_s_loan_sma, INTERVAL in_high_dt DAY )); 
	-- DO CALL `ying_calc`.`s_loan_sma_bMargin_loop`(date_sub(current_timestamp(), INTERVAL in_low_dt DAY ), date_sub(current_timestamp(), INTERVAL in_high_dt DAY )); 
        SET in_low_dt = in_low_dt + 1;
	SET in_high_dt = in_high_dt + 1;	 
END WHILE ;

END$$
DELIMITER ;
