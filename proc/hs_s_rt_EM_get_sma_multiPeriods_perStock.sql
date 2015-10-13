-- Test the proc
	SELECT * FROM `ying`.`hs_s_rt_EM` WHERE `code`='601318' ORDER BY TimeSlot DESC;
    
	CALL `hs_s_rt_EM_get_sma_multiPeriods_perStock`('601318', 5, 10, 20, 30, 60, 120, @out_mv_period_1, @out_mv_period_2, 		 @out_mv_period_3, @out_mv_period_4, @out_mv_period_5, @out_mv_period_6);
	SELECT @out_mv_period_1, @out_mv_period_2, @out_mv_period_3, @out_mv_period_4, @out_mv_period_5, @out_mv_period_6;

DROP PROCEDURE IF EXISTS `hs_s_rt_EM_get_sma_multiPeriods_perStock`;

DELIMITER $$

CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_rt_EM_get_sma_multiPeriods_perStock`(

	IN 	idStock VARCHAR(6), 
		in_period_1 SMALLINT, 
		in_period_2 SMALLINT, 
		in_period_3 SMALLINT, 
		in_period_4 SMALLINT, 
		in_period_5 SMALLINT, 
		in_period_6 SMALLINT, 
    
    OUT out_mv_period_1 DECIMAL(6,2), 
		out_mv_period_2 DECIMAL(6,2), 
    	out_mv_period_3 DECIMAL(6,2), 
    	out_mv_period_4 DECIMAL(6,2), 
    	out_mv_period_5 DECIMAL(6,2), 
    	out_mv_period_6 DECIMAL(6,2)
    )
    
BEGIN

--  mv_period_1
	CALL `hs_s_rt_EM_get_sma`(idStock, in_period_1, @out_mv_1);		
	SET out_mv_period_1 = @out_mv_1;
    
--  mv_period_2
	CALL `hs_s_rt_EM_get_sma`(idStock, in_period_2, @out_mv_2);		
	SET out_mv_period_2 = @out_mv_2;

--  mv_period_3
	CALL `hs_s_rt_EM_get_sma`(idStock, in_period_3, @out_mv_3);		
	SET out_mv_period_3 = @out_mv_3;

--  mv_period_4
	CALL `hs_s_rt_EM_get_sma`(idStock, in_period_4, @out_mv_4);		
	SET out_mv_period_4 = @out_mv_4;

--  mv_period_5
	CALL `hs_s_rt_EM_get_sma`(idStock, in_period_5, @out_mv_5);		
	SET out_mv_period_5 = @out_mv_5;

--  mv_period_1
	CALL `hs_s_rt_EM_get_sma`(idStock, in_period_6, @out_mv_6);		
	SET out_mv_period_6 = @out_mv_6;          

END$$

DELIMITER ;