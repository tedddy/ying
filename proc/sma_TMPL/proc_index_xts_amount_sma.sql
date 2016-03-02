/* 	
	replace `ying_calc`.`index_xts` with ``, `idi` with ``, `dt` with ``, `amount` with ``
	save file proc_index_xts_amount_sma.sql as another file accordingly
	delete `ying`.
	replace
		index_xts	with			 replaced
		idi		with			 replaced
		dt		with			 replaced
		amount	with			 replaced	
	check data type of the table created
	execute file proc_index_xts_amount_sma.sql & test all procedures
*/
-- file name: E:\user_tony\Documents\GitHub\ying\proc\sma_TMPL\proc_index_xts_amount_sma

-- instructions for PROCEDURE `ying_calc`.`index_xts_amount_sma`
	-- replace `dt` and idi with acorrding fields names
		-- NOTE: remember to change data types accordingly.
	-- replace index_xts with table name;
    -- replace amount wiht the field name of the sma calc;
    -- replace the date type of out_sma, cursor_fetch_tmp, and sum with the according data types;
		-- NOTE: out_sma and cursor_fetch_tmp are usually the same data type.
        -- NOTE: sum is better to be big, especially when loop_cnt is large.
        -- NOTE: set round option in SET out_sma = "SET out_sma = ROUND((sum / in_smaPeriods),2);"

		
-- DROP TABLE IF EXISTS `ying_calc`.`index_xts_sma`;

