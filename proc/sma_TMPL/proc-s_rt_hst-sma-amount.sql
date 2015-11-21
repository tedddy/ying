-- DROP TABLE IF EXISTS `ying_calc`.`s_rt_hst_sma`;

CREATE TABLE IF NOT EXISTS `ying_calc`.`s_rt_hst_sma` (
  `dt` DATETIME NOT NULL,
  `ids` VARCHAR(6) NOT NULL COMMENT 'ids',
  PRIMARY KEY (`dt`,`ids`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

ALTER TABLE `ying_calc`.`s_rt_hst_sma`
ADD COLUMN `amount5` MEDIUMINT(8) DEFAULT NULL COMMENT 'amount 5 periods均线',
ADD COLUMN `amount10` MEDIUMINT(8) DEFAULT NULL COMMENT 'amount 10 periods均线',
ADD COLUMN  `amount20` MEDIUMINT(8) DEFAULT NULL COMMENT 'amount 20 periods均线',
ADD COLUMN  `amount30` MEDIUMINT(8) DEFAULT NULL COMMENT 'amount 30 periods均线',
ADD COLUMN  `amount60` MEDIUMINT(8) DEFAULT NULL COMMENT 'amount 60 periods均线',
ADD COLUMN  `amount120` MEDIUMINT(8) DEFAULT NULL COMMENT 'amount 120 periods均线';

DROP PROCEDURE IF EXISTS `ying_calc`.`s_rt_hst-sma-amount`;
-- This procedure compute sma (simple moving average) for stock (ids) at given datetime (`dt`).
DELIMITER $$ 
CREATE PROCEDURE `ying_calc`.`s_rt_hst-sma-amount`(
	IN 	
		in_dt DATETIME, -- variable: datetime. If the value of this variable is large (such as '2019-09-09'), then the sma we get from this proc is for the latest datetime in table s_rt_hst. 
		in_ids VARCHAR(25), -- variable: stock id
		in_smaPeriods MEDIUMINT, -- variable: Periods of the sma 
    
	OUT 
		out_sma int -- sma output
	)

BEGIN
-- 	DECLARE variables
        DECLARE cursor_fetch_tmp int; -- variable for cursor fetch into
		DECLARE sum bigint; 	-- variable for total of periods
									-- If "DECLARE sum DECIMAL(6,2);" and in_smaPeriods is big, get this message: 0 row(s) affected, 1 warning(s): 1264 Out of range value for column 'sum' at row 1
		DECLARE loop_cnt SMALLINT; -- variable for loop counter
		DECLARE limit_number_for_cursor SMALLINT;         
		DECLARE record_fetch_end TINYINT DEFAULT 0; -- 	DECLARE variable for error handler
   
-- 	DECLARE coursors 
		DECLARE cursor1 CURSOR FOR -- variable for the first cursor. 
			SELECT `amount` FROM `ying_calc`.`s_rt_hst` WHERE `ids` = in_ids and `dt` <= in_dt ORDER BY `dt` DESC limit limit_number_for_cursor;

-- 	DECLARE error handler for "NOT FOUND"
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_fetch_end = 1;

-- 	initialize variables for use in procedure		
		SET loop_cnt = 0;
		SET sum = 0.00;
        SET limit_number_for_cursor = in_smaPeriods + 1; -- the limit option used in select query. tedd!: this is bigger than in_smaPeriods for at least 1. If they are equal, then get the message: 0 row(s) affected, 1 warning(s): 1329 No data - zero rows fetched, selected, or processed

-- 	open cursor
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
	  
	  SET out_sma = ROUND((sum / in_smaPeriods),0); -- now calculate the n-period sma
	  
	close cursor1;
	-- output result on screen
		-- SELECT out_sma;
END $$
DELIMITER ;

--  test query in the proc    
SELECT date_sub(current_timestamp(), INTERVAL 3 MINUTE );

CALL `ying_calc`.`s_rt_hst-sma-amount-loop`(date_sub(current_timestamp(), INTERVAL 3 MINUTE ), '2018-08-08 15:05:00');

-- 	CALL `ying_calc`.`s_rt_hst-sma-amount-loop`('2015-11-10 13:35:00', '2018-08-08 15:05:00');     
--     
-- 	SELECT * FROM `ying_calc`.`s_rt_hst_sma` WHERE dt >= '2005-10-13 13:05:00' AND dt <= '2019-10-15 15:05:00' ORDER BY `dt` DESC;
--  
DROP PROCEDURE IF EXISTS `ying_calc`.`s_rt_hst-sma-amount-loop`;
-- 
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_rt_hst-sma-amount-loop`(

	IN 	in_dt_low DATETIME, -- variable for the lowest datetime in the selection of the cursor. 
		in_dt_high DATETIME -- variable for the highest datetime in the selection of the cursor.ids VARCHAR(6)
	-- OUT	out_loop_cnt MEDIUMINT
	)
BEGIN 
-- DECLARE smaPeriods      
	DECLARE in_smaPeriods_1 SMALLINT;
	DECLARE in_smaPeriods_2 SMALLINT; 
	DECLARE in_smaPeriods_3 SMALLINT; 
	DECLARE in_smaPeriods_4 SMALLINT; 
	DECLARE in_smaPeriods_5 SMALLINT;
	DECLARE in_smaPeriods_6 SMALLINT;  
	DECLARE loop_cnt MEDIUMINT; -- variable for loop counter

-- DECLARE cursor_fetch_tmps      
	DECLARE cursor_fetch_tmp_dt DATETIME;   -- for dt    
	DECLARE cursor_fetch_tmp_ids VARCHAR(6);   -- for ids 

	DECLARE record_fetch_end TINYINT DEFAULT 0; -- DECLARE variable for error handler
        
	DECLARE cursor1 CURSOR FOR SELECT DISTINCT `dt`, `ids` FROM `ying_calc`.`s_rt_hst` WHERE dt >= in_dt_low AND dt <= in_dt_high ORDER BY `dt` DESC, `ids`; -- DECLARE coursors  

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_fetch_end = 1; -- DECLARE error handler for "NOT FOUND"	
-- initialize	    
	SET loop_cnt = 0;  
	SET in_smaPeriods_1 = 5;
	SET in_smaPeriods_2 = 10; 
	SET in_smaPeriods_3 = 20; 
	SET in_smaPeriods_4 = 30; 
	SET in_smaPeriods_5 = 60;
	SET in_smaPeriods_6 = 120;      
-- 	open cursor
	OPEN cursor1;
	-- 	Loop of cursor  
		CURSOR_LOOP: LOOP
		
			FETCH cursor1 INTO cursor_fetch_tmp_dt, cursor_fetch_tmp_ids; -- fetch result row into cursor_fetch_tmp 
				
			SET loop_cnt = loop_cnt + 1; -- increment the loop counter
            		
		-- 	actions	
			--  sma_1
				CALL `s_rt_hst-sma-amount`(cursor_fetch_tmp_dt, cursor_fetch_tmp_ids, in_smaPeriods_1, @out_sma_1);
			--  sma_2
				CALL `s_rt_hst-sma-amount`(cursor_fetch_tmp_dt, cursor_fetch_tmp_ids, in_smaPeriods_2, @out_sma_2);	
			--  sma_3
				CALL `s_rt_hst-sma-amount`(cursor_fetch_tmp_dt, cursor_fetch_tmp_ids, in_smaPeriods_3, @out_sma_3);
			--  sma_4
				CALL `s_rt_hst-sma-amount`(cursor_fetch_tmp_dt, cursor_fetch_tmp_ids, in_smaPeriods_4, @out_sma_4);
			--  sma_5
				CALL `s_rt_hst-sma-amount`(cursor_fetch_tmp_dt, cursor_fetch_tmp_ids, in_smaPeriods_5, @out_sma_5);	
			--  sma_6
				CALL `s_rt_hst-sma-amount`(cursor_fetch_tmp_dt, cursor_fetch_tmp_ids, in_smaPeriods_6, @out_sma_6);	
			IF cursor_fetch_tmp_dt IS NOT NULL THEN
				INSERT INTO `ying_calc`.`s_rt_hst_sma` (`dt`,`ids`,`amount5`,`amount10`,`amount20`,`amount30`,`amount60`,`amount120`) VALUES (cursor_fetch_tmp_dt, cursor_fetch_tmp_ids, @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6) ON DUPLICATE KEY UPDATE `amount5` =  @out_sma_1, `amount10` =  @out_sma_2, `amount20` =  @out_sma_3, `amount30` =  @out_sma_4, `amount60` =  @out_sma_5, `amount120` =  @out_sma_6;
                        END IF;
            
		-- 	break from loop if reach the end of the cursor
			IF record_fetch_end THEN
				LEAVE CURSOR_LOOP;
			END IF;		
	
		END LOOP CURSOR_LOOP; 
                -- SET out_loop_cnt = loop_cnt;
		SELECT loop_cnt, in_dt_low, in_dt_high;
	CLOSE cursor1;		
    
END$$
DELIMITER ;


-- Test the proc
-- 	SELECT * FROM `ying_calc`.`s_rt_hst` WHERE `ids`='601318' ORDER BY dt DESC;
--     
-- 	CALL `s_rt_hst-sma-amount_multiPeriods`('2019-09-09 00:00:00', '601318', 5, 10, 20, 30, 60, 120, @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6);
-- 	SELECT @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6;
-- 
-- DROP PROCEDURE IF EXISTS `s_rt_hst-sma-amount_multiPeriods`;
-- 


-- instructions for PROCEDURE `s_rt_hst-sma-amount`
	-- replace dt and ids with acorrding fields names
		-- NOTE: remember to change data types accordingly.
	-- replace s_rt_hst with table name;
    -- replace amount wiht the field name of the sma calc;
    -- replace the date type of out_sma, cursor_fetch_tmp, and sum with the according data types;
		-- NOTE: out_sma and cursor_fetch_tmp are usually the same data type.
        -- NOTE: sum is better to be big, especially when loop_cnt is large.
        -- NOTE: set round option in SET out_sma = "SET out_sma = ROUND((sum / in_smaPeriods),2);"

-- Test the proc
-- 	CALL `s_rt_hst-sma-amount`('2019-09-09', '601318', 10, @out_sma);
-- 	SELECT @out_sma;    

-- DROP PROCEDURE IF EXISTS `s_rt_hst-sma-amount_multiPeriods`;

-- DELIMITER $$
-- CREATE DEFINER=`gxh`@`%` PROCEDURE `s_rt_hst-sma-amount_multiPeriods`
	-- (
	-- IN 	
		-- in_dt DATETIME, -- variable datetime. If the value of this variable is large (such as '2019-09-09'), then the sma we get from this proc is for the latest datetime in table s_rt_hst.  
		-- ids VARCHAR(6),
		-- in_smaPeriods_1 MEDIUMINT, 
		-- in_smaPeriods_2 MEDIUMINT, 
		-- in_smaPeriods_3 MEDIUMINT, 
		-- in_smaPeriods_4 MEDIUMINT, 
		-- in_smaPeriods_5 MEDIUMINT, 
		-- in_smaPeriods_6 MEDIUMINT, 
    
		-- OUT out_sma_1 int, 
		-- OUT out_sma_2 int, 
		-- OUT out_sma_3 int, 
		-- OUT out_sma_4 int, 
		-- OUT out_sma_5 int, 
		-- OUT out_sma_6 int
    -- )
    
-- BEGIN

-- --  sma_1
	-- CALL `s_rt_hst-sma-amount`(in_dt, ids, in_smaPeriods_1, @out_sma_1);		
	-- SET out_sma_1 = @out_sma_1;
    
-- --  sma_2
	-- CALL `s_rt_hst-sma-amount`(in_dt, ids, in_smaPeriods_2, @out_sma_2);		
	-- SET out_sma_2 = @out_sma_2;

-- --  sma_3
	-- CALL `s_rt_hst-sma-amount`(in_dt, ids, in_smaPeriods_3, @out_sma_3);		
	-- SET out_sma_3 = @out_sma_3;

-- --  sma_4
	-- CALL `s_rt_hst-sma-amount`(in_dt, ids, in_smaPeriods_4, @out_sma_4);		
	-- SET out_sma_4 = @out_sma_4;

-- --  sma_5
	-- CALL `s_rt_hst-sma-amount`(in_dt, ids, in_smaPeriods_5, @out_sma_5);		
	-- SET out_sma_5 = @out_sma_5;

-- --  sma_6
	-- CALL `s_rt_hst-sma-amount`(in_dt, ids, in_smaPeriods_6, @out_sma_6);		
	-- SET out_sma_6 = @out_sma_6;          

-- END$$
-- DELIMITER ;
