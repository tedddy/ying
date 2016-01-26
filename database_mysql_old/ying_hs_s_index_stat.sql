-- 所有指数涨跌统计
SELECT TimeSlot, info.name_index  AS '指数名称', rate5 AS '五分钟涨速', z - d AS '涨跌数差', zW - dW AS '涨跌数差加权', zfg - dfg AS '涨跌超3.82', zfgW - dfgW AS '涨跌超3.82加权', zg - dg AS '涨跌超6.18', zgW - dgW AS '涨跌超6.18加权', zt - dt AS '涨跌停差', ztW - dtW AS '涨跌停差加权', summary.code_index AS '指数' FROM `ying`.`hs_s_index_stat_summary` summary JOIN hs_index_info info ON (summary.code_index = info.code_index) WHERE DATE(TimeSlot) >= CURDATE()-1 ORDER BY summary.TimeSlot DESC, summary.code_index; -- date(TimeSlot) = curdate() - 1 or or date(TimeSlot) >= '2015-09-29'

SELECT TimeSlot, info.name_index  AS '指数名称', rate5 AS '五分钟涨速', z - d AS '涨跌数差', zW - dW AS '涨跌数差加权', zfg - dfg AS '涨跌超3.82', zfgW - dfgW AS '涨跌超3.82加权', zg - dg AS '涨跌超6.18', zgW - dgW AS '涨跌超6.18加权', zt - dt AS '涨跌停差', ztW - dtW AS '涨跌停差加权', summary.code_index AS '指数' FROM `ying`.`hs_s_index_stat_summary` summary JOIN hs_index_info info ON (summary.code_index = info.code_index) WHERE DATE(TimeSlot) >= CURDATE()-1 AND info.code_index in ('000300', '000905') ORDER BY summary.TimeSlot DESC, summary.code_index; -- date(TimeSlot) = curdate() - 1 or or date(TimeSlot) >= '2015-09-29'


-- 特定指数涨跌统计, 速度比所有指数涨跌的程度差不多 tedd ？
SELECT TimeSlot, info.name_index  AS '指数名称', rate5 AS '五分钟涨速', z - d AS '涨跌数差', zW - dW AS '涨跌数差加权', zfg - dfg AS '涨跌超3.82', zfgW - dfgW AS '涨跌超3.82加权', zg - dg AS '涨跌超6.18', zgW - dgW AS '涨跌超6.18加权', zt - dt AS '涨跌停差', ztW - dtW AS '涨跌停差加权', summary.code_index AS '指数' FROM `ying`.`hs_s_index_stat_summary` summary JOIN hs_index_info info ON (summary.code_index = info.code_index) WHERE summary.code_index IN ('000016') AND DATE(TimeSlot) >= CURDATE()-1 ; -- date(TimeSlot) = curdate() - 1 or or date(TimeSlot) >= '2015-09-29'

SELECT * FROM `ying`.`hs_s_index_stat_summary`;
SELECT TimeSlot, code_index, rate5, z - d AS dif_zd, zW - dW AS dif_zdW, zfg - dfg AS dif_zdfg, zfgW - dfgW AS dif_zdfgW, zg - dg AS dif_zdg, zgW - dgW AS dif_zdgW, zt - dt AS dif_zdt, ztW - dtW AS dif_zdtW FROM `ying`.`hs_s_index_stat_summary` WHERE  DATE(TimeSlot) = CURDATE(); -- date(TimeSlot) = curdate() - 1 or 

-- SELECT zd.TimeSlot AS '时间', zd.z AS '上涨数', zd.d AS '下跌数', zdfg.zfg AS '涨3.82', zdfg.dfg AS '跌3.82' , zdg.zg AS '涨6.18', zdg.dg AS '跌6.18' FROM `ying`.`hs_s_index_stat_z_d_No` zd join `ying`.`hs_s_index_stat_zfg_dfg_No` zdfg on (zd.TimeSlot = zdfg.TimeSlot)  join `ying`.`hs_s_index_stat_zg_dg_No` zdg on (zd.TimeSlot = zdg.TimeSlot);

