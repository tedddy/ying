CALL `s_rt_get_smaClose_multiPeriods_Loop_dt`('2000-09-09 00:00:00', '2015-10-15 09:25:00');

DROP PROCEDURE `s_rt_get_smaClose_multiPeriods_Loop_dt`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `s_rt_get_smaClose_multiPeriods_Loop_dt`(dt_low DATETIME, dt_high DATETIME)

BEGIN  

-- DECLARE cursor_fetch_tmps      
	DECLARE cursor1_fetch_tmp DATETIME;   -- for dt    
	DECLARE cursor2_fetch_tmp VARCHAR(6); -- for ids 
    
	DECLARE loop1_cnt SMALLINT(3); -- variable for loop counter   
	DECLARE loop2_cnt SMALLINT(3); -- variable for loop counter     

	DECLARE record_fetch_end TINYINT DEFAULT 0; -- DECLARE variable for error handler
        
	DECLARE cursor1 CURSOR FOR SELECT DISTINCT `dt` FROM `ying`.`s_rt` where dt >= dt_low and dt <= dt_high ORDER BY `dt` desc; -- DECLARE coursors  
        
	DECLARE cursor2 CURSOR FOR SELECT DISTINCT `ids` FROM `ying`.`s_rt` ORDER BY ids; -- DECLARE coursors           

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_fetch_end = 1; -- DECLARE error handler for "NOT FOUND"	
    
	SET loop1_cnt = 0;    
	SET loop2_cnt = 0;    
-- open cursor
	OPEN cursor1;
	-- Loop	of cursor1  
		cursor1_LOOP: LOOP
		
			FETCH cursor1 INTO cursor1_fetch_tmp; -- fetch result row into cursor_fetch_tmp tedd
			
			SET loop1_cnt = loop1_cnt + 1; -- increment the loop counter
			
		-- break from loop if reach the end of the cursor
				IF record_fetch_end THEN
					LEAVE cursor1_LOOP;
				END IF;
			
				OPEN cursor2;
				-- Loop	of cursor2  
					cursor2_LOOP: LOOP
					
						FETCH cursor2 INTO cursor2_fetch_tmp; -- fetch result row into cursor_fetch_tmp
						
						SET loop2_cnt = loop2_cnt + 1; -- increment the loop counter
						
					-- break from loop if reach the end of the cursor
							IF record_fetch_end THEN
								LEAVE cursor2_LOOP;
							END IF;
					-- actions	
						CALL `s_rt_get_smaClose_multiPeriods`(cursor2_fetch_tmp, cursor1_fetch_tmp, 5, 10, 20, 30, 60, 120, @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6);
                        
                        UPDATE `ying`.`s_rt_sma`
						SET `s_rt_sma`.`sma5c` = @out_sma_1
						WHERE ids= cursor2_fetch_tmp and dt = cursor1_fetch_tmp;
                        
					END LOOP cursor2_LOOP;
                SET record_fetch_end = 0;    
				CLOSE cursor2;		

		END LOOP cursor1_LOOP;   
    
	CLOSE cursor1;		
    
END$$
DELIMITER ;