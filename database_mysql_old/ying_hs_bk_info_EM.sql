INSERT INTO `ying`.`hs_bk_info_EM` (`code_bk`, `name_bk`, `DateSys`) VALUES ('10', '上证A', '2015-09-08');
INSERT INTO `ying`.`hs_bk_info_EM` (`code_bk`, `name_bk`, `DateSys`) VALUES ('20', '深圳A', '2015-09-08');
UPDATE `ying`.`hs_bk_info_EM` SET `name_bk`='深证A' WHERE `code_bk`='20';


SELECT `hs_bk_info_EM`.`code_bk`,
    `hs_bk_info_EM`.`name_bk`,
    `hs_bk_info_EM`.`DateSys`
FROM `ying`.`hs_bk_info_EM`;


CREATE TABLE `hs_bk_info_EM` (
  `code` char(8) NOT NULL COMMENT 'HK stock code',
  `name_bk` varchar(18) DEFAULT NULL COMMENT 'chinese name_bk',
  `DateSys` date DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_bk_info_EM`(IN code VARCHAR(18), name_bk VARCHAR(18), DateSys date)
BEGIN
SET code = IF(code = '', NULL, code);
SET name_bk = IF(name_bk = '', NULL, name_bk);
SET DateSys = CURDATE();
INSERT INTO `hs_bk_info_EM` (`code`, name_bk, `DateSys`) VALUES (code, name_bk, DateSys) 
ON DUPLICATE KEY UPDate 
`name_bk` = name_bk; 
END$$
DELIMITER ;


CALL hs_bk_info_EM('[标签:code]','[标签:name_bk]','')