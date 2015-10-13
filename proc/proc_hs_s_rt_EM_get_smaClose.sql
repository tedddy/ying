-- Test the proc
	-- Check data in hs_s_rt_EM.
    SELECT `TimeSlot`, `close` FROM hs_s_rt_EM WHERE `code` = '601318' and TimeSlot >= '1999-09-09'  and TimeSlot <= '2019-09-09' ORDER BY TimeSlot DESC limit 1000;
	SELECT count(*) FROM `ying`.`hs_s_rt_EM` WHERE `code`='601318' order by TimeSlot desc; 
    
	CALL `hs_s_rt_EM_get_smaClose`('601318', 4, '1999-09-09', '2019-09-09', 121, @out_mv);
	SELECT @out_mv;
    
-- DROP PROCEDURE IF EXISTS `hs_s_rt_EM_get_smaClose`;
DELIMITER $$

-- This procedure updates sma by taking historical data.
CREATE PROCEDURE `hs_s_rt_EM_get_smaClose`(
	IN 	in_idStock VARCHAR(25), -- variable stock id
		in_period SMALLINT, -- variable in_period
        in_TimeSlot_start DATETIME, -- the start TimeSlot for the selection query in the cursor
        in_TimeSlot_end DATETIME, -- the end TimeSlot for the selection query in the cursor
        in_limit_number INT, -- the limit option used in select query. tedd!: this is bigger than in_period for at least 1. If they are equal, then get the message: 0 row(s) affected, 1 warning(s): 1329 No data - zero rows fetched, selected, or processed
    
	OUT out_mv DECIMAL(6,2) -- 5 periods moving average
	)

BEGIN
-- 	DECLARE variables
		DECLARE sum DECIMAL(12,2); 	-- variable for total of periods
									-- when "DECLARE sum DECIMAL(6,2);" and in_period is big, get this message: 0 row(s) affected, 1 warning(s): 1264 Out of range value for column 'sum' at row 1

		DECLARE loop_cnt SMALLINT(3); -- variable for loop counter
		DECLARE cursor_fetch_tmp DECIMAL(6,2); -- variable for cursor fetch into
        
-- 	DECLARE variable for error handler
		DECLARE record_fetch_end TINYINT DEFAULT 0; -- variable for error handler
   
-- 	DECLARE coursors 
		DECLARE cursor1 CURSOR FOR -- variable for the first cursor. Three inputs: in_TimeSlot_start, in_TimeSlot_end, in_limit_number
			SELECT `close` FROM hs_s_rt_EM WHERE `code` = in_idStock and TimeSlot >= in_TimeSlot_start  and TimeSlot <= in_TimeSlot_end ORDER BY TimeSlot DESC limit in_limit_number;

-- 	DECLARE error handler for "NOT FOUND"
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_fetch_end = 1;

-- initialize variables for use in procedure
		SET loop_cnt = 0;
		SET sum = 0.00;

-- open cursor
		OPEN cursor1;
		-- Loop	of cursor1  
			cursor1_LOOP1: LOOP
            
				FETCH cursor1 INTO cursor_fetch_tmp; -- fetch result row into cursor_fetch_tmp tedd
				
				SET loop_cnt = loop_cnt + 1; -- increment the loop counter
				
			-- set the conditional break for n-periods sma, we need the n as the max
					IF loop_cnt > in_period THEN
						LEAVE cursor1_LOOP1;
					END IF;
				
			-- break from loop if reach the end of the cursor
					IF record_fetch_end THEN
						LEAVE cursor1_LOOP1;
					END IF;
				
				SET sum = sum + cursor_fetch_tmp; -- add the sum to sum
		
			END LOOP cursor1_LOOP1;
	  
	  SET out_mv = ROUND((sum / in_period),2); -- now calculate the n-period sma
	  
	CLOSE cursor1;
	-- output result on screen
		-- SELECT out_mv;
END $$