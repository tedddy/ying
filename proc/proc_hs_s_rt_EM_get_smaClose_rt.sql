-- Test the proc
	SELECT * FROM `ying`.`hs_s_rt_EM` WHERE `code`='601318' order by TimeSlot desc; -- Check transaction data.
    
	CALL `hs_s_rt_EM_get_smaClose_rt`('601318', 5, 32.20, @mv);
	SELECT @mv;



-- This procedure dynamicly updates sma by taking historical and realtime quote
-- This proc is different from `hs_s_rt_EM_get_smaClose` in that this proc has one more "in" variable

-- DROP PROCEDURE IF EXISTS `hs_s_rt_EM_get_smaClose_rt`;
DELIMITER $$
CREATE PROCEDURE `hs_s_rt_EM_get_smaClose_rt`(
	IN in_ids VARCHAR(25), -- variable stock id; 's' after id means stock
	IN in_period INT, -- variable in_period: 
	IN in_current_value DECIMAL(6,2), -- variable in_current_value
	OUT mv DECIMAL(6,2) -- 5 periods moving average
	)

BEGIN

	DECLARE period_limit INT; -- variable for loop counter limit

	DECLARE loop_cnt INT; -- variable for loop counter

	DECLARE sum_sma DECIMAL(6,2); -- variable for total of periods

	DECLARE cursor_fetch_tmp DECIMAL(6,2); -- variable for cursor fetch into

	DECLARE record_not_found INTEGER DEFAULT 0; -- variable for error handler

	DECLARE mysql_cursor CURSOR FOR -- variable for mysql cursor
		SELECT `close` FROM hs_s_rt_EM WHERE `code` = in_ids ORDER BY TimeSlot DESC;
	  
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_not_found = 1;

	-- initialize variables for use in procedure
	SET period_limit = in_period;
	SET period_limit = period_limit - 1;
	SET loop_cnt = 0;
	SET sum_sma = 0.00;

	-- open cursor
	OPEN mysql_cursor;
	  
		cursor1_LOOP1: LOOP
			FETCH mysql_cursor INTO cursor_fetch_tmp; -- fetch result row into cursor_fetch_tmp tedd
			
			SET loop_cnt = loop_cnt + 1; -- increment the loop counter
			
		-- set the conditional break for n-periods sma, we need the n-1 as the max
			IF loop_cnt > period_limit THEN
				LEAVE cursor1_LOOP1;
			END IF;
			
		-- break from loop if reach the end
			IF record_not_found THEN
				LEAVE cursor1_LOOP1;
			END IF;
			
			SET sum_sma = sum_sma + cursor_fetch_tmp; -- add the sum to sum_sma
		
		END LOOP cursor1_LOOP1;
	  
	  SET mv = ROUND(((sum_sma + in_current_value) / in_period),2); -- now calculate the n-period sma
	  
	CLOSE mysql_cursor;
	-- output result
	-- SELECT mv;
END $$