-- 对`ying`.`hs_s_rt_EM`的所有行，按每只股票分别生成行号。        
CALL hs_s_rt_EM_update_rownum();
DROP PROCEDURE IF EXISTS hs_s_rt_EM_update_rownum;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_rt_EM_update_rownum`()
BEGIN        
			DECLARE code_cur varchar(6);
			DECLARE done INT DEFAULT FALSE;
			DECLARE cur_code CURSOR FOR
				 SELECT DISTINCT `code` FROM `ying`.`hs_s_rt_EM`;	 
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
			OPEN cur_code;
				LOOP_code: LOOP
					FETCH cur_code INTO code_cur;
					IF NOT done THEN
						SET @x = 0;
						UPDATE `ying`.`hs_s_rt_EM` a
						INNER JOIN
						(SELECT 
							@x:=IFNULL(@x, 0) + 1 AS idsub, id, TimeSlot
						FROM
							`ying`.`hs_s_rt_EM`
						WHERE
							`hs_s_rt_EM`.code = code_cur
						ORDER BY TimeSlot) b ON a.id = b.id 
						SET a.idsub = b.idsub where a.idsub is null;
					ELSE
						LEAVE LOOP_code;
					END IF;
				END LOOP LOOP_code;
			CLOSE cur_code;					
		END$$
DELIMITER ;
