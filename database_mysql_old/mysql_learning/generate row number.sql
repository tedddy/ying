call `hs_s_rt_EM_test_rownum`('600190', @idsub);
select @idsub;

DROP PROCEDURE `hs_s_rt_EM_test_rownum`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_rt_EM_test_rownum`(in ids varchar(6), out idsub_generated MEDIUMINT) 
-- tedd: Note that if idsub_generated is replaced with idsub, then the procedure doesn't work, conflict with field name?! 
BEGIN
DECLARE idsub_tmp MEDIUMINT; -- variable for cursor fetch into
DECLARE cur_idsub CURSOR FOR
	 SELECT `idsub` FROM `ying`.`hs_s_rt_EM_test` WHERE `code` = ids order by TimeSlot desc limit 1;
OPEN cur_idsub;
FETCH cur_idsub INTO idsub_tmp;
CLOSE cur_idsub;
SET idsub_generated = 1 + idsub_tmp;
-- select idsub_generated;
END$$
DELIMITER ;