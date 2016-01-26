SELECT zd.TimeSlot AS '时间', zd.z AS '上涨数', zd.d AS '下跌数', zdfg.zfg AS '涨3.82', zdfg.dfg AS '跌3.82' , zdg.zg AS '涨6.18', zdg.dg AS '跌6.18' FROM `ying`.`hs_s_fZZGF_z_d_No` zd join `ying`.`hs_s_fZZGF_zfg_dfg_No` zdfg on (zd.TimeSlot = zdfg.TimeSlot)  join `ying`.`hs_s_fZZGF_zg_dg_No` zdg on (zd.TimeSlot = zdg.TimeSlot);

-- 涨跌指数统计
SELECT * FROM `ying`.`hs_s_fZZGF_z_d_Statistics`;
DROP VIEW `ying`.`hs_s_fZZGF_z_d_Statistics`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fZZGF_z_d_Statistics` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        `rate5`.`chgrate5_weight` AS `rate5`,
        `a`.`z` AS `z`,
        `a`.`d` AS `d`,
        (`a`.`z` - `a`.`d`) AS `z-d`,
        IFNULL(`zW`.`z_weight`, 0) AS `zW`,
        IFNULL(`dW`.`d_weight`, 0) AS `dW`,
        (IFNULL(`zW`.`z_weight`, 0) - IFNULL(`dW`.`d_weight`, 0)) AS `zW-dW`,
        `d`.`zfg` AS `zfg`,
        `d`.`dfg` AS `dfg`,
        (`d`.`zfg` - `d`.`dfg`) AS `zfg-dfg`,
        IFNULL(`zfgW`.`zfg_weight`, 0) AS `zfgW`,
        IFNULL(`dfgW`.`dfg_weight`, 0) AS `dfgW`,
        (IFNULL(`zfgW`.`zfg_weight`, 0) - IFNULL(`dfgW`.`dfg_weight`, 0)) AS `zfgW-dfgW`,
        `b`.`zg` AS `zg`,
        `b`.`dg` AS `dg`,
        (`b`.`zg` - `b`.`dg`) AS `zg-dg`,
        IFNULL(`zgW`.`zg_weight`, 0) AS `zgW`,
        IFNULL(`dgW`.`dg_weight`, 0) AS `dgW`,
        (IFNULL(`zgW`.`zg_weight`, 0) - IFNULL(`dgW`.`dg_weight`, 0)) AS `zgW-dgW`,
        `c`.`zt` AS `zt`,
        `c`.`dt` AS `dt`,
        (`c`.`zt` - `c`.`dt`) AS `zt-dt`,
        IFNULL(`ztW`.`zt_weight`, 0) AS `ztW`,
        IFNULL(`dtW`.`dt_weight`, 0) AS `dtW`,
        (IFNULL(`ztW`.`zt_weight`, 0) - IFNULL(`dtW`.`dt_weight`, 0)) AS `ztW-dtW`
    FROM
        ((((((((((((`hs_s_fZZGF_z_d_No` `a`
        LEFT JOIN `hs_s_fZZGF_zg_dg_No` `b` ON ((`a`.`TimeSlot` = `b`.`TimeSlot`)))
        LEFT JOIN `hs_s_fZZGF_zt_dt_No` `c` ON ((`a`.`TimeSlot` = `c`.`TimeSlot`)))
        LEFT JOIN `hs_s_fZZGF_zfg_dfg_No` `d` ON ((`a`.`TimeSlot` = `d`.`TimeSlot`)))
        LEFT JOIN `hs_s_fZZGF_z_weight` `zW` ON ((`a`.`TimeSlot` = `zW`.`TimeSlot`)))
        LEFT JOIN `hs_s_fZZGF_d_weight` `dW` ON ((`a`.`TimeSlot` = `dW`.`TimeSlot`)))
        LEFT JOIN `hs_s_fZZGF_zfg_weight` `zfgW` ON ((`a`.`TimeSlot` = `zfgW`.`TimeSlot`)))
        LEFT JOIN `hs_s_fZZGF_dfg_weight` `dfgW` ON ((`a`.`TimeSlot` = `dfgW`.`TimeSlot`)))
        LEFT JOIN `hs_s_fZZGF_zg_weight` `zgW` ON ((`a`.`TimeSlot` = `zgW`.`TimeSlot`)))
        LEFT JOIN `hs_s_fZZGF_dg_weight` `dgW` ON ((`a`.`TimeSlot` = `dgW`.`TimeSlot`)))
        LEFT JOIN `hs_s_fZZGF_zt_weight` `ztW` ON ((`a`.`TimeSlot` = `ztW`.`TimeSlot`)))
        LEFT JOIN `hs_s_fZZGF_dt_weight` `dtW` ON ((`a`.`TimeSlot` = `dtW`.`TimeSlot`)))
        LEFT JOIN `hs_s_fZZGF_chgrate5_weight` `rate5` ON ((`a`.`TimeSlot` = `rate5`.`TimeSlot`)))
    ORDER BY `a`.`TimeSlot` DESC;

-- 在表ying.hs_s_fZZGF_rt_EM_view中选择中证国防指数的数据    
SELECT * FROM hs_s_fZZGF_rt_EM_view;
SELECT TimeSlot, count(*) FROM hs_s_fZZGF_rt_EM_view group by TimeSlot;
SELECT * FROM hs_s_fZZGF_rt_EM_view where TimeSlot = '2015-09-11 10:00:00';
SELECT * FROM hs_s_fZZGF_rt_EM_view where time > '09:59:00' and TimeSlot = '2015-09-11 10:00:00';
-- DROP VIEW hs_s_fZZGF_rt_EM_view;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `ying`.`hs_s_fZZGF_rt_EM_view` AS
    SELECT 
        `a`.`id` AS `id`,
        `a`.`code` AS `code`,
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
        (`ying`.`hs_s` `b`
        LEFT JOIN `ying`.`hs_s_rt_EM` `a` ON (((`a`.`code` = `b`.`code`)
            AND (`b`.`fZZGF` = 1))))
    WHERE
        (`a`.`id` IS NOT NULL)
    ORDER BY `a`.`TimeSlot` DESC;

-- 加权5分钟涨速指数
SELECT * FROM `ying`.`hs_s_fZZGF_chgrate5_weight`;
-- DROP VIEW `ying`.`hs_s_fZZGF_chgrate5_weight`;    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fZZGF_chgrate5_weight` AS
    SELECT
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM((`a`.`chgrate5` * `c`.`weight`)) AS `chgrate5_weight`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs_index_gp_info_EM` `c` ON ((`a`.`code` = `c`.`code`) and `c`.`code_index` = '399973'))
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC , SUM((`a`.`chgrate5` * `c`.`weight`)) DESC;
    

-- 中证国防指数成分股票的涨跌个数
SELECT TimeSlot AS '时间', z AS '上涨数', d AS '下跌数' FROM `ying`.`hs_s_fZZGF_z_d_No`;
-- DROP VIEW `ying`.`hs_s_fZZGF_z_d_No`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fZZGF_z_d_No` AS
    SELECT
        `hs_s_fZZGF_rt_EM_view`.`TimeSlot` AS `TimeSlot`,
        SUM(IF((`hs_s_fZZGF_rt_EM_view`.`chgrate` > 0),
            1,
            0)) AS `z`,
        SUM(IF((`hs_s_fZZGF_rt_EM_view`.`chgrate` < 0),
            1,
            0)) AS `d`
    FROM
        `hs_s_fZZGF_rt_EM_view`
    GROUP BY `hs_s_fZZGF_rt_EM_view`.`TimeSlot`
    ORDER BY `hs_s_fZZGF_rt_EM_view`.`TimeSlot` DESC;
    
