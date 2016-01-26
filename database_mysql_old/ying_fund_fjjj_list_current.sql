

TRUNCATE `ying`.`hs_fund_fjjj_list_current`;

drop table `ying`.`hs_fund_fjjj_list_current`;

CREATE TABLE `hs_fund_fjjj_list_current` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(18) DEFAULT NULL COMMENT 'code',
  `date` varchar(18) DEFAULT NULL COMMENT 'date',
  `sort_jzzzl` varchar(18) DEFAULT NULL COMMENT 'sort_jzzzl',
  `jjjz` varchar(18) DEFAULT NULL COMMENT 'NPV',
  `price` varchar(18) DEFAULT NULL COMMENT 'price',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=1117 DEFAULT CHARSET=utf8;


DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_fund_fjjj_list_current`(IN code VARCHAR(18), date VARCHAR(18), sort_jzzzl VARCHAR(18), jjjz VARCHAR(18), price VARCHAR(18))
BEGIN
SET code = IF(code = '', NULL, code);
SET date = IF(date = '', NULL, date);
SET sort_jzzzl = IF(sort_jzzzl = '', NULL, sort_jzzzl);
SET jjjz = IF(jjjz = '', NULL, jjjz);
SET price = IF(price = '', NULL, price);

INSERT INTO `hs_fund_fjjj_list_current` (`code`, `date`, `sort_jzzzl`, `jjjz`, `price`) VALUES (code, date, sort_jzzzl, jjjz, price) 
ON DUPLICATE KEY UPDate
`date` = IF(date IS NULL, `date`, date),
`sort_jzzzl` = IF(sort_jzzzl IS NULL, `sort_jzzzl`, sort_jzzzl),
`jjjz` = IF(jjjz IS NULL, `jjjz`, jjjz),
`price` = IF(price IS NULL, `price`, price);
END$$
DELIMITER ;
