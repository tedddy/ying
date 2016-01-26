select DISTINCT code_index from `ying`.`hs_index_gp_info_EM`;

SELECT code_index, code FROM ying.hs_index_cons where code_index = '399807' and date_end = '0000-00-00';

SELECT code_index, code FROM ying.hs_index_cons where code_index = '399394' and date_end = '0000-00-00';

insert into `ying`.`hs_index_gp_info_EM` (code_index, code) SELECT code_index, code FROM ying.hs_index_cons where code_index = '399394' and date_end = '0000-00-00';



UPDATE `ying`.`hs_index_gp_info_EM` i
        LEFT JOIN
    `ying`.`hs_s_index_nmc_view` n ON i.code_index = n.code_index
        LEFT JOIN
    hs_s s ON i.code = s.code 
SET 
    i.weight = ROUND(100 * s.nmc / n.nmc_index, 3)
WHERE
    i.code_index IN ('399807');


insert into `ying`.`hs_index_gp_info_EM` (code_index, code) SELECT code_index, code FROM ying.hs_index_cons where code_index = '399102' and date_end = '0000-00-00';

UPDATE `ying`.`hs_index_gp_info_EM` i
        LEFT JOIN
    `ying`.`hs_s_index_nmc_view` n ON i.code_index = n.code_index
        LEFT JOIN
    hs_s s ON i.code = s.code 
SET 
    i.weight = ROUND(100 * s.nmc / n.nmc_index, 3)
WHERE
    i.code_index IN ('399102');

select * from `ying`.`hs_index_gp_info_EM`;

select distinct code_index from `ying`.`hs_index_gp_info_EM`;

select * from `ying`.`hs_index_gp_info_EM` where not (code_index in ('000016','000300','000905'));

select * from `ying`.`hs_s_index_nmc_v`;


select * from `ying`.`hs_s` where code = '601318';

select * from `ying`.`hs_index_gp_info_EM` where code_index = '000300';

select * from `ying`.`hs_index_gp_info_EM` where code_index = '000905';


select * from `ying`.`hs_index_gp_info_EM` where code_index = '399300' and code = '601318';
select * from `ying`.`hs_index_gp_info_EM` where code_index = '000016' and code = '600000';


alter table `ying`.`hs_index_gp_info_EM` add column `weight` decimal(5,2) NOT NULL COMMENT 'stock weight' after `code`;

-- 从hs_s_index_cons_000935_zzXinXi中插入

insert into `ying`.`hs_index_gp_info_EM` (code_index, code) select `code_index`, `code` from `hs_s_index_cons_000935_zzXinXi`;

UPDATE `ying`.`hs_index_gp_info_EM` i
        LEFT JOIN
    `ying`.`hs_s_index_nmc_view` n ON i.code_index = n.code_index
        LEFT JOIN
    hs_s s ON i.code = s.code 
SET 
    i.weight = ROUND(100 * s.nmc / n.nmc_index, 3)
WHERE
    i.code_index IN ('000935');
    
UPDATE `ying`.`hs_index_gp_info_EM` i
        LEFT JOIN
    `ying`.`hs_s_index_nmc_view` n ON i.code_index = n.code_index
        LEFT JOIN
    hs_s s ON i.code = s.code 
SET 
    i.weight = ROUND(100 * s.nmc / n.nmc_index, 3)
WHERE
    i.code_index IN ('399974');

-- 从hs_s_index_cons_399707_csswZhengQuan中插入

insert into `ying`.`hs_index_gp_info_EM` (code_index, code) select `code_index`, `code` from `hs_s_index_cons_399707_csswZhengQuan`;

insert into `ying`.`hs_index_gp_info_EM` (code_index, code) select `code_index`, `code` from `hs_s_index_cons_399974_GQGG`;


-- tedd 更新相关股票在特定指数中的权重
UPDATE `ying`.`hs_index_gp_info_EM` i
        LEFT JOIN
    `ying`.`hs_s_index_nmc_view` n ON i.code_index = n.code_index
        LEFT JOIN
    hs_s s ON i.code = s.code 
SET 
    i.weight = ROUND(100 * s.nmc / n.nmc_index, 3)
WHERE
    NOT (i.code_index IN ('000016' , '000300', '000905'));
    
UPDATE `ying`.`hs_index_gp_info_EM` i
LEFT JOIN
`ying`.`hs_s_index_nmc_view` n ON i.code_index = n.code_index
LEFT JOIN
hs_s s ON i.code = s.code 
SET 
i.weight = ROUND(100 * s.nmc / n.nmc_index, 3)
WHERE
i.code_index IN ('399707');

    
-- 更新zz500的权重
UPDATE `ying`.`hs_index_gp_info_EM` i
        JOIN
    `ying`.`hs_s_zz500_weight` w ON (i.code_index = w.code_index and i.code = w.code)
SET 
    i.weight = w.weight; -- tedd
    
-- 更新hs300的权重
SELECT * FROM `ying`.`hs_index_gp_info_EM`;
UPDATE `ying`.`hs_index_gp_info_EM` i
        JOIN
    `ying`.`hs_s_hs300_weight` w ON (i.code_index = w.code_index and i.code = w.code)
SET 
    i.weight = w.weight; -- tedd
    
-- 更新上证50的权重
SELECT * FROM `ying`.`hs_index_gp_info_EM`;
UPDATE `ying`.`hs_index_gp_info_EM` i
        JOIN
    `ying`.`hs_index_gp_info_EM` w ON (i.code = w.code
        AND w.code_index = '000300'
        AND i.code_index = '000016') 
SET 
    i.weight = w.weight; -- tedd
    
select * from `ying`.`hs_index_gp_info_EM` where code_index = '399300';
UPDATE `ying`.`hs_index_gp_info_EM` set code_index = '000300' where code_index = '399300';

select * from `ying`.`hs_index_gp_info_EM` where code_index = '399905';
UPDATE `ying`.`hs_index_gp_info_EM` set code_index = '000905' where code_index = '399905';
    
select '399973', 'fZZGF', code from hs_s where fZZGF = 1;
select '000016', 'f50SH', code from hs_s where f50SH = 1;

insert into `ying`.`hs_index_gp_info_EM` (code_index, flag, code) select '399973', 'fZZGF', code from hs_s where fZZGF = 1 ;
insert into `ying`.`hs_index_gp_info_EM` (code_index, flag, code) select '000016', 'f50SH', code from hs_s where f50SH = 1 ;
insert into `ying`.`hs_index_gp_info_EM` (code_index, flag, code) select '000300', 'f300', code from hs_s where f300 = 1 ;
insert into `ying`.`hs_index_gp_info_EM` (code_index, flag, code) select '000905', 'f500', code from hs_s where f500 = 1 ;


-- DROP TABLE `ying`.`hs_index_gp_info_EM`;

CREATE TABLE `hs_index_gp_info_EM` (
  `code_index` char(6) NOT NULL COMMENT 'index code',
  `flag` varchar(6) DEFAULT NULL COMMENT 'hs_s flag',
  `code` varchar(6) NOT NULL COMMENT 'stock code',
  `weight` decimal(6,3) DEFAULT NULL COMMENT 'stock weight',
  `DateSys` date DEFAULT NULL,
  PRIMARY KEY (`code_index`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `ying`.`hs_index_gp_info_EM` 
CHANGE COLUMN `weight` `weight` DECIMAL(6,3) NULL DEFAULT NULL COMMENT 'stock weight' ;






