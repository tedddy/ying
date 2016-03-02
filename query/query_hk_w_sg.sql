SELECT `UnderlyingCode` FROM ying_calc.hk_w_sg;

SELECT sum(`Turnover($K)`) FROM ying_calc.hk_w_sg;

SELECT SUBSTRING_INDEX(`uCode`,'.',1) FROM `ying_calc`.`hk_w_sg`;  
    
SELECT * FROM `ying_calc`.`hk_w_sg`;
 
-- DROP TABLE `ying_calc`.`hk_w_sg`;
CREATE TABLE `ying_calc`.`hk_w_sg` (
  `code` VARCHAR(5),
  `uCode` VARCHAR(18),
  `enName` VARCHAR(15),
  `nature` TINYINT,
  `WarrantsType` VARCHAR(18),
  `eDate` DATE,
  `strike` DECIMAL(9,3),
  `cRatio` DECIMAL(8,3),
  `issuer` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ying_calc`.`hk_w_sg`
(`code`,
`uCode`,
`enName`,
`nature`,
`WarrantsType`,
`eDate`,
`strike`,
`cRatio`,
`Issuer`)
 SELECT 
    `hk_w_sg_imported`.`Code`,
    SUBSTRING_INDEX(`hk_w_sg_imported`.`Underlying Code`,'.',1),
    `hk_w_sg_imported`.`Name`,
    case when `hk_w_sg_imported`.`Call/Put` = 'Call' then 1 when `hk_w_sg_imported`.`Call/Put` = 'Put' then 0 END,
    `hk_w_sg_imported`.`Warrants Type`,
    `hk_w_sg_imported`.`Maturity(YY-MM-DD)`,
    `hk_w_sg_imported`.`Strike`,
    `hk_w_sg_imported`.`Ratio`,
    `hk_w_sg_imported`.`Issuer`
FROM `ying_calc`.`hk_w_sg_imported` ON DUPLICATE KEY UPDATE 
	`code` = `hk_w_sg_imported`.`Code`,
    `uCode` = `hk_w_sg_imported`.`Underlying Code`,
	`enName` = `hk_w_sg_imported`.`Name`,
	`nature` = case when `hk_w_sg_imported`.`Call/Put` = 'Call' then 1 when `hk_w_sg_imported`.`Call/Put` = 'Put' then 0 END,
	`WarrantsType` = `hk_w_sg_imported`.`Warrants Type`,
	`eDate` = `hk_w_sg_imported`.`Maturity(YY-MM-DD)`,
	`strike` = `hk_w_sg_imported`.`Strike`,
	`cRatio` = `hk_w_sg_imported`.`Ratio`,
	`Issuer` = `hk_w_sg_imported`.`Issuer`;


-- tedd: group_concat
SELECT
    COUNT(*), DATE_FORMAT(`Maturity(YY-MM-DD)`, '%Y-%m'), GROUP_CONCAT(CONCAT('hk',code))
FROM
    `ying_calc`.`hk_w_sg`
GROUP BY DATE_FORMAT(`Maturity(YY-MM-DD)`, '%Y-%m') DESC;

-- tedd: group_concat
SELECT
    concat('http://push2.gtimg.cn/q=', GROUP_CONCAT(CONCAT('hk',code))) as hk_w_rt_qq
FROM
    `ying_calc`.`hk_w_sg`
GROUP BY DATE_FORMAT(`Maturity(YY-MM-DD)`, '%Y-%m-%d') DESC;

-- tedd: group_concat
SELECT concat('http://push2.gtimg.cn/q=', GROUP_CONCAT(CONCAT('hk',code))) as hk_w_rt_qq FROM `ying_calc`.`hk_w_sg` GROUP BY DATE_FORMAT(`Maturity(YY-MM-DD)`, '%m-%d') DESC;

SELECT 
    `UnderlyingCode`, `Call/Put`, sum(`hk_w_sg`.`Turnover($K)`)
FROM
    `ying_calc`.`hk_w_sg` 
GROUP BY `UnderlyingCode`,`Call/Put`
ORDER BY `Turnover($K)` DESC;


