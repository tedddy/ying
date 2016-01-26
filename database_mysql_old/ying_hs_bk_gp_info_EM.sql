SELECT `hs_bk_gp_info_EM`.`code_bk`,
    `hs_bk_gp_info_EM`.`code`,
    `hs_bk_gp_info_EM`.`DateSys`
FROM `ying`.`hs_bk_gp_info_EM`;

SELECT `hs_s_bk_gp_info_EM_JoinName`.`code_bk`,
    `hs_s_bk_gp_info_EM_JoinName`.`name_bk`,
    `hs_s_bk_gp_info_EM_JoinName`.`code`,
    `hs_s_bk_gp_info_EM_JoinName`.`DateSys`,
    `hs_s_bk_gp_info_EM_JoinName`.`TimeSys`,
    `hs_s_bk_gp_info_EM_JoinName`.`chgrate_bk`
FROM `ying`.`hs_s_bk_gp_info_EM_JoinName`;

SELECT `hs_s_bk_gp_info_EM_JoinName`.`code_bk`,
    `hs_s_bk_gp_info_EM_JoinName`.`name_bk`,
    `hs_s_bk_gp_info_EM_JoinName`.`code`,
    `hs_s_bk_gp_info_EM_JoinName`.`DateSys`,
    `hs_s_bk_gp_info_EM_JoinName`.`TimeSys`,
    `hs_s_bk_gp_info_EM_JoinName`.`chgrate_bk`
FROM `ying`.`hs_s_bk_gp_info_EM_JoinName` where name_bk = '上证50';


SELECT 
    a.`code_bk`,
    b.`name_bk`,
    a.`code`,
    a.`DateSys`,
    c.`chgrate_bk`
FROM
    `ying`.`hs_bk_gp_info_EM` AS a
        JOIN
    ying.hs_bk_info_EM AS b ON (a.code_bk = b.code_bk)
        JOIN
    ying.hs_bkhq_rt_EM AS c ON (b.name_bk = c.name_bk)
ORDER BY a.`DateSys` DESC , c.`chgrate_bk` DESC; 

SELECT distinct
    a.`code_bk`,
    b.`name_bk`,
    a.`code`
FROM
    `ying`.`hs_bk_gp_info_EM` AS a
        JOIN
    ying.hs_bk_info_EM AS b ON (a.code_bk = b.code_bk)
        JOIN
    ying.hs_bkhq_rt_EM AS c ON (b.name_bk = c.name_bk) where b.name_bk = '上证50'
ORDER BY a.`DateSys` DESC , c.`chgrate_bk` DESC; 


SELECT * FROM `hs_s_bk_gp_info_EM_JoinName` where code = 601318;

SELECT * FROM `hs_s_bk_gp_info_EM_JoinName`;
DROP VIEW `hs_s_bk_gp_info_EM_JoinName`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_bk_gp_info_EM_JoinName` AS
SELECT 
    a.`code_bk`,
    b.`name_bk`,
    a.`code`,
    c.`DateSys`,
    c.`TimeSys`,
    c.`chgrate_bk`
FROM
    `ying`.`hs_bk_gp_info_EM` AS a
        JOIN
    ying.hs_bk_info_EM AS b ON (a.code_bk = b.code_bk)
        JOIN
    ying.hs_bkhq_rt_EM AS c ON (b.name_bk = c.name_bk)
ORDER BY c.`DateSys` DESC , c.`TimeSys` DESC , c.`chgrate_bk` DESC;

SELECT 
    a.`code_bk`,
    b.`name_bk`,
    a.`code`,
    a.`DateSys`,
    c.`chgrate_bk`
FROM
    `ying`.`hs_bk_gp_info_EM` AS a
        JOIN
    ying.hs_bk_info_EM AS b ON (a.code_bk = b.code_bk)
        JOIN
    ying.hs_bkhq_rt_EM AS c ON (b.name_bk = c.name_bk)
ORDER BY a.`DateSys` DESC , c.`chgrate_bk`; 

SELECT 
    `hs_bk_gp_info_EM`.`code_bk`,
    `hs_bk_gp_info_EM`.`code`,
    `hs_bk_gp_info_EM`.`DateSys`
FROM
    `ying`.`hs_bk_gp_info_EM`
WHERE
    code = 601318;


CREATE TABLE `hs_bk_gp_info_EM` (
  `code_bk` char(8) NOT NULL COMMENT 'HK stock code',
  `code` varchar(6) NOT NULL COMMENT 'stock code',
  `DateSys` date DEFAULT NULL,
  PRIMARY KEY (`code_bk`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_bk_gp_info_EM`(IN code_bk VARCHAR(18), code VARCHAR(18), DateSys date)
BEGIN
SET code_bk = IF(code_bk = '', NULL, code_bk);
SET code = IF(code = '', NULL, code);
SET DateSys = CURDATE();
INSERT INTO `hs_bk_gp_info_EM` (`code_bk`, `code`, `DateSys`) VALUES (code_bk, code, DateSys) 
ON DUPLICATE KEY UPDate 
`code` = code; 
END$$
DELIMITER ;


CALL hs_bk_info_EM('[标签:code_bk]','[标签:code]','')