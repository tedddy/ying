CREATE DEFINER=`gxh`@`%` PROCEDURE `xts_scheduler`(IN char_null CHAR(1))
BEGIN
-- sma for s_loan
	DECLARE dt_lastest_s_loan DATE;
	SELECT MAX(`dt`) INTO dt_lastest_s_loan FROM `ying_calc`.`s_loan`;
	IF (CURTIME() > '08:50:00' AND CURTIME() < '09:10:00') THEN 

		BEGIN
			CALL `ying_calc`.`s_loan_sma_bMargin_loop`(dt_lastest_s_loan, '2018-08-08');
                        CALL `ying_calc`.`s_loan_d1_bMargin`;
                        CALL `ying_calc`.`s_loan_sma_d1_bMargin5`;
			CALL `ying_calc`.`s_loan_sma_d1_bMargin10`;
			CALL `ying_calc`.`s_loan_sma_d1_bMargin20`;
			CALL `ying_calc`.`s_loan_sma_d1_bMargin30`;
			CALL `ying_calc`.`s_loan_sma_d1_bMargin60`;
			CALL `ying_calc`.`s_loan_sma_d1_bMargin120`;
		END;
	END IF;

-- sma and d1 for `ying_calc`.`s_xts_adj_sma`
IF (CURTIME() > '15:00:00' AND CURTIME() < '22:20:00')  THEN

	BEGIN
	-- update `cjezb` of table `ying`.`index_xts`
		UPDATE `ying`.`index_xts` a
		JOIN `ying`.`index_xts` b ON (b.`idi` = '000902' AND a.`dt` = b.`dt`) 
		SET a.`cjezb` = IF(b.amount > 0, ROUND(100 * a.amount / b.amount, 2),0) 
		WHERE a.`dt` = CURDATE();
    -- update `cjezb` of table `ying_calc`.`index_rt_hst`
		CALL `ying_calc`.`index_rt_hst_cjezb_d1`;
    -- update `close_d1` of table `ying_calc`.`index_xts`    
		CALL `ying_calc`.`index_xts_close_d1`;      
    -- update `close_d1` of table `ying_calc`.`index_xts`    
		CALL `ying_calc`.`index_xts_amount_d1`;    
    -- update `close_d1` of table `ying_calc`.`index_xts`    
		CALL `ying_calc`.`index_xts_cjezb_d1`;              
	-- update `cjezb` of table `ying_calc`.`s_xts_adj`
		UPDATE `ying_calc`.`s_xts_adj` s
		JOIN `ying_calc`.`index_xts` i ON (i.`idi` = '000902' AND s.`dt` = i.`dt`) 
		SET s.`cjezb` = IF(i.amount > 0, ROUND(10000 * s.amount / i.amount, 2),0) 
		WHERE i.`dt` = CURDATE();
    -- update d1 for `ying_calc`.`s_xts_adj`    
        CALL `ying_calc`.`s_xts_adj_close_d1`;
		CALL `ying_calc`.`s_xts_adj_amount_d1`;
        CALL `ying_calc`.`s_xts_adj_cjezb_d1`;

	-- sma for `s_xts_adj`
		CALL `ying_calc`.`s_xts_adj_sma_amount_loop`(CURDATE(), '2018-08-08', 5, 10, 20, 30, 60, 120);
		CALL `ying_calc`.`s_xts_adj_sma_close_loop`(CURDATE(), '2018-08-08', 5, 10, 20, 30, 60, 120);
		CALL `ying_calc`.`s_xts_adj_sma_cjezb_loop`(CURDATE(), '2018-08-08', 5, 10, 20, 30, 60, 120);
	-- d1 amount
		CALL `ying_calc`.`s_xts_adj_sma_amount5_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_amount10_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_amount20_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_amount30_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_amount60_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_amount120_d1`;
        -- d1 close
		CALL `ying_calc`.`s_xts_adj_sma_close5_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_close10_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_close20_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_close30_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_close60_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_close120_d1`;
        -- d1 cjezb
		CALL `ying_calc`.`s_xts_adj_sma_cjezb5_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_cjezb10_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_cjezb20_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_cjezb30_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_cjezb60_d1`;
		CALL `ying_calc`.`s_xts_adj_sma_cjezb120_d1`;        

	END;
END IF;

-- update `ying_calc`.`i_nmc` 流通市值 2016-02-14。
TRUNCATE table `ying_calc`.`i_nmc`;
INSERT INTO `ying_calc`.`i_nmc`
(`idi`,
`i_nmc`)
SELECT 
`ying_calc`.`i_s`.`idi` AS `idi`,
SUM(`ying_calc`.`s_info`.`nmc`) AS `i_nmc`
FROM
(`ying_calc`.`s_info`
LEFT JOIN `ying_calc`.`i_s` ON ((`ying_calc`.`s_info`.`ids` = `ying_calc`.`i_s`.`ids`)))
WHERE
(`ying_calc`.`i_s`.`idi` IS NOT NULL)
GROUP BY `ying_calc`.`i_s`.`idi`;

-- clean locoy data 
DELETE FROM ying.s_xts_adj_hst_sina_cur_day where `dt` = '0000-00-00';
DELETE FROM ying.s_xts_adj_hst_sina where `dt` = '0000-00-00';

END