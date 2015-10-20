-- Test the proc
	SELECT * FROM `ying`.`s_rt` WHERE `ids`='601318' ORDER BY dt DESC;
    
	CALL `tableTMPL_sma_rt_idTMPL_dtTMPL_fieldTMPL_multiPeriods`('601318', 0.0, 5, 10, 20, 30, 60, 120, @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6);
	SELECT @out_sma_1, @out_sma_2, @out_sma_3, @out_sma_4, @out_sma_5, @out_sma_6;

DROP PROCEDURE IF EXISTS `tableTMPL_sma_rt_idTMPL_dtTMPL_fieldTMPL_multiPeriods`;

DELIMITER $$

CREATE DEFINER=`gxh`@`%` PROCEDURE `tableTMPL_sma_rt_idTMPL_dtTMPL_fieldTMPL_multiPeriods`(

	IN 	ids VARCHAR(6),
		in_current_close DECIMAL(6,2), -- variable in_current_close  
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
	CALL `tableTMPL_sma_rt_idTMPL_dtTMPL_fieldTMPL`(ids, in_current_close, in_smaPeriods_1, @out_sma_1);		
	SET out_sma_1 = @out_sma_1;
    
--  sma_2
	CALL `tableTMPL_sma_rt_idTMPL_dtTMPL_fieldTMPL`(ids, in_current_close, in_smaPeriods_2, @out_sma_2);		
	SET out_sma_2 = @out_sma_2;

--  sma_3
	CALL `tableTMPL_sma_rt_idTMPL_dtTMPL_fieldTMPL`(ids, in_current_close, in_smaPeriods_3, @out_sma_3);		
	SET out_sma_3 = @out_sma_3;

--  sma_4
	CALL `tableTMPL_sma_rt_idTMPL_dtTMPL_fieldTMPL`(ids, in_current_close, in_smaPeriods_4, @out_sma_4);		
	SET out_sma_4 = @out_sma_4;

--  sma_5
	CALL `tableTMPL_sma_rt_idTMPL_dtTMPL_fieldTMPL`(ids, in_current_close, in_smaPeriods_5, @out_sma_5);		
	SET out_sma_5 = @out_sma_5;

--  sma_6
	CALL `tableTMPL_sma_rt_idTMPL_dtTMPL_fieldTMPL`(ids, in_current_close, in_smaPeriods_6, @out_sma_6);		
	SET out_sma_6 = @out_sma_6;          

END$$

DELIMITER ;