		-- SET out_sma = ROUND((sum/ in_smaPeriods),2); -- now calculate the n-period sma
                SET out_sma = ROUND(((sum + cursor_fetch_tmp * (1 + in_smaPeriods - loop_cnt))/ in_smaPeriods),2); -- now calculate the n-period sma, fix the rusults in the first several periods.

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `s_xts_adj_ids_d_amount_d1`(
	IN 	
		in_d DATETIME, 
		in_ids VARCHAR(25), 
		in_smaPeriods MEDIUMINT, 
    
	OUT 
		out_sma MEDIUMINT(8) 
	)
BEGIN

        DECLARE cursor_fetch_tmp MEDIUMINT(8); 
		DECLARE sum INT(12); 	
									
		DECLARE loop_cnt SMALLINT; 
		DECLARE limit_number_for_cursor SMALLINT;         
		DECLARE record_fetch_end TINYINT DEFAULT 0; 
   

		DECLARE cursor1 CURSOR FOR 
			SELECT `amount` FROM `s_xts_adj` WHERE `ids` = in_ids AND `d` <= in_d ORDER BY `d` DESC LIMIT LIMIT_NUMBER_FOR_CURSOR;


		DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_fetch_end = 1;


		SET loop_cnt = 0;
		SET sum = 0.00;
        SET limit_number_for_cursor = in_smaPeriods + 1; 


		OPEN cursor1;
		
			CURSOR1_LOOP1: LOOP
            
				FETCH cursor1 INTO cursor_fetch_tmp; 
				
				SET loop_cnt = loop_cnt + 1; 
				
			
					IF loop_cnt > in_smaPeriods THEN
						LEAVE CURSOR1_LOOP1;
					END IF;
				
			
					IF record_fetch_end THEN
						LEAVE CURSOR1_LOOP1;
					END IF;
				
				SET sum = sum + cursor_fetch_tmp; 
		
			END LOOP CURSOR1_LOOP1;
	  
	  SET out_sma = ROUND((sum / in_smaPeriods)); 
	  
	CLOSE cursor1;
	
		
END$$
DELIMITER ;


SELECT 
    `d`,
    `ids`,
    (CAST(amount5 AS SIGNED) - CAST(@amount5_lag AS SIGNED)) AS `amount5_d1`,
    @amount5_lag:=amount5 `curr_amount5`
FROM
    `ying_calc`.`s_xts_adj_sma` t
WHERE
    t.d >= DATE_SUB(CURDATE(), INTERVAL 1 DAY)
ORDER BY `ids` , `d`;

SELECT 
        `d`,
            `ids`,
            (CAST(amount5 AS SIGNED) - CAST(@amount5_lag AS SIGNED)) AS `amount5_d1`,
            @amount5_lag:=amount5 `curr_amount5`
    FROM
        `ying_calc`.`s_xts_adj_sma` t
    ORDER BY `ids` , `d` LIMIT 2 ;

CALL `s_xts_adj_ids_d_amount_sma_multiPeriods_loop_dt_ids` (cast(concat((curdate(), ' ', '00:00:01')) as datetime), '2015-09-01 00:00:01', 5, 10, 20, 30, 60, 120); 



-- select * from hs_s_xts where amount is null;

DELETE FROM hs_s_xts WHERE amount IS NULL;

-- DELETE from hs_s_xts_history_sina where amount is null;

SELECT xts.code, xts.date, ROUND(xts.amount/hst.amount) FROM hs_s_xts xts LEFT JOIN ying.hs_s_xts_history_sina hst ON xts.code=hst.code AND xts.date=hst.date where ROUND(xts.amount/hst.amount) < 100 ORDER BY date DESC, code;

SELECT xts.code, xts.date, ROUND(xts.amount/hst.amount) FROM hs_s_xts xts LEFT JOIN ying.s_xts hst ON xts.code=hst.ids AND xts.date=hst.d where code = '601318' ORDER BY date DESC, code;

SELECT xts.ids, xts.d, ROUND(xts.amount/hst.amount) FROM ying.s_xts xts LEFT outer JOIN hs_s_xts hst ON xts.ids=hst.code where code = '601318';

SELECT xts.ids, xts.d, hst.amount FROM ying.s_xts xts LEFT JOIN hs_s_xts hst ON xts.ids=hst.code where xts.ids = '000001' and hst.code is null;


select * FROM hs_s_xts xts where code = '601318' ORDER BY date DESC, code;

select * FROM ying.s_xts where ids = '601318' ORDER BY d DESC, ids;

select * from ying.hs_s_xts_history_sina where code = '601318' ORDER BY date desc;