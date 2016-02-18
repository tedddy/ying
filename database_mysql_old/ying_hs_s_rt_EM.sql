-- too slow
select * FROM hs_s_rt_EM WHERE id NOT IN (SELECT MIN(id) FROM hs_s_rt_EM GROUP BY code, TimeSlot);

SELECT DISTINCT
    code, TimeSlot
FROM
    hs_s_rt_EM
WHERE
    TIME(TimeSlot) = '09:30:00'
        AND DATE(TimeSlot) > '2015-10-01'
        AND id NOT IN (SELECT 
            minid
        FROM
            (SELECT 
                MAX(id) AS minid
            FROM
                hs_s_rt_EM
            GROUP BY code , TimeSlot) AS newtable)
ORDER BY TimeSlot DESC , code;

SELECT 
    MAX(id) AS minid
FROM
    hs_s_rt_EM
GROUP BY code , TimeSlot;

SELECT 
    code, TimeSlot, count(id) AS minid
FROM
    hs_s_rt_EM
GROUP BY code , TimeSlot;

select * FROM hs_s_rt_EM WHERE DATE(TimeSlot) > '2015-10-01' ORDER BY TimeSlot;

select * FROM hs_s_rt_EM WHERE id NOT IN (SELECT MIN(id) FROM hs_s_rt_EM where time(TimeSlot) = '09:30:00' GROUP BY code, TimeSlot);

-- DELETE FROM hs_s_rt_EM WHERE id NOT IN (SELECT MIN(id) FROM hs_s_rt_EM GROUP BY code, TimeSlot);

SELECT * FROM ying.hs_s_rt_EM WHERE TimeSlot = '2015-10-22 09:30:00' ORDER BY code, TimeSlot DESC;

SELECT * FROM `ying`.`hs_s_rt_EM` WHERE `code`='601318' ORDER BY TimeSlot DESC;

-- DELETE FROM `ying`.`hs_s_rt_EM` WHERE `code`='601002' and`TimeSlot`='2015-10-12 10:30:00';

SELECT * FROM ying.hs_s_rt_EM WHERE code = '601002' ORDER BY TimeSlot DESC;

CALL hs_s_rt_EM('601002','11.75','29367','251791','1.64','10.78','-0.25','2.02','2015-10-12','10:28:48');

-- 2 row(s) affected, 2 warning(s): 1264 Out of range value for column 'TimeSlot' at row 10001 1364 Field 'id' doesn't have a default value

-- 1 row(s) affected, 1 warning(s): 1264 Out of range value for column 'TimeSlot' at row 1996068

-- 1 row(s) affected, 1 warning(s): 1264 Out of range value for column 'TimeSlot' at row 10001

-- 2 row(s) affected, 2 warning(s): 1264 Out of range value for column 'TimeSlot' at row 858 1364 Field 'id' doesn't have a default value

-- 1 row(s) affected, 1 warning(s): 1264 Out of range value for column 'TimeSlot' at row 1998317

ALTER TABLE ying.hs_s_rt_EM ADD PRIMARY KEY(code,TimeSlot);


ALTER TABLE ying.hs_s_rt_EM AUTO_INCREMENT = 1996068;


SELECT * FROM ying.hs_s_rt_EM ORDER BY code, idsub;

SELECT * FROM ying.hs_s_rt_EM WHERE code IS NULL OR close IS NULL;
DELETE FROM ying.hs_s_rt_EM WHERE code IS NULL OR close IS NULL;

DELETE FROM `ying`.`hs_s_hs300_rt_EM` WHERE `id`<='10269' AND `id`>='7492';

DELETE FROM `ying`.`hs_s_rt_EM` WHERE time > '09:59:00' AND TimeSlot = '2015-09-11 10:00:00';
DELETE FROM `ying`.`hs_s_rt_EM` WHERE time > '09:59:00' AND TimeSlot = '2015-09-10 10:00:00';

DELETE FROM `ying`.`hs_s_rt_EM` WHERE time < '13:59:00' AND TimeSlot = '2015-09-11 14:00:00';
DELETE FROM `ying`.`hs_s_rt_EM` WHERE time < '13:59:00' AND TimeSlot = '2015-09-10 14:00:00';

