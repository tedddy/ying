-- E:\user_tony\Documents\GitHub\ying\proc\sma_TMPL\proc_`s_xts_adj_sma`_ids_d_`amount5_d1`_sma.sql

-- SELECT * FROM `ying_calc`.`s_xts_adj_sma_sma`;
		
-- DROP TABLE IF EXISTS `ying_calc`.`s_xts_adj_sma_sma`;

CREATE TABLE IF NOT EXISTS `ying_calc`.`s_xts_adj_sma_sma` (
  `d` DATE NOT NULL,
  `ids` VARCHAR(6) NOT NULL COMMENT 'ids',
  PRIMARY KEY (`ids`,`d`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

ALTER TABLE `ying_calc`.`s_xts_adj_sma_sma`
ADD COLUMN `amount5_d15` DECIMAL(6,2) DEFAULT NULL COMMENT 'amount5_d1 5 periods均线',
ADD COLUMN `amount5_d110` DECIMAL(6,2) DEFAULT NULL COMMENT 'amount5_d1 10 periods均线',
ADD COLUMN  `amount5_d120` DECIMAL(6,2) DEFAULT NULL COMMENT 'amount5_d1 20 periods均线',
ADD COLUMN  `amount5_d130` DECIMAL(6,2) DEFAULT NULL COMMENT 'amount5_d1 30 periods均线',
ADD COLUMN  `amount5_d160` DECIMAL(6,2) DEFAULT NULL COMMENT 'amount5_d1 60 periods均线',
ADD COLUMN  `amount5_d1120` DECIMAL(6,2) DEFAULT NULL COMMENT 'amount5_d1 120 periods均线';

DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_sma`;
-- This procedure compute sma (simple moving average) for stock (ids) at given DATE (`d`).
DELIMITER $$ 
CREATE PROCEDURE `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_sma`(
	IN 	
		in_d DATE, -- variable: DATE. If the value of this variable is large (such as '2019-09-09'), then the sma we get from this proc is for the latest DATE in table s_xts_adj_sma. 
		in_ids VARCHAR(25), -- variable: stock id
		in_smaPeriods MEDIUMINT, -- variable: Periods of the sma 
    
	OUT 
		out_sma DECIMAL(6,2) -- sma output
	)

BEGIN
-- 	DECLARE variables
        DECLARE cursor_fetch_tmp DECIMAL(6,2); -- variable for cursor fetch into
		DECLARE sum DECIMAL(12,2); 	-- variable for total of periods
									-- If "DECLARE sum DECIMAL(6,2);" and in_smaPeriods is big, get this message: 0 row(s) affected, 1 warning(s): 1264 Out of range value for column 'sum' at row 1
		DECLARE loop_cnt SMALLINT; -- variable for loop counter
		DECLARE limit_number_for_cursor SMALLINT;         
		DECLARE record_fetch_end TINYINT DEFAULT 0; -- 	DECLARE variable for error handler
   
-- 	DECLARE coursors 
		DECLARE cursor1 CURSOR FOR -- variable for the first cursor. 
			SELECT `amount5_d1` FROM `ying_calc`.`s_xts_adj_sma` WHERE `ids` = in_ids AND `d` <= in_d ORDER BY `d` DESC LIMIT LIMIT_NUMBER_FOR_CURSOR;

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
	  
	  SET out_sma = ROUND((sum / in_smaPeriods),2); -- now calculate the n-period sma
	  
	CLOSE cursor1;
	-- output result on screen
		-- SELECT out_sma;
END $$
DELIMITER ;

-- Test the proc
-- 	CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_sma`('2019-09-09', '000001', 5, @out_sma);
-- 	SELECT @out_sma;    
-- 

DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_sma_multiPeriods`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_sma_multiPeriods`
	(
	IN 	
		in_d DATE, -- variable DATE. If the value of this variable is large (such as '2019-09-09'), then the sma we get from this proc is for the latest DATE in table s_xts_adj_sma.  
		in_ids VARCHAR(6),
		in_smaPeriods_1 MEDIUMINT, 
		in_smaPeriods_2 MEDIUMINT, 
		in_smaPeriods_3 MEDIUMINT, 
		in_smaPeriods_4 MEDIUMINT, 
		in_smaPeriods_5 MEDIUMINT, 
		in_smaPeriods_6 MEDIUMINT, 
    
		OUT out_sma_1 DECIMAL(6,2), 
		OUT out_sma_2 DECIMAL(6,2), 
		OUT out_sma_3 DECIMAL(6,2), 
		OUT out_sma_4 DECIMAL(6,2), 
		OUT out_sma_5 DECIMAL(6,2), 
		OUT out_sma_6 DECIMAL(6,2)
    )
    
BEGIN

--  sma_1
	SET @out_sma_1 = 0;
        CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_sma`(in_d, in_ids, in_smaPeriods_1, @out_sma_1);		
	SET out_sma_1 = @out_sma_1;
    
--  sma_2
	SET @out_sma_2 = 0.00;
	CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_sma`(in_d, in_ids, in_smaPeriods_2, @out_sma_2);		
	SET out_sma_2 = @out_sma_2;

--  sma_3
	SET @out_sma_3 = 0.00;
	CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_sma`(in_d, in_ids, in_smaPeriods_3, @out_sma_3);		
	SET out_sma_3 = @out_sma_3;

--  sma_4
	SET @out_sma_4 = 0.00;
	CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_sma`(in_d, in_ids, in_smaPeriods_4, @out_sma_4);		
	SET out_sma_4 = @out_sma_4;

--  sma_5
	SET @out_sma_5 = 0.00;
	CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_sma`(in_d, in_ids, in_smaPeriods_5, @out_sma_5);		
	SET out_sma_5 = @out_sma_5;

--  sma_6
	SET @out_sma_6 = 0.00;
	CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_sma`(in_d, in_ids, in_smaPeriods_6, @out_sma_6);		
	SET out_sma_6 = @out_sma_6;          

END$$
DELIMITER ;

-- Test the proc
	SELECT * FROM `ying_calc`.`s_xts_adj_sma` WHERE `ids`='000001' ORDER BY d DESC;
--     
	SET @out_sma_1 = 0.00;
	SET @out_sma_2 = 0.00;
	SET @out_sma_3 = 0.00;
	SET @out_sma_4 = 0.00;
	SET @out_sma_5 = 0.00;
	SET @out_sma_6 = 0.00;
	CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_sma_multiPeriods`('2019-09-09', '000001', 5, 10, 20, 30, 60, 120, @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6);
	SELECT @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6;

    
DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_sma_multiPeriods_loop_dt_ids`; 
-- This proc loops through two fields to compute sma's
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_sma_multiPeriods_loop_dt_ids`(

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
	DECLARE cursor_fetch_tmp_dt DATE;   -- for `d`    
	DECLARE cursor_fetch_tmp_ids VARCHAR(6);   -- for ids 

	DECLARE record_fetch_end TINYINT DEFAULT 0; -- DECLARE variable for error handler
        
	DECLARE cursor1 CURSOR FOR SELECT DISTINCT `d`, `ids` FROM `ying_calc`.`s_xts_adj_sma` WHERE `d` >= in_dt_low AND `d` <= in_dt_high ORDER BY `d` DESC, `ids`; -- DECLARE coursors  

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_fetch_end = 1; -- DECLARE error handler for "NOT FOUND"	
    
-- 	open cursor
	OPEN cursor1;
	-- 	Loop of cursor  
		CURSOR_LOOP: LOOP
		
			FETCH cursor1 INTO cursor_fetch_tmp_dt, cursor_fetch_tmp_ids; -- fetch result row into cursor_fetch_tmp tedd
            		
		-- 	actions    
			SET @out_sma_1 = 0.00;
			SET @out_sma_2 = 0.00;
			SET @out_sma_3 = 0.00;
			SET @out_sma_4 = 0.00;
			SET @out_sma_5 = 0.00;
			SET @out_sma_6 = 0.00;	
			CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_sma_multiPeriods`(cursor_fetch_tmp_dt,cursor_fetch_tmp_ids,5,10,20,30,60,120, @out_sma_1,@out_sma_2,@out_sma_3,@out_sma_4,@out_sma_5,@out_sma_6);
			
			INSERT INTO `ying_calc`.`s_xts_adj_sma_sma` (`d`,`ids`,`amount5_d15`,`amount5_d110`,`amount5_d120`,`amount5_d130`,`amount5_d160`,`amount5_d1120`) VALUES (cursor_fetch_tmp_dt, cursor_fetch_tmp_ids, @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6) ON DUPLICATE KEY UPDATE `amount5_d15` =  @out_sma_1, `amount5_d110` =  @out_sma_2, `amount5_d120` =  @out_sma_3, `amount5_d130` =  @out_sma_4, `amount5_d160` =  @out_sma_5, `amount5_d1120` =  @out_sma_6;

		-- 	break from loop if reach the end of the cursor
			IF record_fetch_end THEN
				LEAVE CURSOR_LOOP;
			END IF;		
	
		END LOOP CURSOR_LOOP;   
    
	CLOSE cursor1;		
    
END$$
DELIMITER ;

--  test query in the proc   
-- 	CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_sma_multiPeriods`('2015-11-02','000001',5,10,20,30,60,120, @out_sma_1,@out_sma_2,@out_sma_3,@out_sma_4,@out_sma_5,@out_sma_6); 
-- 	SELECT @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6;
-- 	-- CALL `ying_calc`.`s_xts_adj_sma_import_data_from_s_rt`;			SET @out_sma_1 = 0.00;
-- 	SET @out_sma_2 = 0.00;
-- 	SET @out_sma_3 = 0.00;
-- 	SET @out_sma_4 = 0.00;
-- 	SET @out_sma_5 = 0.00;
-- 	SET @out_sma_6 = 0.00;	
--         CALL `ying_calc`.`s_xts_adj_sma_ids_d_amount5_d1_sma_multiPeriods_loop_dt_ids`(DATE_SUB(curdate(), INTERVAL 3 DAY) , '2018-08-08', 5, 10, 20, 30, 60, 120);   
--         SELECT DATE_SUB(curdate(), INTERVAL 3 DAY);
-- 	SELECT * FROM `s_xts_adj_sma_sma` WHERE `d` >= '2005-10-13 13:05:00' AND `d` <= '2019-10-15 15:05:00' ORDER BY `d` DESC;
-- 	select `d` FROM `s_xts_adj_sma`;