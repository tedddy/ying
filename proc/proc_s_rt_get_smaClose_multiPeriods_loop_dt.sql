--  test query in the proc
	-- DECLARE cursor1 CURSOR FOR 
    SELECT DISTINCT `dt` FROM `ying`.`s_rt_sma` WHERE dt >= '2005-10-15 13:05:00' AND '2015-10-15 13:05:00' ORDER BY `dt` DESC;
    
	CALL `s_rt_get_smaClose_multiPeriods_Loop_dt`('2015-10-08 15:05:00', '2015-10-14 01:00:00', '000001', 5, 10, 20, 30, 60, 120); 
    
    SELECT * FROM ying.s_rt_sma WHERE ids = '601318' AND dt = '2015-10-15 13:05:00' ORDER BY dt DESC;
    
	SELECT DISTINCT `dt` FROM `ying`.`s_rt_sma` WHERE dt >= '2015-09-08 15:05:00' AND dt <= '2015-10-15 13:10:00' ORDER BY `dt` DESC;
    
	CALL `s_rt_get_smaClose_multiPeriods`('2015-10-15 13:10:00', '601318', 5, 10, 20, 30, 60, 120, @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6);
	SELECT @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6;


DROP PROCEDURE IF EXISTS `s_rt_get_smaClose_multiPeriods_Loop_dt`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `s_rt_get_smaClose_multiPeriods_Loop_dt`(

	IN 	in_dt_low DATETIME, -- variable for the lowest datetime in the selection of the cursor. 
        in_dt_high DATETIME, -- variable for the highest datetime in the selection of the cursor.ids VARCHAR(6),
		in_ids VARCHAR(6),
		in_smaPeriods_1 SMALLINT, 
		in_smaPeriods_2 SMALLINT, 
		in_smaPeriods_3 SMALLINT, 
		in_smaPeriods_4 SMALLINT, 
		in_smaPeriods_5 SMALLINT, 
		in_smaPeriods_6 SMALLINT 
	)
BEGIN  

-- DECLARE cursor_fetch_tmps      
	DECLARE cursor_fetch_tmp DATETIME;   -- for dt 

	DECLARE record_fetch_end TINYINT DEFAULT 0; -- DECLARE variable for error handler
        
	DECLARE cursor1 CURSOR FOR SELECT DISTINCT `dt` FROM `ying`.`s_rt` WHERE dt >= in_dt_low AND dt <= in_dt_high ORDER BY `dt` DESC; -- DECLARE coursors  

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_fetch_end = 1; -- DECLARE error handler for "NOT FOUND"	
    
-- open cursor
	OPEN cursor1;
	-- Loop	of cursor  
		CURSOR_LOOP: LOOP
		
			FETCH cursor1 INTO cursor_fetch_tmp; -- fetch result row into cursor_fetch_tmp tedd
            		
		-- actions	
			CALL `s_rt_get_smaClose_multiPeriods`(cursor_fetch_tmp,in_ids,5,10,20,30,60,120, @out_sma_1,@out_sma_2,@out_sma_3,@out_sma_4,@out_sma_5,@out_sma_6);
			
			INSERT INTO `ying`.`s_rt_sma` (`dt`,`ids`,`close5`,`close10`,`close20`,`close30`,`close60`,`close120`) VALUES (cursor_fetch_tmp,in_ids,@out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6) ON DUPLICATE KEY UPDATE `close5` =  @out_sma_1, `close10` =  @out_sma_2, `close20` =  @out_sma_3, `close30` =  @out_sma_4, `close60` =  @out_sma_5, `close120` =  @out_sma_6;

		-- break from loop if reach the end of the cursor
			IF record_fetch_end THEN
				LEAVE CURSOR_LOOP;
			END IF;		
	
		END LOOP CURSOR_LOOP;   
    
	CLOSE cursor1;		
    
END$$
DELIMITER ;