-- tedd: This view is much quicker than the below one.
DROP VIEW `ying`.`hs_s_index_stat_summary`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_summary` AS
    SELECT
        a.`TimeSlot` AS `TimeSlot`,
        `c`.`code_index` AS `code_index`,
        SUM((`a`.`chgrate5` * `c`.`weight`)) AS `rate5`,
        SUM(IF((`a`.`chgrate` > 0), 1, 0)) AS `z`,
        SUM(IF((`a`.`chgrate` > 0), `c`.weight, 0)) AS `zw`,
        SUM(IF((`a`.`chgrate` < 0), 1, 0)) AS `d`,
        SUM(IF((`a`.`chgrate` < 0), `c`.weight, 0)) AS `dw`,
        -- (SUM(IF((`a`.`chgrate` > 0), 1, 0)) - SUM(IF((`a`.`chgrate` < 0), 1, 0))) AS `diff(zd)`,
        -- SUM(IF((`a`.`chgrate` > 0), `c`.weight, 0)) - SUM(IF((`a`.`chgrate` < 0), `c`.weight, 0)) AS  `diff(zWdW)`,
        SUM(IF(((`a`.`chgrate` > 0) AND (`a`.`close` >= ROUND((1.0382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), 1, 0)) AS `zfg`,
        SUM(IF(((`a`.`chgrate` > 0) AND (`a`.`close` >= ROUND((1.0382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), `c`.weight, 0)) AS `zfgw`,
        SUM(IF(((`a`.`chgrate` < 0) AND (`a`.`close` <= ROUND((0.9618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), 1, 0)) AS `dfg`,
        SUM(IF(((`a`.`chgrate` < 0) AND (`a`.`close` <= ROUND((0.9618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), `c`.weight, 0)) AS `dfgw`,
        -- SUM(IF(((`a`.`chgrate` > 0) AND (`a`.`close` >= ROUND((1.0382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), 1, 0)) - SUM(IF(((`a`.`chgrate` < 0) AND (`a`.`close` <= ROUND((0.9618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), 1, 0)) AS `zfg - dfg`,
        -- SUM(IF(((`a`.`chgrate` > 0) AND (`a`.`close` >= ROUND((1.0382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), `c`.weight, 0)) - SUM(IF(((`a`.`chgrate` < 0) AND (`a`.`close` <= ROUND((0.9618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), `c`.weight, 0)) AS `zfgw -dfgw`,
        SUM(IF(((`a`.`chgrate` > 0) AND (`a`.`close` >= ROUND((1.0618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), 1, 0)) AS `zg`,
        SUM(IF(((`a`.`chgrate` > 0) AND (`a`.`close` >= ROUND((1.0618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), `c`.weight, 0)) AS `zgw`,
        SUM(IF(((`a`.`chgrate` < 0) AND (`a`.`close` <= ROUND((0.9382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), 1, 0)) AS `dg`,
        SUM(IF(((`a`.`chgrate` < 0) AND (`a`.`close` <= ROUND((0.9382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), `c`.weight, 0)) AS `dgw`,
        -- SUM(IF(((`a`.`chgrate` > 0) AND (`a`.`close` >= ROUND((1.0618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), 1, 0)) - SUM(IF(((`a`.`chgrate` < 0) AND (`a`.`close` <= ROUND((0.9382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), 1, 0)) AS `zg -dg`,
        -- SUM(IF(((`a`.`chgrate` > 0) AND (`a`.`close` >= ROUND((1.0618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), `c`.weight, 0)) - SUM(IF(((`a`.`chgrate` < 0) AND (`a`.`close` <= ROUND((0.9382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), `c`.weight, 0)) AS `zgw -dgw`,
        SUM(IF(((`a`.`chgrate` > 0) AND (`a`.`close` >= ROUND((1.1 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), 1, 0)) AS `zt`,
        SUM(IF(((`a`.`chgrate` > 0) AND (`a`.`close` >= ROUND((1.1 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), `c`.weight, 0)) AS `ztw`,
        SUM(IF(((`a`.`chgrate` < 0) AND (`a`.`close` <= ROUND((0.9 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), 1, 0)) AS `dt`,
        SUM(IF(((`a`.`chgrate` < 0) AND (`a`.`close` <= ROUND((0.9 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), `c`.weight, 0)) AS `dtw`
        -- SUM(IF(((`a`.`chgrate` > 0) AND (`a`.`close` >= ROUND((1.1 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), 1, 0)) - SUM(IF(((`a`.`chgrate` < 0) AND (`a`.`close` <= ROUND((0.9 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), 1, 0)) AS `zt -dt`,
        -- SUM(IF(((`a`.`chgrate` > 0) AND (`a`.`close` >= ROUND((1.1 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), `c`.weight, 0)) - SUM(IF(((`a`.`chgrate` < 0) AND (`a`.`close` <= ROUND((0.9 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))), 2))), `c`.weight, 0)) AS `ztw -dtw`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs_index_gp_info_EM` `c` ON ((`a`.`code` = `c`.`code`)))
	WHERE (`c`.`code_index` IS NOT NULL)
    GROUP BY `a`.`TimeSlot` , `c`.`code_index`
    ORDER BY `a`.`TimeSlot` DESC, `c`.`code_index`;