SELECT * FROM ying.hs_s_rt_EM;

SELECT * FROM ying.hs_s_rt_EM WHERE close = 0.00;
-- delete from ying.hs_s_rt_EM where close = 0.00;

SELECT * FROM ying.hs_s_rt_EM WHERE
	
            (`date` = CURDATE())
            AND (`chgrate` > 0)
            AND (`close` >= ROUND((1.1 * ((100 * `close`) / (100 + `chgrate`))),
                2));

SELECT * FROM ying.hs_s_rt_EM WHERE code = '600000';

SELECT * FROM ying.hs_s_rt_EM WHERE date = CURDATE() ORDER BY id DESC;

SELECT * FROM ying.hs_s_rt_EM WHERE TimeSlot = '2015-09-08 15:05:00' ORDER BY id DESC ;

SELECT * FROM ying.hs_s_rt_EM WHERE date = CURDATE() AND time < '11:20:00' AND time > '11:15:00';

-- UPDATE `ying`.`hs_s_rt_EM` SET `TimeSlot`='11:25:00' WHERE date = curdate() and time < '11:25:00'and time > '11:20:00';

UPDATE `ying`.`hs_s_rt_EM` SET `datetime`=CAST(CONCAT(date,' ',TimeSlot) AS DATETIME);

SELECT * FROM ying.hs_s_rt_EM WHERE date = CURDATE() AND time < '10:48:00'AND time > '10:35:00';

UPDATE `ying`.`hs_s_rt_EM` SET `TimeSlot`= '09:50:00' WHERE date = CURDATE() AND time < '09:50:00'AND time > '09:45:00';

SELECT * FROM ying.hs_s_rt_EM ORDER BY id DESC;

SET TimeSlot =  CASE WHEN time <= '09:27:00' THEN '09:25:00' WHEN time <= '09:32:00' THEN '09:30:00' WHEN time <= '09:37:00' THEN '09:35:00' WHEN time <= '09:42:00' THEN '09:40:00' WHEN time <= '09:47:00' THEN '09:45:00' WHEN time <= '09:52:00' THEN '09:50:00' WHEN time <= '09:57:00' THEN '09:55:00' WHEN time <= '10:02:00' THEN '10:00:00' WHEN time <= '10:07:00' THEN '10:05:00' WHEN time <= '10:12:00' THEN '10:10:00' WHEN time <= '10:17:00' THEN '10:15:00' WHEN time <= '10:22:00' THEN '10:20:00' WHEN time <= '10:27:00' THEN '10:25:00' WHEN time <= '10:32:00' THEN '10:30:00' WHEN time <= '10:37:00' THEN '10:35:00' WHEN time <= '10:42:00' THEN '10:40:00' WHEN time <= '10:47:00' THEN '10:45:00' WHEN time <= '10:52:00' THEN '10:50:00' WHEN time <='10:57:00' THEN '10:55:00' WHEN time <='11:02:00' THEN '11:00:00' WHEN time <='11:07:00' THEN '11:05:00' WHEN time <='11:12:00' THEN '11:10:00' WHEN time <='11:17:00' THEN '11:15:00' WHEN time <='11:22:00' THEN '11:20:00' WHEN time <='11:27:00' THEN '11:25:00' WHEN time <='11:32:00' THEN '11:30:00' WHEN (time <='13:07:00' AND time > '13:00:00') THEN '13:05:00' WHEN time <='13:12:00' THEN '13:10:00' WHEN time <='13:17:00' THEN '13:15:00' WHEN time <='13:22:00' THEN '13:20:00' WHEN time <='13:27:00' THEN '13:25:00' WHEN time <='13:32:00' THEN '13:30:00' WHEN time <='13:37:00' THEN '13:35:00' WHEN time <='13:42:00' THEN '13:40:00' WHEN time <='13:47:00' THEN '13:45:00' WHEN time <='13:52:00' THEN '13:50:00' WHEN time <='13:57:00' THEN '13:55:00' WHEN time <='14:02:00' THEN '14:00:00' WHEN time <='14:07:00' THEN '14:05:00' WHEN time <='14:12:00' THEN '14:10:00' WHEN time <='14:17:00' THEN '14:15:00' WHEN time <='14:22:00' THEN '14:20:00' WHEN time <='14:27:00' THEN '14:25:00' WHEN time <='14:32:00' THEN '14:30:00' WHEN time <='14:37:00' THEN '14:35:00' WHEN time <='14:42:00' THEN '14:40:00' WHEN time <='14:47:00' THEN '14:45:00' WHEN time <='14:52:00' THEN '14:50:00' WHEN time <='14:57:00' THEN '14:55:00' WHEN time <='15:01:00' THEN '15:00:00' WHEN time <='15:07:00' THEN '15:05:00' END;


