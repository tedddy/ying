SELECT `i_s_weight`.`idi`,
    `i_s_weight`.`ids`,
    `i_s_weight`.`weight`,
    `i_s_weight`.`weight_adj`
FROM `ying_calc`.`i_s_weight`;

DROP TABLE `ying_calc`.`i_s_weight`;
CREATE TABLE `ying_calc`.`i_s_weight` (
  `idi` varchar(6) NOT NULL DEFAULT '' COMMENT 'code_index',
  `ids` varchar(6) NOT NULL DEFAULT '' COMMENT 'code',
  `weight` DECIMAL(5,3) DEFAULT NULL COMMENT 'weight',
  `weight_adj` DECIMAL(5,3) DEFAULT NULL COMMENT 'adjuested weight',
  PRIMARY KEY (`idi`,`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ying_calc`.`i_s_weight`
(`idi`,
`ids`,
`weight`,
`weight_adj`)
SELECT `idi`,
`ids`,
`weight`,
`weight_adj`
from `ying_calc`.`i_s_weight_view`;


DROP VIEW `ying_calc`.`i_s_weight_view`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `ying_calc`.`i_s_weight_view` AS
    SELECT 
        `ying_calc`.`i_s`.`idi` AS `idi`,
        `ying_calc`.`i_s`.`ids` AS `ids`,
        ROUND(((100 * `ying_calc`.`s_info`.`nmc`) / `ying_calc`.`i_nmc`.`i_nmc`),
                3) AS `weight`,
        ROUND(((100 * `nmc_adj`.`nmc_adj`) / `ying_calc`.`i_nmc`.`i_nmc`),
                3) AS `weight_adj`
    FROM
        (((`ying_calc`.`i_s`
        JOIN `ying_calc`.`s_info` ON ((`ying_calc`.`i_s`.`ids` = `ying_calc`.`s_info`.`ids`)))
        JOIN `ying_calc`.`i_nmc` ON ((`ying_calc`.`i_s`.`idi` = `ying_calc`.`i_nmc`.`idi`)))
        JOIN `ying_calc`.`nmc_adj` ON ((`ying_calc`.`i_s`.`ids` = `nmc_adj`.`ids`)));
