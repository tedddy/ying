-- DROP PROCEDURE `ying_calc`.`hk_w_sg_import`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`hk_w_sg_import`()
BEGIN
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
    `uCode` = SUBSTRING_INDEX(`hk_w_sg_imported`.`Underlying Code`,'.',1),
	`enName` = `hk_w_sg_imported`.`Name`,
	`nature` = case when `hk_w_sg_imported`.`Call/Put` = 'Call' then 1 when `hk_w_sg_imported`.`Call/Put` = 'Put' then 0 END,
	`WarrantsType` = `hk_w_sg_imported`.`Warrants Type`,
	`eDate` = `hk_w_sg_imported`.`Maturity(YY-MM-DD)`,
	`strike` = `hk_w_sg_imported`.`Strike`,
	`cRatio` = `hk_w_sg_imported`.`Ratio`,
	`Issuer` = `hk_w_sg_imported`.`Issuer`;
    
INSERT INTO `ying_calc`.`hk_w_xts_sg`
(`code`,
`close`,
`turnover`,
`chgrate`,
`buy`,
`sell`,
`uPrice`,
`dt`,
`premium`,
`gear`,
`os`,
`oRate`,
`iv`,
`delta`,
`vega`)
SELECT 
    `hk_w_sg_imported`.`Code`,
    `hk_w_sg_imported`.`Last(HKD)`,
    `hk_w_sg_imported`.`Turnover($K)`,
    `hk_w_sg_imported`.`Change(%)`,
    `hk_w_sg_imported`.`Bid(HKD)`,
    `hk_w_sg_imported`.`Ask(HKD)`,
    `hk_w_sg_imported`.`Underlying Price`,
    `hk_w_sg_imported`.`dt`,
    `hk_w_sg_imported`.`Premium(%)`,
case when `hk_w_sg_imported`.`Eff.Gearing(x)` = 'N/A' then 0 when `hk_w_sg_imported`.`Eff.Gearing(x)` <> 'N/A' then `hk_w_sg_imported`.`Eff.Gearing(x)` END,
    `hk_w_sg_imported`.`Outstanding(M)`,
    `hk_w_sg_imported`.`Outstanding(%)`,
    `hk_w_sg_imported`.`IV(%)`,
    `hk_w_sg_imported`.`Delta(%)`,
    `hk_w_sg_imported`.`Vega`
FROM `ying_calc`.`hk_w_sg_imported` ON DUPLICATE KEY UPDATE 
`code` = `hk_w_sg_imported`.`Code`,
`close` = `hk_w_sg_imported`.`Last(HKD)`,
`turnover` = `hk_w_sg_imported`.`Last(HKD)`,
`chgrate` = `hk_w_sg_imported`.`Change(%)`,
`buy` = `hk_w_sg_imported`.`Bid(HKD)`,
`sell` = `hk_w_sg_imported`.`Ask(HKD)`,
`uPrice` = `hk_w_sg_imported`.`Underlying Price`,
`dt` = `hk_w_sg_imported`.`dt`,
`premium` = `hk_w_sg_imported`.`Premium(%)`,
`gear` = case when `hk_w_sg_imported`.`Eff.Gearing(x)` = 'N/A' then 0 when `hk_w_sg_imported`.`Eff.Gearing(x)` <> 'N/A' then `hk_w_sg_imported`.`Eff.Gearing(x)` END,
`os` = `hk_w_sg_imported`.`Outstanding(M)`,
`oRate` = `hk_w_sg_imported`.`Outstanding(%)`,
`iv` = `hk_w_sg_imported`.`IV(%)`,
`delta` = `hk_w_sg_imported`.`Delta(%)`,
`vega` = `hk_w_sg_imported`.`Vega`;

END$$
DELIMITER ;