-- 沪深300股票的加权跌指数
SELECT * FROM `ying`.`hs_s_fZZGF_d_weight`;
-- DROP VIEW `ying`.`hs_s_fZZGF_d_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fZZGF_d_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `d_weight`
    FROM
        (`hs_s_rt_EM` `a`JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`)
            AND (`c`.`code_index` = '399973'))))
    WHERE
        (`a`.`chgrate` < 0)
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;    

-- 沪深300股票的加权跌反金指数（跌超过反黄金分割点，反黄金分割点 = 1 - 0.618）
SELECT * FROM `ying`.`hs_s_fZZGF_dfg_weight`;
DROP VIEW `ying`.`hs_s_fZZGF_dfg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fZZGF_dfg_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `dfg_weight`
    FROM
        (`hs_s_rt_EM` `a`JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`)
            AND (`c`.`code_index` = '399973'))))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;

-- 沪深300股票的加权跌金指数（跌超过黄金分割点）
SELECT * FROM `ying`.`hs_s_fZZGF_dg_weight`;
DROP VIEW `ying`.`hs_s_fZZGF_dg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fZZGF_dg_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `dg_weight`
    FROM
        (`hs_s_rt_EM` `a`JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`)
            AND (`c`.`code_index` = '399973'))))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;

-- 沪深300股票的加权跌停指数
SELECT * FROM `ying`.`hs_s_fZZGF_dt_weight`;
DROP VIEW `ying`.`hs_s_fZZGF_dt_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fZZGF_dt_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `dt_weight`
    FROM
        (`hs_s_rt_EM` `a`JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`)
            AND (`c`.`code_index` = '399973'))))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY  `a`.`TimeSlot`;
	
