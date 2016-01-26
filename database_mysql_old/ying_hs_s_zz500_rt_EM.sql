SELECT * FROM ying.hs_s_zz500_rt_EM;

SELECT distinct code FROM ying.hs_s_zz500_rt_EM where code not in (SELECT distinct code FROM ying.hs_s where f500=1);


SELECT * FROM ying.hs_s_zz500_rt_EM where date = current_date() - 1;

DELETE FROM ying.hs_s_zz500_rt_EM WHERE date = CURRENT_DATE() - 1;

SELECT * FROM ying.hs_s_zz500_rt_EM order by id desc;

SELECT * FROM ying.hs_s_zz500_rt_EM where date = curdate() and time < '14:10:00'and time > '14:05:00';

-- UPDATE `ying`.`hs_s_zz500_rt_EM` SET `TimeSlot`='14:10:00' WHERE date = curdate() and time < '14:10:00'and time > '14:05:00';

UPDATE `ying`.`hs_s_zz500_rt_EM` SET TimeSlot =  cast(CONCAT(date, ' ', CASE WHEN time <= '09:27:00' THEN '09:25:00' WHEN time <= '09:32:00' THEN '09:30:00' WHEN time <= '09:37:00' THEN '09:35:00' WHEN time <= '09:42:00' THEN '09:40:00' WHEN time <= '09:47:00' THEN '09:45:00' WHEN time <= '09:52:00' THEN '09:50:00' WHEN time <= '09:57:00' THEN '09:55:00' WHEN time <= '10:02:00' THEN '10:00:00' WHEN time <= '10:07:00' THEN '10:05:00' WHEN time <= '10:12:00' THEN '10:10:00' WHEN time <= '10:17:00' THEN '10:15:00' WHEN time <= '10:22:00' THEN '10:20:00' WHEN time <= '10:27:00' THEN '10:25:00' WHEN time <= '10:32:00' THEN '10:30:00' WHEN time <= '10:37:00' THEN '10:35:00' WHEN time <= '10:42:00' THEN '10:40:00' WHEN time <= '10:47:00' THEN '10:45:00' WHEN time <= '10:52:00' THEN '10:50:00' WHEN time <='10:57:00' THEN '10:55:00' WHEN time <='11:02:00' THEN '11:00:00' WHEN time <='11:07:00' THEN '11:05:00' WHEN time <='11:12:00' THEN '11:10:00' WHEN time <='11:17:00' THEN '11:15:00' WHEN time <='11:22:00' THEN '11:20:00' WHEN time <='11:27:00' THEN '11:25:00' WHEN time <='11:32:00' THEN '11:30:00' WHEN (time <='13:07:00' and time > '13:00:00') THEN '13:05:00' WHEN time <='13:12:00' THEN '13:10:00' WHEN time <='13:17:00' THEN '13:15:00' WHEN time <='13:22:00' THEN '13:20:00' WHEN time <='13:27:00' THEN '13:25:00' WHEN time <='13:32:00' THEN '13:30:00' WHEN time <='13:37:00' THEN '13:35:00' WHEN time <='13:42:00' THEN '13:40:00' WHEN time <='13:47:00' THEN '13:45:00' WHEN time <='13:52:00' THEN '13:50:00' WHEN time <='13:57:00' THEN '13:55:00' WHEN time <='14:02:00' THEN '14:00:00' WHEN time <='14:07:00' THEN '14:05:00' WHEN time <='14:12:00' THEN '14:10:00' WHEN time <='14:17:00' THEN '14:15:00' WHEN time <='14:22:00' THEN '14:20:00' WHEN time <='14:27:00' THEN '14:25:00' WHEN time <='14:32:00' THEN '14:30:00' WHEN time <='14:37:00' THEN '14:35:00' WHEN time <='14:42:00' THEN '14:40:00' WHEN time <='14:47:00' THEN '14:45:00' WHEN time <='14:52:00' THEN '14:50:00' WHEN time <='14:57:00' THEN '14:55:00' WHEN time <='15:01:00' THEN '15:00:00' WHEN time <='15:07:00' THEN '15:05:00' end) as datetime);


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

SELECT 
        `hs_s_zz500_rt_EM`.`date` AS `date`,
        `hs_s_zz500_rt_EM`.`TimeSlot` AS `TimeSlot`,
        SUM(IF(((`hs_s_zz500_rt_EM`.`chgrate` > 0)
                AND (`hs_s_zz500_rt_EM`.`close` >= ROUND((1.1 * ((100 * `hs_s_zz500_rt_EM`.`close`) / (100 + `hs_s_zz500_rt_EM`.`chgrate`))),
                    2))),
            1,
            0)) AS `zt`,
        SUM(IF(((`hs_s_zz500_rt_EM`.`chgrate` < 0)
                AND (`hs_s_zz500_rt_EM`.`close` <= ROUND((0.9 * ((100 * `hs_s_zz500_rt_EM`.`close`) / (100 + `hs_s_zz500_rt_EM`.`chgrate`))),
                    2))),
            1,
            0)) AS `dt`
    FROM
        `hs_s_zz500_rt_EM`
    GROUP BY `hs_s_zz500_rt_EM`.`date`, `hs_s_zz500_rt_EM`.`TimeSlot`
    ORDER BY `hs_s_zz500_rt_EM`.`date` DESC , `hs_s_zz500_rt_EM`.`TimeSlot` DESC;

SELECT * FROM ying.hs_s_zz500_rt_EM order by date desc, TimeSlot desc;

