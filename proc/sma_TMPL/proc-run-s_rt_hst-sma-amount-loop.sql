-- E:\user_tony\Documents\GitHub\ying\proc\sma_TMPL\proc-run_s_rt_hst_sma_amount_loop.sql

-- call `ying_calc`.`run_s_rt_hst_sma_amount_loop`();
-- 
-- SELECT date_sub(current_timestamp(), INTERVAL -1 DAY);
-- SELECT min(`dt`) FROM `ying_calc`.`s_rt_hst_sma`;
-- SELECT cast(date_add(min(date(`dt`)), INTERVAL 1 DAY) as DATETIME) FROM `ying_calc`.`s_rt_hst_sma`;
-- 
DROP PROCEDURE `ying_calc`.`run_s_rt_hst_sma_amount_loop`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`run_s_rt_hst_sma_amount_loop`()
BEGIN
-- 	DECLARE variables
	DECLARE in_low_dt MEDIUMINT;
	DECLARE in_high_dt MEDIUMINT;
	DECLARE dt_earliest_s_rt_hst DATETIME;
	DECLARE dt_earliest_s_rt_hst_sma DATETIME;
	DECLARE loop_cnt MEDIUMINT; -- variable for loop counter
-- 	initialize variables for use in procedure
	SET loop_cnt = 0;	
	SELECT min(`dt`) INTO dt_earliest_s_rt_hst FROM `ying_calc`.`s_rt_hst`;
        SELECT date_add(min(date(`dt`)), INTERVAL 1 DAY) INTO dt_earliest_s_rt_hst_sma FROM `ying_calc`.`s_rt_hst_sma`;
        SET dt_earliest_s_rt_hst_sma = IF(dt_earliest_s_rt_hst_sma is NULL, date_add(curdate(), INTERVAL 1 DAY), dt_earliest_s_rt_hst_sma);
	SET in_low_dt = 1;
	SET in_high_dt = 0;

WHILE date_sub(current_timestamp(), INTERVAL in_low_dt DAY ) > dt_earliest_s_rt_hst 
	DO CALL `ying_calc`.`s_rt_hst_sma_amount_loop`(date_sub(dt_earliest_s_rt_hst_sma, INTERVAL in_low_dt DAY ), date_sub(dt_earliest_s_rt_hst_sma, INTERVAL in_high_dt DAY )); 
	-- DO CALL `ying_calc`.`s_rt_hst_sma_amount_loop`(date_sub(current_timestamp(), INTERVAL in_low_dt DAY ), date_sub(current_timestamp(), INTERVAL in_high_dt DAY )); 
        SET in_low_dt = in_low_dt + 1;
	SET in_high_dt = in_high_dt + 1;	 
END WHILE ;

END$$
DELIMITER ;
