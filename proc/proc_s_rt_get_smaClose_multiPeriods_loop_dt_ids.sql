-- actions test
CALL `s_rt_get_smaClose_multiPeriods_Loop_dt`('2015-10-14 09:25:00', '2016-10-15 13:05:00', '601318', 5, 10, 20, 30, 60, 120);

use ying;
CALL `s_rt_get_smaClose_multiPeriods_Loop_dt_ids`('2015-09-08 09:25:00', '2015-10-14 10:25:00');

call run_s_rt_get_smaClose_multiPeriods_Loop_dt_ids();



drop PROCEDURE `run_s_rt_get_smaClose_multiPeriods_Loop_dt_ids`;

DELIMITER $$

create procedure `run_s_rt_get_smaClose_multiPeriods_Loop_dt_ids`()

BEGIN

DECLARE dt_min DATETIME;
DECLARE dt_max DATETIME;
DECLARE dt_tmp DATETIME;
SELECT min(dt) from `ying`.`s_rt` into dt_min;
SELECT max(dt) from `ying`.`s_rt` into dt_max;
set dt_tmp = dt_max;
if date(dt_tmp) > dt_min 
then

CALL `s_rt_get_smaClose_multiPeriods_Loop_dt_ids`(DATE_SUB(dt_tmp, interval 1 HOUR), dt_tmp);
set dt_tmp = DATE_SUB(dt_tmp, interval 1 day); 
end if; 

END$$
DELIMITER ;

DROP PROCEDURE `s_rt_get_smaClose_multiPeriods_Loop_dt_ids`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `s_rt_get_smaClose_multiPeriods_Loop_dt_ids`(IN in_dt_low DATETIME, in_dt_high DATETIME)

BEGIN  

-- DECLARE cursor_fetch_tmps      
	DECLARE cursor1_fetch_tmp VARCHAR(6); -- for ids 
    
	DECLARE loop1_cnt SMALLINT(3); -- variable for loop counter   

	DECLARE record_fetch_end TINYINT DEFAULT 0; -- DECLARE variable for error handler
        
	DECLARE cursor1 CURSOR FOR SELECT DISTINCT `ids` FROM `ying`.`s_rt` ORDER BY ids; -- DECLARE coursors           

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_fetch_end = 1; -- DECLARE error handler for "NOT FOUND"	
    
	SET loop1_cnt = 0;
    
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

		-- actions	
			CALL `s_rt_get_smaClose_multiPeriods_Loop_dt`(in_dt_low, in_dt_high, cursor1_fetch_tmp, 5, 10, 20, 30, 60, 120);
			
		END LOOP cursor1_LOOP;   
    
	CLOSE cursor1;		
    
END$$
DELIMITER ;