-- 中证国防指数成分股票的涨跌超过反黄金分割点个数
SELECT * FROM `hs_s_fZZGF_zfg_dfg_No`;
-- DROP VIEW `hs_s_fZZGF_zfg_dfg_No`;    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fZZGF_zfg_dfg_No` AS
    SELECT
        `hs_s_fZZGF_rt_EM_view`.`TimeSlot` AS `TimeSlot`,
        SUM(IF(((`hs_s_fZZGF_rt_EM_view`.`chgrate` > 0)
                AND (`hs_s_fZZGF_rt_EM_view`.`close` >= ROUND((1.0382 * ((100 * `hs_s_fZZGF_rt_EM_view`.`close`) / (100 + `hs_s_fZZGF_rt_EM_view`.`chgrate`))),
                    2))),
            1,
            0)) AS `zfg`,
        SUM(IF(((`hs_s_fZZGF_rt_EM_view`.`chgrate` < 0)
                AND (`hs_s_fZZGF_rt_EM_view`.`close` <= ROUND((0.9618 * ((100 * `hs_s_fZZGF_rt_EM_view`.`close`) / (100 + `hs_s_fZZGF_rt_EM_view`.`chgrate`))),
                    2))),
            1,
            0)) AS `dfg`
    FROM
        `hs_s_fZZGF_rt_EM_view`
    GROUP BY `hs_s_fZZGF_rt_EM_view`.`TimeSlot`
    ORDER BY `hs_s_fZZGF_rt_EM_view`.`TimeSlot` DESC;
    
-- 中证国防指数成分股票的涨跌超过黄金分割点个数
SELECT * FROM `hs_s_fZZGF_zg_dg_No`;
-- DROP VIEW `hs_s_fZZGF_zg_dg_No`;    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fZZGF_zg_dg_No` AS
    SELECT
        `hs_s_fZZGF_rt_EM_view`.`TimeSlot` AS `TimeSlot`,
        SUM(IF(((`hs_s_fZZGF_rt_EM_view`.`chgrate` > 0)
                AND (`hs_s_fZZGF_rt_EM_view`.`close` >= ROUND((1.0618 * ((100 * `hs_s_fZZGF_rt_EM_view`.`close`) / (100 + `hs_s_fZZGF_rt_EM_view`.`chgrate`))),
                    2))),
            1,
            0)) AS `zg`,
        SUM(IF(((`hs_s_fZZGF_rt_EM_view`.`chgrate` < 0)
                AND (`hs_s_fZZGF_rt_EM_view`.`close` <= ROUND((0.9382 * ((100 * `hs_s_fZZGF_rt_EM_view`.`close`) / (100 + `hs_s_fZZGF_rt_EM_view`.`chgrate`))),
                    2))),
            1,
            0)) AS `dg`
    FROM
        `hs_s_fZZGF_rt_EM_view`
    GROUP BY `hs_s_fZZGF_rt_EM_view`.`TimeSlot`
    ORDER BY `hs_s_fZZGF_rt_EM_view`.`TimeSlot` DESC;
    
