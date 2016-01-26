SELECT * FROM ying.hs_s_hs300_EM order by date desc;

SELECT * FROM ying.hs_s_hs300_EM;

SELECT * FROM ying.hs_s_hs300_EM where code = '600000';

SELECT * FROM ying.hs_s_hs300_EM where date = curdate() - 1 order by id desc;

-- 选择当前的涨跌停股票（从当日最近时间的数据中选取，有subquery）
SELECT 
    latest.code, latest.time_latest, rt300.close, rt300.chgrate
FROM
    (SELECT 
        code, MAX(time) AS time_latest
    FROM
        ying.hs_s_hs300_EM
    WHERE
        date = CURDATE() - 1
    GROUP BY code) AS latest
        JOIN
    ying.hs_s_hs300_EM AS rt300 ON latest.code = rt300.code
        AND latest.time_latest = rt300.time
WHERE
    ((`rt300`.`chgrate` > 0)
        AND (`rt300`.`close` >= ROUND((1.1 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
            2))) or ((`rt300`.`chgrate` < 0)
            AND (`rt300`.`close` <= ROUND((0.9 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
                2)));


SELECT 
    date,
    TimeSlot,
    z - d AS dif_zd,
    zW - dW AS dif_zdW,
    zg - dg AS dif_zdg,
    zgW - dgW AS dif_zdgW,
    zt - dt AS dif_zdt,
    ztW - dtW AS dif_zdtW
FROM
    `ying`.`hs_s_hs300_z_d_Statistics`
WHERE
    date = CURDATE() - 1 or date = CURDATE();

-- 沪深300股票的加权5分钟涨速指数
SELECT * FROM `ying`.`hs_s_hs300_chgrate5_weight` ORDER BY date DESC, TimeSlot DESC;
DROP VIEW `ying`.`hs_s_hs300_chgrate5_weight`;    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_chgrate5_weight` AS
    SELECT 
        `a`.`date` AS `date`,
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM((`a`.`chgrate5` * `c`.`weight`)) AS `chgrate5_weight`
    FROM
        (`hs_s_hs300_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    GROUP BY `a`.`date` , `a`.`TimeSlot`
    ORDER BY `a`.`date` DESC , `a`.`TimeSlot` DESC , SUM((`a`.`chgrate5` * `c`.`weight`)) DESC;

-- 沪深300股票的加权跌指数
SELECT * FROM `ying`.`hs_s_hs300_d_weight`;
DROP VIEW `ying`.`hs_s_hs300_d_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_d_weight` AS
    SELECT 
        `a`.`date` AS `date`,
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `d_weight`
    FROM
        (`hs_s_hs300_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        (`a`.`chgrate` < 0)
    GROUP BY `a`.`date` , `a`.`TimeSlot`
    ORDER BY `a`.`date` DESC , `a`.`TimeSlot` DESC;

-- 沪深300股票的加权跌金指数（跌超过黄金分割点）
SELECT * FROM `ying`.`hs_s_hs300_dg_weight`;
DROP VIEW `ying`.`hs_s_hs300_dg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_dg_weight` AS
    SELECT 
        `a`.`date` AS `date`,
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `dg_weight`
    FROM
        (`hs_s_hs300_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`date` , `a`.`TimeSlot`
    ORDER BY `a`.`date` DESC , `a`.`TimeSlot` DESC;

-- 沪深300股票的加权跌停指数
SELECT * FROM `ying`.`hs_s_hs300_dt_weight`;
DROP VIEW `ying`.`hs_s_hs300_dt_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_dt_weight` AS
    SELECT 
        `a`.`date` AS `date`,
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `dt_weight`
    FROM
        (`hs_s_hs300_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`date` , `a`.`TimeSlot`;

-- 沪深300股票的涨跌个数
SELECT * FROM `ying`.`hs_s_hs300_z_d_No`;
DROP VIEW `ying`.`hs_s_hs300_z_d_No`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_z_d_No` AS
    SELECT 
        `hs_s_hs300_rt_EM`.`date` AS `date`,
        `hs_s_hs300_rt_EM`.`TimeSlot` AS `TimeSlot`,
        SUM(IF((`hs_s_hs300_rt_EM`.`chgrate` > 0),
            1,
            0)) AS `z`,
        SUM(IF((`hs_s_hs300_rt_EM`.`chgrate` < 0),
            1,
            0)) AS `d`
    FROM
        `hs_s_hs300_rt_EM`
    GROUP BY `hs_s_hs300_rt_EM`.`date` , `hs_s_hs300_rt_EM`.`TimeSlot`
    ORDER BY `hs_s_hs300_rt_EM`.`date` DESC , `hs_s_hs300_rt_EM`.`TimeSlot` DESC;

-- 涨跌指数统计
SELECT * FROM `ying`.`hs_s_hs300_z_d_Statistics`;
DROP VIEW `ying`.`hs_s_hs300_z_d_Statistics`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_z_d_Statistics` AS
    SELECT 
        `a`.`date` AS `date`,
        `a`.`TimeSlot` AS `TimeSlot`,
        `rate5`.`chgrate5_weight` AS `rate5`,
        `a`.`z` AS `z`,
        `a`.`d` AS `d`,
        (`a`.`z` - `a`.`d`) AS `z-d`,
        ifnull(`zW`.`z_weight`,0) AS `zW`,
        ifnull(`dW`.`d_weight`,0) AS `dW`,
        (ifnull(`zW`.`z_weight`,0) - ifnull(`dW`.`d_weight`,0)) AS `zW-dW`,
        `b`.`zg` AS `zg`,
        `b`.`dg` AS `dg`,
        ifnull(`zgW`.`zg_weight`,0) AS `zgW`,
        ifnull(`dgW`.`dg_weight`,0) AS `dgW`,
        (ifnull(`zgW`.`zg_weight`,0) - ifnull(`dgW`.`dg_weight`,0)) AS `zgW-dgW`,
        `c`.`zt` AS `zt`,
        `c`.`dt` AS `dt`,
        ifnull(`ztW`.`zt_weight`,0) AS `ztW`,
        ifnull(`dtW`.`dt_weight`,0) AS `dtW`,
        (ifnull(`ztW`.`zt_weight`,0) - ifnull(`dtW`.`dt_weight`,0)) AS `ztW-dtW`
    FROM
        (((((((((`hs_s_hs300_z_d_No` `a`
        LEFT JOIN `hs_s_hs300_zg_dg_No` `b` ON (((`a`.`date` = `b`.`date`)
            AND (`a`.`TimeSlot` = `b`.`TimeSlot`))))
        LEFT JOIN `hs_s_hs300_zt_dt_No` `c` ON (((`a`.`date` = `c`.`date`)
            AND (`a`.`TimeSlot` = `c`.`TimeSlot`))))
        LEFT JOIN `hs_s_hs300_z_weight` `zW` ON (((`a`.`date` = `zW`.`date`)
            AND (`a`.`TimeSlot` = `zW`.`TimeSlot`))))
        LEFT JOIN `hs_s_hs300_d_weight` `dW` ON (((`a`.`date` = `dW`.`date`)
            AND (`a`.`TimeSlot` = `dW`.`TimeSlot`))))
        LEFT JOIN `hs_s_hs300_zg_weight` `zgW` ON (((`a`.`date` = `zgW`.`date`)
            AND (`a`.`TimeSlot` = `zgW`.`TimeSlot`))))
        LEFT JOIN `hs_s_hs300_dg_weight` `dgW` ON (((`a`.`date` = `dgW`.`date`)
            AND (`a`.`TimeSlot` = `dgW`.`TimeSlot`))))
        LEFT JOIN `hs_s_hs300_zt_weight` `ztW` ON (((`a`.`date` = `ztW`.`date`)
            AND (`a`.`TimeSlot` = `ztW`.`TimeSlot`))))
        LEFT JOIN `hs_s_hs300_dt_weight` `dtW` ON (((`a`.`date` = `dtW`.`date`)
            AND (`a`.`TimeSlot` = `dtW`.`TimeSlot`))))
        LEFT JOIN `hs_s_hs300_chgrate5_weight` `rate5` ON (((`a`.`date` = `rate5`.`date`)
            AND (`a`.`TimeSlot` = `rate5`.`TimeSlot`))))
    ORDER BY `a`.`date` DESC , `a`.`TimeSlot` DESC;
    
-- 沪深300股票的加权涨指数
SELECT * FROM `ying`.`hs_s_hs300_z_weight`;
DROP VIEW `ying`.`hs_s_hs300_z_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_z_weight` AS
    SELECT 
        `a`.`date` AS `date`,
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `z_weight`
    FROM
        (`hs_s_hs300_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        (`a`.`chgrate` > 0)
    GROUP BY `a`.`date` , `a`.`TimeSlot`
    ORDER BY `a`.`date` DESC , `a`.`TimeSlot` DESC;

-- 沪深300股票的涨跌超过黄金分割点个数
SELECT 
    *
FROM
    `hs_s_hs300_zg_dg_No`;
DROP VIEW `hs_s_hs300_zg_dg_No`;    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zg_dg_No` AS
    SELECT 
        `hs_s_hs300_rt_EM`.`date` AS `date`,
        `hs_s_hs300_rt_EM`.`TimeSlot` AS `TimeSlot`,
        SUM(IF(((`hs_s_hs300_rt_EM`.`chgrate` > 0)
                AND (`hs_s_hs300_rt_EM`.`close` >= ROUND((1.0618 * ((100 * `hs_s_hs300_rt_EM`.`close`) / (100 + `hs_s_hs300_rt_EM`.`chgrate`))),
                    2))),
            1,
            0)) AS `zg`,
        SUM(IF(((`hs_s_hs300_rt_EM`.`chgrate` < 0)
                AND (`hs_s_hs300_rt_EM`.`close` <= ROUND((0.9382 * ((100 * `hs_s_hs300_rt_EM`.`close`) / (100 + `hs_s_hs300_rt_EM`.`chgrate`))),
                    2))),
            1,
            0)) AS `dg`
    FROM
        `hs_s_hs300_rt_EM`
    GROUP BY `hs_s_hs300_rt_EM`.`date` , `hs_s_hs300_rt_EM`.`TimeSlot`
    ORDER BY `hs_s_hs300_rt_EM`.`date` DESC , `hs_s_hs300_rt_EM`.`TimeSlot` DESC;

-- 沪深300股票的加权涨金指数（涨超过黄金分割点）
SELECT * FROM `ying`.`hs_s_hs300_zg_weight`;
DROP VIEW `ying`.`hs_s_hs300_zg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zg_weight` AS
    SELECT 
        `a`.`date` AS `date`,
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `zg_weight`
    FROM
        (`hs_s_hs300_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.0618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY date, `a`.`TimeSlot`
    ORDER BY `a`.`date` DESC , `a`.`TimeSlot` DESC;

-- 沪深300股票的涨停跌停个数
SELECT 
    *
FROM
    `hs_s_hs300_zt_dt_No`;
drop view `hs_s_hs300_zt_dt_No`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zt_dt_No` AS
    SELECT 
        `hs_s_hs300_rt_EM`.`date` AS `date`,
        `hs_s_hs300_rt_EM`.`TimeSlot` AS `TimeSlot`,
        SUM(IF(((`hs_s_hs300_rt_EM`.`chgrate` > 0)
                AND (`hs_s_hs300_rt_EM`.`close` >= ROUND((1.1 * ((100 * `hs_s_hs300_rt_EM`.`close`) / (100 + `hs_s_hs300_rt_EM`.`chgrate`))),
                    2))),
            1,
            0)) AS `zt`,
        SUM(IF(((`hs_s_hs300_rt_EM`.`chgrate` < 0)
                AND (`hs_s_hs300_rt_EM`.`close` <= ROUND((0.9 * ((100 * `hs_s_hs300_rt_EM`.`close`) / (100 + `hs_s_hs300_rt_EM`.`chgrate`))),
                    2))),
            1,
            0)) AS `dt`
    FROM
        `hs_s_hs300_rt_EM`
    GROUP BY `hs_s_hs300_rt_EM`.`date` , `hs_s_hs300_rt_EM`.`TimeSlot`
    ORDER BY `hs_s_hs300_rt_EM`.`date` DESC , `hs_s_hs300_rt_EM`.`TimeSlot` DESC;	

-- 沪深300股票的加权涨停指数
SELECT * FROM `ying`.`hs_s_hs300_zt_weight`;
DROP VIEW `ying`.`hs_s_hs300_zt_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zt_weight` AS
    SELECT 
        `a`.`date` AS `date`,
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `zt_weight`
    FROM
        (`hs_s_hs300_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.1 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`date` , `a`.`TimeSlot`
    ORDER BY `a`.`date` DESC , `a`.`TimeSlot` DESC;
	
-- view 选择当前的涨跌停股票（从当日最近时间的数据中选取）
SELECT * FROM ying.hs_s_hs300_zt_dt;
DROP VIEW `ying`.`hs_s_hs300_zt_dt`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zt_dt` AS
    SELECT 
        `rt300`.`code` AS `code`,
        `hs_s`.`name` AS `name`,
        `rt300`.`close` AS `close`,
        `rt300`.`chgrate` AS `chgrate`
    FROM
        ((`hs_s_hs300_rt_EM` `rt300`
        LEFT JOIN `hs_s_hs300_rt_EM` `b` ON (((`rt300`.`code` = `b`.`code`)
            AND ((`rt300`.`TimeSlot` < `b`.`TimeSlot`)
            OR ((`rt300`.`TimeSlot` = `b`.`TimeSlot`)
            AND (`rt300`.`id` < `b`.`id`))))))
        LEFT JOIN `hs_s` ON ((`rt300`.`code` = `hs_s`.`code`)))
    WHERE
        ((ISNULL(`b`.`code`)
            AND (`rt300`.`date` = (CURDATE() - 1))
            AND (`rt300`.`chgrate` > 0)
            AND (`rt300`.`close` >= ROUND((1.1 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`code`)
            AND (`rt300`.`date` = (CURDATE() - 1))
            AND (`rt300`.`chgrate` < 0)
            AND (`rt300`.`close` <= ROUND((0.9 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
                2))))
    ORDER BY `rt300`.`code`;

-- My own format ( 对应format after beatifying) 
-- CREATE 
--     ALGORITHM = UNDEFINED 
--     DEFINER = `gxh`@`%` 
--     SQL SECURITY DEFINER
-- VIEW `hs_s_hs300_lastest` AS
--     SELECT 
--         `rt300`.`code` AS `code`,
--         `rt300`.`TimeSlot` AS `TimeSlot`,
--         `rt300`.`close` AS `close`,
--         `rt300`.`chgrate` AS `chgrate`
--     FROM
--         (`hs_s_hs300_rt_EM` `rt300`
--         LEFT JOIN `hs_s_hs300_rt_EM` `b` ON (((`rt300`.`code` = `b`.`code`)
--             AND ((`rt300`.`TimeSlot` < `b`.`TimeSlot`)
--             OR ((`rt300`.`TimeSlot` = `b`.`TimeSlot`)
--             AND (`rt300`.`id` < `b`.`id`))))))
--     WHERE
--         ((ISNULL(`b`.`code`)
--             AND (`rt300`.`date` = (CURDATE() - 1))) AND ((`rt300`.`chgrate` > 0)
--         AND (`rt300`.`close` >= ROUND((1.1 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
--             2)))) or ((ISNULL(`b`.`code`)
--             AND (`rt300`.`date` = (CURDATE() - 1))) AND (((`rt300`.`chgrate` < 0)
--             AND (`rt300`.`close` <= ROUND((0.9 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
--                 2))))) 
--     ORDER BY `rt300`.`code`;
	
-- view 选择当前数据
SELECT * FROM `ying`.`hs_s_hs300_lastest`;
DROP VIEW `ying`.`hs_s_hs300_lastest`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_lastest` AS
    SELECT 
        `rt300`.`code` AS `code`,
        `rt300`.`TimeSlot` AS `TimeSlot`,
        `rt300`.`close` AS `close`,
        `rt300`.`chgrate` AS `chgrate`
    FROM
        (`hs_s_hs300_rt_EM` `rt300`
        LEFT JOIN `hs_s_hs300_rt_EM` `b` ON (((`rt300`.`code` = `b`.`code`)
            AND ((`rt300`.`TimeSlot` < `b`.`TimeSlot`)
            OR ((`rt300`.`TimeSlot` = `b`.`TimeSlot`)
            AND (`rt300`.`id` < `b`.`id`))))))
    WHERE
        (ISNULL(`b`.`code`)
            AND (`rt300`.`date` = CURDATE()))
    ORDER BY `rt300`.`code`;

-- 在表ying.hs_s_hs300_rt_EM中选择上证50的数据    
select * from hs_s_sh50_rt_EM_view;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_sh50_rt_EM_view` AS
SELECT 
    *
FROM
    ying.hs_s_hs300_rt_EM
WHERE
    code IN (SELECT DISTINCT
            a.`code`
        FROM
            `ying`.`hs_bk_gp_info_EM` AS a
                JOIN
            ying.hs_bk_info_EM AS b ON (a.code_bk = b.code_bk)
                JOIN
            ying.hs_bkhq_rt_EM AS c ON (b.name_bk = c.name_bk)
        WHERE
            b.name_bk = '上证50'
        ORDER BY a.`DateSys` DESC , c.`chgrate_bk` DESC); 

-- 选择最近时间的数据（不用subquery） sql - Fetch the row which has the Max value for a column - Stack Overflow 
SELECT 
    a.code, a.TimeSlot, a.close, a.chgrate5
FROM
    ying.hs_s_hs300_rt_EM AS a
        LEFT OUTER JOIN
    ying.hs_s_hs300_rt_EM AS b ON (a.code = b.code
        AND (a.time < b.time
        OR (a.time = b.time AND a.id < b.id)))
WHERE
    b.code IS NULL;
    
-- 不同的TimeSlot的涨跌停板数量    
SELECT 
    date,
    TimeSlot,
    SUM(IF(chgrate > 0
            AND close >= ROUND(1.1 * (100 * close / (100 + chgrate)), 2),
        1,
        0)) AS zt,
    SUM(IF(chgrate < 0
            AND close <= ROUND(0.9 * (100 * close / (100 + chgrate)), 2),
        1,
        0)) AS dt
FROM
    ying.hs_s_hs300_rt_EM
WHERE
    date = CURDATE()
GROUP BY date, TimeSlot
ORDER BY TimeSlot DESC;

-- 加权涨跌停指数, 无subquery
SELECT 
    SUM(c.weight)
FROM
    (SELECT 
        code
    FROM
        ying.hs_s_hs300_rt_EM
    WHERE
        chgrate > 0
            AND close >= ROUND(1.1 * (100 * close / (100 + chgrate)), 2)) AS a
        JOIN
    hs300_s_data_c AS c ON a.code = c.code;
    
-- 加权涨跌停指数, 无subquery
SELECT 
    SUM(c.weight)
FROM
    (SELECT 
        code
    FROM
        ying.hs_s_hs300_rt_EM
    WHERE
        chgrate > 0
            AND close >= ROUND(1.1 * (100 * close / (100 + chgrate)), 2)) AS a
        JOIN
    hs300_s_data_c AS c ON a.code = c.code;
    
-- 加权涨跌停指数, 没有subquery
SELECT 
    a.date, a.TimeSlot, SUM(c.weight) as zt_weight
FROM
        ying.hs_s_hs300_rt_EM as a join hs300_s_data_c AS c ON a.code = c.code
    WHERE
        a.chgrate > 0 AND a.close >= ROUND(1.1 * (100 * a.close / (100 + a.chgrate)),2) GROUP BY date, a.TimeSlot;
        
-- 加权涨跌停指数, 没有subquery
SELECT 
    a.date, a.TimeSlot, SUM(c.weight) as zt_weight
FROM
        ying.hs_s_hs300_rt_EM as a join hs300_s_data_c AS c ON a.code = c.code
    WHERE
        a.chgrate > 0 AND a.close >= ROUND(1.1 * (100 * a.close / (100 + a.chgrate)),2) GROUP BY date, a.TimeSlot;

-- 在表ying.hs_s_hs300_rt_EM中选择上证50的数据 tedd        
SELECT 
    a.id,
    a.code,
    a.close,
    a.amount,
    a.volume,
    a.chgrate,
    a.WeiBi,
    a.chgrate5,
    a.LiangBi,
    a.date,
    a.time,
    a.TimeSlot
FROM
    ying.hs_s_hs300_rt_EM AS a
        RIGHT OUTER JOIN
    hs_s AS b ON (a.code = b.code AND b.f50SH = 1)
WHERE
    id IS NOT NULL; 

-- 在表ying.hs_s_hs300_rt_EM中统计上证50的数据条数 tedd      
SELECT 
    count(a.id)
FROM
    ying.hs_s_hs300_rt_EM AS a
        RIGHT OUTER JOIN
    hs_s AS b ON (a.code = b.code AND b.f50SH = 1)
WHERE
    id IS NOT NULL; 

select count(*) from hs_s_sh50_rt_EM;
select count(id) from hs_s_hs300_rt_EM;


SELECT `hs_s_hs300_rt_EM`.`id`,
    `hs_s_hs300_rt_EM`.`code`,
    `hs_s_hs300_rt_EM`.`close`,
    `hs_s_hs300_rt_EM`.`amount`,
    `hs_s_hs300_rt_EM`.`volume`,
    `hs_s_hs300_rt_EM`.`chgrate`,
    `hs_s_hs300_rt_EM`.`WeiBi`,
    `hs_s_hs300_rt_EM`.`chgrate5`,
    `hs_s_hs300_rt_EM`.`LiangBi`,
    `hs_s_hs300_rt_EM`.`date`,
    `hs_s_hs300_rt_EM`.`time`,
    `hs_s_hs300_rt_EM`.`TimeSlot`
FROM `ying`.`hs_s_hs300_rt_EM`;


SELECT 
    `hs_s_hs300_rt_EM`.`id`,
    `hs_s_hs300_rt_EM`.`code`,
    `hs_s_hs300_rt_EM`.`close`,
    `hs_s_hs300_rt_EM`.`amount`,
    `hs_s_hs300_rt_EM`.`volume`,
    `hs_s_hs300_rt_EM`.`chgrate`,
    `hs_s_hs300_rt_EM`.`WeiBi`,
    `hs_s_hs300_rt_EM`.`chgrate5`,
    `hs_s_hs300_rt_EM`.`LiangBi`,
    `hs_s_hs300_rt_EM`.`date`,
    `hs_s_hs300_rt_EM`.`time`,
    `hs_s_hs300_rt_EM`.`TimeSlot`
FROM
    ying.hs_s_hs300_rt_EM
WHERE
    code IN (SELECT DISTINCT
            a.`code`
        FROM
            `ying`.`hs_bk_gp_info_EM` AS a
                JOIN
            ying.hs_bk_info_EM AS b ON (a.code_bk = b.code_bk)
                JOIN
            ying.hs_bkhq_rt_EM AS c ON (b.name_bk = c.name_bk)
        WHERE
            b.name_bk = '上证50'
        ORDER BY a.`DateSys` DESC , c.`chgrate_bk` DESC)
ORDER BY id; 

SELECT `hs_s_hs300_zt_dt_No`.`date` as '日期',
    `hs_s_hs300_zt_dt_No`.`TimeSlot` as '时间' ,
    `hs_s_hs300_zt_dt_No`.`zt` as '涨停股数',
    `hs_s_hs300_zt_dt_No`.`dt` as '跌停股数'
FROM `ying`.`hs_s_hs300_zt_dt_No`;

SELECT * FROM ying.hs_s_hs300_z_weight;
SELECT * FROM ying.hs_s_hs300_zt_weight;
SELECT * FROM ying.hs_s_hs300_dt_weight;