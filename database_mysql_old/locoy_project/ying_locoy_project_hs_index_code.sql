

SELECT `hs_index_code`.`code`,
    `hs_index_code`.`name`,
    `hs_index_code`.`fW`,
    `hs_index_code`.`fD`,
    `hs_index_code`.`fSH`,
    `hs_index_code`.`date`
FROM `ying`.`hs_index_code`;

SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN fSH = 1 THEN 'sh' ELSE 'sz' END)), code, '/ncp.shtml') as url_hs_index_info_sina FROM hs_index_code;


CREATE TABLE `hs_index_code` (
  `code` varchar(6) NOT NULL COMMENT 'HK warrant code',
  `name` varchar(18) DEFAULT NULL COMMENT 'chinese name',
  `fW` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: never watch; 1: watch daily; 2: watch hourly; 3: watch every 20 min; 4: watch every 10 min; 5: watch every 5 min; 8: hold for mid or short term; 9: hold for long term',
  `fD` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Delete 0: Delete from database; 1: don''t collect data anymore; ',
  `fSH` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: sh; 0: sz',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `hs_index_code` (
  `code` varchar(6) NOT NULL COMMENT 'HK warrant code',
  `name` varchar(18) DEFAULT NULL COMMENT 'chinese name',
  `nmc_index` int(10) DEFAULT NULL,
  `flag_hs_s` varchar(10) DEFAULT NULL,
  `fW` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: never watch; 1: watch daily; 2: watch hourly; 3: watch every 20 min; 4: watch every 10 min; 5: watch every 5 min; 8: hold for mid or short term; 9: hold for long term',
  `fD` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Delete 0: Delete from database; 1: don''t collect data anymore; ',
  `fSH` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: sh; 0: sz',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_index_code`(IN code VARCHAR(18), name VARCHAR(18), fSH VARCHAR(18), date date)
BEGIN
SET code = IF(code = '', NULL, code);
SET name = IF(name = '', NULL, name);
SET fSH = IF(fSH = '', NULL, fSH);
SET date = IF(date = '', NULL, date);
INSERT INTO `hs_index_code` (`code`, `name`, `fSH`, `date`) VALUES (code, name, fSH, date) 
ON DUPLICATE KEY UPDate 
`name` = name,
`fSH` = fSH;
END$$
DELIMITER ;

CALL hs_index_code('[标签:code]', '[标签:name]','[标签:fSH]', '[标签:date]') 