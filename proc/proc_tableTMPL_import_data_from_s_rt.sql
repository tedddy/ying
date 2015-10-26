USE `ying`;
DROP procedure IF EXISTS `tableTMPL_import_data_from_s_rt`;

DELIMITER $$
USE `ying`$$
CREATE PROCEDURE `tableTMPL_import_data_from_s_rt` ()
BEGIN
INSERT INTO `tableTMPL` 
	( 	
		`tableTMPL`.`idTMPL`,
		`tableTMPL`.`dtTMPL`,
		`tableTMPL`.`fieldTMPL`,
		`tableTMPL`.`volume`,
		`tableTMPL`.`amount`,
		`tableTMPL`.`chgrate`,
		`tableTMPL`.`WeiBi`,
		`tableTMPL`.`chgrate5`,
		`tableTMPL`.`LiangBi`
    )
SELECT 
		`s_rt`.`ids`,
		`s_rt`.`dt`,
		`s_rt`.`close`,
		`s_rt`.`volume`,
		`s_rt`.`amount`,
		`s_rt`.`chgrate`,
		`s_rt`.`WeiBi`,
		`s_rt`.`chgrate5`,
		`s_rt`.`LiangBi`  
FROM `ying`.`s_rt`
WHERE `ids` in ('601318', '000001') order by `dt` desc
ON DUPLICATE KEY UPDATE
		`tableTMPL`.`fieldTMPL` = `s_rt`.`close`,
		`tableTMPL`.`volume` = `s_rt`.`volume`,
		`tableTMPL`.`amount` = `s_rt`.`amount`,
		`tableTMPL`.`chgrate` = `s_rt`.`chgrate`,
		`tableTMPL`.`WeiBi` = `s_rt`.`WeiBi`,
		`tableTMPL`.`chgrate5` = `s_rt`.`chgrate5`,
		`tableTMPL`.`LiangBi` = `s_rt`.`LiangBi`;
END
$$

DELIMITER ;

