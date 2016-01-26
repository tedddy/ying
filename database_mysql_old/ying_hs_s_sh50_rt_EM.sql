SELECT * FROM ying.hs_s_sh50_rt_EM;

SELECT * FROM ying.hs_s_sh50_rt_EM where date = curdate() order by id desc;

SELECT * FROM ying.hs_s_sh50_rt_EM where date = curdate() and TimeSlot = '09:45:00';

SELECT * FROM ying.hs_s_sh50_rt_EM where date = curdate() and time < '09:50:00'and time > '09:45:00';

UPDATE `ying`.`hs_s_sh50_rt_EM` SET `TimeSlot`= '09:50:00' where date = curdate() and time < '09:50:00'and time > '09:45:00';

SELECT * FROM ying.hs_s_sh50_rt_EM WHERE date = curdate() and time < '11:20:00' and time > '11:15:00';

UPDATE `ying`.`hs_s_sh50_rt_EM` SET TimeSlot =  cast(CONCAT(date, ' ', CASE WHEN time <= '09:27:00' THEN '09:25:00' WHEN time <= '09:32:00' THEN '09:30:00' WHEN time <= '09:37:00' THEN '09:35:00' WHEN time <= '09:42:00' THEN '09:40:00' WHEN time <= '09:47:00' THEN '09:45:00' WHEN time <= '09:52:00' THEN '09:50:00' WHEN time <= '09:57:00' THEN '09:55:00' WHEN time <= '10:02:00' THEN '10:00:00' WHEN time <= '10:07:00' THEN '10:05:00' WHEN time <= '10:12:00' THEN '10:10:00' WHEN time <= '10:17:00' THEN '10:15:00' WHEN time <= '10:22:00' THEN '10:20:00' WHEN time <= '10:27:00' THEN '10:25:00' WHEN time <= '10:32:00' THEN '10:30:00' WHEN time <= '10:37:00' THEN '10:35:00' WHEN time <= '10:42:00' THEN '10:40:00' WHEN time <= '10:47:00' THEN '10:45:00' WHEN time <= '10:52:00' THEN '10:50:00' WHEN time <='10:57:00' THEN '10:55:00' WHEN time <='11:02:00' THEN '11:00:00' WHEN time <='11:07:00' THEN '11:05:00' WHEN time <='11:12:00' THEN '11:10:00' WHEN time <='11:17:00' THEN '11:15:00' WHEN time <='11:22:00' THEN '11:20:00' WHEN time <='11:27:00' THEN '11:25:00' WHEN time <='11:32:00' THEN '11:30:00' WHEN (time <='13:07:00' and time > '13:00:00') THEN '13:05:00' WHEN time <='13:12:00' THEN '13:10:00' WHEN time <='13:17:00' THEN '13:15:00' WHEN time <='13:22:00' THEN '13:20:00' WHEN time <='13:27:00' THEN '13:25:00' WHEN time <='13:32:00' THEN '13:30:00' WHEN time <='13:37:00' THEN '13:35:00' WHEN time <='13:42:00' THEN '13:40:00' WHEN time <='13:47:00' THEN '13:45:00' WHEN time <='13:52:00' THEN '13:50:00' WHEN time <='13:57:00' THEN '13:55:00' WHEN time <='14:02:00' THEN '14:00:00' WHEN time <='14:07:00' THEN '14:05:00' WHEN time <='14:12:00' THEN '14:10:00' WHEN time <='14:17:00' THEN '14:15:00' WHEN time <='14:22:00' THEN '14:20:00' WHEN time <='14:27:00' THEN '14:25:00' WHEN time <='14:32:00' THEN '14:30:00' WHEN time <='14:37:00' THEN '14:35:00' WHEN time <='14:42:00' THEN '14:40:00' WHEN time <='14:47:00' THEN '14:45:00' WHEN time <='14:52:00' THEN '14:50:00' WHEN time <='14:57:00' THEN '14:55:00' WHEN time <='15:01:00' THEN '15:00:00' WHEN time <='15:07:00' THEN '15:05:00' end) as datetime);
-- UPDATE `ying`.`hs_s_sh50_rt_EM` SET `TimeSlot`='11:25:00' WHERE date = curdate() and time < '11:25:00'and time > '11:20:00';

