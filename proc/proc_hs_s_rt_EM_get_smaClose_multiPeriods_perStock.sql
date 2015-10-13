-- Test the proc
	SELECT * FROM `ying`.`hs_s_rt_EM` WHERE `code`='601318' ORDER BY TimeSlot DESC;
    
	CALL `hs_s_rt_EM_get_smaClose_multiPeriods_perStock`('601318', 5, 10, 20, 30, 60, 120, '1999-09-09', '2019-09-09', 121, @out_mv_period_1, @out_mv_period_2, @out_mv_period_3, @out_mv_period_4, @out_mv_period_5, @out_mv_period_6);
	SELECT @out_mv_period_1, @out_mv_period_2, @out_mv_period_3, @out_mv_period_4, @out_mv_period_5, @out_mv_period_6;

DROP PROCEDURE IF EXISTS `hs_s_rt_EM_get_smaClose_multiPeriods_perStock`;

DELIMITER $$

CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_rt_EM_get_smaClose_multiPeriods_perStock`(

	IN 	idStock VARCHAR(6), 
		in_period_1 SMALLINT, 
		in_period_2 SMALLINT, 
		in_period_3 SMALLINT, 
		in_period_4 SMALLINT, 
		in_period_5 SMALLINT, 
		in_period_6 SMALLINT, 
        in_TimeSlot_start DATETIME, -- the start TimeSlot for the selection query in the cursor
        in_TimeSlot_end DATETIME, -- the end TimeSlot for the selection query in the cursor
        in_limit_number INT, -- the limit option used in select query  
    
    OUT out_mv_period_1 DECIMAL(6,2), 
	OUT out_mv_period_2 DECIMAL(6,2), 
    OUT out_mv_period_3 DECIMAL(6,2), 
    OUT out_mv_period_4 DECIMAL(6,2), 
    OUT out_mv_period_5 DECIMAL(6,2), 
    OUT out_mv_period_6 DECIMAL(6,2)
    )
    
BEGIN

--  mv_period_1
	CALL `hs_s_rt_EM_get_smaClose`(idStock, in_period_1, in_TimeSlot_start, in_TimeSlot_end, in_limit_number, @out_mv_1);		
	SET out_mv_period_1 = @out_mv_1;
    
--  mv_period_2
	CALL `hs_s_rt_EM_get_smaClose`(idStock, in_period_2, in_TimeSlot_start, in_TimeSlot_end, in_limit_number, @out_mv_2);		
	SET out_mv_period_2 = @out_mv_2;

--  mv_period_3
	CALL `hs_s_rt_EM_get_smaClose`(idStock, in_period_3, in_TimeSlot_start, in_TimeSlot_end, in_limit_number, @out_mv_3);		
	SET out_mv_period_3 = @out_mv_3;

--  mv_period_4
	CALL `hs_s_rt_EM_get_smaClose`(idStock, in_period_4, in_TimeSlot_start, in_TimeSlot_end, in_limit_number, @out_mv_4);		
	SET out_mv_period_4 = @out_mv_4;

--  mv_period_5
	CALL `hs_s_rt_EM_get_smaClose`(idStock, in_period_5, in_TimeSlot_start, in_TimeSlot_end, in_limit_number, @out_mv_5);		
	SET out_mv_period_5 = @out_mv_5;

--  mv_period_6
	CALL `hs_s_rt_EM_get_smaClose`(idStock, in_period_6, in_TimeSlot_start, in_TimeSlot_end, in_limit_number, @out_mv_6);		
	SET out_mv_period_6 = @out_mv_6;          

END$$

DELIMITER ;