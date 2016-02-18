SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN fSH = 1 THEN 'sh' ELSE 'sz' END)), code, '/ncp.shtml') as url_hs_index_info_sina FROM hs_index_code;


CREATE TABLE `hs_index_info` (
  `code_index` varchar(6) NOT NULL COMMENT 'index code',
  `name_index` varchar(18) DEFAULT NULL COMMENT 'index name',
  `nmc_index` int(10) DEFAULT NULL,
  `flag_hs_s` varchar(10) DEFAULT NULL COMMENT 'flag in table hs_s',
  `fW` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: never watch; 1: watch daily; 2: watch hourly; 3: watch every 20 min; 4: watch every 10 min; 5: watch every 5 min; 8: hold for mid or short term; 9: hold for long term',
  `fD` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Delete 0: Delete from database; 1: don''t collect data anymore; ',
  `fSH` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: sh; 0: sz',
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  PRIMARY KEY (`code_index`),
  UNIQUE KEY `code_UNIQUE` (`code_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_index_info`(IN code_index VARCHAR(18), name_index VARCHAR(18), fSH VARCHAR(18), date date)
BEGIN
SET code_index = IF(code_index = '', NULL, code_index);
SET name_index = IF(name_index = '', NULL, name_index);
SET fSH = IF(fSH = '', NULL, fSH);
SET date = IF(date = '', NULL, date);
INSERT INTO `hs_index_info` (`code_index`, `name_index`, `fSH`, `date_start`) VALUES (code_index, name_index, fSH, date) 
ON DUPLICATE KEY UPDate 
`name_index` = name_index,
`fSH` = fSH;
END$$
DELIMITER ;

CALL hs_index_info('[标签:code_index]', '[标签:name_index]','[标签:fSH]', '[标签:date]') 