-- migrate from E:\bYun\securities\database_mysql\ying_hs_s_index_stat.sql
/* 
	replace index_cons_stat_zd with index_cons_stat_zd
	replace idi with idi
	replace ids with ids
	replace s_rt with s_rt
	replace dt with dt
	replace idi with idi
	replace index_stock_info with index_stock_info
	replace dt with dt
	replace idi with idi
	replace index_stock_info with index_stock_info

 */


-- tedd: This view is much quicker than the below one.
-- tedd: "LEFT JOIN `index_stock_info` `c` ON ((`a`.`ids` = `c`.`ids`)))" is faster than "JOIN `index_stock_info` `c` ON ((`a`.`ids` = `c`.`ids`)))". Left join faster than join?!
DROP VIEW `ying`.`index_cons_stat_zd`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `index_cons_stat_zd` AS
    SELECT 
        a.`dt` AS `dt`,
        `c`.`idi` AS `idi`,
        SUM((`a`.`chgrate5` * `c`.`weight`)) AS `rate5`,
        SUM(IF((`a`.`chgrate` > 0), 1, 0)) AS `z`,
        SUM(IF((`a`.`chgrate` > 0), `c`.weight, 0)) AS `zw`,
        SUM(IF((`a`.`chgrate` < 0), 1, 0)) AS `d`,
        SUM(IF((`a`.`chgrate` < 0), `c`.weight, 0)) AS `dw`,
        SUM(IF(((`a`.`chgrate` > 0)
                AND (`a`.`close` >= ROUND((1.0382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                    2))),
            1,
            0)) AS `zfg`,
        SUM(IF(((`a`.`chgrate` > 0)
                AND (`a`.`close` >= ROUND((1.0382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                    2))),
            `c`.weight,
            0)) AS `zfgw`,
        SUM(IF(((`a`.`chgrate` < 0)
                AND (`a`.`close` <= ROUND((0.9618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                    2))),
            1,
            0)) AS `dfg`,
        SUM(IF(((`a`.`chgrate` < 0)
                AND (`a`.`close` <= ROUND((0.9618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                    2))),
            `c`.weight,
            0)) AS `dfgw`,
        SUM(IF(((`a`.`chgrate` > 0)
                AND (`a`.`close` >= ROUND((1.0618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                    2))),
            1,
            0)) AS `zg`,
        SUM(IF(((`a`.`chgrate` > 0)
                AND (`a`.`close` >= ROUND((1.0618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                    2))),
            `c`.weight,
            0)) AS `zgw`,
        SUM(IF(((`a`.`chgrate` < 0)
                AND (`a`.`close` <= ROUND((0.9382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                    2))),
            1,
            0)) AS `dg`,
        SUM(IF(((`a`.`chgrate` < 0)
                AND (`a`.`close` <= ROUND((0.9382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                    2))),
            `c`.weight,
            0)) AS `dgw`,
        SUM(IF(((`a`.`chgrate` > 0)
                AND (`a`.`close` >= ROUND((1.1 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                    2))),
            1,
            0)) AS `zt`,
        SUM(IF(((`a`.`chgrate` > 0)
                AND (`a`.`close` >= ROUND((1.1 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                    2))),
            `c`.weight,
            0)) AS `ztw`,
        SUM(IF(((`a`.`chgrate` < 0)
                AND (`a`.`close` <= ROUND((0.9 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                    2))),
            1,
            0)) AS `d10`,
        SUM(IF(((`a`.`chgrate` < 0)
                AND (`a`.`close` <= ROUND((0.9 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                    2))),
            `c`.weight,
            0)) AS `d10w`
    FROM
        (`s_rt` `a`
        LEFT JOIN `index_stock_info` `c` ON ((`a`.`ids` = `c`.`ids`)))
    WHERE
        (`c`.`idi` IS NOT NULL)
    GROUP BY `a`.`dt` , `c`.`idi`
    ORDER BY `a`.`dt` DESC , `c`.`idi`;

-- 在表ying.s_rt中选择指数的数据    
SELECT * FROM hs_s_index_stat_rt_EM;
SELECT dt, COUNT(*) FROM hs_s_index_stat_rt_EM WHERE DATE(dt) = CURDATE() - 1 GROUP BY dt;
SELECT * FROM hs_s_index_stat_rt_EM WHERE dt = '2015-09-11 10:00:00';
SELECT * FROM hs_s_index_stat_rt_EM WHERE time > '09:00:00' AND dt = '2015-09-16 10:00:00';
-- DROP VIEW hs_s_index_stat_rt_EM;
-- The constraint ((`c`.`idi` IS NOT NULL)) can speed up the query significantly. 
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_rt_EM` AS
    SELECT 
        `a`.`id` AS `id`,
        `a`.`ids` AS `ids`,
        `c`.`idi` AS `idi`,
        `a`.`close` AS `close`,
        `a`.`amount` AS `amount`,
        `a`.`volume` AS `volume`,
        `a`.`chgrate` AS `chgrate`,
        `a`.`WeiBi` AS `WeiBi`,
        `a`.`chgrate5` AS `chgrate5`,
        `a`.`LiangBi` AS `LiangBi`,
        `a`.`date` AS `date`,
        `a`.`time` AS `time`,
        `a`.`dt` AS `dt`
    FROM
        (`s_rt` `a`
        LEFT JOIN `index_stock_info` `c` ON ((`a`.`ids` = `c`.`ids`)))
    WHERE
        ((`a`.`id` IS NOT NULL)
            AND (`c`.`idi` IS NOT NULL))
    ORDER BY `a`.`dt` DESC , `c`.`idi`;


    

-- 加权5分钟涨速指数
SELECT * FROM `ying`.`hs_s_index_stat_chgrate5`;
SELECT * FROM `ying`.`hs_s_index_stat_chgrate5` WHERE idi = '000300';
-- DROP VIEW `ying`.`hs_s_index_stat_chgrate5`;    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_chgrate5` AS
    SELECT 
        `a`.`dt` AS `dt`,
        `c`.`idi` AS `idi`,
        SUM((`a`.`chgrate5` * `c`.`weight`)) AS `chgrate5_weight`
    FROM
        (`s_rt` `a`
        JOIN `index_stock_info` `c` ON ((`a`.`ids` = `c`.`ids`)))
    GROUP BY `a`.`dt` , `c`.`idi`
    ORDER BY `a`.`dt` DESC , `c`.`idi` , SUM((`a`.`chgrate5` * `c`.`weight`)) DESC;
    

-- 指数成分股票的涨跌个数
SELECT dt AS '时间', idi AS '指数代码', z AS '上涨数', d AS '下跌数' FROM `ying`.`hs_s_index_stat_z_d_No`;
DROP VIEW `ying`.`hs_s_index_stat_z_d_No`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_z_d_No` AS
    SELECT
        a.`dt` AS `dt`,
        `c`.`idi` AS `idi`,
        SUM(IF((`a`.`chgrate` > 0),
            1,
            0)) AS `z`,
        SUM(IF((`a`.`chgrate` < 0),
            1,
            0)) AS `d`
    FROM
        (`s_rt` `a`
        JOIN `index_stock_info` `c` ON ((`a`.`ids` = `c`.`ids`)))
    GROUP BY `a`.`dt` , `c`.`idi`
    ORDER BY `a`.`dt` DESC, `c`.`idi`;
    
-- 指数成分股票的加权跌指数
-- Replace `hs_s_fZZGF_rt_EM_view` with `s_rt`; For naming of the views, replace `ying`.`hs_s_fZZGF_d_weight` (_fZZGF_) with `ying`.`hs_s_index_stat_d_weight` (_index_stat_); delete index constaint: AND (`c`.`idi` = '399973'); add field `c`.`idi` AS `idi`; add `c`.`idi` to 'group by'
SELECT * FROM `ying`.`hs_s_index_stat_d_weight`;
SELECT * FROM `ying`.`hs_s_index_stat_d_weight` WHERE `idi` = '399973';
-- DROP VIEW `ying`.`hs_s_index_stat_d_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_d_weight` AS
    SELECT 
        `a`.`dt` AS `dt`,
        `c`.`idi` AS `idi`,
        SUM(`c`.`weight`) AS `d_weight`
    FROM
        (`s_rt` `a`
        JOIN `index_stock_info` `c` ON (((`a`.`ids` = `c`.`ids`))))
    WHERE
        (`a`.`chgrate` < 0)
    GROUP BY `a`.`dt` , `c`.`idi`
    ORDER BY `a`.`dt` DESC, `c`.`idi`;   
    


-- 指数成分股票的加权跌反金指数（跌超过反黄金分割点，反黄金分割点 = 1 - 0.618）
SELECT * FROM `ying`.`hs_s_index_stat_dfg_weight`;
DROP VIEW `ying`.`hs_s_index_stat_dfg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_dfg_weight` AS
    SELECT 
        `a`.`dt` AS `dt`,
        `c`.`idi` AS `idi`,
        SUM(`c`.`weight`) AS `dfg_weight`
    FROM
        (`s_rt` `a`JOIN `index_stock_info` `c` ON (((`a`.`ids` = `c`.`ids`))))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`dt` , `c`.`idi`
    ORDER BY `a`.`dt` DESC, `c`.`idi`; 

-- 指数成分股票的加权跌金指数（跌超过黄金分割点）
SELECT * FROM `ying`.`hs_s_index_stat_dg_weight`;
DROP VIEW `ying`.`hs_s_index_stat_dg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_dg_weight` AS
    SELECT 
        `a`.`dt` AS `dt`,
        `c`.`idi` AS `idi`,
        SUM(`c`.`weight`) AS `dg_weight`
    FROM
        (`s_rt` `a`JOIN `index_stock_info` `c` ON (((`a`.`ids` = `c`.`ids`))))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`dt` , `c`.`idi`
    ORDER BY `a`.`dt` DESC, `c`.`idi`; 

-- 指数成分股票的加权跌停指数
SELECT * FROM `ying`.`hs_s_index_stat_dt_weight`;
DROP VIEW `ying`.`hs_s_index_stat_dt_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_dt_weight` AS
    SELECT 
        `a`.`dt` AS `dt`,
        `c`.`idi` AS `idi`,
        SUM(`c`.`weight`) AS `dt_weight`
    FROM
        (`s_rt` `a`JOIN `index_stock_info` `c` ON (((`a`.`ids` = `c`.`ids`))))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`dt` , `c`.`idi`
    ORDER BY `a`.`dt` DESC, `c`.`idi`;   
	
-- 指数成分股票的涨跌超过反黄金分割点个数
SELECT * FROM `hs_s_index_stat_zfg_dfg_No`;
DROP VIEW `hs_s_index_stat_zfg_dfg_No`;    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zfg_dfg_No` AS
    SELECT
        `a`.`dt` AS `dt`,
        `c`.`idi` AS `idi`,
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
        `s_rt` `a` JOIN `index_stock_info` `c` ON (((`a`.`ids` = `c`.`ids`)))
    GROUP BY `a`.`dt` , `c`.`idi`
    ORDER BY `a`.`dt` DESC, `c`.`idi`; 
    
-- 指数成分股票的涨跌超过黄金分割点个数
SELECT * FROM `hs_s_index_stat_zg_dg_No`;
DROP VIEW `hs_s_index_stat_zg_dg_No`;    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zg_dg_No` AS
    SELECT
        `a`.`dt` AS `dt`,
        `c`.`idi` AS `idi`,
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
        `s_rt` `a` JOIN `index_stock_info` `c` ON (((`a`.`ids` = `c`.`ids`)))
    GROUP BY `a`.`dt` , `c`.`idi`
    ORDER BY `a`.`dt` DESC, `c`.`idi`; 
    
-- 指数成分股票的涨停跌停个数
SELECT * FROM `hs_s_index_stat_zt_dt_No`;
DROP VIEW `hs_s_index_stat_zt_dt_No`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zt_dt_No` AS
    SELECT
        `a`.`dt` AS `dt`,
        `c`.`idi` AS `idi`,
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
        `s_rt` `a` JOIN `index_stock_info` `c` ON (((`a`.`ids` = `c`.`ids`)))
    GROUP BY `a`.`dt` , `c`.`idi`
    ORDER BY `a`.`dt` DESC, `c`.`idi`; 	
    
-- 指数成分股票的加权涨指数
SELECT * FROM `ying`.`hs_s_index_stat_z_weight`;
DROP VIEW `ying`.`hs_s_index_stat_z_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_z_weight` AS
    SELECT 
        `a`.`dt` AS `dt`,
        `c`.`idi` AS `idi`,
        SUM(`c`.`weight`) AS `z_weight`
    FROM
        (`s_rt` `a`JOIN `index_stock_info` `c` ON (((`a`.`ids` = `c`.`ids`))))
    WHERE
        (`a`.`chgrate` > 0)
    GROUP BY `a`.`dt` , `c`.`idi`
    ORDER BY `a`.`dt` DESC, `c`.`idi`;     
 
-- view 选择当前的涨跌过反黄金分割点的股票（从当日最近时间的数据中选取）, tedd: inequality on "id" is not necessary here.
SELECT * FROM ying.hs_s_index_stat_zfg_dfg;
DROP VIEW `ying`.`hs_s_index_stat_zfg_dfg`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zfg_dfg` AS
    SELECT 
        `rt`.`ids` AS `ids`,
        `hs_s`.`name` AS `name`,
        `rt`.`close` AS `close`,
        `rt`.`chgrate` AS `chgrate`
    FROM
        ((`s_rt` `rt`
        LEFT JOIN `s_rt` `b` ON (((`rt`.`ids` = `b`.`ids`)
            AND ((`rt`.`dt` < `b`.`dt`))))
        LEFT JOIN `hs_s` ON ((`rt`.`ids` = `hs_s`.`ids`))))
    WHERE
        ((ISNULL(`b`.`ids`)
            AND (`rt`.`chgrate` > 0)
            AND (`rt`.`close` >= ROUND((1.0382 * ((100 * `rt`.`close`) / (100 + `rt`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`ids`)
            AND (`rt`.`chgrate` < 0)
            AND (`rt`.`close` <= ROUND((0.9618 * ((100 * `rt`.`close`) / (100 + `rt`.`chgrate`))),
                2))))
    ORDER BY `rt`.`ids`; 
    
-- view 选择当前的涨跌过反黄金分割点的股票（从当日最近时间的数据中选取）tedd: id is used to avoid duplicates, although it is not necessary here.
SELECT * FROM ying.hs_s_index_stat_zfg_dfg;
DROP VIEW `ying`.`hs_s_index_stat_zfg_dfg`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zfg_dfg` AS
    SELECT 
        `rt`.`ids` AS `ids`,
        `hs_s`.`name` AS `name`,
        `rt`.`close` AS `close`,
        `rt`.`chgrate` AS `chgrate`
    FROM
        ((`s_rt` `rt`
        LEFT JOIN `s_rt` `b` ON (((`rt`.`ids` = `b`.`ids`)
            AND ((`rt`.`dt` < `b`.`dt`)
            OR ((`rt`.`dt` = `b`.`dt`)
            AND (`rt`.`id` < `b`.`id`))))))
        LEFT JOIN `hs_s` ON ((`rt`.`ids` = `hs_s`.`ids`)))
    WHERE
        ((ISNULL(`b`.`ids`)
            AND (`rt`.`chgrate` > 0)
            AND (`rt`.`close` >= ROUND((1.0382 * ((100 * `rt`.`close`) / (100 + `rt`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`ids`)
            AND (`rt`.`chgrate` < 0)
            AND (`rt`.`close` <= ROUND((0.9618 * ((100 * `rt`.`close`) / (100 + `rt`.`chgrate`))),
                2))))
    ORDER BY `rt`.`ids`; 


-- 指数成分股票的加权涨反金指数（涨超过反黄金分割点）
SELECT * FROM `ying`.`hs_s_index_stat_zfg_weight`;
DROP VIEW `ying`.`hs_s_index_stat_zfg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zfg_weight` AS
    SELECT 
        `a`.`dt` AS `dt`,
        `c`.`idi` AS `idi`,
        SUM(`c`.`weight`) AS `zfg_weight`
    FROM
        (`s_rt` `a` JOIN `index_stock_info` `c` ON (((`a`.`ids` = `c`.`ids`))))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.0618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`dt` , `c`.`idi`
    ORDER BY `a`.`dt` DESC, `c`.`idi`;   	

    
-- view 选择当前的涨跌过黄金分割点的股票（从当日最近时间的数据中选取）
SELECT * FROM ying.hs_s_index_stat_zg_dg;
SELECT * FROM ying.hs_s_index_stat_zg_dg WHERE `idi` = '000016';
DROP VIEW `ying`.`hs_s_index_stat_zg_dg`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zg_dg` AS
    SELECT 
        `rt`.`ids` AS `ids`,
        `c`.`idi` AS `idi`,
        `hs_s`.`name` AS `name`,
        `rt`.`close` AS `close`,
        `rt`.`chgrate` AS `chgrate`
    FROM
        ((`s_rt` `rt`
        LEFT JOIN `s_rt` `b` ON (((`rt`.`ids` = `b`.`ids`)
            AND ((`rt`.`dt` < `b`.`dt`)
            OR ((`rt`.`dt` = `b`.`dt`)
            AND (`rt`.`id` < `b`.`id`))))))
        LEFT JOIN `hs_s` ON ((`rt`.`ids` = `hs_s`.`ids`))) JOIN `index_stock_info` `c` ON (((`rt`.`ids` = `c`.`ids`)))
    WHERE
        ((ISNULL(`b`.`ids`)
            AND (`rt`.`chgrate` > 0)
            AND (`rt`.`close` >= ROUND((1.0618 * ((100 * `rt`.`close`) / (100 + `rt`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`ids`)
            AND (`rt`.`chgrate` < 0)
            AND (`rt`.`close` <= ROUND((0.9382 * ((100 * `rt`.`close`) / (100 + `rt`.`chgrate`))),
                2))))
    ORDER BY `rt`.`ids`;

-- 指数成分股票的加权涨金指数（涨超过黄金分割点）
SELECT * FROM `ying`.`hs_s_index_stat_zg_weight`;
DROP VIEW `ying`.`hs_s_index_stat_zg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zg_weight` AS
    SELECT 
        `a`.`dt` AS `dt`,
        `c`.`idi` AS `idi`,
        SUM(`c`.`weight`) AS `zg_weight`
    FROM
        (`s_rt` `a`JOIN `index_stock_info` `c` ON (((`a`.`ids` = `c`.`ids`))))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.0618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`dt` , `c`.`idi`
    ORDER BY `a`.`dt` DESC, `c`.`idi`;   	

-- 指数成分股票的加权涨停指数
SELECT * FROM `ying`.`hs_s_index_stat_zt_weight`;
DROP VIEW `ying`.`hs_s_index_stat_zt_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zt_weight` AS
    SELECT 
        `a`.`dt` AS `dt`,
        `c`.`idi` AS `idi`,
        SUM(`c`.`weight`) AS `zt_weight`
    FROM
        (`s_rt` `a`JOIN `index_stock_info` `c` ON (((`a`.`ids` = `c`.`ids`))))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.1 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`dt` , `c`.`idi`
    ORDER BY `a`.`dt` DESC, `c`.`idi`; 

-- view 选择当前的涨跌停股票（从当日最近时间的数据中选取）
SELECT * FROM ying.hs_s_index_stat_zt_dt;
SELECT * FROM ying.hs_s_index_stat_zt_dt WHERE `idi` = '000300';

DROP VIEW `ying`.`hs_s_index_stat_zt_dt`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_zt_dt` AS
    SELECT 
        `rt`.`ids` AS `ids`,
        `c`.`idi` AS `idi`,
        `hs_s`.`name` AS `name`,
        `rt`.`close` AS `close`,
        `rt`.`chgrate` AS `chgrate`
    FROM
        ((`s_rt` `rt`
        LEFT JOIN `s_rt` `b` ON (((`rt`.`ids` = `b`.`ids`)
            AND ((`rt`.`dt` < `b`.`dt`)
            OR ((`rt`.`dt` = `b`.`dt`)
            AND (`rt`.`id` < `b`.`id`))))))
        LEFT JOIN `hs_s` ON ((`rt`.`ids` = `hs_s`.`ids`))) JOIN `index_stock_info` `c` ON (((`rt`.`ids` = `c`.`ids`)))
    WHERE
        ((ISNULL(`b`.`ids`)
            AND (`rt`.`chgrate` > 0)
            AND (`rt`.`close` >= ROUND((1.1 * ((100 * `rt`.`close`) / (100 + `rt`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`ids`)
            AND (`rt`.`chgrate` < 0)
            AND (`rt`.`close` <= ROUND((0.9 * ((100 * `rt`.`close`) / (100 + `rt`.`chgrate`))),
                2))))
    ORDER BY `rt`.`ids`;    

-- view 选择当前数据

SELECT * FROM `ying`.`hs_s_index_stat_lastest`;
SELECT * FROM `ying`.`hs_s_index_stat_lastest` WHERE `idi` = '000016';
SELECT * FROM `ying`.`hs_s_index_stat_lastest` WHERE ids = '600000';
DROP VIEW `ying`.`hs_s_index_stat_lastest`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_index_stat_lastest` AS
    SELECT 
        `rt`.`ids` AS `ids`,
        `c`.`idi` AS `idi`,
        `rt`.`dt` AS `dt`,
        `rt`.`close` AS `close`,
        `rt`.`chgrate` AS `chgrate`
    FROM
        (`s_rt` `rt`
        LEFT JOIN `s_rt` `b` ON (((`rt`.`ids` = `b`.`ids`)
            AND ((`rt`.`dt` < `b`.`dt`)
            OR ((`rt`.`dt` = `b`.`dt`)
            AND (`rt`.`id` < `b`.`id`)))))) JOIN `index_stock_info` `c` ON (((`rt`.`ids` = `c`.`ids`)))
    WHERE
        ISNULL(`b`.`ids`) AND `c`.`idi` IS NOT NULL
    ORDER BY `rt`.`ids`;