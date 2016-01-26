UPDATE `ying`.`hs_index_info` w
INNER JOIN hs_s s ON p.productId = pp.productId SET pp.price = pp.price * 0.8 WHERE p.dateCreated < '2004-01-01';

-- 统计指数的流通市值 
select i.code_index_index, sum(s.nmc) from hs_s s left join `ying`.`hs_index_gp_info_EM` i on (s.code_index = i.code_index) where i.code_index_index is not null  group by i.code_index_index;

select sum(s.nmc) from hs_s s where code_index in (select code_index from `ying`.`hs_index_gp_info_EM` where code_index_index = '399973');
select sum(s.nmc) from hs_s s where code_index in (select code_index from `ying`.`hs_index_gp_info_EM` where code_index_index = '399300');



-- 在sina采集的指数. 注意：有些指数，比如'中证200'，有两个不同的代码: sh000904, sz399904。
SELECT *
FROM `ying`.`hs_index_info`;

SELECT `hs_index_info`.`code_index`,
    `hs_index_info`.`name_index`,
    `hs_index_info`.`nmc_index`,
    `hs_index_info`.`flag_hs_s`,
    `hs_index_info`.`fW`,
    `hs_index_info`.`fD`,
    `hs_index_info`.`fSH`,
    `hs_index_info`.`date_start`,
    `hs_index_info`.`date_end`
FROM `ying`.`hs_index_info`;


select a.code_index as code_index, a.name_index as name_index, b.fW as fW, b.fD as fD, b.fSH as fSH, b.date as date from (SELECT 
    MAX(`hs_index_info`.`code_index`) AS code_index,
    `hs_index_info`.`name_index` AS name_index
FROM
    `ying`.`hs_index_info`
GROUP BY `hs_index_info`.`name_index`) as a join `ying`.`hs_index_info` as b on a.code_index = b.code_index;

SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN fSH = 1 THEN 'sh' ELSE 'sz' END)), code_index, '/ncp.shtml') as url_hs_index_info_sina FROM hs_index_info;

SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN a.fSH = 1 THEN 'sh' ELSE 'sz' END)), a.code_index, '/ncp.shtml') as url_hs_index_info_sina FROM (select a.code_index as code_index, a.name_index as name_index, b.fW as fW, b.fD as fD, b.fSH as fSH, b.date as date from (SELECT MAX(`hs_index_info`.`code_index`) AS code_index, `hs_index_info`.`name_index` AS name_index FROM     `ying`.`hs_index_info` GROUP BY `hs_index_info`.`name_index`) as a join `ying`.`hs_index_info` as b on a.code_index = b.code_index) as a;

-- view: 统计指数的流通市值