CREATE TABLE IF NOT EXISTS `ying_calc`.`index_xts_sma` (
  `dt` DATETIME NOT NULL,
  `idi` VARCHAR(6) NOT NULL COMMENT 'idi',
  PRIMARY KEY (`idi`,`dt`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

ALTER TABLE `ying_calc`.`index_xts_sma`
ADD COLUMN `amount5` int(9) UNSIGNED DEFAULT NULL COMMENT 'amount 5 periods均线',
ADD COLUMN `amount10` int(9) UNSIGNED DEFAULT NULL COMMENT 'amount 10 periods均线',
ADD COLUMN  `amount20` int(9) UNSIGNED DEFAULT NULL COMMENT 'amount 20 periods均线',
ADD COLUMN  `amount30` int(9) UNSIGNED DEFAULT NULL COMMENT 'amount 30 periods均线',
ADD COLUMN  `amount60` int(9) UNSIGNED DEFAULT NULL COMMENT 'amount 60 periods均线',
ADD COLUMN  `amount120` int(9) UNSIGNED DEFAULT NULL COMMENT 'amount 120 periods均线';

DROP PROCEDURE IF EXISTS `ying_calc`.`index_xts_amount_sma`;
-- This procedure compute sma (simple moving average) for stock (idi) at given datetime (`dt`).
DELIMITER $$ 
CREATE PROCEDURE `ying_calc`.`index_xts_amount_sma`(
	IN 	
		in_dt DATETIME, -- variable: datetime. If the value of this variable is large (such as '2019-09-09'), then the sma we get from this proc is for the latest datetime in table index_xts. 
		in_idi VARCHAR(25), -- variable: stock id
		in_smaPeriods MEDIUMINT, -- variable: Periods of the sma 
    
	OUT 
		out_sma int(9) -- sma output
	)

BEGIN
-- 	DECLARE variables
        DECLARE cursor_fetch_tmp int(9); -- variable for cursor fetch into
		DECLARE sum DECIMAL(12,2); 	-- variable for total of periods
						-- If "DECLARE sum int(9);" and in_smaPeriods is big, get this message: 0 row(s) affected, 1 warning(s): 1264 Out of range value for column 'sum' at row 1
		DECLARE loop_cnt SMALLINT; -- variable for loop counter
		DECLARE limit_number_for_cursor SMALLINT;         
		DECLARE record_fetch_end TINYINT DEFAULT 0; -- 	DECLARE variable for error handler
   
-- 	DECLARE coursors 
		DECLARE cursor1 CURSOR FOR -- variable for the first cursor. 
			SELECT `amount` FROM `ying_calc`.`index_xts` WHERE `idi` = in_idi AND `dt` <= in_dt ORDER BY `dt` DESC LIMIT LIMIT_NUMBER_FOR_CURSOR;

-- 	DECLARE error handler for "NOT FOUND"
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_fetch_end = 1;

-- 	initialize variables for use in procedure		
		SET loop_cnt = 0;
		SET sum = 0.00;
        SET limit_number_for_cursor = in_smaPeriods + 1; -- the limit option used in select query. tedd!: this is bigger than in_smaPeriods for at least 1. If they are equal, then get the message: 0 row(s) affected, 1 warning(s): 1329 No data - zero rows fetched, selected, or processed

-- 	open cursor
		OPEN cursor1;
		-- Loop	of cursor1  
			CURSOR1_LOOP1: LOOP
            
				FETCH cursor1 INTO cursor_fetch_tmp; -- fetch result row into cursor_fetch_tmp tedd
				
				SET loop_cnt = loop_cnt + 1; -- increment the loop counter
				
			-- set the conditional break for n-periods sma, we need the n as the max
					IF loop_cnt > in_smaPeriods THEN
						LEAVE CURSOR1_LOOP1;
					END IF;
				
			-- break from loop if reach the end of the cursor
					IF record_fetch_end THEN
						LEAVE CURSOR1_LOOP1;
					END IF;
				
				SET sum = sum + cursor_fetch_tmp; -- add the sum to sum
		
			END LOOP CURSOR1_LOOP1;
	  
	  	  -- SET out_sma = ROUND((sum/ in_smaPeriods),2); -- now calculate the n-period sma
                  SET out_sma = ROUND(((sum + cursor_fetch_tmp * (in_smaPeriods + 1 - loop_cnt))/ in_smaPeriods),2); -- now calculate the n-period sma, fix the rusults in the first several periods.
	  
	CLOSE cursor1;
	-- output result on screen
		-- SELECT out_sma;
END $$
DELIMITER ;

-- Test the proc
	CALL `ying_calc`.`index_xts_amount_sma`('2015-10-28 15:05:00', '000001', 10, @out_sma);
	SELECT @out_sma;    


DROP PROCEDURE IF EXISTS `ying_calc`.`index_xts_amount_sma_multiPeriods`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`index_xts_amount_sma_multiPeriods`
	(
	IN 	
		in_dt DATETIME, -- variable datetime. If the value of this variable is large (such as '2019-09-09'), then the sma we get from this proc is for the latest datetime in table index_xts.  
		in_idi VARCHAR(6),
        in_smaPeriods_1 MEDIUMINT, 
		in_smaPeriods_2 MEDIUMINT, 
		in_smaPeriods_3 MEDIUMINT, 
		in_smaPeriods_4 MEDIUMINT, 
		in_smaPeriods_5 MEDIUMINT, 
		in_smaPeriods_6 MEDIUMINT, 
    
		OUT out_sma_1 int(9), 
		OUT out_sma_2 int(9), 
		OUT out_sma_3 int(9), 
		OUT out_sma_4 int(9), 
		OUT out_sma_5 int(9), 
		OUT out_sma_6 int(9)
    )
    
BEGIN

--  sma_1
	CALL `ying_calc`.`index_xts_amount_sma`(in_dt, in_idi, in_smaPeriods_1, @out_sma_1);		
	SET out_sma_1 = @out_sma_1;
    
--  sma_2
	CALL `ying_calc`.`index_xts_amount_sma`(in_dt, in_idi, in_smaPeriods_2, @out_sma_2);		
	SET out_sma_2 = @out_sma_2;

--  sma_3
	CALL `ying_calc`.`index_xts_amount_sma`(in_dt, in_idi, in_smaPeriods_3, @out_sma_3);		
	SET out_sma_3 = @out_sma_3;

--  sma_4
	CALL `ying_calc`.`index_xts_amount_sma`(in_dt, in_idi, in_smaPeriods_4, @out_sma_4);		
	SET out_sma_4 = @out_sma_4;

--  sma_5
	CALL `ying_calc`.`index_xts_amount_sma`(in_dt, in_idi, in_smaPeriods_5, @out_sma_5);		
	SET out_sma_5 = @out_sma_5;

--  sma_6
	CALL `ying_calc`.`index_xts_amount_sma`(in_dt, in_idi, in_smaPeriods_6, @out_sma_6);		
	SET out_sma_6 = @out_sma_6;          

END$$
DELIMITER ;

-- Test the proc
	SELECT * FROM `ying_calc`.`index_xts` WHERE `idi`='000001' ORDER BY dt DESC;
    
--     CALL `ying_calc`.`index_xts_amount_sma_multiPeriods`('2019-10-28 00:00:00', '000001', 5, 10, 20, 30, 60, 120, @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6);
-- SELECT @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6;

    
DROP PROCEDURE IF EXISTS `ying_calc`.`index_xts_amount_sma_multiPeriods_loop_dt_idi`; 
-- This proc loops through two fields to compute sma's
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`index_xts_amount_sma_multiPeriods_loop_dt_idi`(

	IN 	in_dt_low DATETIME, -- variable for the lowest datetime in the selection of the cursor. 
        in_dt_high DATETIME, -- variable for the highest datetime in the selection of the cursor.idi VARCHAR(6),
		-- in_idi VARCHAR(6),
		in_smaPeriods_1 SMALLINT, 
		in_smaPeriods_2 SMALLINT, 
		in_smaPeriods_3 SMALLINT, 
		in_smaPeriods_4 SMALLINT, 
		in_smaPeriods_5 SMALLINT, 
		in_smaPeriods_6 SMALLINT 
	)
BEGIN 
 
-- 	DECLARE cursor_fetch_tmps      
	DECLARE cursor_fetch_tmp_dt DATETIME;   -- for `dt`    
	DECLARE cursor_fetch_tmp_idi VARCHAR(6);   -- for idi 

	DECLARE record_fetch_end TINYINT DEFAULT 0; -- DECLARE variable for error handler
        
	DECLARE cursor1 CURSOR FOR SELECT DISTINCT `dt`, `idi` FROM `ying_calc`.`index_xts` WHERE `dt` >= in_dt_low AND `dt` <= in_dt_high ORDER BY `dt` DESC, `idi`; -- DECLARE coursors  

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_fetch_end = 1; -- DECLARE error handler for "NOT FOUND"	
    
-- 	open cursor
	OPEN cursor1;
	-- 	Loop of cursor  
		CURSOR_LOOP: LOOP
		
			FETCH cursor1 INTO cursor_fetch_tmp_dt, cursor_fetch_tmp_idi; -- fetch result row into cursor_fetch_tmp tedd
            		
		-- 	actions	
			CALL `ying_calc`.`index_xts_amount_sma_multiPeriods`(cursor_fetch_tmp_dt, cursor_fetch_tmp_idi,5,10,20,30,60,120, @out_sma_1,@out_sma_2,@out_sma_3,@out_sma_4,@out_sma_5,@out_sma_6);
			
			INSERT INTO `ying_calc`.`index_xts_sma` (`dt`,`idi`,`amount5`,`amount10`,`amount20`,`amount30`,`amount60`,`amount120`) VALUES (cursor_fetch_tmp_dt, cursor_fetch_tmp_idi, @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6) ON DUPLICATE KEY UPDATE `amount5` =  @out_sma_1, `amount10` =  @out_sma_2, `amount20` =  @out_sma_3, `amount30` =  @out_sma_4, `amount60` =  @out_sma_5, `amount120` =  @out_sma_6;

		-- 	break from loop if reach the end of the cursor
			IF record_fetch_end THEN
				LEAVE CURSOR_LOOP;
			END IF;		
	
		END LOOP CURSOR_LOOP;   
    
	CLOSE cursor1;		
    
END$$
DELIMITER ;

	CALL `ying_calc`.`index_xts_amount_sma_multiPeriods_loop_dt_idi`('2015-08-12 15:05:00' , '2016-08-08 15:05:00', 5, 10, 20, 30, 60, 120);     

	-- CALL `ying_calc`.`index_xts_amount_sma_multiPeriods_loop_dt_idi`(DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 3 DAY) , '2019-10-15 15:05:00', 5, 10, 20, 30, 60, 120);     

SELECT * FROM `ying_calc`.`index_xts_sma` WHERE `dt` >= '2005-10-13 13:05:00' AND `dt` <= '2019-10-15 15:05:00' ORDER BY `dt` DESC; 	

select * FROM `ying_calc`.`index_xts` ORDER BY dt DESC;