UPDATE `ying`.`hs_s_rt_EM` SET TimeSlot =  CASE WHEN time <= '09:27:00' THEN '09:25:00' WHEN time <= '09:32:00' THEN '09:30:00' WHEN time <= '09:37:00' THEN '09:35:00' WHEN time <= '09:42:00' THEN '09:40:00' WHEN time <= '09:47:00' THEN '09:45:00' WHEN time <= '09:52:00' THEN '09:50:00' WHEN time <= '09:57:00' THEN '09:55:00' WHEN time <= '10:02:00' THEN '10:00:00' WHEN time <= '10:07:00' THEN '10:05:00' WHEN time <= '10:12:00' THEN '10:10:00' WHEN time <= '10:17:00' THEN '10:15:00' WHEN time <= '10:22:00' THEN '10:20:00' WHEN time <= '10:27:00' THEN '10:25:00' WHEN time <= '10:32:00' THEN '10:30:00' WHEN time <= '10:37:00' THEN '10:35:00' WHEN time <= '10:42:00' THEN '10:40:00' WHEN time <= '10:47:00' THEN '10:45:00' WHEN time <= '10:52:00' THEN '10:50:00' WHEN time <='10:57:00' THEN '10:55:00' WHEN time <='11:02:00' THEN '11:00:00' WHEN time <='11:07:00' THEN '11:05:00' WHEN time <='11:12:00' THEN '11:10:00' WHEN time <='11:17:00' THEN '11:15:00' WHEN time <='11:22:00' THEN '11:20:00' WHEN time <='11:27:00' THEN '11:25:00' WHEN time <='11:32:00' THEN '11:30:00' WHEN (time <='13:07:00' AND time > '13:00:00') THEN '13:05:00' WHEN time <='13:12:00' THEN '13:10:00' WHEN time <='13:17:00' THEN '13:15:00' WHEN time <='13:22:00' THEN '13:20:00' WHEN time <='13:27:00' THEN '13:25:00' WHEN time <='13:32:00' THEN '13:30:00' WHEN time <='13:37:00' THEN '13:35:00' WHEN time <='13:42:00' THEN '13:40:00' WHEN time <='13:47:00' THEN '13:45:00' WHEN time <='13:52:00' THEN '13:50:00' WHEN time <='13:57:00' THEN '13:55:00' WHEN time <='14:02:00' THEN '14:00:00' WHEN time <='14:07:00' THEN '14:05:00' WHEN time <='14:12:00' THEN '14:10:00' WHEN time <='14:17:00' THEN '14:15:00' WHEN time <='14:22:00' THEN '14:20:00' WHEN time <='14:27:00' THEN '14:25:00' WHEN time <='14:32:00' THEN '14:30:00' WHEN time <='14:37:00' THEN '14:35:00' WHEN time <='14:42:00' THEN '14:40:00' WHEN time <='14:47:00' THEN '14:45:00' WHEN time <='14:52:00' THEN '14:50:00' WHEN time <='14:57:00' THEN '14:55:00' WHEN time <='15:01:00' THEN '15:00:00' WHEN time <='15:07:00' THEN '15:05:00' END WHERE date = CURDATE();

-- UPDATE `ying`.`hs_s_rt_EM` SET TimeSlot = NULL;

UPDATE `ying`.`hs_s_rt_EM` SET TimeSlot = TIME(datetime); -- tedd

-- 选择当前的涨跌停股票（从当日最近时间的数据中选取，有subquery）
SELECT 
    latest.code, latest.time_latest, rt300.close, rt300.chgrate