-- 中证国防指数成分股票的涨停跌停个数
SELECT * FROM `hs_s_fZZGF_zt_dt_No`;
DROP VIEW `hs_s_fZZGF_zt_dt_No`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fZZGF_zt_dt_No` AS
    SELECT
        `hs_s_fZZGF_rt_EM_view`.`TimeSlot` AS `TimeSlot`,
        SUM(IF(((`hs_s_fZZGF_rt_EM_view`.`chgrate` > 0)
                AND (`hs_s_fZZGF_rt_EM_view`.`close` >= ROUND((1.1 * ((100 * `hs_s_fZZGF_rt_EM_view`.`close`) / (100 + `hs_s_fZZGF_rt_EM_view`.`chgrate`))),
                    2))),
            1,
            0)) AS `zt`,
        SUM(IF(((`hs_s_fZZGF_rt_EM_view`.`chgrate` < 0)
                AND (`hs_s_fZZGF_rt_EM_view`.`close` <= ROUND((0.9 * ((100 * `hs_s_fZZGF_rt_EM_view`.`close`) / (100 + `hs_s_fZZGF_rt_EM_view`.`chgrate`))),
                    2))),
            1,
            0)) AS `dt`
    FROM
        `hs_s_fZZGF_rt_EM_view`
    GROUP BY `hs_s_fZZGF_rt_EM_view`.`TimeSlot`
    ORDER BY `hs_s_fZZGF_rt_EM_view`.`TimeSlot` DESC;	
    
-- 沪深300股票的加权涨指数
SELECT * FROM `ying`.`hs_s_fZZGF_z_weight`;
DROP VIEW `ying`.`hs_s_fZZGF_z_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fZZGF_z_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `z_weight`
    FROM
        (`hs_s_rt_EM` `a`JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`)
            AND (`c`.`code_index` = '399973'))))
    WHERE
        (`a`.`chgrate` > 0)
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;    
 
-- view 选择当前的涨跌过反黄金分割点的股票（从当日最近时间的数据中选取）
SELECT * FROM ying.hs_s_fZZGF_zfg_dfg;
DROP VIEW `ying`.`hs_s_fZZGF_zfg_dfg`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fZZGF_zfg_dfg` AS
    SELECT 
        `fZZGF`.`code` AS `code`,
        `hs_s`.`name` AS `name`,
        `fZZGF`.`close` AS `close`,
        `fZZGF`.`chgrate` AS `chgrate`
    FROM
        ((`hs_s_fZZGF_rt_EM_view` `fZZGF`
        LEFT JOIN `hs_s_fZZGF_rt_EM_view` `b` ON (((`fZZGF`.`code` = `b`.`code`)
            AND ((`fZZGF`.`TimeSlot` < `b`.`TimeSlot`)
            OR ((`fZZGF`.`TimeSlot` = `b`.`TimeSlot`)
            AND (`fZZGF`.`id` < `b`.`id`))))))
        LEFT JOIN `hs_s` ON ((`fZZGF`.`code` = `hs_s`.`code`)))
    WHERE
        ((ISNULL(`b`.`code`)
            AND (`fZZGF`.`chgrate` > 0)
            AND (`fZZGF`.`close` >= ROUND((1.0382 * ((100 * `fZZGF`.`close`) / (100 + `fZZGF`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`code`)
            AND (`fZZGF`.`chgrate` < 0)
            AND (`fZZGF`.`close` <= ROUND((0.9618 * ((100 * `fZZGF`.`close`) / (100 + `fZZGF`.`chgrate`))),
                2))))
    ORDER BY `fZZGF`.`code`; 

-- 沪深300股票的加权涨反金指数（涨超过反黄金分割点）
SELECT * FROM `ying`.`hs_s_fZZGF_zfg_weight`;
DROP VIEW `ying`.`hs_s_fZZGF_zfg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fZZGF_zfg_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `zfg_weight`
    FROM
        (`hs_s_rt_EM` `a`JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`)
            AND (`c`.`code_index` = '399973'))))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.0618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY date, `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;	

    
-- view 选择当前的涨跌过黄金分割点的股票（从当日最近时间的数据中选取）
SELECT * FROM ying.hs_s_fZZGF_zg_dg;
DROP VIEW `ying`.`hs_s_fZZGF_zg_dg`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fZZGF_zg_dg` AS
    SELECT 
        `fZZGF`.`code` AS `code`,
        `hs_s`.`name` AS `name`,
        `fZZGF`.`close` AS `close`,
        `fZZGF`.`chgrate` AS `chgrate`
    FROM
        ((`hs_s_fZZGF_rt_EM_view` `fZZGF`
        LEFT JOIN `hs_s_fZZGF_rt_EM_view` `b` ON (((`fZZGF`.`code` = `b`.`code`)
            AND ((`fZZGF`.`TimeSlot` < `b`.`TimeSlot`)
            OR ((`fZZGF`.`TimeSlot` = `b`.`TimeSlot`)
            AND (`fZZGF`.`id` < `b`.`id`))))))
        LEFT JOIN `hs_s` ON ((`fZZGF`.`code` = `hs_s`.`code`)))
    WHERE
        ((ISNULL(`b`.`code`)
            AND (`fZZGF`.`chgrate` > 0)
            AND (`fZZGF`.`close` >= ROUND((1.0618 * ((100 * `fZZGF`.`close`) / (100 + `fZZGF`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`code`)
            AND (`fZZGF`.`chgrate` < 0)
            AND (`fZZGF`.`close` <= ROUND((0.9382 * ((100 * `fZZGF`.`close`) / (100 + `fZZGF`.`chgrate`))),
                2))))
    ORDER BY `fZZGF`.`code`;

-- 沪深300股票的加权涨金指数（涨超过黄金分割点）
SELECT * FROM `ying`.`hs_s_fZZGF_zg_weight`;
DROP VIEW `ying`.`hs_s_fZZGF_zg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fZZGF_zg_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `zg_weight`
    FROM
        (`hs_s_rt_EM` `a`JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`)
            AND (`c`.`code_index` = '399973'))))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.0618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY date, `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;	

-- 沪深300股票的加权涨停指数
SELECT * FROM `ying`.`hs_s_fZZGF_zt_weight`;
DROP VIEW `ying`.`hs_s_fZZGF_zt_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fZZGF_zt_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `zt_weight`
    FROM
        (`hs_s_rt_EM` `a`JOIN `hs_index_gp_info_EM` `c` ON (((`a`.`code` = `c`.`code`)
            AND (`c`.`code_index` = '399973'))))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.1 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;

-- view 选择当前的涨跌停股票（从当日最近时间的数据中选取）
SELECT * FROM ying.hs_s_fZZGF_zt_dt;
DROP VIEW `ying`.`hs_s_fZZGF_zt_dt`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fZZGF_zt_dt` AS
    SELECT 
        `fZZGF`.`code` AS `code`,
        `hs_s`.`name` AS `name`,
        `fZZGF`.`close` AS `close`,
        `fZZGF`.`chgrate` AS `chgrate`
    FROM
        ((`hs_s_fZZGF_rt_EM_view` `fZZGF`
        LEFT JOIN `hs_s_fZZGF_rt_EM_view` `b` ON (((`fZZGF`.`code` = `b`.`code`)
            AND ((`fZZGF`.`TimeSlot` < `b`.`TimeSlot`)
            OR ((`fZZGF`.`TimeSlot` = `b`.`TimeSlot`)
            AND (`fZZGF`.`id` < `b`.`id`))))))
        LEFT JOIN `hs_s` ON ((`fZZGF`.`code` = `hs_s`.`code`)))
    WHERE
        ((ISNULL(`b`.`code`)
            AND (`fZZGF`.`chgrate` > 0)
            AND (`fZZGF`.`close` >= ROUND((1.1 * ((100 * `fZZGF`.`close`) / (100 + `fZZGF`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`code`)
            AND (`fZZGF`.`chgrate` < 0)
            AND (`fZZGF`.`close` <= ROUND((0.9 * ((100 * `fZZGF`.`close`) / (100 + `fZZGF`.`chgrate`))),
                2))))
    ORDER BY `fZZGF`.`code`;
    

-- view 选择当前数据
SELECT * FROM `ying`.`hs_s_fZZGF_lastest`;
DROP VIEW `ying`.`hs_s_fZZGF_lastest`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fZZGF_lastest` AS
    SELECT 
        `fZZGF`.`code` AS `code`,
        `fZZGF`.`TimeSlot` AS `TimeSlot`,
        `fZZGF`.`close` AS `close`,
        `fZZGF`.`chgrate` AS `chgrate`
    FROM
        (`hs_s_fZZGF_rt_EM_view` `fZZGF`
        LEFT JOIN `hs_s_rt_EM` `b` ON (((`fZZGF`.`code` = `b`.`code`)
            AND ((`fZZGF`.`TimeSlot` < `b`.`TimeSlot`)
            OR ((`fZZGF`.`TimeSlot` = `b`.`TimeSlot`)
            AND (`fZZGF`.`id` < `b`.`id`))))))
    WHERE
        ISNULL(`b`.`code`)
    ORDER BY `fZZGF`.`code`;