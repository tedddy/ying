-- Tutorial :: MYSQL :: Mysql Stored Procedure Cursor Tutorial Calculating Simple Moving Average
-- version 151010;

CALL `hs_s_rt_EM_test_get_sma`('600190', 2, 5.58, @m5);
SELECT @m5;

DROP PROCEDURE IF EXISTS `hs_s_rt_EM_test_get_sma`;
DELIMITER $$

CREATE PROCEDURE `hs_s_rt_EM_test_get_sma`(
	IN in_ids VARCHAR(25), -- variable stock id; 's' after id means stock
	IN in_period INT, -- variable in_period: 
	IN in_current_close DECIMAL(6,2), -- variable in_current_close: current close
	OUT m5 DECIMAL(6,2) -- 5 periods moving average
	)

BEGIN

DECLARE period_limit INT; -- variable for loop counter limit

DECLARE loop_cnt INT; -- variable for loop counter

DECLARE sum_sma DECIMAL(6,2); -- variable for total of close of periods

DECLARE close_tmp DECIMAL(6,2); -- variable for cursor fetch into

DECLARE record_not_found INTEGER DEFAULT 0; -- variable for error handler

DECLARE mysql_cursor CURSOR FOR -- variable for mysql cursor

SELECT `close` FROM hs_s_rt_EM_test WHERE `code` = in_ids ORDER BY TimeSlot DESC;
  
DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_not_found = 1;

-- initialize variables for use in procedure
SET period_limit = in_period;
SET period_limit = period_limit - 1;
SET loop_cnt = 0;
SET sum_sma = 0.00;

-- open cursor
OPEN mysql_cursor;
  
	THE_LOOP: LOOP
		FETCH mysql_cursor INTO close_tmp; -- fetch result row into close_tmp tedd
		
		SET loop_cnt = loop_cnt + 1; -- increment the loop counter
		
	-- set the conditional break for n-periods sma, we need the n-1 as the max
		IF loop_cnt > period_limit THEN
			LEAVE THE_LOOP;
		END IF;
		
	-- break from loop if reach the end
		IF record_not_found THEN
			LEAVE THE_LOOP;
		END IF;
		
		SET sum_sma = sum_sma + close_tmp; -- add the sum to sum_sma
    
	END LOOP THE_LOOP;
  
  SET m5 = ROUND(((sum_sma + in_current_close) / in_period),2); -- now calculate the n-period sma
  
CLOSE mysql_cursor;
-- output result
-- SELECT m5;
END $$

