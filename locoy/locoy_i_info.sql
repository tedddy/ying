-- migrate from E:\bYun\securities\database_mysql\ying_i_info.sql
/* 
	replace i_info with i_info
	replace idi with idi

 */
DROP TABLE `ying_calc`.`i_info`;
CREATE TABLE `ying_calc`.`i_info` (
  `idi` varchar(6) NOT NULL COMMENT 'index id',
  `name_i` varchar(18) DEFAULT NULL COMMENT 'index name',
  `fW` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: never watch; 1: watch daily; 2: watch hourly; 3: watch every 20 min; 4: watch every 10 min; 5: watch every 5 min; 8: hold for mid or short term; 9: hold for long term',
  `mkt` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: sh; 0: sz',
  PRIMARY KEY (`idi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DROP PROCEDURE `ying_calc`.`i_info`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`i_info`(IN idi VARCHAR(18), name_i VARCHAR(18), mkt VARCHAR(18))
BEGIN
SET `idi` = IF(idi = '', NULL, idi);
SET `name_i` = IF(name_i = '', NULL, name_i);
SET `mkt` = IF(mkt = '', NULL, mkt);
INSERT INTO `ying_calc`.`i_info` (`idi`, `name_i`, `mkt`) VALUES (idi, name_i, mkt) 
ON DUPLICATE KEY UPDate 
`name_i` = name_i,
`mkt` = mkt;
END$$
DELIMITER ;


CALL i_info('[标签:idi]', '[标签:name_i]','[标签:mkt]');

UPDATE `ying`.`i_info` w
INNER JOIN hs_s s ON p.productId = pp.productId SET pp.price = pp.price * 0.8 WHERE p.dateCreated < '2004-01-01';

-- 统计指数的流通市值 
select i.idi_index, sum(s.nmc) from hs_s s left join `ying`.`hs_index_gp_info_EM` i on (s.idi = i.idi) where i.idi_index is not null  group by i.idi_index;

select sum(s.nmc) from hs_s s where idi in (select idi from `ying`.`hs_index_gp_info_EM` where idi_index = '399973');
select sum(s.nmc) from hs_s s where idi in (select idi from `ying`.`hs_index_gp_info_EM` where idi_index = '399300');



-- 在sina采集的指数. 注意：有些指数，比如'中证200'，有两个不同的代码: sh000904, sz399904。
SELECT *
FROM `ying`.`i_info`;

SELECT `i_info`.`idi`,
    `i_info`.`name_i`,
    `i_info`.`nmc_index`,
    `i_info`.`flag_hs_s`,
    `i_info`.`fW`,
    `i_info`.`fD`,
    `i_info`.`mkt`,
    `i_info`.`date_start`,
    `i_info`.`date_end`
FROM `ying`.`i_info`;


select a.idi as idi, a.name_i as name_i, b.fW as fW, b.fD as fD, b.mkt as mkt, b.date as date from (SELECT 
    MAX(`i_info`.`idi`) AS idi,
    `i_info`.`name_i` AS name_i
FROM
    `ying`.`i_info`
GROUP BY `i_info`.`name_i`) as a join `ying`.`i_info` as b on a.idi = b.idi;

SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN mkt = 1 THEN 'sh' ELSE 'sz' END)), idi, '/ncp.shtml') as url_i_info_sina FROM i_info;

SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN a.mkt = 1 THEN 'sh' ELSE 'sz' END)), a.idi, '/ncp.shtml') as url_i_info_sina FROM (select a.idi as idi, a.name_i as name_i, b.fW as fW, b.fD as fD, b.mkt as mkt, b.date as date from (SELECT MAX(`i_info`.`idi`) AS idi, `i_info`.`name_i` AS name_i FROM     `ying`.`i_info` GROUP BY `i_info`.`name_i`) as a join `ying`.`i_info` as b on a.idi = b.idi) as a;

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
SELECT * FROM `ying`.`i_info`;

SELECT `i_info`.`idi`,
    `i_info`.`name`,
    `i_info`.`fW`,
    `i_info`.`fD`,
    `i_info`.`mkt`,
    `i_info`.`date_start`
FROM `ying`.`i_info`;

SELECT MIN(`idi`) AS idi FROM `ying`.`i_info` GROUP BY `name_i`;

select a.idi as idi, a.name_i as name_i, b.fW as fW, b.fD as fD, b.mkt as mkt, b.date_start as date_start from (SELECT 
    min(`i_info`.`idi`) AS idi,
    `i_info`.`name_i` AS name_i
FROM
    `ying`.`i_info`
GROUP BY `i_info`.`name_i`) as a join `ying`.`i_info` as b on a.idi = b.idi;





SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN mkt = 1 THEN 'sh' ELSE 'sz' END)), idi, '/ncp.shtml') as url_i_info_sina FROM i_info;

SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN a.mkt = 1 THEN 'sh' ELSE 'sz' END)), a.idi, '/ncp.shtml') as url_i_info_sina FROM (select a.idi as idi, a.name_i as name_i, b.fW as fW, b.fD as fD, b.mkt as mkt, b.date_start as date_start from (SELECT MAX(`i_info`.`idi`) AS idi, `i_info`.`name_i` AS name_i FROM     `ying`.`i_info` GROUP BY `i_info`.`name_i`) as a join `ying`.`i_info` as b on a.idi = b.idi) as a;

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

-- cross table update example: UPDATE `ying`.`i_info` w INNER JOIN hs_s s ON p.productId = pp.productId SET pp.price = pp.price * 0.8 WHERE p.dateCreated < '2004-01-01';