-- DROP VIEW `hs_s_index_nmc_v`;
select * from `hs_s_index_nmc_v`;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_nmc_v` AS
    SELECT 
        `i`.`code_index_index` AS `code_index_index`,
        SUM(`s`.`nmc`) AS `nmc_index`
    FROM
        (`hs_s` `s`
        LEFT JOIN `hs_index_gp_info_EM` `i` ON ((`s`.`code_index` = `i`.`code_index`)))
    WHERE
        (`i`.`code_index_index` IS NOT NULL)
    GROUP BY `i`.`code_index_index`;


CREATE TABLE `hs_index_info` (
  `code_index` varchar(6) NOT NULL COMMENT 'HK warrant code_index',
  `name_index` varchar(18) DEFAULT NULL COMMENT 'chinese name_index',
  `fW` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: never watch; 1: watch daily; 2: watch hourly; 3: watch every 20 min; 4: watch every 10 min; 5: watch every 5 min; 8: hold for mid or short term; 9: hold for long term',
  `fD` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Delete 0: Delete from database; 1: don''t collect data anymore; ',
  `fSH` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: sh; 0: sz',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`code_index`),
  UNIQUE KEY `code_index_UNIQUE` (`code_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_index_info`(IN code_index VARCHAR(18), name_index VARCHAR(18), fSH VARCHAR(18), date date)
BEGIN
SET code_index = IF(code_index = '', NULL, code_index);
SET name_index = IF(name_index = '', NULL, name_index);
SET fSH = IF(fSH = '', NULL, fSH);
SET date = IF(date = '', NULL, date);
INSERT INTO `hs_index_info` (`code_index`, `name_index`, `fSH`, `date`) VALUES (code_index, name_index, fSH, date) 
ON DUPLICATE KEY UPDate 
`name_index` = name_index,
`fSH` = fSH;
END$$
DELIMITER ;

CALL hs_index_info('[标签:code_index]', '[标签:name_index]','[标签:fSH]', '[标签:date]') 

-- 统计指数的流通市值 
select i.code_index, sum(s.nmc) from hs_s s left join `ying`.`hs_index_gp_info_EM` i on (s.code = i.code) where i.code_index is not null  group by i.code_index;

select sum(s.nmc) from hs_s s where code in (select code from `ying`.`hs_index_gp_info_EM` where code_index = '399973');
select sum(s.nmc) from hs_s s where code in (select code from `ying`.`hs_index_gp_info_EM` where code_index = '399300');



-- 在sina采集的指数. 注意：有些指数，比如'中证200'，有两个不同的代码: sh000904, sz399904。
SELECT * FROM `ying`.`hs_index_info`;

SELECT `hs_index_info`.`code_index`,
    `hs_index_info`.`name`,
    `hs_index_info`.`fW`,
    `hs_index_info`.`fD`,
    `hs_index_info`.`fSH`,
    `hs_index_info`.`date_start`
FROM `ying`.`hs_index_info`;

SELECT MIN(`code_index`) AS code_index FROM `ying`.`hs_index_info` GROUP BY `name_index`;

select a.code_index as code_index, a.name_index as name_index, b.fW as fW, b.fD as fD, b.fSH as fSH, b.date_start as date_start from (SELECT 
    min(`hs_index_info`.`code_index`) AS code_index,
    `hs_index_info`.`name_index` AS name_index
FROM
    `ying`.`hs_index_info`
GROUP BY `hs_index_info`.`name_index`) as a join `ying`.`hs_index_info` as b on a.code_index = b.code_index;





SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN fSH = 1 THEN 'sh' ELSE 'sz' END)), code_index, '/ncp.shtml') as url_hs_index_info_sina FROM hs_index_info;

SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN a.fSH = 1 THEN 'sh' ELSE 'sz' END)), a.code_index, '/ncp.shtml') as url_hs_index_info_sina FROM (select a.code_index as code_index, a.name_index as name_index, b.fW as fW, b.fD as fD, b.fSH as fSH, b.date_start as date_start from (SELECT MAX(`hs_index_info`.`code_index`) AS code_index, `hs_index_info`.`name_index` AS name_index FROM     `ying`.`hs_index_info` GROUP BY `hs_index_info`.`name_index`) as a join `ying`.`hs_index_info` as b on a.code_index = b.code_index) as a;

-- view: 统计指数的流通市值

-- DROP VIEW `hs_s_index_nmc_v`;
select * from `hs_s_index_nmc_v`;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_nmc_v` AS
    SELECT 
        `i`.`code_index` AS `code_index`,
        SUM(`s`.`nmc`) AS `nmc_index`
    FROM
        (`hs_s` `s`
        LEFT JOIN `hs_index_gp_info_EM` `i` ON ((`s`.`code` = `i`.`code`)))
    WHERE
        (`i`.`code_index` IS NOT NULL)
    GROUP BY `i`.`code_index`;

-- cross table update example: UPDATE `ying`.`hs_index_info` w INNER JOIN hs_s s ON p.productId = pp.productId SET pp.price = pp.price * 0.8 WHERE p.dateCreated < '2004-01-01';



