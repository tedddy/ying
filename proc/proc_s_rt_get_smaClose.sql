-- Test the proc
	-- Check data in `s_rt`.
    SELECT `dt`, `close` FROM `s_rt` WHERE `ids` = '601318' and `dt` >= '1999-09-09'  and `dt` <= '2019-09-09' ORDER BY `dt` DESC limit 1000;
	SELECT count(*) FROM `ying`.`s_rt` WHERE `ids`='601318' order by `dt` desc; 
    
	CALL `s_rt_get_smaClose`('2019-09-09', '601318', 10, @out_sma);
	SELECT @out_sma;
    
DROP PROCEDURE IF EXISTS `s_rt_get_smaClose`;
DELIMITER $$

-- This procedure compute sma (simple moving average) for stock (idStock) at given `dt`.
CREATE PROCEDURE `s_rt_get_smaClose`(
	IN 	in_dt DATETIME, -- variable datetime. If the value of this variable is large (such as '2019-09-09'), then the sma we get from this proc is for the latest datetime in table s_rt. 
		in_ids VARCHAR(25), -- variable stock id
		in_smaPeriods MEDIUMINT, -- variable in_smaPeriods
    
	OUT out_sma DECIMAL(6,2) -- 5 periods moving average
	)

BEGIN
-- 	DECLARE variables
		DECLARE sum DECIMAL(12,2); 	-- variable for total of periods
									-- If "DECLARE sum DECIMAL(6,2);" and in_smaPeriods is big, get this message: 0 row(s) affected, 1 warning(s): 1264 Out of range value for column 'sum' at row 1
		DECLARE in_limit_number INT; 

		DECLARE loop_cnt MEDIUMINT(3); -- variable for loop counter
		DECLARE cursor_fetch_tmp DECIMAL(6,2); -- variable for cursor fetch into
        
-- 	DECLARE variable for error handler
		DECLARE record_fetch_end TINYINT DEFAULT 0; -- variable for error handler
   
-- 	DECLARE coursors 
		DECLARE cursor1 CURSOR FOR -- variable for the first cursor. Three inputs: in_dt, in_limit_number
			SELECT `close` FROM `s_rt` WHERE `ids` = in_ids and `dt` <= in_dt ORDER BY `dt` DESC limit in_limit_number;

-- 	DECLARE error handler for "NOT FOUND"
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_fetch_end = 1;

-- initialize variables for use in procedure
		
		SET loop_cnt = 0;
		SET sum = 0.00;
        SET in_limit_number = in_smaPeriods + 1; -- the limit option used in select query. tedd!: this is bigger than in_smaPeriods for at least 1. If they are equal, then get the message: 0 row(s) affected, 1 warning(s): 1329 No data - zero rows fetched, selected, or processed

-- open cursor
		OPEN cursor1;
		-- Loop	of cursor1  
			cursor1_LOOP1: LOOP
            
				FETCH cursor1 INTO cursor_fetch_tmp; -- fetch result row into cursor_fetch_tmp tedd
				
				SET loop_cnt = loop_cnt + 1; -- increment the loop counter
				
			-- set the conditional break for n-periods sma, we need the n as the max
					IF loop_cnt > in_smaPeriods THEN
						LEAVE cursor1_LOOP1;
					END IF;
				
			-- break from loop if reach the end of the cursor
					IF record_fetch_end THEN
						LEAVE cursor1_LOOP1;
					END IF;
				
				SET sum = sum + cursor_fetch_tmp; -- add the sum to sum
		
			END LOOP cursor1_LOOP1;
	  
	  SET out_sma = ROUND((sum / in_smaPeriods),2); -- now calculate the n-period sma
	  
	CLOSE cursor1;
	-- output result on screen
		-- SELECT out_sma;
END $$