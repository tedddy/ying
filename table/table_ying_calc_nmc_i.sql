USE `ying_calc`;

-- DROP TABLE `ying_calc`.`i_nmc`;
CREATE TABLE `ying_calc`.`i_nmc` (
  `idi` CHAR(6) NOT NULL COMMENT 'index code',
  `i_nmc` BIGINT(13) DEFAULT NULL COMMENT '流通市值',
  PRIMARY KEY (`idi`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

-- TRUNCATE table `ying_calc`.`i_nmc`;
INSERT INTO `ying_calc`.`i_nmc`
(`idi`,
`i_nmc`)
SELECT 
`idi`,
`i_nmc`
FROM
`ying_calc`.`i_nmc_view`;

-- TRUNCATE table `ying_calc`.`i_nmc`;
INSERT INTO `ying_calc`.`i_nmc`
(`idi`,
`i_nmc`)
SELECT 
`ying_calc`.`i_s`.`idi` AS `idi`,
SUM(`ying_calc`.`s_info`.`nmc`) AS `i_nmc`
FROM
(`ying_calc`.`s_info`
LEFT JOIN `ying_calc`.`i_s` ON ((`ying_calc`.`s_info`.`ids` = `ying_calc`.`i_s`.`ids`)))
WHERE
(`ying_calc`.`i_s`.`idi` IS NOT NULL)
GROUP BY `ying_calc`.`i_s`.`idi`;


SELECT 
`ying_calc`.`i_s`.`idi` AS `idi`,
SUM(`ying_calc`.`s_info`.`nmc`) AS `i_nmc`
FROM
(`ying_calc`.`s_info`
LEFT JOIN `ying_calc`.`i_s` ON ((`ying_calc`.`s_info`.`ids` = `ying_calc`.`i_s`.`ids`)))
WHERE
(`ying_calc`.`i_s`.`idi` IS NOT NULL)
GROUP BY `ying_calc`.`i_s`.`idi`;

select DISTINCT idi from `ying_calc`.`i_s`;

select * from `ying_calc`.`i_nmc_view`;
DROP VIEW IF EXISTS `ying_calc`.`i_nmc_view` ;
USE `ying_calc`;
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `ying_calc`.`i_nmc_view` AS
    SELECT 
        `ying_calc`.`i_s`.`idi` AS `idi`,
        SUM(`ying_calc`.`s_info`.`nmc`) AS `i_nmc`
    FROM
        (`ying_calc`.`s_info`
        LEFT JOIN `ying_calc`.`i_s` ON ((`ying_calc`.`s_info`.`ids` = `ying_calc`.`i_s`.`ids`)))
    WHERE
        (`ying_calc`.`i_s`.`idi` IS NOT NULL)
    GROUP BY `ying_calc`.`i_s`.`idi`;
