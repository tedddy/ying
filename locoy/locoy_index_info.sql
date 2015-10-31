-- migrate from E:\bYun\securities\database_mysql\ying_index_info.sql
/* 
	replace index_info with index_info
	replace idi with idi

 */

CREATE TABLE `index_info` (
  `idi` varchar(6) NOT NULL COMMENT 'index id',
  `name_i` varchar(18) DEFAULT NULL COMMENT 'index name',
  `nmc_index` int(10) DEFAULT NULL,
  `flag_hs_s` varchar(10) DEFAULT NULL COMMENT 'flag in table hs_s',
  `fW` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: never watch; 1: watch daily; 2: watch hourly; 3: watch every 20 min; 4: watch every 10 min; 5: watch every 5 min; 8: hold for mid or short term; 9: hold for long term',
  `fD` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Delete 0: Delete from database; 1: don''t collect data anymore; ',
  `fSH` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: sh; 0: sz',
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  PRIMARY KEY (`idi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `index_info`
(`idi`,
`name_i`,
`nmc_index`,
`flag_hs_s`,
`fW`,
`fD`,
`fSH`,
`date_start`,
`date_end`)
SELECT `hs_index_info`.`code_index`,
    `hs_index_info`.`name_i`,
    `hs_index_info`.`nmc_index`,
    `hs_index_info`.`flag_hs_s`,
    `hs_index_info`.`fW`,
    `hs_index_info`.`fD`,
    `hs_index_info`.`fSH`,
    `hs_index_info`.`date_start`,
    `hs_index_info`.`date_end`
FROM `hs_index_info`;

-- DROP PROCEDURE `index_info`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `index_info`(IN idi VARCHAR(18), name_i VARCHAR(18), fSH VARCHAR(18), d date)
BEGIN
SET `idi` = IF(idi = '', NULL, idi);
SET `name_i` = IF(name_i = '', NULL, name_i);
SET `fSH` = IF(fSH = '', NULL, fSH);
SET `d` = IF(d = '', NULL, d);
INSERT INTO `index_info` (`idi`, `name_i`, `fSH`, `date_start`) VALUES (idi, name_i, fSH, d) 
ON DUPLICATE KEY UPDate 
`name_i` = name_i,
`fSH` = fSH;
END$$
DELIMITER ;


CALL index_info('[标签:idi]', '[标签:name_i]','[标签:fSH]', '[标签:d]');

UPDATE `ying`.`index_info` w
INNER JOIN hs_s s ON p.productId = pp.productId SET pp.price = pp.price * 0.8 WHERE p.dateCreated < '2004-01-01';

-- 统计指数的流通市值 
select i.idi_index, sum(s.nmc) from hs_s s left join `ying`.`hs_index_gp_info_EM` i on (s.idi = i.idi) where i.idi_index is not null  group by i.idi_index;

select sum(s.nmc) from hs_s s where idi in (select idi from `ying`.`hs_index_gp_info_EM` where idi_index = '399973');
select sum(s.nmc) from hs_s s where idi in (select idi from `ying`.`hs_index_gp_info_EM` where idi_index = '399300');



-- 在sina采集的指数. 注意：有些指数，比如'中证200'，有两个不同的代码: sh000904, sz399904。
SELECT *
FROM `ying`.`index_info`;

SELECT `index_info`.`idi`,
    `index_info`.`name_i`,
    `index_info`.`nmc_index`,
    `index_info`.`flag_hs_s`,
    `index_info`.`fW`,
    `index_info`.`fD`,
    `index_info`.`fSH`,
    `index_info`.`date_start`,
    `index_info`.`date_end`
FROM `ying`.`index_info`;


select a.idi as idi, a.name_i as name_i, b.fW as fW, b.fD as fD, b.fSH as fSH, b.date as date from (SELECT 
    MAX(`index_info`.`idi`) AS idi,
    `index_info`.`name_i` AS name_i
FROM
    `ying`.`index_info`
GROUP BY `index_info`.`name_i`) as a join `ying`.`index_info` as b on a.idi = b.idi;

SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN fSH = 1 THEN 'sh' ELSE 'sz' END)), idi, '/ncp.shtml') as url_index_info_sina FROM index_info;

SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN a.fSH = 1 THEN 'sh' ELSE 'sz' END)), a.idi, '/ncp.shtml') as url_index_info_sina FROM (select a.idi as idi, a.name_i as name_i, b.fW as fW, b.fD as fD, b.fSH as fSH, b.date as date from (SELECT MAX(`index_info`.`idi`) AS idi, `index_info`.`name_i` AS name_i FROM     `ying`.`index_info` GROUP BY `index_info`.`name_i`) as a join `ying`.`index_info` as b on a.idi = b.idi) as a;

-- view: 统计指数的流通市值

-- DROP VIEW `hs_s_index_nmc_v`;
select * from `hs_s_index_nmc_v`;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_nmc_v` AS
    SELECT 
        `i`.`idi_index` AS `idi_index`,
        SUM(`s`.`nmc`) AS `nmc_index`
    FROM
        (`hs_s` `s`
        LEFT JOIN `hs_index_gp_info_EM` `i` ON ((`s`.`idi` = `i`.`idi`)))
    WHERE
        (`i`.`idi_index` IS NOT NULL)
    GROUP BY `i`.`idi_index`;


-- 统计指数的流通市值 
select i.idi, sum(s.nmc) from hs_s s left join `ying`.`hs_index_gp_info_EM` i on (s.code = i.code) where i.idi is not null  group by i.idi;

select sum(s.nmc) from hs_s s where code in (select code from `ying`.`hs_index_gp_info_EM` where idi = '399973');
select sum(s.nmc) from hs_s s where code in (select code from `ying`.`hs_index_gp_info_EM` where idi = '399300');



-- 在sina采集的指数. 注意：有些指数，比如'中证200'，有两个不同的代码: sh000904, sz399904。
SELECT * FROM `ying`.`index_info`;

SELECT `index_info`.`idi`,
    `index_info`.`name`,
    `index_info`.`fW`,
    `index_info`.`fD`,
    `index_info`.`fSH`,
    `index_info`.`date_start`
FROM `ying`.`index_info`;

SELECT MIN(`idi`) AS idi FROM `ying`.`index_info` GROUP BY `name_i`;

select a.idi as idi, a.name_i as name_i, b.fW as fW, b.fD as fD, b.fSH as fSH, b.date_start as date_start from (SELECT 
    min(`index_info`.`idi`) AS idi,
    `index_info`.`name_i` AS name_i
FROM
    `ying`.`index_info`
GROUP BY `index_info`.`name_i`) as a join `ying`.`index_info` as b on a.idi = b.idi;





SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN fSH = 1 THEN 'sh' ELSE 'sz' END)), idi, '/ncp.shtml') as url_index_info_sina FROM index_info;

SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN a.fSH = 1 THEN 'sh' ELSE 'sz' END)), a.idi, '/ncp.shtml') as url_index_info_sina FROM (select a.idi as idi, a.name_i as name_i, b.fW as fW, b.fD as fD, b.fSH as fSH, b.date_start as date_start from (SELECT MAX(`index_info`.`idi`) AS idi, `index_info`.`name_i` AS name_i FROM     `ying`.`index_info` GROUP BY `index_info`.`name_i`) as a join `ying`.`index_info` as b on a.idi = b.idi) as a;

-- view: 统计指数的流通市值

-- DROP VIEW `hs_s_index_nmc_v`;
select * from `hs_s_index_nmc_v`;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_nmc_v` AS
    SELECT 
        `i`.`idi` AS `idi`,
        SUM(`s`.`nmc`) AS `nmc_index`
    FROM
        (`hs_s` `s`
        LEFT JOIN `hs_index_gp_info_EM` `i` ON ((`s`.`code` = `i`.`code`)))
    WHERE
        (`i`.`idi` IS NOT NULL)
    GROUP BY `i`.`idi`;

-- cross table update example: UPDATE `ying`.`index_info` w INNER JOIN hs_s s ON p.productId = pp.productId SET pp.price = pp.price * 0.8 WHERE p.dateCreated < '2004-01-01';