FROM
    (SELECT 
        code, MAX(time) AS time_latest
    FROM
        ying.hs_s_rt_EM
    WHERE
        date = CURDATE() - 2
    GROUP BY code) AS latest
        JOIN
    ying.hs_s_rt_EM AS rt300 ON latest.code = rt300.code
        AND latest.time_latest = rt300.time
WHERE
    ((`rt300`.`chgrate` > 0)
        AND (`rt300`.`close` >= ROUND((1.1 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
            2))) OR ((`rt300`.`chgrate` < 0)
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
    date = CURDATE() - 1 OR date = CURDATE();

-- 在表ying.hs_s_rt_EM中选择沪深300的数据    
SELECT * FROM hs_s_hs300_rt_EM_view;
DROP VIEW hs_s_hs300_rt_EM_view;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_rt_EM_view` AS
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
        (`hs_s` `b`
        LEFT JOIN `hs_s_rt_EM` `a` ON (((`a`.`code` = `b`.`code`)
            AND (`b`.`f300` = 1))))
    WHERE
        (`a`.`id` IS NOT NULL)
    ORDER BY `a`.`TimeSlot` DESC;

-- 在表ying.hs_s_rt_EM中选择中证500的数据    
SELECT * FROM hs_s_zz500_rt_EM_view;
-- DROP VIEW hs_s_zz500_rt_EM_view;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_zz500_rt_EM_view` AS
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
        (`hs_s` `b`
        LEFT JOIN `hs_s_rt_EM` `a` ON (((`a`.`code` = `b`.`code`)
            AND (`b`.`f500` = 1))))
    WHERE
        (`a`.`id` IS NOT NULL)
    ORDER BY `a`.`TimeSlot` DESC;	
		
-- 在表ying.hs_s_rt_EM中选择上证50的数据    
SELECT * FROM hs_s_sh50_rt_EM_view;
DROP VIEW hs_s_sh50_rt_EM_view;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_sh50_rt_EM_view` AS
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
        (`hs_s` `b`
        LEFT JOIN `hs_s_rt_EM` `a` ON (((`a`.`code` = `b`.`code`)
            AND (`b`.`f50SH` = 1))))
    WHERE
        (`a`.`id` IS NOT NULL)
    ORDER BY `a`.`TimeSlot` DESC;

-- CREATE 
--     ALGORITHM = UNDEFINED 
--     DEFINER = `gxh`@`%` 
--     SQL SECURITY DEFINER
-- VIEW `hs_s_sh50_rt_EM_view` AS
-- SELECT 
--     a.id,
--     a.code,
--     a.close,
--     a.amount,
--     a.volume,
--     a.chgrate,
--     a.WeiBi,
--     a.chgrate5,
--     a.LiangBi,
--     a.date,
--     a.time,
--     a.TimeSlot
-- FROM
--     ying.hs_s_rt_EM AS a
--         RIGHT OUTER JOIN
--     hs_s AS b ON (a.code = b.code AND b.f50SH = 1)
-- WHERE
--     id IS NOT NULL
-- ORDER BY TimeSlot DESC;
		

-- 沪深300股票的加权5分钟涨速指数
SELECT * FROM `ying`.`hs_s_hs300_chgrate5_weight` ORDER BY TimeSlot DESC;
DROP VIEW `ying`.`hs_s_hs300_chgrate5_weight`;    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_chgrate5_weight` AS
    SELECT
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM((`a`.`chgrate5` * `c`.`weight`)) AS `chgrate5_weight`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC , SUM((`a`.`chgrate5` * `c`.`weight`)) DESC;

-- 沪深300股票的加权跌指数
SELECT * FROM `ying`.`hs_s_hs300_d_weight`;
DROP VIEW `ying`.`hs_s_hs300_d_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_d_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `d_weight`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        (`a`.`chgrate` < 0)
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;

-- 沪深300股票的加权跌金指数（跌超过黄金分割点）
SELECT * FROM `ying`.`hs_s_hs300_dg_weight`;
DROP VIEW `ying`.`hs_s_hs300_dg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_dg_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `dg_weight`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;

-- 沪深300股票的加权跌停指数
SELECT * FROM `ying`.`hs_s_hs300_dt_weight`;
DROP VIEW `ying`.`hs_s_hs300_dt_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_dt_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `dt_weight`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY  `a`.`TimeSlot`;

-- 沪深300股票的涨跌个数
SELECT * FROM `ying`.`hs_s_hs300_z_d_No`;
DROP VIEW `ying`.`hs_s_hs300_z_d_No`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_z_d_No` AS
    SELECT
        `hs_s_rt_EM`.`TimeSlot` AS `TimeSlot`,
        SUM(IF((`hs_s_rt_EM`.`chgrate` > 0),
            1,
            0)) AS `z`,
        SUM(IF((`hs_s_rt_EM`.`chgrate` < 0),
            1,
            0)) AS `d`
    FROM
        `hs_s_rt_EM`
    GROUP BY `hs_s_rt_EM`.`TimeSlot`
    ORDER BY `hs_s_rt_EM`.`TimeSlot` DESC;


-- 沪深300股票的加权涨指数
SELECT * FROM `ying`.`hs_s_hs300_z_weight`;
DROP VIEW `ying`.`hs_s_hs300_z_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_z_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `z_weight`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        (`a`.`chgrate` > 0)
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;

-- view 选择当前的涨跌过黄金分割点的股票（从当日最近时间的数据中选取）
SELECT * FROM ying.hs_s_hs300_zg_dg;
DROP VIEW `ying`.`hs_s_hs300_zg_dg`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zg_dg` AS
    SELECT 
        `rt300`.`code` AS `code`,
        `hs_s`.`name` AS `name`,
        `rt300`.`close` AS `close`,
        `rt300`.`chgrate` AS `chgrate`
    FROM
        ((`hs_s_rt_EM` `rt300`
        LEFT JOIN `hs_s_rt_EM` `b` ON (((`rt300`.`code` = `b`.`code`)
            AND ((`rt300`.`TimeSlot` < `b`.`TimeSlot`)
            OR ((`rt300`.`TimeSlot` = `b`.`TimeSlot`)
            AND (`rt300`.`id` < `b`.`id`))))))
        LEFT JOIN `hs_s` ON ((`rt300`.`code` = `hs_s`.`code`)))
    WHERE
        ((ISNULL(`b`.`code`)
            AND (`rt300`.`chgrate` > 0)
            AND (`rt300`.`close` >= ROUND((1.0618 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`code`)
            AND (`rt300`.`chgrate` < 0)
            AND (`rt300`.`close` <= ROUND((0.9382 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
                2))))
    ORDER BY `rt300`.`code`;
	
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
        `hs_s_rt_EM`.`TimeSlot` AS `TimeSlot`,
        SUM(IF(((`hs_s_rt_EM`.`chgrate` > 0)
                AND (`hs_s_rt_EM`.`close` >= ROUND((1.0618 * ((100 * `hs_s_rt_EM`.`close`) / (100 + `hs_s_rt_EM`.`chgrate`))),
                    2))),
            1,
            0)) AS `zg`,
        SUM(IF(((`hs_s_rt_EM`.`chgrate` < 0)
                AND (`hs_s_rt_EM`.`close` <= ROUND((0.9382 * ((100 * `hs_s_rt_EM`.`close`) / (100 + `hs_s_rt_EM`.`chgrate`))),
                    2))),
            1,
            0)) AS `dg`
    FROM
        `hs_s_rt_EM`
    GROUP BY `hs_s_rt_EM`.`TimeSlot`
    ORDER BY `hs_s_rt_EM`.`TimeSlot` DESC;

-- 沪深300股票的加权涨金指数（涨超过黄金分割点）
SELECT * FROM `ying`.`hs_s_hs300_zg_weight`;
DROP VIEW `ying`.`hs_s_hs300_zg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zg_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `zg_weight`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.0618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY date, `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;

-- 沪深300股票的涨停跌停个数
SELECT 
    *
FROM
    `hs_s_hs300_zt_dt_No`;
DROP VIEW `hs_s_hs300_zt_dt_No`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zt_dt_No` AS
    SELECT
        `hs_s_rt_EM`.`TimeSlot` AS `TimeSlot`,
        SUM(IF(((`hs_s_rt_EM`.`chgrate` > 0)
                AND (`hs_s_rt_EM`.`close` >= ROUND((1.1 * ((100 * `hs_s_rt_EM`.`close`) / (100 + `hs_s_rt_EM`.`chgrate`))),
                    2))),
            1,
            0)) AS `zt`,
        SUM(IF(((`hs_s_rt_EM`.`chgrate` < 0)
                AND (`hs_s_rt_EM`.`close` <= ROUND((0.9 * ((100 * `hs_s_rt_EM`.`close`) / (100 + `hs_s_rt_EM`.`chgrate`))),
                    2))),
            1,
            0)) AS `dt`
    FROM
        `hs_s_rt_EM`
    GROUP BY `hs_s_rt_EM`.`TimeSlot`
    ORDER BY `hs_s_rt_EM`.`TimeSlot` DESC;	

-- 沪深300股票的加权涨停指数
SELECT * FROM `ying`.`hs_s_hs300_zt_weight`;
DROP VIEW `ying`.`hs_s_hs300_zt_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zt_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `zt_weight`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.1 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;
	
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
        ((`hs_s_rt_EM` `rt300`
        LEFT JOIN `hs_s_rt_EM` `b` ON (((`rt300`.`code` = `b`.`code`)
            AND ((`rt300`.`TimeSlot` < `b`.`TimeSlot`)
            OR ((`rt300`.`TimeSlot` = `b`.`TimeSlot`)
            AND (`rt300`.`id` < `b`.`id`))))))
        LEFT JOIN `hs_s` ON ((`rt300`.`code` = `hs_s`.`code`)))
    WHERE
        ((ISNULL(`b`.`code`)
            AND (`rt300`.`chgrate` > 0)
            AND (`rt300`.`close` >= ROUND((1.1 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`code`)
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
--         (`hs_s_rt_EM` `rt300`
--         LEFT JOIN `hs_s_rt_EM` `b` ON (((`rt300`.`code` = `b`.`code`)
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
        (`hs_s_rt_EM` `rt300`
        LEFT JOIN `hs_s_rt_EM` `b` ON (((`rt300`.`code` = `b`.`code`)
            AND ((`rt300`.`TimeSlot` < `b`.`TimeSlot`)
            OR ((`rt300`.`TimeSlot` = `b`.`TimeSlot`)
            AND (`rt300`.`id` < `b`.`id`))))))
    WHERE
        ISNULL(`b`.`code`)
    ORDER BY `rt300`.`code`;
        
-- 涨跌指数统计
SELECT * FROM `ying`.`hs_s_hs300_z_d_Statistics`;
DROP VIEW `ying`.`hs_s_hs300_z_d_Statistics`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_z_d_Statistics` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        `rate5`.`chgrate5_weight` AS `rate5`,
        `a`.`z` AS `z`,
        `a`.`d` AS `d`,
        (`a`.`z` - `a`.`d`) AS `z-d`,
        IFNULL(`zW`.`z_weight`, 0) AS `zW`,
        IFNULL(`dW`.`d_weight`, 0) AS `dW`,
        (IFNULL(`zW`.`z_weight`, 0) - IFNULL(`dW`.`d_weight`, 0)) AS `zW-dW`,
        `b`.`zg` AS `zg`,
        `b`.`dg` AS `dg`,
        IFNULL(`zgW`.`zg_weight`, 0) AS `zgW`,
        IFNULL(`dgW`.`dg_weight`, 0) AS `dgW`,
        (IFNULL(`zgW`.`zg_weight`, 0) - IFNULL(`dgW`.`dg_weight`, 0)) AS `zgW-dgW`,
        `c`.`zt` AS `zt`,
        `c`.`dt` AS `dt`,
        IFNULL(`ztW`.`zt_weight`, 0) AS `ztW`,
        IFNULL(`dtW`.`dt_weight`, 0) AS `dtW`,
        (IFNULL(`ztW`.`zt_weight`, 0) - IFNULL(`dtW`.`dt_weight`, 0)) AS `ztW-dtW`
    FROM
        (((((((((`hs_s_hs300_z_d_No` `a`
        LEFT JOIN `hs_s_hs300_zg_dg_No` `b` ON ((`a`.`TimeSlot` = `b`.`TimeSlot`)))
        LEFT JOIN `hs_s_hs300_zt_dt_No` `c` ON ((`a`.`TimeSlot` = `c`.`TimeSlot`)))
        LEFT JOIN `hs_s_hs300_z_weight` `zW` ON ((`a`.`TimeSlot` = `zW`.`TimeSlot`)))
        LEFT JOIN `hs_s_hs300_d_weight` `dW` ON ((`a`.`TimeSlot` = `dW`.`TimeSlot`)))
        LEFT JOIN `hs_s_hs300_zg_weight` `zgW` ON ((`a`.`TimeSlot` = `zgW`.`TimeSlot`)))
        LEFT JOIN `hs_s_hs300_dg_weight` `dgW` ON ((`a`.`TimeSlot` = `dgW`.`TimeSlot`)))
        LEFT JOIN `hs_s_hs300_zt_weight` `ztW` ON ((`a`.`TimeSlot` = `ztW`.`TimeSlot`)))
        LEFT JOIN `hs_s_hs300_dt_weight` `dtW` ON ((`a`.`TimeSlot` = `dtW`.`TimeSlot`)))
        LEFT JOIN `hs_s_hs300_chgrate5_weight` `rate5` ON ((`a`.`TimeSlot` = `rate5`.`TimeSlot`)))
    ORDER BY `a`.`TimeSlot` DESC;


-- 选择最近时间的数据（不用subquery） sql - Fetch the row which has the Max value for a column - Stack Overflow 
SELECT 
    a.code, a.TimeSlot, a.close, a.chgrate5
FROM
    ying.hs_s_rt_EM AS a
        LEFT OUTER JOIN
    ying.hs_s_rt_EM AS b ON (a.code = b.code
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
    ying.hs_s_rt_EM
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
        ying.hs_s_rt_EM
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
        ying.hs_s_rt_EM
    WHERE
        chgrate > 0
            AND close >= ROUND(1.1 * (100 * close / (100 + chgrate)), 2)) AS a
        JOIN
    hs300_s_data_c AS c ON a.code = c.code;
    
-- 加权涨跌停指数, 没有subquery
SELECT 
    a.date, a.TimeSlot, SUM(c.weight) AS zt_weight
FROM
        ying.hs_s_rt_EM AS a JOIN hs300_s_data_c AS c ON a.code = c.code
    WHERE
        a.chgrate > 0 AND a.close >= ROUND(1.1 * (100 * a.close / (100 + a.chgrate)),2) GROUP BY date, a.TimeSlot;
        
-- 加权涨跌停指数, 没有subquery
SELECT 
    a.date, a.TimeSlot, SUM(c.weight) AS zt_weight
FROM
        ying.hs_s_rt_EM AS a JOIN hs300_s_data_c AS c ON a.code = c.code
    WHERE
        a.chgrate > 0 AND a.close >= ROUND(1.1 * (100 * a.close / (100 + a.chgrate)),2) GROUP BY date, a.TimeSlot;



-- 在表ying.hs_s_rt_EM中选择上证50的数据    
SELECT * FROM hs_s_sh50_rt_EM_view_1;
DROP VIEW hs_s_sh50_rt_EM_view_1;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_sh50_rt_EM_view_1` AS
-- SELECT 
--     *
-- FROM
--     ying.hs_s_rt_EM
-- WHERE
--     code IN (SELECT DISTINCT
--             a.`code`
--         FROM
--             `ying`.`hs_bk_gp_info_EM` AS a
--                 JOIN
--             ying.hs_bk_info_EM AS b ON (a.code_bk = b.code_bk)
--                 JOIN
--             ying.hs_bkhq_rt_EM AS c ON (b.name_bk = c.name_bk)
--         WHERE
--             b.name_bk = '上证50'
--         ORDER BY a.`DateSys` DESC , c.`chgrate_bk` DESC); 
-- CREATE 
--     ALGORITHM = UNDEFINED 
--     DEFINER = `gxh`@`%` 
--     SQL SECURITY DEFINER
-- VIEW `hs_s_sh50_rt_EM_view_1` AS
    SELECT 
        `hs_s_rt_EM`.`id` AS `id`,
        `hs_s_rt_EM`.`code` AS `code`,
        `hs_s_rt_EM`.`close` AS `close`,
        `hs_s_rt_EM`.`amount` AS `amount`,
        `hs_s_rt_EM`.`volume` AS `volume`,
        `hs_s_rt_EM`.`chgrate` AS `chgrate`,
        `hs_s_rt_EM`.`WeiBi` AS `WeiBi`,
        `hs_s_rt_EM`.`chgrate5` AS `chgrate5`,
        `hs_s_rt_EM`.`LiangBi` AS `LiangBi`,
        `hs_s_rt_EM`.`date` AS `date`,
        `hs_s_rt_EM`.`time` AS `time`,
        `hs_s_rt_EM`.`TimeSlot` AS `TimeSlot`
    FROM
        `hs_s_rt_EM`
    WHERE
        `hs_s_rt_EM`.`code` IN (SELECT DISTINCT
                `a`.`code`
            FROM
                ((`hs_bk_gp_info_EM` `a`
                JOIN `hs_bk_info_EM` `b` ON ((`a`.`code_bk` = `b`.`code_bk`)))
                JOIN `hs_bkhq_rt_EM` `c` ON ((`b`.`name_bk` = `c`.`name_bk`)))
            WHERE
                (`b`.`name_bk` = '上证50')
            ORDER BY `a`.`DateSys` DESC , `c`.`chgrate_bk` DESC) ORDER BY TimeSlot DESC;

    

-- 在表ying.hs_s_rt_EM中选择上证50的数据 tedd        
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
    ying.hs_s_rt_EM AS a
        RIGHT OUTER JOIN
    hs_s AS b ON (a.code = b.code AND b.f50SH = 1)
WHERE
    id IS NOT NULL
ORDER BY TimeSlot DESC;

-- 在表ying.hs_s_rt_EM中统计上证50的数据条数 tedd      
SELECT 
    COUNT(a.id)
FROM
    ying.hs_s_rt_EM AS a
        RIGHT OUTER JOIN
    hs_s AS b ON (a.code = b.code AND b.f50SH = 1)
WHERE
    id IS NOT NULL; 

SELECT COUNT(*) FROM hs_s_sh50_rt_EM;
SELECT COUNT(id) FROM hs_s_rt_EM;


SELECT `hs_s_rt_EM`.`id`,
    `hs_s_rt_EM`.`code`,
    `hs_s_rt_EM`.`close`,
    `hs_s_rt_EM`.`amount`,
    `hs_s_rt_EM`.`volume`,
    `hs_s_rt_EM`.`chgrate`,
    `hs_s_rt_EM`.`WeiBi`,
    `hs_s_rt_EM`.`chgrate5`,
    `hs_s_rt_EM`.`LiangBi`,
    `hs_s_rt_EM`.`date`,
    `hs_s_rt_EM`.`time`,
    `hs_s_rt_EM`.`TimeSlot`
FROM `ying`.`hs_s_rt_EM`;


SELECT 
    `hs_s_rt_EM`.`id`,
    `hs_s_rt_EM`.`code`,
    `hs_s_rt_EM`.`close`,
    `hs_s_rt_EM`.`amount`,
    `hs_s_rt_EM`.`volume`,
    `hs_s_rt_EM`.`chgrate`,
    `hs_s_rt_EM`.`WeiBi`,
    `hs_s_rt_EM`.`chgrate5`,
    `hs_s_rt_EM`.`LiangBi`,
    `hs_s_rt_EM`.`date`,
    `hs_s_rt_EM`.`time`,
    `hs_s_rt_EM`.`TimeSlot`
FROM
    ying.hs_s_rt_EM
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

SELECT `hs_s_hs300_zt_dt_No`.`date` AS '日期',
    `hs_s_hs300_zt_dt_No`.`TimeSlot` AS '时间' ,
    `hs_s_hs300_zt_dt_No`.`zt` AS '涨停股数',
    `hs_s_hs300_zt_dt_No`.`dt` AS '跌停股数'
FROM `ying`.`hs_s_hs300_zt_dt_No`;

SELECT * FROM ying.hs_s_hs300_z_weight;
SELECT * FROM ying.hs_s_hs300_zt_weight;
SELECT * FROM ying.hs_s_hs300_dt_weight;