-- migrate from E:\bYun\securities\database_mysql\ying_hs_index_gp_info_EM.sql
/* 
    replace hs_index_gp_info_EM with index_stock_info
    replace code_index with idi
    replace code with ids
 */
 
-- DROP TABLE IF EXISTS `index_stock_info`;
CREATE TABLE IF NOT EXISTS `index_stock_info` (
  `idi` char(6) NOT NULL COMMENT 'index id',
  `ids` varchar(6) NOT NULL COMMENT 'stock id',
  `weight` decimal(6,3) DEFAULT NULL COMMENT 'weight of stock',
  `flag` varchar(6) DEFAULT NULL COMMENT '`hs_s` flag',
  `DateSys` date DEFAULT NULL,
  PRIMARY KEY (`idi`,`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- insert data into `index_stock_info` from `hs_index_gp_info_EM`

INSERT INTO `index_stock_info`
	(
	    `idi`,
	    `ids`,
	    `weight`,
	    `flag`,
	    `DateSys`
        )
SELECT 
    `hs_index_gp_info_EM`.`code_index`,
    `hs_index_gp_info_EM`.`code`,
    `hs_index_gp_info_EM`.`weight`,
    `hs_index_gp_info_EM`.`flag`,
    `hs_index_gp_info_EM`.`DateSys`
FROM
    `hs_index_gp_info_EM` 
ON DUPLICATE KEY UPDATE 
    `weight` = `hs_index_gp_info_EM`.`weight`,
    `flag` = `hs_index_gp_info_EM`.`flag`,
    `DateSys`  = `hs_index_gp_info_EM`.`DateSys`;