-- This view is much slower than the above one. 
-- DROP VIEW `ying`.`hs_s_index_stat_summary_150930`;
-- CREATE 
--     ALGORITHM = UNDEFINED 
--     DEFINER = `gxh`@`%` 
--     SQL SECURITY DEFINER
-- VIEW `hs_s_index_stat_summary_150930` AS
--     SELECT 
--         `a`.`TimeSlot` AS `TimeSlot`,
--         `a`.`code_index` AS `code_index`,
--         `rate5`.`chgrate5_weight` AS `rate5`,
--         `a`.`z` AS `z`,
--         `a`.`d` AS `d`,
--         (`a`.`z` - `a`.`d`) AS `z-d`,
--         IFNULL(`zW`.`z_weight`, 0) AS `zW`,
--         IFNULL(`dW`.`d_weight`, 0) AS `dW`,
--         (IFNULL(`zW`.`z_weight`, 0) - IFNULL(`dW`.`d_weight`, 0)) AS `zW-dW`,
--         `d`.`zfg` AS `zfg`,
--         `d`.`dfg` AS `dfg`,
--         (`d`.`zfg` - `d`.`dfg`) AS `zfg-dfg`,
--         IFNULL(`zfgW`.`zfg_weight`, 0) AS `zfgW`,
--         IFNULL(`dfgW`.`dfg_weight`, 0) AS `dfgW`,
--         (IFNULL(`zfgW`.`zfg_weight`, 0) - IFNULL(`dfgW`.`dfg_weight`, 0)) AS `zfgW-dfgW`,
--         `b`.`zg` AS `zg`,
--         `b`.`dg` AS `dg`,
--         (`b`.`zg` - `b`.`dg`) AS `zg-dg`,
--         IFNULL(`zgW`.`zg_weight`, 0) AS `zgW`,
--         IFNULL(`dgW`.`dg_weight`, 0) AS `dgW`,
--         (IFNULL(`zgW`.`zg_weight`, 0) - IFNULL(`dgW`.`dg_weight`, 0)) AS `zgW-dgW`,
--         `c`.`zt` AS `zt`,
--         `c`.`dt` AS `dt`,
--         (`c`.`zt` - `c`.`dt`) AS `zt-dt`,
--         IFNULL(`ztW`.`zt_weight`, 0) AS `ztW`,
--         IFNULL(`dtW`.`dt_weight`, 0) AS `dtW`,
--         (IFNULL(`ztW`.`zt_weight`, 0) - IFNULL(`dtW`.`dt_weight`, 0)) AS `ztW-dtW`
--     FROM
--         ((((((((((((`hs_s_index_stat_z_d_No` `a`
--         LEFT JOIN `hs_s_index_stat_zg_dg_No` `b` ON ((`a`.`TimeSlot` = `b`.`TimeSlot`) and (`a`.`code_index` = `b`.`code_index`)))
--         LEFT JOIN `hs_s_index_stat_zt_dt_No` `c` ON ((`a`.`TimeSlot` = `c`.`TimeSlot`) and (`a`.`code_index` = `c`.`code_index`)))
--         LEFT JOIN `hs_s_index_stat_zfg_dfg_No` `d` ON ((`a`.`TimeSlot` = `d`.`TimeSlot`) and (`a`.`code_index` = `d`.`code_index`)))
--         LEFT JOIN `hs_s_index_stat_z_weight` `zW` ON ((`a`.`TimeSlot` = `zW`.`TimeSlot`) and (`a`.`code_index` = `zW`.`code_index`)))
--         LEFT JOIN `hs_s_index_stat_d_weight` `dW` ON ((`a`.`TimeSlot` = `dW`.`TimeSlot`) and (`a`.`code_index` = `dW`.`code_index`)))
--         LEFT JOIN `hs_s_index_stat_zfg_weight` `zfgW` ON ((`a`.`TimeSlot` = `zfgW`.`TimeSlot`) and (`a`.`code_index` = `zfgW`.`code_index`)))
--         LEFT JOIN `hs_s_index_stat_dfg_weight` `dfgW` ON ((`a`.`TimeSlot` = `dfgW`.`TimeSlot`) and (`a`.`code_index` = `dfgW`.`code_index`)))
--         LEFT JOIN `hs_s_index_stat_zg_weight` `zgW` ON ((`a`.`TimeSlot` = `zgW`.`TimeSlot`) and (`a`.`code_index` = `zgW`.`code_index`)))
--         LEFT JOIN `hs_s_index_stat_dg_weight` `dgW` ON ((`a`.`TimeSlot` = `dgW`.`TimeSlot`) and (`a`.`code_index` = `dgW`.`code_index`)))
--         LEFT JOIN `hs_s_index_stat_zt_weight` `ztW` ON ((`a`.`TimeSlot` = `ztW`.`TimeSlot`) and (`a`.`code_index` = `ztW`.`code_index`)))
--         LEFT JOIN `hs_s_index_stat_dt_weight` `dtW` ON ((`a`.`TimeSlot` = `dtW`.`TimeSlot`) and (`a`.`code_index` = `dtW`.`code_index`)))
--         LEFT JOIN `hs_s_index_stat_chgrate5` `rate5` ON ((`a`.`TimeSlot` = `rate5`.`TimeSlot`) and (`a`.`code_index` = `rate5`.`code_index`)))
--     ORDER BY `a`.`TimeSlot` DESC , `c`.`code_index`;