-- UPDATE `ying`.`hs_s_sh50_rt_EM` SET `TimeSlot`='15:05:00' where date = curdate() and TimeSlot = '15:00:00' and time >= '15:00:00';



SELECT * FROM ying.hs_s_sh50_rt_EM where date = curdate() and TimeSlot = '15:00:00' and time >= '15:00:00' order by id desc;

SELECT * FROM ying.hs_s_sh50_rt_EM where date = curdate() and time >= '14:55:00' order by id desc;

SELECT * FROM ying.hs_s_sh50_rt_EM where date = curdate() and time >= '15:03:00' order by id desc;

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
    `ying`.`hs_s_sh50_z_d_Statistics`
WHERE
    date = CURDATE() - 1 or date = CURDATE();

-- 上证50股票的加权5分钟涨速指数
SELECT * FROM `ying`.`hs_s_sh50_chgrate5_weight` ORDER BY TimeSlot DESC;
DROP VIEW `ying`.`hs_s_sh50_chgrate5_weight`;    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_sh50_chgrate5_weight` AS
    SELECT
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM((`a`.`chgrate5` * `c`.`weight`)) AS `chgrate5_weight`
    FROM
        (`hs_s_sh50_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC , SUM((`a`.`chgrate5` * `c`.`weight`)) DESC;

