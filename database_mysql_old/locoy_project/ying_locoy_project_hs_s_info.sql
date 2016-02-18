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
  `f500` tinyint(1) DEFAULT '0' COMMENT '1: 沪深300（hs300）',
  `fSH` tinyint(1) DEFAULT '0' COMMENT '1: sh; 0: sz',
  `fMKT` tinyint(1) DEFAULT '1' COMMENT '1: sh;2: sz',
  `fCYB` tinyint(1) DEFAULT '0' COMMENT '1: 创业板',
  `fDZXX` tinyint(1) DEFAULT '0' COMMENT '1: 电子信息',
  `fYJS` tinyint(1) DEFAULT '0' COMMENT '1: 云计算',
  `fDSGN` tinyint(1) DEFAULT '0' COMMENT '1: 电商概念',
  `fZZGF` tinyint(1) DEFAULT '0' COMMENT '1: 中证国防；指数代码：399973',
  `fZZJG` tinyint(1) DEFAULT '0' COMMENT '1: 中证国防',
  `w_f300` decimal(5,2) DEFAULT NULL,
  `DateSys` date DEFAULT NULL,
  `pDate` date DEFAULT NULL COMMENT 'The date when the stock was first listed.',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP PROCEDURE `hs_s_info`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_info`(IN code VARCHAR(18), fSH VARCHAR(18), name VARCHAR(18), mktcap VARCHAR(18), nmc VARCHAR(18), DateSys date)
BEGIN
SET code = IF(code = '', NULL, code);
SET fSH = IF(fSH = '', NULL, fSH);
SET name = IF(name = '', NULL, name);
SET mktcap = IF(mktcap = '', NULL, mktcap);
SET nmc = IF(nmc = '', NULL, case when nmc <= 0.15 * mktcap then nmc when nmc <= 0.20 * mktcap then 0.20 * mktcap when nmc <= 0.30 * mktcap then 0.30 * mktcap when nmc <= 0.40 * mktcap then 0.40 * mktcap when nmc <= 0.50 * mktcap then 0.50 * mktcap when nmc <= 0.60 * mktcap then 0.60 * mktcap when nmc <= 0.70 * mktcap then 0.70 * mktcap when nmc <= 0.80 * mktcap then 0.80 * mktcap else mktcap end);
SET DateSys = CURDATE();
INSERT INTO `hs_s` (`code`, name, `mktcap`, `nmc`, `fSH`, `DateSys`) VALUES (code, name, fSH, mktcap, nmc, DateSys) 
ON DUPLICATE KEY UPDate 
`name` = name,
`mktcap` = mktcap,
`nmc` = nmc,
`fSH` = fSH,
`DateSys` = DateSys;
END$$
DELIMITER ;

CALL hs_s_info('[标签:code]','[标签:fSH]','[标签:name]','[标签:mktcap]','[标签:nmc]', '')