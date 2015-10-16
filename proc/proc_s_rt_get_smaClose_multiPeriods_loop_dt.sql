--  test query in the proc
	-- DECLARE cursor1 CURSOR FOR 
    SELECT DISTINCT `dt` FROM `ying`.`s_rt_sma` where dt >= '2005-10-15 13:05:00' and '2015-10-15 13:05:00' ORDER BY `dt` desc;
    
	CALL `s_rt_get_smaClose_multiPeriods_Loop_dt`('2005-10-15 13:05:00', '2015-10-15 13:05:00', '601318', 5, 10, 20, 30, 60, 120);    
    SELECT * FROM ying.s_rt_sma where ids = '601318' and dt = '2015-10-15 13:05:00' order by dt desc;
    
	SELECT DISTINCT `dt` FROM `ying`.`s_rt_sma` where dt >= '2015-10-15 13:10:00' and dt <= '2015-10-15 13:10:00' ORDER BY `dt` desc;
    
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
    
	DECLARE loop_cnt SMALLINT(3); -- variable for loop counter     

	DECLARE record_fetch_end TINYINT DEFAULT 0; -- DECLARE variable for error handler
        
	DECLARE cursor1 CURSOR FOR SELECT DISTINCT `dt` FROM `ying`.`s_rt` where dt >= in_dt_low and dt <= in_dt_high ORDER BY `dt` desc; -- DECLARE coursors  

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_fetch_end = 1; -- DECLARE error handler for "NOT FOUND"	
    
	SET loop_cnt = 0;  
-- open cursor
	OPEN cursor1;
	-- Loop	of cursor  
		cursor_LOOP: LOOP
		
			FETCH cursor1 INTO cursor_fetch_tmp; -- fetch result row into cursor_fetch_tmp tedd
			
			SET loop_cnt = loop_cnt + 1; -- increment the loop counter
            
		-- actions	
			CALL `s_rt_get_smaClose_multiPeriods`(cursor_fetch_tmp,in_ids,5,10,20,30,60,120, @out_sma_1,@out_sma_2,@out_sma_3,@out_sma_4,@out_sma_5,@out_sma_6);
			
			insert into `ying`.`s_rt_sma` (`dt`,`ids`,`sma5c`,`sma10c`,`sma20c`,`sma30c`,`sma60c`,`sma120c`) values (cursor_fetch_tmp,in_ids,@out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6) ON DUPLICATE KEY UPDATE `sma5c` =  @out_sma_1, `sma10c` =  @out_sma_2, `sma20c` =  @out_sma_3, `sma30c` =  @out_sma_4, `sma60c` =  @out_sma_5, `sma120c` =  @out_sma_6;
			
		-- break from loop if reach the end of the cursor
			IF record_fetch_end THEN
				LEAVE cursor_LOOP;
			END IF;		

		END LOOP cursor_LOOP;   
    
	CLOSE cursor1;		
    
END$$
DELIMITER ;