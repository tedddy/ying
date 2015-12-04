
-- instructions for PROCEDURE `ying_calc`.`s_xts_adj_sma_cjezb`
	-- replace `dt` and ids with acorrding fields names
		-- NOTE: remember to change data types accordingly.
	-- replace `ying_calc`.`s_xts_adj` with table name;
    -- replace cjezb wiht the field name of the sma calc;
    -- replace the date type of out_sma, cursor_fetch_tmp, and sum with the according data types;
		-- NOTE: out_sma and cursor_fetch_tmp are usually the same data type.
        -- NOTE: sum is better to be big, especially when loop_cnt is large.
        -- NOTE: set round option in SET out_sma = "SET out_sma = ROUND((sum / in_smaPeriods),2);"

		
-- Test the proc
-- 	CALL `ying_calc`.`s_xts_adj_sma_cjezb`('2019-09-09', '601318', 10, @out_sma);
-- 	SELECT @out_sma;    

-- DROP TABLE IF EXISTS `s_xts_adj_sma_cjezb`;

CREATE TABLE IF NOT EXISTS `ying_calc`.`s_xts_adj_sma` (
  `dt` DATE NOT NULL,
  `ids` VARCHAR(6) NOT NULL COMMENT 'ids',
  PRIMARY KEY (`ids`,`dt`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

ALTER TABLE `ying_calc`.`s_xts_adj_sma`
ADD COLUMN `cjezb5` DECIMAL(7,2) UNSIGNED DEFAULT NULL COMMENT 'cjezb 5 periods均线',
ADD COLUMN `cjezb10` DECIMAL(7,2) UNSIGNED DEFAULT NULL COMMENT 'cjezb 10 periods均线',
ADD COLUMN  `cjezb20` DECIMAL(7,2) UNSIGNED DEFAULT NULL COMMENT 'cjezb 20 periods均线',
ADD COLUMN  `cjezb30` DECIMAL(7,2) UNSIGNED DEFAULT NULL COMMENT 'cjezb 30 periods均线',
ADD COLUMN  `cjezb60` DECIMAL(7,2) UNSIGNED DEFAULT NULL COMMENT 'cjezb 60 periods均线',
ADD COLUMN  `cjezb120` DECIMAL(7,2) UNSIGNED DEFAULT NULL COMMENT 'cjezb 120 periods均线';

DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_cjezb`;
-- This procedure compute sma (simple moving average) for stock (ids) at given DATE (`dt`).
DELIMITER $$ 
CREATE PROCEDURE `ying_calc`.`s_xts_adj_sma_cjezb`(
	IN 	
		in_dt DATE, -- variable: DATE. If the value of this variable is large (such as '2019-09-09'), then the sma we get from this proc is for the latest DATE in table `ying_calc`.`s_xts_adj`. 
		in_ids VARCHAR(25), -- variable: stock id
		in_smaPeriods MEDIUMINT, -- variable: Periods of the sma 
    
	OUT 
		out_sma DECIMAL(7,2) -- sma output
	)

BEGIN
-- 	DECLARE variables
        DECLARE cursor_fetch_tmp DECIMAL(7,2); -- variable for cursor fetch into
		DECLARE sum DECIMAL(12,2); 	-- variable for total of periods
									-- If "DECLARE sum DECIMAL(7,2);" and in_smaPeriods is big, get this message: 0 row(s) affected, 1 warning(s): 1264 Out of range value for column 'sum' at row 1
		DECLARE loop_cnt SMALLINT; -- variable for loop counter
		DECLARE limit_number_for_cursor SMALLINT;         
		DECLARE record_fetch_end TINYINT DEFAULT 0; -- 	DECLARE variable for error handler
   
-- 	DECLARE coursors 
		DECLARE cursor1 CURSOR FOR -- variable for the first cursor. 
			SELECT `cjezb` FROM `ying_calc`.`s_xts_adj` WHERE `ids` = in_ids AND `dt` <= in_dt ORDER BY `dt` DESC LIMIT LIMIT_NUMBER_FOR_CURSOR;

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


--  test query in the proc    
-- 	CALL `ying_calc`.`s_xts_adj_sma_cjezb_loop`('2005-10-13 13:05:00', '2019-10-15 15:05:00', 5, 10, 20, 30, 60, 120);     
-- 	SELECT * FROM `ying_calc`.`s_xts_adj_sma` WHERE `dt` >= '2005-10-13 13:05:00' AND `dt` <= '2019-10-15 15:05:00' ORDER BY `dt` DESC;
-- 	select `dt` FROM `ying_calc`.`s_xts_adj`;
-- instructions for PROCEDURE `ying_calc`.`ying_calc`.`s_xts_adj_sma_cjezb_loop`
	-- create table `ying_calc`.`s_xts_adj_sma` according to E:\bYun\securities\ying\table\table_s_xts_adj_sma.sql
	-- replace fields names accordingly, to which sma's are inserted 
    
DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_cjezb_loop`; 
-- This proc loops through two fields to compute sma's
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_xts_adj_sma_cjezb_loop`
	(
		IN 	in_dt_low DATE, -- variable for the lowest DATE in the selection of the cursor. 
			in_dt_high DATE, -- variable for the highest DATE in the selection of the cursor.ids VARCHAR(6),
			-- in_ids VARCHAR(6),
			in_smaPeriods_1 SMALLINT, 
			in_smaPeriods_2 SMALLINT, 
			in_smaPeriods_3 SMALLINT, 
			in_smaPeriods_4 SMALLINT, 
			in_smaPeriods_5 SMALLINT, 
			in_smaPeriods_6 SMALLINT 
	)
BEGIN 
 
-- 	DECLARE cursor_fetch_tmps      
	DECLARE cursor_fetch_tmp_dt DATE;   -- for `dt`    
	DECLARE cursor_fetch_tmp_ids VARCHAR(6);   -- for ids 

	DECLARE record_fetch_end TINYINT DEFAULT 0; -- DECLARE variable for error handler
        
	DECLARE cursor1 CURSOR FOR SELECT DISTINCT `dt`, `ids` FROM `ying_calc`.`s_xts_adj` WHERE `dt` >= in_dt_low AND `dt` <= in_dt_high ORDER BY `dt` DESC, `ids`; -- DECLARE coursors  

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_fetch_end = 1; -- DECLARE error handler for "NOT FOUND"	
    
-- 	open cursor
	OPEN cursor1;
	-- 	Loop of cursor  
		CURSOR_LOOP: LOOP
		
			FETCH cursor1 INTO cursor_fetch_tmp_dt, cursor_fetch_tmp_ids; -- fetch result row into cursor_fetch_tmp tedd
            		
		-- 	actions	
		-- 	CALL `s_xts_adj_sma_cjezb_multiPeriods`(cursor_fetch_tmp_dt, cursor_fetch_tmp_ids,5,10,20,30,60,120, @out_sma_1,@out_sma_2,@out_sma_3,@out_sma_4,@out_sma_5,@out_sma_6);
                
		-- 	actions	
		--  sma_1
			CALL `s_xts_adj_sma_cjezb`(cursor_fetch_tmp_dt, cursor_fetch_tmp_ids, in_smaPeriods_1, @out_sma_1);
		--  sma_2
			CALL `s_xts_adj_sma_cjezb`(cursor_fetch_tmp_dt, cursor_fetch_tmp_ids, in_smaPeriods_2, @out_sma_2);	
		--  sma_3
			CALL `s_xts_adj_sma_cjezb`(cursor_fetch_tmp_dt, cursor_fetch_tmp_ids, in_smaPeriods_3, @out_sma_3);
		--  sma_4
			CALL `s_xts_adj_sma_cjezb`(cursor_fetch_tmp_dt, cursor_fetch_tmp_ids, in_smaPeriods_4, @out_sma_4);
		--  sma_5
			CALL `s_xts_adj_sma_cjezb`(cursor_fetch_tmp_dt, cursor_fetch_tmp_ids, in_smaPeriods_5, @out_sma_5);	
		--  sma_6
			CALL `s_xts_adj_sma_cjezb`(cursor_fetch_tmp_dt, cursor_fetch_tmp_ids, in_smaPeriods_6, @out_sma_6);
			
			IF cursor_fetch_tmp_dt IS NOT NULL THEN			
				INSERT INTO `ying_calc`.`s_xts_adj_sma` (`dt`,`ids`,`cjezb5`,`cjezb10`,`cjezb20`,`cjezb30`,`cjezb60`,`cjezb120`) VALUES (cursor_fetch_tmp_dt, cursor_fetch_tmp_ids, @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6) ON DUPLICATE KEY UPDATE `cjezb5` =  @out_sma_1, `cjezb10` =  @out_sma_2, `cjezb20` =  @out_sma_3, `cjezb30` =  @out_sma_4, `cjezb60` =  @out_sma_5, `cjezb120` =  @out_sma_6;
                        END IF;
                        
		-- 	break from loop if reach the end of the cursor
			IF record_fetch_end THEN
				LEAVE CURSOR_LOOP;
			END IF;		
	
		END LOOP CURSOR_LOOP;   
    
	CLOSE cursor1;		
    
END$$
DELIMITER ;

CALL `ying_calc`.`s_xts_adj_sma_cjezb_loop`('2015-11-30', '2018-08-08', 5, 10, 20, 30, 60, 120);

-- history

-- Test the proc
-- 	SELECT * FROM `ying_calc`.`s_xts_adj` WHERE `ids`='601318' ORDER BY dt DESC;
--     
-- 	CALL `s_xts_adj_sma_cjezb_multiPeriods`('2019-09-09 00:00:00', '601318', 5, 10, 20, 30, 60, 120, @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6);
-- 	SELECT @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6;

-- DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_cjezb_multiPeriods`;

-- DELIMITER $$
-- CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_xts_adj_sma_cjezb_multiPeriods`
	-- (
	-- IN 	
		-- in_dt DATE, -- variable DATE. If the value of this variable is large (such as '2019-09-09'), then the sma we get from this proc is for the latest DATE in table `ying_calc`.`s_xts_adj`.  
		-- in_ids VARCHAR(6),
		-- in_smaPeriods_1 MEDIUMINT, 
		-- in_smaPeriods_2 MEDIUMINT, 
		-- in_smaPeriods_3 MEDIUMINT, 
		-- in_smaPeriods_4 MEDIUMINT, 
		-- in_smaPeriods_5 MEDIUMINT, 
		-- in_smaPeriods_6 MEDIUMINT, 
    
		-- OUT out_sma_1 DECIMAL(7,2), 
		-- OUT out_sma_2 DECIMAL(7,2), 
		-- OUT out_sma_3 DECIMAL(7,2), 
		-- OUT out_sma_4 DECIMAL(7,2), 
		-- OUT out_sma_5 DECIMAL(7,2), 
		-- OUT out_sma_6 DECIMAL(7,2)
    -- )
    
-- BEGIN

-- --  sma_1
	-- CALL `ying_calc`.`s_xts_adj_sma_cjezb`(in_dt, in_ids, in_smaPeriods_1, @out_sma_1);		
	-- SET out_sma_1 = @out_sma_1;
    
-- --  sma_2
	-- CALL `ying_calc`.`s_xts_adj_sma_cjezb`(in_dt, in_ids, in_smaPeriods_2, @out_sma_2);		
	-- SET out_sma_2 = @out_sma_2;

-- --  sma_3
	-- CALL `ying_calc`.`s_xts_adj_sma_cjezb`(in_dt, in_ids, in_smaPeriods_3, @out_sma_3);		
	-- SET out_sma_3 = @out_sma_3;

-- --  sma_4
	-- CALL `ying_calc`.`s_xts_adj_sma_cjezb`(in_dt, in_ids, in_smaPeriods_4, @out_sma_4);		
	-- SET out_sma_4 = @out_sma_4;

-- --  sma_5
	-- CALL `ying_calc`.`s_xts_adj_sma_cjezb`(in_dt, in_ids, in_smaPeriods_5, @out_sma_5);		
	-- SET out_sma_5 = @out_sma_5;

-- --  sma_6
	-- CALL `ying_calc`.`s_xts_adj_sma_cjezb`(in_dt, in_ids, in_smaPeriods_6, @out_sma_6);		
	-- SET out_sma_6 = @out_sma_6;          

-- END$$
-- DELIMITER ;
