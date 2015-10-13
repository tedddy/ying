-- Test the proc
	SELECT * FROM `ying`.`hs_s_rt_EM` WHERE `code`='601318' order by TimeSlot desc; -- Check transaction data.
    
	CALL `hs_s_rt_EM_get_sma`('601318', 5, @out_mv);
	SELECT @out_mv;

DROP PROCEDURE IF EXISTS `hs_s_rt_EM_get_sma`;
DELIMITER $$

-- This procedure updates sma by taking historical data.
CREATE PROCEDURE `hs_s_rt_EM_get_sma`(
	IN in_idStock VARCHAR(25), -- variable stock id; 's' after id means stock
	IN in_period INT, -- variable in_period: 
	OUT out_mv DECIMAL(6,2) -- 5 periods moving average
	)

BEGIN
-- 	DECLARE variables
		DECLARE sum DECIMAL(6,2); -- variable for total of close of periods    
		DECLARE loop_cnt SMALLINT(3); -- variable for loop counter
		DECLARE close_tmp DECIMAL(6,2); -- variable for cursor fetch into
        
-- 	DECLARE variable for error handler
		DECLARE record_not_found TINYINT DEFAULT 0; -- variable for error handler
   
    -- 	DECLARE coursors 
		DECLARE stock_cursor CURSOR FOR -- variable for mysql cursor
			SELECT `close` FROM hs_s_rt_EM WHERE `code` = in_idStock ORDER BY TimeSlot DESC;

-- 	DECLARE error handler for "NOT FOUND"
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_not_found = 1;

-- initialize variables for use in procedure
		SET loop_cnt = 0;
		SET sum = 0.00;

-- open cursor
		OPEN stock_cursor;
		-- Loop	of stock_cursor  
			THE_LOOP: LOOP
            
				FETCH stock_cursor INTO close_tmp; -- fetch result row into close_tmp tedd
				
				SET loop_cnt = loop_cnt + 1; -- increment the loop counter
				
			-- set the conditional break for n-periods sma, we need the n as the max
					IF loop_cnt > in_period THEN
						LEAVE THE_LOOP;
					END IF;
				
			-- break from loop if reach the end of the cursor
					IF record_not_found THEN
						LEAVE THE_LOOP;
					END IF;
				
				SET sum = sum + close_tmp; -- add the sum to sum
		
			END LOOP THE_LOOP;
	  
	  SET out_mv = ROUND((sum / in_period),2); -- now calculate the n-period sma
	  
	CLOSE stock_cursor;
	-- output result on screen
		-- SELECT out_mv;
END $$