--  test query in the proc
	-- DECLARE cursor1 CURSOR FOR 
    
	CALL `s_rt_get_smaClose_multiPeriods_loop_dt&ids`('2015-10-16 09:05:00', '2015-10-16 16:00:00', 5, 10, 20, 30, 60, 120); 
    
	SELECT DISTINCT `dt` FROM `ying`.`s_rt_sma` WHERE dt >= '2015-10-14 15:05:00' AND dt <= '2015-10-15 13:10:00' ORDER BY `dt` DESC;
    
	CALL `s_rt_get_smaClose_multiPeriods`('2015-10-15 13:10:00', '601318', 5, 10, 20, 30, 60, 120, @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6);
	SELECT @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6;


DROP PROCEDURE IF EXISTS `s_rt_get_smaClose_multiPeriods_loop_dt&ids`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `s_rt_get_smaClose_multiPeriods_loop_dt&ids`(

	IN 	in_dt_low DATETIME, -- variable for the lowest datetime in the selection of the cursor. 
        in_dt_high DATETIME, -- variable for the highest datetime in the selection of the cursor.ids VARCHAR(6),
		-- in_ids VARCHAR(6),
		in_smaPeriods_1 SMALLINT, 
		in_smaPeriods_2 SMALLINT, 
		in_smaPeriods_3 SMALLINT, 
		in_smaPeriods_4 SMALLINT, 
		in_smaPeriods_5 SMALLINT, 
		in_smaPeriods_6 SMALLINT 
	)
BEGIN  

-- DECLARE cursor_fetch_tmps      
	DECLARE cursor_fetch_tmp_dt DATETIME;   -- for dt    
	DECLARE cursor_fetch_tmp_ids VARCHAR(6);   -- for ids 

	DECLARE record_fetch_end TINYINT DEFAULT 0; -- DECLARE variable for error handler
        
	DECLARE cursor1 CURSOR FOR SELECT DISTINCT `dt`, `ids` FROM `ying`.`s_rt` WHERE dt >= in_dt_low AND dt <= in_dt_high ORDER BY `dt` DESC, `ids`; -- DECLARE coursors  

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_fetch_end = 1; -- DECLARE error handler for "NOT FOUND"	
    
-- open cursor
	OPEN cursor1;
	-- Loop	of cursor  
		CURSOR_LOOP: LOOP
		
			FETCH cursor1 INTO cursor_fetch_tmp_dt, cursor_fetch_tmp_ids; -- fetch result row into cursor_fetch_tmp tedd
            		
		-- actions	
			CALL `s_rt_get_smaClose_multiPeriods`(cursor_fetch_tmp_dt, cursor_fetch_tmp_ids,5,10,20,30,60,120, @out_sma_1,@out_sma_2,@out_sma_3,@out_sma_4,@out_sma_5,@out_sma_6);
			
			INSERT INTO `ying`.`s_rt_sma` (`dt`,`ids`,`sma5c`,`sma10c`,`sma20c`,`sma30c`,`sma60c`,`sma120c`) VALUES (cursor_fetch_tmp_dt, cursor_fetch_tmp_ids, @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6) ON DUPLICATE KEY UPDATE `sma5c` =  @out_sma_1, `sma10c` =  @out_sma_2, `sma20c` =  @out_sma_3, `sma30c` =  @out_sma_4, `sma60c` =  @out_sma_5, `sma120c` =  @out_sma_6;

		-- break from loop if reach the end of the cursor
			IF record_fetch_end THEN
				LEAVE CURSOR_LOOP;
			END IF;		
	
		END LOOP CURSOR_LOOP;   
    
	CLOSE cursor1;		
    
END$$
DELIMITER ;
