-- add a column for value of d1
ALTER TABLE `ying`.`tableTMPL` ADD COLUMN `fieldTMPL_d1` DECIMAL(6,2) NULL COMMENT '' AFTER `fieldTMPL`;

-- UPDATE value of d1 into tableTMPL

DROP PROCEDURE IF EXISTS `tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1`()
BEGIN
UPDATE tableTMPL t
        INNER JOIN
    (SELECT 
        `dtTMPL`,
            `idTMPL`,
            round((fieldTMPL - @fieldTMPL_lag), 2) AS `fieldTMPL_d1`,
            @fieldTMPL_lag:=fieldTMPL `curr_fieldTMPL`
    FROM
        `ying`.`tableTMPL` t, (SELECT @fieldTMPL_lag:=0) r
    ORDER BY `idTMPL` , `dtTMPL`) d1 ON (t.idTMPL = d1.idTMPL
        AND t.dtTMPL = d1.dtTMPL) 
SET 
    t.fieldTMPL_d1 = d1.fieldTMPL_d1;
END$$
DELIMITER ;

CALL `tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1`;

SELECT * FROM tableTMPL ORDER BY idTMPL, dtTMPL DESC;

-- Reference: file E:\bYun\securities\ying\learning\learning.sql; search key words: learning and researching E:\bYun\securities\ying\proc\d1_TMPL\proc_tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1.sql 

