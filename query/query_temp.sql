SELECT 
    `amount`
FROM
    `ying_calc`.`index_xts`
WHERE
    `idi` = '000902'
ORDER BY `dt` DESC
LIMIT 2;

SELECT MAX(`dt`) FROM `ying_calc`.`s_loan`;

CALL `ying_calc`.`s_loan_sma_bMargin_loop`('2015-11-20', '2018-08-08');

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `s_rt_hst-amount-sma`(
	IN 	
		in_dt DATETIME, -- variable: datetime. If the value of this variable is large (such as '2019-09-09'), then the sma we get from this proc is for the latest datetime in table s_rt. 
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
			SELECT `amount` FROM `s_rt` WHERE `ids` = in_ids and `dt` <= in_dt ORDER BY `dt` DESC limit limit_number_for_cursor;

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
END$$
DELIMITER ;



select min(cjezb), max(cjezb) from `ying_calc`.`s_rt_hst`;

select * from `ying_calc`.`s_rt_hst` where cjezb > '999.99';

select * from `ying_calc`.`s_rt_hst` where `dt` = '2015-10-30 09:30:00';


-- UPDATE `ying_calc`.`s_rt_hst` hst
--         JOIN
--     `ying_calc`.`s_rt_hst` s ON (hst.ids = s.ids AND hst.`dt` = s.`dt`)
--         LEFT JOIN
--     `ying_calc`.index_rt_hst i ON (i.idi = '000902' AND i.`dt` = s.`dt`) 
-- SET 
--     hst.`cjezb` = IF(i.amount > 0,
--         ROUND(10000 * s.amount / i.amount, 2),
--         0);
-- 
-- 1000786 row(s) affected, 1 warning(s): 1264 Out of range value for column 'cjezb' at row 1 Rows matched: 1029817  Changed: 1000786  Warnings: 1

-- USE `ying`;
-- DROP procedure IF EXISTS `rt_scheduler`;
-- 
-- DELIMITER $$
-- USE `ying`$$
-- CREATE PROCEDURE `rt_scheduler` (IN char_null char(1))
-- BEGIN
-- CALL `ying`.`calc_s_rt_index_rt`;
-- END
-- $$
-- 
-- DELIMITER ;
-- 
-- 
-- CALL `ying_calc`.`s_xts_adj_ids_d_amount_sma_multiPeriods_loop_dt_ids`(curdate(), '2018-08-08', 5, 10, 20, 30, 60, 120);
-- 
-- SELECT 
--     s.`ids`,
--     s.`dt`,
--     s.`close`,
--     s.`amount`,
--     IF(i.amount > 0,
--         ROUND(10000 * s.amount / i.amount, 2),
--         0) AS amount_pct,
--     s.`volume`,
--     s.`chgrate`,
--     s.`WeiBi`,
--     s.`chgrate5`,
--     s.`LiangBi`
-- FROM
--     `ying`.`s_rt` s
--         LEFT JOIN
--     `ying`.index_rt i ON (i.idi = '000902' AND i.`dt` = s.`dt`);
-- 
-- SELECT 
--     s.ids,
--     s.`dt`,
--     IF(i.amount > 0,
--         round(10000 * s.amount / i.amount,2),
--         0) AS amount_pct
-- FROM
--     ying_calc.s_rt_hst s
--         left JOIN
--     ying_calc.index_rt_hst i ON (i.idi = '000902' AND i.`dt` = s.`dt`);
-- 
-- 		-- SET out_sma = ROUND((sum/ in_smaPeriods),2); -- now calculate the n-period sma
--                 SET out_sma = ROUND(((sum + cursor_fetch_tmp * (1 + in_smaPeriods - loop_cnt))/ in_smaPeriods),2); -- now calculate the n-period sma, fix the rusults in the first several periods.
-- 
-- DELIMITER $$
-- CREATE DEFINER=`gxh`@`%` PROCEDURE `s_xts_adj_ids_d_amount_d1`(
-- 	IN 	
-- 		in_d DATETIME, 
-- 		in_ids VARCHAR(25), 
-- 		in_smaPeriods MEDIUMINT, 
--     
-- 	OUT 
-- 		out_sma MEDIUMINT(8) 
-- 	)
-- BEGIN
-- 
--         DECLARE cursor_fetch_tmp MEDIUMINT(8); 
-- 		DECLARE sum INT(12); 	
-- 									
-- 		DECLARE loop_cnt SMALLINT; 
-- 		DECLARE limit_number_for_cursor SMALLINT;         
-- 		DECLARE record_fetch_end TINYINT DEFAULT 0; 
--    
-- 
-- 		DECLARE cursor1 CURSOR FOR 
-- 			SELECT `amount` FROM `s_xts_adj` WHERE `ids` = in_ids AND `dt` <= in_d ORDER BY `dt` DESC LIMIT LIMIT_NUMBER_FOR_CURSOR;
-- 
-- 
-- 		DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_fetch_end = 1;
-- 
-- 
-- 		SET loop_cnt = 0;
-- 		SET sum = 0.00;
--         SET limit_number_for_cursor = in_smaPeriods + 1; 
-- 
-- 
-- 		OPEN cursor1;
-- 		
-- 			CURSOR1_LOOP1: LOOP
--             
-- 				FETCH cursor1 INTO cursor_fetch_tmp; 
-- 				
-- 				SET loop_cnt = loop_cnt + 1; 
-- 				
-- 			
-- 					IF loop_cnt > in_smaPeriods THEN
-- 						LEAVE CURSOR1_LOOP1;
-- 					END IF;
-- 				
-- 			
-- 					IF record_fetch_end THEN
-- 						LEAVE CURSOR1_LOOP1;
-- 					END IF;
-- 				
-- 				SET sum = sum + cursor_fetch_tmp; 
-- 		
-- 			END LOOP CURSOR1_LOOP1;
-- 	  
-- 	  SET out_sma = ROUND((sum / in_smaPeriods)); 
-- 	  
-- 	CLOSE cursor1;
-- 	
-- 		
-- END$$
-- DELIMITER ;
-- 
-- 
-- SELECT 
--     `dt`,
--     `ids`,
--     (CAST(amount5 AS SIGNED) - CAST(@amount5_lag AS SIGNED)) AS `amount5_d1`,
--     @amount5_lag:=amount5 `curr_amount5`
-- FROM
--     `ying_calc`.`s_xts_adj_sma` t
-- WHERE
--     t.`dt` >= DATE_SUB(CURDATE(), INTERVAL 1 DAY)
-- ORDER BY `ids` , `dt`;
-- 
-- SELECT 
--         `dt`,
--             `ids`,
--             (CAST(amount5 AS SIGNED) - CAST(@amount5_lag AS SIGNED)) AS `amount5_d1`,
--             @amount5_lag:=amount5 `curr_amount5`
--     FROM
--         `ying_calc`.`s_xts_adj_sma` t
--     ORDER BY `ids` , `dt` LIMIT 2 ;
-- 
-- CALL `s_xts_adj_ids_d_amount_sma_multiPeriods_loop_dt_ids` (cast(concat((curdate(), ' ', '00:00:01')) as datetime), '2015-09-01 00:00:01', 5, 10, 20, 30, 60, 120); 
-- 
-- 
-- 
-- -- select * from hs_s_xts where amount is null;
-- 
-- DELETE FROM hs_s_xts WHERE amount IS NULL;
-- 
-- -- DELETE from hs_s_xts_history_sina where amount is null;
-- 
-- SELECT xts.code, xts.date, ROUND(xts.amount/hst.amount) FROM hs_s_xts xts LEFT JOIN ying.hs_s_xts_history_sina hst ON xts.code=hst.code AND xts.date=hst.date where ROUND(xts.amount/hst.amount) < 100 ORDER BY date DESC, code;
-- 
-- SELECT xts.code, xts.date, ROUND(xts.amount/hst.amount) FROM hs_s_xts xts LEFT JOIN ying.s_xts hst ON xts.code=hst.ids AND xts.date=hst.`dt` where code = '601318' ORDER BY date DESC, code;
-- 
-- SELECT xts.ids, xts.`dt`, ROUND(xts.amount/hst.amount) FROM ying.s_xts xts LEFT outer JOIN hs_s_xts hst ON xts.ids=hst.code where code = '601318';
-- 
-- SELECT xts.ids, xts.`dt`, hst.amount FROM ying.s_xts xts LEFT JOIN hs_s_xts hst ON xts.ids=hst.code where xts.ids = '000001' and hst.code is null;
-- 
-- 
-- select * FROM hs_s_xts xts where code = '601318' ORDER BY date DESC, code;
-- 
-- select * FROM ying.s_xts where ids = '601318' ORDER BY `dt` DESC, ids;
-- 
-- select * from ying.hs_s_xts_history_sina where code = '601318' ORDER BY date desc;