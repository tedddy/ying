DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `s_rt_get_smaClose_rt`(
	IN in_ids VARCHAR(25), -- variable stock id; 's' after id means stock
	IN in_current_close DECIMAL(6,2), -- variable in_current_close
	IN in_smaPeriods INT, -- variable in_smaPeriods: 
	OUT sma DECIMAL(6,2) -- 5 periods moving average
	)
BEGIN

	DECLARE period_limit INT; -- variable for loop counter limit

	DECLARE loop_cnt INT; -- variable for loop counter

	DECLARE sum_sma DECIMAL(12,2); -- variable for total of periods

	DECLARE cursor_fetch_tmp DECIMAL(6,2); -- variable for cursor fetch into

	DECLARE record_not_found INTEGER DEFAULT 0; -- variable for error handler

	DECLARE mysql_cursor CURSOR FOR -- variable for mysql cursor
		SELECT `close` FROM s_rt WHERE `ids` = in_ids ORDER BY dt DESC;
	  
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_not_found = 1;

	-- initialize variables for use in procedure
	SET period_limit = in_smaPeriods - 1;
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
	  
	  SET sma = ROUND(((sum_sma + in_current_close) / in_smaPeriods),2); -- now calculate the n-period sma
	  
	CLOSE mysql_cursor;
	-- output result
	-- SELECT @sma;
END$$
DELIMITER ;