-- 上证50股票的加权跌指数
SELECT * FROM `ying`.`hs_s_sh50_d_weight`;
DROP VIEW `ying`.`hs_s_sh50_d_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_sh50_d_weight` AS
    SELECT
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `d_weight`
    FROM
        (`hs_s_sh50_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        (`a`.`chgrate` < 0)
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;

-- 上证50股票的加权跌金指数（跌超过黄金分割点）
SELECT * FROM `ying`.`hs_s_sh50_dg_weight`;
DROP VIEW `ying`.`hs_s_sh50_dg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_sh50_dg_weight` AS
    SELECT
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `dg_weight`
    FROM
        (`hs_s_sh50_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;

-- 上证50股票的加权跌停指数
SELECT * FROM `ying`.`hs_s_sh50_dt_weight`;
DROP VIEW `ying`.`hs_s_sh50_dt_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_sh50_dt_weight` AS
    SELECT
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `dt_weight`
    FROM
        (`hs_s_sh50_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`TimeSlot`;

-- 上证50股票的涨跌个数
SELECT * FROM `ying`.`hs_s_sh50_z_d_No`;
DROP VIEW `ying`.`hs_s_sh50_z_d_No`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_sh50_z_d_No` AS
    SELECT
        `hs_s_sh50_rt_EM`.`TimeSlot` AS `TimeSlot`,
        SUM(IF((`hs_s_sh50_rt_EM`.`chgrate` > 0),
            1,
            0)) AS `z`,
        SUM(IF((`hs_s_sh50_rt_EM`.`chgrate` < 0),
            1,
            0)) AS `d`
    FROM
        `hs_s_sh50_rt_EM`
    GROUP BY `hs_s_sh50_rt_EM`.`TimeSlot`
    ORDER BY `hs_s_sh50_rt_EM`.`TimeSlot` DESC;

-- 涨跌指数统计 tedd
SELECT 
    *
FROM
    `ying`.`hs_s_sh50_z_d_Statistics`;
    
DROP VIEW `ying`.`hs_s_sh50_z_d_Statistics`;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_sh50_z_d_Statistics` AS
    SELECT
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
        (((((((((`hs_s_sh50_z_d_No` `a`
        LEFT JOIN `hs_s_sh50_zg_dg_No` `b` ON (((`a`.`TimeSlot` = `b`.`TimeSlot`))))
        LEFT JOIN `hs_s_sh50_zt_dt_No` `c` ON (((`a`.`TimeSlot` = `c`.`TimeSlot`))))
        LEFT JOIN `hs_s_sh50_z_weight` `zW` ON (((`a`.`TimeSlot` = `zW`.`TimeSlot`))))
        LEFT JOIN `hs_s_sh50_d_weight` `dW` ON (((`a`.`TimeSlot` = `dW`.`TimeSlot`))))
        LEFT JOIN `hs_s_sh50_zg_weight` `zgW` ON (((`a`.`TimeSlot` = `zgW`.`TimeSlot`))))
        LEFT JOIN `hs_s_sh50_dg_weight` `dgW` ON (((`a`.`TimeSlot` = `dgW`.`TimeSlot`))))
        LEFT JOIN `hs_s_sh50_zt_weight` `ztW` ON (((`a`.`TimeSlot` = `ztW`.`TimeSlot`))))
        LEFT JOIN `hs_s_sh50_dt_weight` `dtW` ON (((`a`.`TimeSlot` = `dtW`.`TimeSlot`))))
        LEFT JOIN `hs_s_sh50_chgrate5_weight` `rate5` ON (((`a`.`TimeSlot` = `rate5`.`TimeSlot`))))
    ORDER BY `a`.`TimeSlot` DESC;
    
-- 上证50股票的加权涨指数
SELECT * FROM `ying`.`hs_s_sh50_z_weight`;
DROP VIEW `ying`.`hs_s_sh50_z_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_sh50_z_weight` AS
    SELECT
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `z_weight`
    FROM
        (`hs_s_sh50_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        (`a`.`chgrate` > 0)
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;

-- 上证50股票的涨跌超过黄金分割点个数
SELECT 
    *
FROM
    `hs_s_sh50_zg_dg_No`;
DROP VIEW `hs_s_sh50_zg_dg_No`;    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_sh50_zg_dg_No` AS
    SELECT
        `hs_s_sh50_rt_EM`.`TimeSlot` AS `TimeSlot`,
        SUM(IF(((`hs_s_sh50_rt_EM`.`chgrate` > 0)
                AND (`hs_s_sh50_rt_EM`.`close` >= ROUND((1.0618 * ((100 * `hs_s_sh50_rt_EM`.`close`) / (100 + `hs_s_sh50_rt_EM`.`chgrate`))),
                    2))),
            1,
            0)) AS `zg`,
        SUM(IF(((`hs_s_sh50_rt_EM`.`chgrate` < 0)
                AND (`hs_s_sh50_rt_EM`.`close` <= ROUND((0.9382 * ((100 * `hs_s_sh50_rt_EM`.`close`) / (100 + `hs_s_sh50_rt_EM`.`chgrate`))),
                    2))),
            1,
            0)) AS `dg`
    FROM
        `hs_s_sh50_rt_EM`
    GROUP BY `hs_s_sh50_rt_EM`.`TimeSlot`
    ORDER BY `hs_s_sh50_rt_EM`.`TimeSlot` DESC;

-- 上证50股票的加权涨金指数（涨超过黄金分割点）
SELECT * FROM `ying`.`hs_s_sh50_zg_weight`;
DROP VIEW `ying`.`hs_s_sh50_zg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_sh50_zg_weight` AS
    SELECT
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `zg_weight`
    FROM
        (`hs_s_sh50_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.0618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY date, `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;

-- 上证50股票的涨停跌停个数
SELECT 
    *
FROM
    `hs_s_sh50_zt_dt_No`;
drop view `hs_s_sh50_zt_dt_No`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_sh50_zt_dt_No` AS
    SELECT
        `hs_s_sh50_rt_EM`.`TimeSlot` AS `TimeSlot`,
        SUM(IF(((`hs_s_sh50_rt_EM`.`chgrate` > 0)
                AND (`hs_s_sh50_rt_EM`.`close` >= ROUND((1.1 * ((100 * `hs_s_sh50_rt_EM`.`close`) / (100 + `hs_s_sh50_rt_EM`.`chgrate`))),
                    2))),
            1,
            0)) AS `zt`,
        SUM(IF(((`hs_s_sh50_rt_EM`.`chgrate` < 0)
                AND (`hs_s_sh50_rt_EM`.`close` <= ROUND((0.9 * ((100 * `hs_s_sh50_rt_EM`.`close`) / (100 + `hs_s_sh50_rt_EM`.`chgrate`))),
                    2))),
            1,
            0)) AS `dt`
    FROM
        `hs_s_sh50_rt_EM`
    GROUP BY `hs_s_sh50_rt_EM`.`TimeSlot`
    ORDER BY `hs_s_sh50_rt_EM`.`TimeSlot` DESC;	

-- 上证50股票的加权涨停指数
SELECT * FROM `ying`.`hs_s_sh50_zt_weight`;
DROP VIEW `ying`.`hs_s_sh50_zt_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_sh50_zt_weight` AS
    SELECT
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `zt_weight`
    FROM
        (`hs_s_sh50_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.1 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;

-- 选择最近时间的数据（不用subquery） sql - Fetch the row which has the Max value for a column - Stack Overflow 
SELECT 
    a.code, a.TimeSlot, a.close, a.chgrate5
FROM
    ying.hs_s_sh50_rt_EM AS a
        LEFT OUTER JOIN
    ying.hs_s_sh50_rt_EM AS b ON (a.code = b.code
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
    ying.hs_s_sh50_rt_EM
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
        ying.hs_s_sh50_rt_EM
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
        ying.hs_s_sh50_rt_EM
    WHERE
        chgrate > 0
            AND close >= ROUND(1.1 * (100 * close / (100 + chgrate)), 2)) AS a
        JOIN
    hs300_s_data_c AS c ON a.code = c.code;
    
-- 加权涨跌停指数, 没有subquery
SELECT 
    a.date, a.TimeSlot, SUM(c.weight) as zt_weight
FROM
        ying.hs_s_sh50_rt_EM as a join hs300_s_data_c AS c ON a.code = c.code
    WHERE
        a.chgrate > 0 AND a.close >= ROUND(1.1 * (100 * a.close / (100 + a.chgrate)),2) GROUP BY date, a.TimeSlot;
        
-- 加权涨跌停指数, 没有subquery
SELECT 
    a.date, a.TimeSlot, SUM(c.weight) as zt_weight
FROM
        ying.hs_s_sh50_rt_EM as a join hs300_s_data_c AS c ON a.code = c.code
    WHERE
        a.chgrate > 0 AND a.close >= ROUND(1.1 * (100 * a.close / (100 + a.chgrate)),2) GROUP BY date, a.TimeSlot;
        
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
    ying.hs_s_sh50_rt_EM AS a
        RIGHT OUTER JOIN
    hs_s AS b ON (a.code = b.code AND b.f50SH = 1)
WHERE
    id IS NOT NULL; 

select count(*) from hs_s_sh50_rt_EM;
select count(*) from hs_s_hs300_rt_EM;

select * from hs_s_sh50_rt_EM;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_sh50_rt_EM` AS
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

SELECT `hs_s_sh50_zt_dt_No`.`date` as '日期',
    `hs_s_sh50_zt_dt_No`.`TimeSlot` as '时间' ,
    `hs_s_sh50_zt_dt_No`.`zt` as '涨停股数',
    `hs_s_sh50_zt_dt_No`.`dt` as '跌停股数'
FROM `ying`.`hs_s_sh50_zt_dt_No`;

SELECT * FROM ying.hs_s_sh50_z_weight;
SELECT * FROM ying.hs_s_sh50_zt_weight;
SELECT * FROM ying.hs_s_sh50_dt_weight;