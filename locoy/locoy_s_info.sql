CREATE TABLE `ying_calc`.`s_info` (
  `ids` CHAR(6) NOT NULL COMMENT 'HK stock ids',
  `mkt` TINYINT(1) DEFAULT '1' COMMENT '1: sh; 2: sz',
  `name` VARCHAR(18) DEFAULT NULL COMMENT 'chinese name',
  `mktcap` INT(9) DEFAULT NULL COMMENT '总市值',
  `nmc` INT(9) DEFAULT NULL COMMENT '流通市值',
  `BVPS` DECIMAL(8,5) DEFAULT NULL COMMENT '每股净资产 book value of equity per share',
  `EPS` DECIMAL(8,5) DEFAULT NULL COMMENT '每股收益 earning per share',
  `fW` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '0: never watch; 1: watch daily; 2: watch hourly; 3: watch every 20 min; 4: watch every 10 min; 5: watch every 5 min; 8: hold for mid or short term; 9: hold for long term',
  `pDate` DATE DEFAULT NULL COMMENT 'The date when the stock was first listed.',
  PRIMARY KEY (`ids`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;


DROP PROCEDURE IF EXISTS `ying_calc`.`s_info`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_info`(IN ids VARCHAR(18), mkt VARCHAR(18), name VARCHAR(18), mktcap VARCHAR(18), nmc VARCHAR(18))
BEGIN
SET `ids` = IF(ids = '', NULL, ids);
SET `mkt` = IF(mkt = '', NULL, mkt);
SET `name` = IF(name = '', NULL, name);
SET `mktcap` = ROUND(IF(mktcap = '', NULL, mktcap));
SET `nmc` = ROUND(IF(nmc = '', NULL, nmc));
INSERT INTO `s_info` (`ids`, `mkt`, `name`, `mktcap`, `nmc`) VALUES (ids, mkt, name, mktcap, nmc) 
ON DUPLICATE KEY UPDATE 
`name` = name,
`mkt` = mkt,
`mktcap` = mktcap,
`nmc` = nmc;
END$$
DELIMITER ;

CALL s_info('[标签:ids]','[标签:mkt]','[标签:name]','[标签:mktcap]','[标签:nmc]');