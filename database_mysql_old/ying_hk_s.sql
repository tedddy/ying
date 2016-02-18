

SELECT * FROM ying.hk_s;

update `ying`.`hk_s` set f50SH = 1; 

-- SELECT * FROM ying.hk_s where ;

-- import data from database securities to database ying
INSERT INTO `ying`.`hk_s`
(`code`)
SELECT DISTINCT `hk_xts`.`code`
FROM `securities`.`hk_xts`
WHERE 
	`hk_xts`.code NOT IN 
		(SELECT code FROM `securities`.`hk_w`);
        
-- import data from database securities to database ying
INSERT INTO `ying`.`hk_s`
(`code`)
SELECT DISTINCT `hk_w`.`code_u`
FROM `securities`.`hk_w`
WHERE `hk_w`.`code_u` IS NOT NULL
ON DUPLICATE KEY UPDATE `code` =  `hk_w`.`code_u`;

SELECT 
    date, w.uCode, sum(turnover)
FROM
    ying.hk_w_xts AS xts
        JOIN
    hk_w AS w ON xts.code = w.code
WHERE
    xts.code IN (SELECT 
            code
        FROM
            hk_w
        WHERE
            uCode IN ('03888','06837','03898'))
GROUP BY w.uCode , date;

SELECT `hs_s`.`code`,
    `hs_s`.`enName`,
    `hs_s`.`name`,
    `hs_s`.`mktcap`,
    `hs_s`.`nmc`,
    `hs_s`.`BVPS`,
    `hs_s`.`EPS`,
    `hs_s`.`fW`,
    `hs_s`.`f50A`,
    `hs_s`.`f50SH`,
    `hs_s`.`f300`,
    `hs_s`.`fSH`,
    `hs_s`.`DateSys`
FROM `ying`.`hs_s`;

CREATE TABLE `hs_s` (
  `code` char(6) NOT NULL COMMENT 'HK stock code',
  `enName` varchar(18) DEFAULT NULL COMMENT 'english name',
  `name` varchar(18) DEFAULT NULL COMMENT 'chinese name',
  `mktcap` decimal(15,6) DEFAULT NULL COMMENT '总股本',
  `nmc` decimal(15,6) DEFAULT NULL COMMENT '流通股 tradable shares',
  `BVPS` decimal(8,5) DEFAULT NULL COMMENT '每股净资产 book value of equity per share',
  `EPS` decimal(8,5) DEFAULT NULL COMMENT '每股收益 earning per share',
  `fW` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: never watch; 1: watch daily; 2: watch hourly; 3: watch every 20 min; 4: watch every 10 min; 5: watch every 5 min; 8: hold for mid or short term; 9: hold for long term',
  `f50A` tinyint(1) DEFAULT '0' COMMENT '1: A50',
  `f50SH` tinyint(1) DEFAULT '0' COMMENT '1: 上证50(sh50)',
  `f300` tinyint(1) DEFAULT '0' COMMENT '1: 沪深300（hs300）',
  `fSH` tinyint(1) DEFAULT '0' COMMENT '1: sh; 0: sz',
  `DateSys` date DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_code`(IN code VARCHAR(18), fSH VARCHAR(18), name VARCHAR(18), DateSys date)
BEGIN
SET code = IF(code = '', NULL, code);
SET fSH = IF(fSH = '', NULL, fSH);
SET name = IF(name = '', NULL, name);
SET DateSys = CURDATE();
INSERT INTO `hs_s` (`code`, `fSH`, name, `DateSys`) VALUES (code, fSH, name, DateSys) 
ON DUPLICATE KEY UPDate 
`name` = name; 
END$$
DELIMITER ;



CALL hs_s_code('[标签:code]','[标签:fSH]','[标签:name]','')