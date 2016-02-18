
SELECT `hs_bk_info_EM`.`code_bk`,
    `hs_bk_info_EM`.`name_bk`,
    `hs_bk_info_EM`.`DateSys`
FROM `ying`.`hs_bk_info_EM`;


CREATE TABLE `hs_bk_info_EM` (
  `code_bk` char(8) NOT NULL COMMENT 'HK stock code',
  `name_bk` varchar(18) DEFAULT NULL COMMENT 'chinese name',
  `DateSys` date DEFAULT NULL,
  PRIMARY KEY (`code_bk`),
  UNIQUE KEY `code_UNIQUE` (`code_bk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP PROCEDURE `ying`.`hs_bk_info_EM`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_bk_info_EM`(IN code_bk VARCHAR(18), name_bk VARCHAR(18), DateSys date)
BEGIN
SET code_bk = IF(code_bk = '', NULL, code_bk);
SET name_bk = IF(name_bk = '', NULL, name_bk);
SET DateSys = CURDATE();
INSERT INTO `hs_bk_info_EM` (`code_bk`, name_bk, `DateSys`) VALUES (code_bk, name_bk, DateSys) 
ON DUPLICATE KEY UPDate 
`name_bk` = name_bk; 
END$$
DELIMITER ;


CALL hs_bk_info_EM('[标签:code]','[标签:name_bk]','')