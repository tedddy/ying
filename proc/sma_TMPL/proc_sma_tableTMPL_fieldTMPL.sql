-- DROP PROCEDURE IF EXISTS `sma_tableTMPL_fieldTMPL`;
-- This procedure compute sma (simple moving average) for stock (ids) at given datetime (`dt`).
DELIMITER $$ 
CREATE PROCEDURE `sma_tableTMPL_fieldTMPL`(
	IN 	
		in_dt DATETIME, -- variable: datetime. If the value of this variable is large (such as '2019-09-09'), then the sma we get from this proc is for the latest datetime in table tableTMPL. 
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
			SELECT `fieldTMPL` FROM `tableTMPL` WHERE `ids` = in_ids and `dt` <= in_dt ORDER BY `dt` DESC limit limit_number_for_cursor;

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
	  
	  SET out_sma = ROUND((sum / in_smaPeriods),2); -- now calculate the n-period sma
	  
	close cursor1;
	-- output result on screen
		-- SELECT out_sma;
END $$
DELIMITER ;


-- Test the proc
-- 	SELECT * FROM `ying`.`tableTMPL` WHERE `ids`='601318' ORDER BY dt DESC;
--     
-- 	CALL `sma_tableTMPL_fieldTMPL_multiPeriods`('2019-09-09 00:00:00', '601318', 5, 10, 20, 30, 60, 120, @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6);
-- 	SELECT @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6;

-- DROP PROCEDURE IF EXISTS `sma_tableTMPL_fieldTMPL_multiPeriods`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `sma_tableTMPL_fieldTMPL_multiPeriods`
	(
	IN 	
		in_dt DATETIME, -- variable datetime. If the value of this variable is large (such as '2019-09-09'), then the sma we get from this proc is for the latest datetime in table tableTMPL.  
		ids VARCHAR(6),
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
	CALL `sma_tableTMPL_fieldTMPL`(in_dt, ids, in_smaPeriods_1, @out_sma_1);		
	SET out_sma_1 = @out_sma_1;
    
--  sma_2
	CALL `sma_tableTMPL_fieldTMPL`(in_dt, ids, in_smaPeriods_2, @out_sma_2);		
	SET out_sma_2 = @out_sma_2;

--  sma_3
	CALL `sma_tableTMPL_fieldTMPL`(in_dt, ids, in_smaPeriods_3, @out_sma_3);		
	SET out_sma_3 = @out_sma_3;

--  sma_4
	CALL `sma_tableTMPL_fieldTMPL`(in_dt, ids, in_smaPeriods_4, @out_sma_4);		
	SET out_sma_4 = @out_sma_4;

--  sma_5
	CALL `sma_tableTMPL_fieldTMPL`(in_dt, ids, in_smaPeriods_5, @out_sma_5);		
	SET out_sma_5 = @out_sma_5;

--  sma_6
	CALL `sma_tableTMPL_fieldTMPL`(in_dt, ids, in_smaPeriods_6, @out_sma_6);		
	SET out_sma_6 = @out_sma_6;          

END$$
DELIMITER ;

--  test query in the proc    
-- 	CALL `sma_tableTMPL_fieldTMPL_multiPeriods_loop_dt_ids`('2005-10-13 13:05:00', '2019-10-15 15:05:00', 5, 10, 20, 30, 60, 120);     
-- 	SELECT * FROM `ying`.`tableTMPL_sma` WHERE dt >= '2005-10-13 13:05:00' AND dt <= '2019-10-15 15:05:00' ORDER BY `dt` DESC;
-- 
-- instructions for PROCEDURE `sma_tableTMPL_fieldTMPL_multiPeriods_loop_dt_ids`
	-- replace fields names accordingly, to which sma's are inserted 
    
-- DROP PROCEDURE IF EXISTS `sma_tableTMPL_fieldTMPL_multiPeriods_loop_dt_ids`; 
-- This proc loops through two fields to compute sma's
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `sma_tableTMPL_fieldTMPL_multiPeriods_loop_dt_ids`(

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
 
-- 	DECLARE cursor_fetch_tmps      
	DECLARE cursor_fetch_tmp_dt DATETIME;   -- for dt    
	DECLARE cursor_fetch_tmp_ids VARCHAR(6);   -- for ids 

	DECLARE record_fetch_end TINYINT DEFAULT 0; -- DECLARE variable for error handler
        
	DECLARE cursor1 CURSOR FOR SELECT DISTINCT `dt`, `ids` FROM `ying`.`tableTMPL` WHERE dt >= in_dt_low AND dt <= in_dt_high ORDER BY `dt` DESC, `ids`; -- DECLARE coursors  

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_fetch_end = 1; -- DECLARE error handler for "NOT FOUND"	
    
-- 	open cursor
	OPEN cursor1;
	-- 	Loop of cursor  
		CURSOR_LOOP: LOOP
		
			FETCH cursor1 INTO cursor_fetch_tmp_dt, cursor_fetch_tmp_ids; -- fetch result row into cursor_fetch_tmp tedd
            		
		-- 	actions	
			CALL `sma_tableTMPL_fieldTMPL_multiPeriods`(cursor_fetch_tmp_dt, cursor_fetch_tmp_ids,5,10,20,30,60,120, @out_sma_1,@out_sma_2,@out_sma_3,@out_sma_4,@out_sma_5,@out_sma_6);
			
			INSERT INTO `ying`.`tableTMPL_sma` (`dt`,`ids`,`sma5fieldTMPL`,`sma10fieldTMPL`,`sma20fieldTMPL`,`sma30fieldTMPL`,`sma60fieldTMPL`,`sma120fieldTMPL`) VALUES (cursor_fetch_tmp_dt, cursor_fetch_tmp_ids, @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6) ON DUPLICATE KEY UPDATE `sma5c` =  @out_sma_1, `sma10c` =  @out_sma_2, `sma20c` =  @out_sma_3, `sma30c` =  @out_sma_4, `sma60c` =  @out_sma_5, `sma120c` =  @out_sma_6;

		-- 	break from loop if reach the end of the cursor
			IF record_fetch_end THEN
				LEAVE CURSOR_LOOP;
			END IF;		
	
		END LOOP CURSOR_LOOP;   
    
	CLOSE cursor1;		
    
END$$
DELIMITER ;



-- instructions for PROCEDURE `sma_tableTMPL_fieldTMPL`
	-- replace dt and ids with acorrding fields names
		-- NOTE: remember to change data types accordingly.
	-- replace tableTMPL with table name;
    -- replace fieldTMPL wiht the field name of the sma calc;
    -- replace the date type of out_sma, cursor_fetch_tmp, and sum with the according data types;
		-- NOTE: out_sma and cursor_fetch_tmp are usually the same data type.
        -- NOTE: sum is better to be big, especially when loop_cnt is large.
        -- NOTE: set round option in SET out_sma = "SET out_sma = ROUND((sum / in_smaPeriods),2);"

-- Test the proc
-- 	CALL `sma_tableTMPL_fieldTMPL`('2019-09-09', '601318', 10, @out_sma);
-- 	SELECT @out_sma;    
    

-- DROP TABLE `ying`.`tableTMPL_sma`;
-- CREATE TABLE `tableTMPL_sma` (
--   `dt` DATETIME NOT NULL,
--   `ids` VARCHAR(6) NOT NULL COMMENT 'ids',
--   `sma5c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 5 periods均线',
--   `sma10c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 10 periods均线',
--   `sma20c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 20 periods均线',
--   `sma30c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 30 periods均线',
--   `sma60c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 60 periods均线',
--   `sma120c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 120 periods均线',
--   `sma5v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 5 periods均线',
--   `sma10v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 10 periods均线',
--   `sma20v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 20 periods均线',
--   `sma30v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 30 periods均线',
--   `sma60v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 60 periods均线',
--   `sma120v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 120 periods均线',
--   `sma5a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 5 periods均线',
--   `sma10a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 10 periods均线',
--   `sma20a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 20 periods均线',
--   `sma30a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 30 periods均线',
--   `sma60a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 60 periods均线',
--   `sma120a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 120 periods均线',
--   `sma5wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 5 periods均线',
--   `sma10wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 10 periods均线',
--   `sma20wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 20 periods均线',
--   `sma30wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 30 periods均线',
--   `sma60wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 60 periods均线',
--   `sma120wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 120 periods均线',
--   `sma5lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 5 periods均线',
--   `sma10lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 10 periods均线',
--   `sma20lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 20 periods均线',
--   `sma30lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 30 periods均线',
--   `sma60lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 60 periods均线',
--   `sma120lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 120 periods均线',
--   PRIMARY KEY (`ids`,`dt`),
--   INDEX `dt` (`dt` DESC)
-- ) ENGINE=INNODB DEFAULT CHARSET=UTF8;

-- SELECT * FROM `ying`.`tableTMPL` order by ids desc, dt;
-- SELECT count(*) FROM `ying`.`tableTMPL` order by ids desc, dt;
-- 
-- -- import data from `s_rt` to `tableTMPL`, where field name `close` is changed to fieldTMPL.
-- INSERT INTO `tableTMPL` 
-- 	( 	
-- 		`tableTMPL`.`ids`,
-- 		`tableTMPL`.`fieldTMPL`,
-- 		`tableTMPL`.`volume`,
-- 		`tableTMPL`.`amount`,
-- 		`tableTMPL`.`chgrate`,
-- 		`tableTMPL`.`WeiBi`,
-- 		`tableTMPL`.`chgrate5`,
-- 		`tableTMPL`.`LiangBi`,
-- 		`tableTMPL`.`dt`
--     )
-- SELECT 
-- 		`s_rt`.`ids`,
-- 		`s_rt`.`close`,
-- 		`s_rt`.`volume`,
-- 		`s_rt`.`amount`,
-- 		`s_rt`.`chgrate`,
-- 		`s_rt`.`WeiBi`,
-- 		`s_rt`.`chgrate5`,
-- 		`s_rt`.`LiangBi`,
-- 		`s_rt`.`dt`        
-- FROM `ying`.`s_rt`
-- WHERE `ids` in ('601318', '000001') order by `dt` desc;