-- 在表ying.hs_s_rt_EM中选择指数的数据    
SELECT * FROM hs_s_index_stat_rt_EM;
SELECT TimeSlot, COUNT(*) FROM hs_s_index_stat_rt_EM WHERE DATE(TimeSlot) = CURDATE() - 1 GROUP BY TimeSlot;
SELECT * FROM hs_s_index_stat_rt_EM WHERE TimeSlot = '2015-09-11 10:00:00';
SELECT * FROM hs_s_index_stat_rt_EM WHERE time > '09:00:00' AND TimeSlot = '2015-09-16 10:00:00';
-- DROP VIEW hs_s_index_stat_rt_EM;
-- The constraint ((`c`.`code_index` IS NOT NULL)) can speed up the query significantly. 
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_rt_EM` AS
    SELECT 
        `a`.`id` AS `id`,
        `a`.`code` AS `code`,
        `c`.`code_index` AS `code_index`,
        `a`.`close` AS `close`,
        `a`.`amount` AS `amount`,
        `a`.`volume` AS `volume`,
        `a`.`chgrate` AS `chgrate`,
        `a`.`WeiBi` AS `WeiBi`,
        `a`.`chgrate5` AS `chgrate5`,
        `a`.`LiangBi` AS `LiangBi`,
        `a`.`date` AS `date`,
        `a`.`time` AS `time`,
        `a`.`TimeSlot` AS `TimeSlot`
    FROM
        (`hs_s_rt_EM` `a`
        LEFT JOIN `hs_index_gp_info_EM` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`id` IS NOT NULL)
            AND (`c`.`code_index` IS NOT NULL))
    ORDER BY `a`.`TimeSlot` DESC , `c`.`code_index`;


    

-- 加权5分钟涨速指数
SELECT * FROM `ying`.`hs_s_index_stat_chgrate5`;
SELECT * FROM `ying`.`hs_s_index_stat_chgrate5` WHERE code_index = '000300';
-- DROP VIEW `ying`.`hs_s_index_stat_chgrate5`;    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_chgrate5` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        `c`.`code_index` AS `code_index`,
        SUM((`a`.`chgrate5` * `c`.`weight`)) AS `chgrate5_weight`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs_index_gp_info_EM` `c` ON ((`a`.`code` = `c`.`code`)))
    GROUP BY `a`.`TimeSlot` , `c`.`code_index`
    ORDER BY `a`.`TimeSlot` DESC , `c`.`code_index` , SUM((`a`.`chgrate5` * `c`.`weight`)) DESC;
    

-- 指数成分股票的涨跌个数
SELECT TimeSlot AS '时间', code_index AS '指数代码', z AS '上涨数', d AS '下跌数' FROM `ying`.`hs_s_index_stat_z_d_No`;
DROP VIEW `ying`.`hs_s_index_stat_z_d_No`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_z_d_No` AS
    SELECT
        a.`TimeSlot` AS `TimeSlot`,
        `c`.`code_index` AS `code_index`,
        SUM(IF((`a`.`chgrate` > 0),
            1,
            0)) AS `z`,
        SUM(IF((`a`.`chgrate` < 0),
            1,
            0)) AS `d`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs_index_gp_info_EM` `c` ON ((`a`.`code` = `c`.`code`)))
    GROUP BY `a`.`TimeSlot` , `c`.`code_index`
    ORDER BY `a`.`TimeSlot` DESC, `c`.`code_index`;
    
-- 指数成分股票的加权跌指数
-- Replace `hs_s_fZZGF_rt_EM_view` with `hs_s_rt_EM`; For naming of the views, replace `ying`.`hs_s_fZZGF_d_weight` (_fZZGF_) with `ying`.`hs_s_index_stat_d_weight` (_index_stat_); delete index constaint: AND (`c`.`code_index` = '399973'); add field `c`.`code_index` AS `code_index`; add `c`.`code_index` to 'group by'
SELECT * FROM `ying`.`hs_s_index_stat_d_weight`;
SELECT * FROM `ying`.`hs_s_index_stat_d_weight` WHERE `code_index` = '399973';
-- DROP VIEW `ying`.`hs_s_index_stat_d_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_d_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        `c`.`code_index` AS `code_index`,
        SUM(`c`.`weight`) AS `d_weight`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`))))
    WHERE
        (`a`.`chgrate` < 0)
    GROUP BY `a`.`TimeSlot` , `c`.`code_index`
    ORDER BY `a`.`TimeSlot` DESC, `c`.`code_index`;   
    


-- 指数成分股票的加权跌反金指数（跌超过反黄金分割点，反黄金分割点 = 1 - 0.618）
SELECT * FROM `ying`.`hs_s_index_stat_dfg_weight`;
DROP VIEW `ying`.`hs_s_index_stat_dfg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_dfg_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        `c`.`code_index` AS `code_index`,
        SUM(`c`.`weight`) AS `dfg_weight`
    FROM
        (`hs_s_rt_EM` `a`JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`))))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`TimeSlot` , `c`.`code_index`
    ORDER BY `a`.`TimeSlot` DESC, `c`.`code_index`; 

-- 指数成分股票的加权跌金指数（跌超过黄金分割点）
SELECT * FROM `ying`.`hs_s_index_stat_dg_weight`;
DROP VIEW `ying`.`hs_s_index_stat_dg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_dg_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        `c`.`code_index` AS `code_index`,
        SUM(`c`.`weight`) AS `dg_weight`
    FROM
        (`hs_s_rt_EM` `a`JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`))))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`TimeSlot` , `c`.`code_index`
    ORDER BY `a`.`TimeSlot` DESC, `c`.`code_index`; 

-- 指数成分股票的加权跌停指数
SELECT * FROM `ying`.`hs_s_index_stat_dt_weight`;
DROP VIEW `ying`.`hs_s_index_stat_dt_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_dt_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        `c`.`code_index` AS `code_index`,
        SUM(`c`.`weight`) AS `dt_weight`
    FROM
        (`hs_s_rt_EM` `a`JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`))))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`TimeSlot` , `c`.`code_index`
    ORDER BY `a`.`TimeSlot` DESC, `c`.`code_index`;   
	
-- 指数成分股票的涨跌超过反黄金分割点个数
SELECT * FROM `hs_s_index_stat_zfg_dfg_No`;
DROP VIEW `hs_s_index_stat_zfg_dfg_No`;    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zfg_dfg_No` AS
    SELECT
        `a`.`TimeSlot` AS `TimeSlot`,
        `c`.`code_index` AS `code_index`,
        SUM(IF(((`a`.`chgrate` > 0)
                AND (`a`.`close` >= ROUND((1.0382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                    2))),
            1,
            0)) AS `zfg`,
        SUM(IF(((`a`.`chgrate` < 0)
                AND (`a`.`close` <= ROUND((0.9618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                    2))),
            1,
            0)) AS `dfg`
    FROM
        `hs_s_rt_EM` `a` JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`)))
    GROUP BY `a`.`TimeSlot` , `c`.`code_index`
    ORDER BY `a`.`TimeSlot` DESC, `c`.`code_index`; 
    
-- 指数成分股票的涨跌超过黄金分割点个数
SELECT * FROM `hs_s_index_stat_zg_dg_No`;
DROP VIEW `hs_s_index_stat_zg_dg_No`;    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zg_dg_No` AS
    SELECT
        `a`.`TimeSlot` AS `TimeSlot`,
        `c`.`code_index` AS `code_index`,
        SUM(IF(((`a`.`chgrate` > 0)
                AND (`a`.`close` >= ROUND((1.0618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                    2))),
            1,
            0)) AS `zg`,
        SUM(IF(((`a`.`chgrate` < 0)
                AND (`a`.`close` <= ROUND((0.9382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                    2))),
            1,
            0)) AS `dg`
    FROM
        `hs_s_rt_EM` `a` JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`)))
    GROUP BY `a`.`TimeSlot` , `c`.`code_index`
    ORDER BY `a`.`TimeSlot` DESC, `c`.`code_index`; 
    
-- 指数成分股票的涨停跌停个数
SELECT * FROM `hs_s_index_stat_zt_dt_No`;
DROP VIEW `hs_s_index_stat_zt_dt_No`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zt_dt_No` AS
    SELECT
        `a`.`TimeSlot` AS `TimeSlot`,
        `c`.`code_index` AS `code_index`,
        SUM(IF(((`a`.`chgrate` > 0)
                AND (`a`.`close` >= ROUND((1.1 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                    2))),
            1,
            0)) AS `zt`,
        SUM(IF(((`a`.`chgrate` < 0)
                AND (`a`.`close` <= ROUND((0.9 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                    2))),
            1,
            0)) AS `dt`
    FROM
        `hs_s_rt_EM` `a` JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`)))
    GROUP BY `a`.`TimeSlot` , `c`.`code_index`
    ORDER BY `a`.`TimeSlot` DESC, `c`.`code_index`; 	
    
-- 指数成分股票的加权涨指数
SELECT * FROM `ying`.`hs_s_index_stat_z_weight`;
DROP VIEW `ying`.`hs_s_index_stat_z_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_z_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        `c`.`code_index` AS `code_index`,
        SUM(`c`.`weight`) AS `z_weight`
    FROM
        (`hs_s_rt_EM` `a`JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`))))
    WHERE
        (`a`.`chgrate` > 0)
    GROUP BY `a`.`TimeSlot` , `c`.`code_index`
    ORDER BY `a`.`TimeSlot` DESC, `c`.`code_index`;     
 
-- view 选择当前的涨跌过反黄金分割点的股票（从当日最近时间的数据中选取）, tedd: inequality on "id" is not necessary here.
SELECT * FROM ying.hs_s_index_stat_zfg_dfg;
DROP VIEW `ying`.`hs_s_index_stat_zfg_dfg`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zfg_dfg` AS
    SELECT 
        `rt`.`code` AS `code`,
        `hs_s`.`name` AS `name`,
        `rt`.`close` AS `close`,
        `rt`.`chgrate` AS `chgrate`
    FROM
        ((`hs_s_rt_EM` `rt`
        LEFT JOIN `hs_s_rt_EM` `b` ON (((`rt`.`code` = `b`.`code`)
            AND ((`rt`.`TimeSlot` < `b`.`TimeSlot`))))
        LEFT JOIN `hs_s` ON ((`rt`.`code` = `hs_s`.`code`))))
    WHERE
        ((ISNULL(`b`.`code`)
            AND (`rt`.`chgrate` > 0)
            AND (`rt`.`close` >= ROUND((1.0382 * ((100 * `rt`.`close`) / (100 + `rt`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`code`)
            AND (`rt`.`chgrate` < 0)
            AND (`rt`.`close` <= ROUND((0.9618 * ((100 * `rt`.`close`) / (100 + `rt`.`chgrate`))),
                2))))
    ORDER BY `rt`.`code`; 
    
-- view 选择当前的涨跌过反黄金分割点的股票（从当日最近时间的数据中选取）tedd: id is used to avoid duplicates, although it is not necessary here.
SELECT * FROM ying.hs_s_index_stat_zfg_dfg;
DROP VIEW `ying`.`hs_s_index_stat_zfg_dfg`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zfg_dfg` AS
    SELECT 
        `rt`.`code` AS `code`,
        `hs_s`.`name` AS `name`,
        `rt`.`close` AS `close`,
        `rt`.`chgrate` AS `chgrate`
    FROM
        ((`hs_s_rt_EM` `rt`
        LEFT JOIN `hs_s_rt_EM` `b` ON (((`rt`.`code` = `b`.`code`)
            AND ((`rt`.`TimeSlot` < `b`.`TimeSlot`)
            OR ((`rt`.`TimeSlot` = `b`.`TimeSlot`)
            AND (`rt`.`id` < `b`.`id`))))))
        LEFT JOIN `hs_s` ON ((`rt`.`code` = `hs_s`.`code`)))
    WHERE
        ((ISNULL(`b`.`code`)
            AND (`rt`.`chgrate` > 0)
            AND (`rt`.`close` >= ROUND((1.0382 * ((100 * `rt`.`close`) / (100 + `rt`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`code`)
            AND (`rt`.`chgrate` < 0)
            AND (`rt`.`close` <= ROUND((0.9618 * ((100 * `rt`.`close`) / (100 + `rt`.`chgrate`))),
                2))))
    ORDER BY `rt`.`code`; 


-- 指数成分股票的加权涨反金指数（涨超过反黄金分割点）
SELECT * FROM `ying`.`hs_s_index_stat_zfg_weight`;
DROP VIEW `ying`.`hs_s_index_stat_zfg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zfg_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        `c`.`code_index` AS `code_index`,
        SUM(`c`.`weight`) AS `zfg_weight`
    FROM
        (`hs_s_rt_EM` `a` JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`))))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.0618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`TimeSlot` , `c`.`code_index`
    ORDER BY `a`.`TimeSlot` DESC, `c`.`code_index`;   	

    
-- view 选择当前的涨跌过黄金分割点的股票（从当日最近时间的数据中选取）
SELECT * FROM ying.hs_s_index_stat_zg_dg;
SELECT * FROM ying.hs_s_index_stat_zg_dg WHERE `code_index` = '000016';
DROP VIEW `ying`.`hs_s_index_stat_zg_dg`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zg_dg` AS
    SELECT 
        `rt`.`code` AS `code`,
        `c`.`code_index` AS `code_index`,
        `hs_s`.`name` AS `name`,
        `rt`.`close` AS `close`,
        `rt`.`chgrate` AS `chgrate`
    FROM
        ((`hs_s_rt_EM` `rt`
        LEFT JOIN `hs_s_rt_EM` `b` ON (((`rt`.`code` = `b`.`code`)
            AND ((`rt`.`TimeSlot` < `b`.`TimeSlot`)
            OR ((`rt`.`TimeSlot` = `b`.`TimeSlot`)
            AND (`rt`.`id` < `b`.`id`))))))
        LEFT JOIN `hs_s` ON ((`rt`.`code` = `hs_s`.`code`))) JOIN `hs_index_gp_info_EM` `c` ON (((`rt`.`code` = `c`.`code`)))
    WHERE
        ((ISNULL(`b`.`code`)
            AND (`rt`.`chgrate` > 0)
            AND (`rt`.`close` >= ROUND((1.0618 * ((100 * `rt`.`close`) / (100 + `rt`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`code`)
            AND (`rt`.`chgrate` < 0)
            AND (`rt`.`close` <= ROUND((0.9382 * ((100 * `rt`.`close`) / (100 + `rt`.`chgrate`))),
                2))))
    ORDER BY `rt`.`code`;

-- 指数成分股票的加权涨金指数（涨超过黄金分割点）
SELECT * FROM `ying`.`hs_s_index_stat_zg_weight`;
DROP VIEW `ying`.`hs_s_index_stat_zg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zg_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        `c`.`code_index` AS `code_index`,
        SUM(`c`.`weight`) AS `zg_weight`
    FROM
        (`hs_s_rt_EM` `a`JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`))))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.0618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`TimeSlot` , `c`.`code_index`
    ORDER BY `a`.`TimeSlot` DESC, `c`.`code_index`;   	

-- 指数成分股票的加权涨停指数
SELECT * FROM `ying`.`hs_s_index_stat_zt_weight`;
DROP VIEW `ying`.`hs_s_index_stat_zt_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zt_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        `c`.`code_index` AS `code_index`,
        SUM(`c`.`weight`) AS `zt_weight`
    FROM
        (`hs_s_rt_EM` `a`JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`))))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.1 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`TimeSlot` , `c`.`code_index`
    ORDER BY `a`.`TimeSlot` DESC, `c`.`code_index`; 

-- view 选择当前的涨跌停股票（从当日最近时间的数据中选取）
SELECT * FROM ying.hs_s_index_stat_zt_dt;
SELECT * FROM ying.hs_s_index_stat_zt_dt WHERE `code_index` = '000300';

DROP VIEW `ying`.`hs_s_index_stat_zt_dt`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zt_dt` AS
    SELECT 
        `rt`.`code` AS `code`,
        `c`.`code_index` AS `code_index`,
        `hs_s`.`name` AS `name`,
        `rt`.`close` AS `close`,
        `rt`.`chgrate` AS `chgrate`
    FROM
        ((`hs_s_rt_EM` `rt`
        LEFT JOIN `hs_s_rt_EM` `b` ON (((`rt`.`code` = `b`.`code`)
            AND ((`rt`.`TimeSlot` < `b`.`TimeSlot`)
            OR ((`rt`.`TimeSlot` = `b`.`TimeSlot`)
            AND (`rt`.`id` < `b`.`id`))))))
        LEFT JOIN `hs_s` ON ((`rt`.`code` = `hs_s`.`code`))) JOIN `hs_index_gp_info_EM` `c` ON (((`rt`.`code` = `c`.`code`)))
    WHERE
        ((ISNULL(`b`.`code`)
            AND (`rt`.`chgrate` > 0)
            AND (`rt`.`close` >= ROUND((1.1 * ((100 * `rt`.`close`) / (100 + `rt`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`code`)
            AND (`rt`.`chgrate` < 0)
            AND (`rt`.`close` <= ROUND((0.9 * ((100 * `rt`.`close`) / (100 + `rt`.`chgrate`))),
                2))))
    ORDER BY `rt`.`code`;    

-- view 选择当前数据

SELECT * FROM `ying`.`hs_s_index_stat_lastest`;
SELECT * FROM `ying`.`hs_s_index_stat_lastest` WHERE `code_index` = '000016';
SELECT * FROM `ying`.`hs_s_index_stat_lastest` WHERE code = '600000';
DROP VIEW `ying`.`hs_s_index_stat_lastest`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_lastest` AS
    SELECT 
        `rt`.`code` AS `code`,
        `c`.`code_index` AS `code_index`,
        `rt`.`TimeSlot` AS `TimeSlot`,
        `rt`.`close` AS `close`,
        `rt`.`chgrate` AS `chgrate`
    FROM
        (`hs_s_rt_EM` `rt`
        LEFT JOIN `hs_s_rt_EM` `b` ON (((`rt`.`code` = `b`.`code`)
            AND ((`rt`.`TimeSlot` < `b`.`TimeSlot`)
            OR ((`rt`.`TimeSlot` = `b`.`TimeSlot`)
            AND (`rt`.`id` < `b`.`id`)))))) JOIN `hs_index_gp_info_EM` `c` ON (((`rt`.`code` = `c`.`code`)))
    WHERE
        ISNULL(`b`.`code`) AND `c`.`code_index` IS NOT NULL
    ORDER BY `rt`.`code`;