SELECT `hs_s_zz500_zt_dt_No`.`date` as '日期',
    `hs_s_zz500_zt_dt_No`.`TimeSlot` as '时间' ,
    `hs_s_zz500_zt_dt_No`.`zt` as '涨停股数',
    `hs_s_zz500_zt_dt_No`.`dt` as '跌停股数'
FROM `ying`.`hs_s_zz500_zt_dt_No`;

SELECT * FROM ying.hs_s_zz500_z_weight;
SELECT * FROM ying.hs_s_zz500_zt_weight;
SELECT * FROM ying.hs_s_zz500_dt_weight;

-- 中证500股票的涨跌个数
SELECT * FROM `ying`.`hs_s_zz500_z_d_No` order by TimeSlot desc;
DROP VIEW `ying`.`hs_s_zz500_z_d_No`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_zz500_z_d_No` AS
    SELECT 
        TimeSlot,
        SUM(IF(chgrate > 0, 1, 0)) AS z,
        SUM(IF(chgrate < 0, 1, 0)) AS d
    FROM
        ying.hs_s_zz500_rt_EM
    GROUP BY TimeSlot
    ORDER BY TimeSlot DESC;
	
-- 沪深300股票的涨停跌停个数
SELECT * FROM `ying`.`hs_s_zz500_zt_dt_No` order by TimeSlot desc;
DROP VIEW `ying`.`hs_s_zz500_zt_dt_No`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_zz500_zt_dt_No` AS
    SELECT
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
        ying.hs_s_zz500_rt_EM
    GROUP BY TimeSlot
    ORDER BY TimeSlot DESC;
    
-- 沪深300股票的加权5分钟涨速指数
SELECT * FROM `ying`.`hs_s_zz500_chgrate5_weight` ORDER BY TimeSlot DESC;
DROP VIEW `ying`.`hs_s_zz500_chgrate5_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_zz500_chgrate5_weight` AS
    SELECT
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`a`.`chgrate5` * `c`.`weight`) AS `chgrate5_weight`
    FROM
        (`hs_s_zz500_rt_EM` `a`
        JOIN `zz500_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC,`chgrate5_weight` DESC;
	
-- 沪深300股票的加权涨指数
SELECT * FROM `ying`.`hs_s_zz500_z_weight`;
-- DROP VIEW `ying`.`hs_s_zz500_z_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_zz500_z_weight` AS
    SELECT 
        `a`.`date` AS `date`,
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `z_weight`
    FROM
        (`hs_s_zz500_rt_EM` `a`
        JOIN `zz500_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        `a`.`chgrate` > 0
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`date` DESC , `a`.`TimeSlot` DESC;
	
-- 沪深300股票的加权涨停指数
SELECT * FROM `ying`.`hs_s_zz500_zt_weight`;
-- DROP VIEW `ying`.`hs_s_zz500_zt_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_zz500_zt_weight` AS
    SELECT 
        `a`.`date` AS `date`,
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `zt_weight`
    FROM
        (`hs_s_zz500_rt_EM` `a`
        JOIN `zz500_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.1 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`date` DESC , `a`.`TimeSlot` DESC;



-- 沪深300股票的加权跌停指数
SELECT * FROM `ying`.`hs_s_zz500_dt_weight`;
DROP VIEW `ying`.`hs_s_zz500_dt_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_zz500_dt_weight` AS
    SELECT 
        `a`.`date` AS `date`,
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `dt_weight`
    FROM
        (`hs_s_zz500_rt_EM` `a`
        JOIN `zz500_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`TimeSlot`;

-- 选择最近时间的数据（不用subquery） sql - Fetch the row which has the Max value for a column - Stack Overflow 
SELECT 
    a.code, a.TimeSlot, a.close, a.chgrate5
FROM
    ying.hs_s_zz500_rt_EM AS a
        LEFT OUTER JOIN
    ying.hs_s_zz500_rt_EM AS b ON (a.code = b.code
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
    ying.hs_s_zz500_rt_EM
WHERE
    date = CURDATE()
GROUP BY TimeSlot
ORDER BY TimeSlot DESC;

-- 加权涨跌停指数, 有subquery
SELECT 
    SUM(c.weight)
FROM
    (SELECT 
        code
    FROM
        ying.hs_s_zz500_rt_EM
    WHERE
        chgrate > 0
            AND close >= ROUND(1.1 * (100 * close / (100 + chgrate)), 2)) AS a
        JOIN
    zz500_s_data_c AS c ON a.code = c.code;
    
-- 加权涨跌停指数, 有subquery
SELECT 
    SUM(c.weight)
FROM
    (SELECT 
        code
    FROM
        ying.hs_s_zz500_rt_EM
    WHERE
        chgrate > 0
            AND close >= ROUND(1.1 * (100 * close / (100 + chgrate)), 2)) AS a
        JOIN
    zz500_s_data_c AS c ON a.code = c.code;
    
-- 加权涨跌停指数, 没有subquery
SELECT 
    a.TimeSlot, SUM(c.weight) as zt_weight
FROM
        ying.hs_s_zz500_rt_EM as a join zz500_s_data_c AS c ON a.code = c.code
    WHERE
        a.chgrate > 0 AND a.close >= ROUND(1.1 * (100 * a.close / (100 + a.chgrate)),2) group by a.TimeSlot;
        
-- 加权涨跌停指数, 没有subquery
SELECT 
    a.TimeSlot, SUM(c.weight) as zt_weight
FROM
        ying.hs_s_zz500_rt_EM as a join zz500_s_data_c AS c ON a.code = c.code
    WHERE
        a.chgrate > 0 AND a.close >= ROUND(1.1 * (100 * a.close / (100 + a.chgrate)),2) group by a.TimeSlot;