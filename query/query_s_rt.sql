SELECT * FROM ying.s_rt order by ids, dt desc;

SELECT * FROM ying.s_rt where dt is null order by ids, dt desc;


SELECT * FROM `ying`.`s_rt` WHERE `ids`='600190' order by dt desc;

DELETE FROM `ying`.`s_rt` WHERE `ids`='601002' and`dt`='2015-10-12 10:30:00';

SELECT * FROM ying.s_rt where ids = '601002' order by dt desc;

CALL s_rt('601002','11.75','29367','251791','1.64','10.78','-0.25','2.02','2015-10-12','10:28:48');

-- 2 row(s) affected, 2 warning(s): 1264 Out of range value for column 'dt' at row 10001 1364 Field 'id' doesn't have a default value

-- 1 row(s) affected, 1 warning(s): 1264 Out of range value for column 'dt' at row 1996068

-- 1 row(s) affected, 1 warning(s): 1264 Out of range value for column 'dt' at row 10001

-- 2 row(s) affected, 2 warning(s): 1264 Out of range value for column 'dt' at row 858 1364 Field 'id' doesn't have a default value

-- 1 row(s) affected, 1 warning(s): 1264 Out of range value for column 'dt' at row 1998317

ALTER TABLE ying.s_rt ADD PRIMARY KEY(ids,dt);


ALTER TABLE ying.s_rt AUTO_INCREMENT = 1996068;


SELECT * FROM ying.s_rt order by ids, idsub;

SELECT * FROM ying.s_rt where ids is null or close is null;
DELETE FROM ying.s_rt where ids is null or close is null;

DELETE FROM `ying`.`hs_s_hs300_rt_EM` WHERE `id`<='10269' and `id`>='7492';

DELETE FROM `ying`.`s_rt` WHERE time > '09:59:00' and dt = '2015-09-11 10:00:00';
DELETE FROM `ying`.`s_rt` WHERE time > '09:59:00' and dt = '2015-09-10 10:00:00';

DELETE FROM `ying`.`s_rt` WHERE time < '13:59:00' and dt = '2015-09-11 14:00:00';
DELETE FROM `ying`.`s_rt` WHERE time < '13:59:00' and dt = '2015-09-10 14:00:00';

SELECT * FROM ying.s_rt;

select * from ying.s_rt where close = 0.00;
-- delete from ying.s_rt where close = 0.00;

SELECT * FROM ying.s_rt WHERE
	
            (`date` = curdate())
            AND (`chgrate` > 0)
            AND (`close` >= ROUND((1.1 * ((100 * `close`) / (100 + `chgrate`))),
                2));

SELECT * FROM ying.s_rt where ids = '600000';

SELECT * FROM ying.s_rt where date = curdate() order by id desc;

SELECT * FROM ying.s_rt where dt = '2015-09-08 15:05:00' order by id desc ;

SELECT * FROM ying.s_rt WHERE date = curdate() and time < '11:20:00' and time > '11:15:00';

-- UPDATE `ying`.`s_rt` SET `dt`='11:25:00' WHERE date = curdate() and time < '11:25:00'and time > '11:20:00';

UPDATE `ying`.`s_rt` SET `datetime`=cast(CONCAT(date,' ',dt) as datetime);

SELECT * FROM ying.s_rt where date = curdate() and time < '10:48:00'and time > '10:35:00';

UPDATE `ying`.`s_rt` SET `dt`= '09:50:00' where date = curdate() and time < '09:50:00'and time > '09:45:00';

SELECT * FROM ying.s_rt order by id desc;

SET dt =  CASE WHEN time <= '09:27:00' THEN '09:25:00' WHEN time <= '09:32:00' THEN '09:30:00' WHEN time <= '09:37:00' THEN '09:35:00' WHEN time <= '09:42:00' THEN '09:40:00' WHEN time <= '09:47:00' THEN '09:45:00' WHEN time <= '09:52:00' THEN '09:50:00' WHEN time <= '09:57:00' THEN '09:55:00' WHEN time <= '10:02:00' THEN '10:00:00' WHEN time <= '10:07:00' THEN '10:05:00' WHEN time <= '10:12:00' THEN '10:10:00' WHEN time <= '10:17:00' THEN '10:15:00' WHEN time <= '10:22:00' THEN '10:20:00' WHEN time <= '10:27:00' THEN '10:25:00' WHEN time <= '10:32:00' THEN '10:30:00' WHEN time <= '10:37:00' THEN '10:35:00' WHEN time <= '10:42:00' THEN '10:40:00' WHEN time <= '10:47:00' THEN '10:45:00' WHEN time <= '10:52:00' THEN '10:50:00' WHEN time <='10:57:00' THEN '10:55:00' WHEN time <='11:02:00' THEN '11:00:00' WHEN time <='11:07:00' THEN '11:05:00' WHEN time <='11:12:00' THEN '11:10:00' WHEN time <='11:17:00' THEN '11:15:00' WHEN time <='11:22:00' THEN '11:20:00' WHEN time <='11:27:00' THEN '11:25:00' WHEN time <='11:32:00' THEN '11:30:00' WHEN (time <='13:07:00' and time > '13:00:00') THEN '13:05:00' WHEN time <='13:12:00' THEN '13:10:00' WHEN time <='13:17:00' THEN '13:15:00' WHEN time <='13:22:00' THEN '13:20:00' WHEN time <='13:27:00' THEN '13:25:00' WHEN time <='13:32:00' THEN '13:30:00' WHEN time <='13:37:00' THEN '13:35:00' WHEN time <='13:42:00' THEN '13:40:00' WHEN time <='13:47:00' THEN '13:45:00' WHEN time <='13:52:00' THEN '13:50:00' WHEN time <='13:57:00' THEN '13:55:00' WHEN time <='14:02:00' THEN '14:00:00' WHEN time <='14:07:00' THEN '14:05:00' WHEN time <='14:12:00' THEN '14:10:00' WHEN time <='14:17:00' THEN '14:15:00' WHEN time <='14:22:00' THEN '14:20:00' WHEN time <='14:27:00' THEN '14:25:00' WHEN time <='14:32:00' THEN '14:30:00' WHEN time <='14:37:00' THEN '14:35:00' WHEN time <='14:42:00' THEN '14:40:00' WHEN time <='14:47:00' THEN '14:45:00' WHEN time <='14:52:00' THEN '14:50:00' WHEN time <='14:57:00' THEN '14:55:00' WHEN time <='15:01:00' THEN '15:00:00' WHEN time <='15:07:00' THEN '15:05:00' end;


UPDATE `ying`.`s_rt` SET dt =  CASE WHEN time <= '09:27:00' THEN '09:25:00' WHEN time <= '09:32:00' THEN '09:30:00' WHEN time <= '09:37:00' THEN '09:35:00' WHEN time <= '09:42:00' THEN '09:40:00' WHEN time <= '09:47:00' THEN '09:45:00' WHEN time <= '09:52:00' THEN '09:50:00' WHEN time <= '09:57:00' THEN '09:55:00' WHEN time <= '10:02:00' THEN '10:00:00' WHEN time <= '10:07:00' THEN '10:05:00' WHEN time <= '10:12:00' THEN '10:10:00' WHEN time <= '10:17:00' THEN '10:15:00' WHEN time <= '10:22:00' THEN '10:20:00' WHEN time <= '10:27:00' THEN '10:25:00' WHEN time <= '10:32:00' THEN '10:30:00' WHEN time <= '10:37:00' THEN '10:35:00' WHEN time <= '10:42:00' THEN '10:40:00' WHEN time <= '10:47:00' THEN '10:45:00' WHEN time <= '10:52:00' THEN '10:50:00' WHEN time <='10:57:00' THEN '10:55:00' WHEN time <='11:02:00' THEN '11:00:00' WHEN time <='11:07:00' THEN '11:05:00' WHEN time <='11:12:00' THEN '11:10:00' WHEN time <='11:17:00' THEN '11:15:00' WHEN time <='11:22:00' THEN '11:20:00' WHEN time <='11:27:00' THEN '11:25:00' WHEN time <='11:32:00' THEN '11:30:00' WHEN (time <='13:07:00' and time > '13:00:00') THEN '13:05:00' WHEN time <='13:12:00' THEN '13:10:00' WHEN time <='13:17:00' THEN '13:15:00' WHEN time <='13:22:00' THEN '13:20:00' WHEN time <='13:27:00' THEN '13:25:00' WHEN time <='13:32:00' THEN '13:30:00' WHEN time <='13:37:00' THEN '13:35:00' WHEN time <='13:42:00' THEN '13:40:00' WHEN time <='13:47:00' THEN '13:45:00' WHEN time <='13:52:00' THEN '13:50:00' WHEN time <='13:57:00' THEN '13:55:00' WHEN time <='14:02:00' THEN '14:00:00' WHEN time <='14:07:00' THEN '14:05:00' WHEN time <='14:12:00' THEN '14:10:00' WHEN time <='14:17:00' THEN '14:15:00' WHEN time <='14:22:00' THEN '14:20:00' WHEN time <='14:27:00' THEN '14:25:00' WHEN time <='14:32:00' THEN '14:30:00' WHEN time <='14:37:00' THEN '14:35:00' WHEN time <='14:42:00' THEN '14:40:00' WHEN time <='14:47:00' THEN '14:45:00' WHEN time <='14:52:00' THEN '14:50:00' WHEN time <='14:57:00' THEN '14:55:00' WHEN time <='15:01:00' THEN '15:00:00' WHEN time <='15:07:00' THEN '15:05:00' end where date = curdate();

-- UPDATE `ying`.`s_rt` SET dt = NULL;

UPDATE `ying`.`s_rt` SET dt = time(datetime); -- tedd

-- 选择当前的涨跌停股票（从当日最近时间的数据中选取，有subquery）
SELECT 
    latest.ids, latest.time_latest, rt300.close, rt300.chgrate
FROM
    (SELECT 
        ids, MAX(time) AS time_latest
    FROM
        ying.s_rt
    WHERE
        date = CURDATE() - 2
    GROUP BY ids) AS latest
        JOIN
    ying.s_rt AS rt300 ON latest.ids = rt300.ids
        AND latest.time_latest = rt300.time
WHERE
    ((`rt300`.`chgrate` > 0)
        AND (`rt300`.`close` >= ROUND((1.1 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
            2))) or ((`rt300`.`chgrate` < 0)
            AND (`rt300`.`close` <= ROUND((0.9 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
                2)));


SELECT 
    date,
    dt,
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

-- 在表ying.s_rt中选择沪深300的数据    
SELECT * FROM hs_s_hs300_rt_EM_view;
DROP VIEW hs_s_hs300_rt_EM_view;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_rt_EM_view` AS
    SELECT 
        `a`.`id` AS `id`,
        `a`.`ids` AS `ids`,
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
        (`hs_s` `b`
        LEFT JOIN `s_rt` `a` ON (((`a`.`ids` = `b`.`ids`)
            AND (`b`.`f300` = 1))))
    WHERE
        (`a`.`id` IS NOT NULL)
    ORDER BY `a`.`dt` DESC;

-- 在表ying.s_rt中选择中证500的数据    
SELECT * FROM hs_s_zz500_rt_EM_view;
-- DROP VIEW hs_s_zz500_rt_EM_view;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_zz500_rt_EM_view` AS
    SELECT 
        `a`.`id` AS `id`,
        `a`.`ids` AS `ids`,
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
        (`hs_s` `b`
        LEFT JOIN `s_rt` `a` ON (((`a`.`ids` = `b`.`ids`)
            AND (`b`.`f500` = 1))))
    WHERE
        (`a`.`id` IS NOT NULL)
    ORDER BY `a`.`dt` DESC;	
		
-- 在表ying.s_rt中选择上证50的数据    
SELECT * FROM hs_s_sh50_rt_EM_view;
DROP VIEW hs_s_sh50_rt_EM_view;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_sh50_rt_EM_view` AS
    SELECT 
        `a`.`id` AS `id`,
        `a`.`ids` AS `ids`,
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
        (`hs_s` `b`
        LEFT JOIN `s_rt` `a` ON (((`a`.`ids` = `b`.`ids`)
            AND (`b`.`f50SH` = 1))))
    WHERE
        (`a`.`id` IS NOT NULL)
    ORDER BY `a`.`dt` DESC;

-- CREATE 
--     ALGORITHM = UNDEFINED 
--     DEFINER = `gxh`@`%` 
--     SQL SECURITY DEFINER
-- VIEW `hs_s_sh50_rt_EM_view` AS
-- SELECT 
--     a.id,
--     a.ids,
--     a.close,
--     a.amount,
--     a.volume,
--     a.chgrate,
--     a.WeiBi,
--     a.chgrate5,
--     a.LiangBi,
--     a.date,
--     a.time,
--     a.dt
-- FROM
--     ying.s_rt AS a
--         RIGHT OUTER JOIN
--     hs_s AS b ON (a.ids = b.ids AND b.f50SH = 1)
-- WHERE
--     id IS NOT NULL
-- ORDER BY dt DESC;
		

-- 沪深300股票的加权5分钟涨速指数
SELECT * FROM `ying`.`hs_s_hs300_chgrate5_weight` ORDER BY dt DESC;
DROP VIEW `ying`.`hs_s_hs300_chgrate5_weight`;    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_chgrate5_weight` AS
    SELECT
        `a`.`dt` AS `dt`,
        SUM((`a`.`chgrate5` * `c`.`weight`)) AS `chgrate5_weight`
    FROM
        (`s_rt` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`ids` = `c`.`ids`)))
    GROUP BY `a`.`dt`
    ORDER BY `a`.`dt` DESC , SUM((`a`.`chgrate5` * `c`.`weight`)) DESC;

-- 沪深300股票的加权跌指数
SELECT * FROM `ying`.`hs_s_hs300_d_weight`;
DROP VIEW `ying`.`hs_s_hs300_d_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_d_weight` AS
    SELECT 
        `a`.`dt` AS `dt`,
        SUM(`c`.`weight`) AS `d_weight`
    FROM
        (`s_rt` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`ids` = `c`.`ids`)))
    WHERE
        (`a`.`chgrate` < 0)
    GROUP BY `a`.`dt`
    ORDER BY `a`.`dt` DESC;

-- 沪深300股票的加权跌金指数（跌超过黄金分割点）
SELECT * FROM `ying`.`hs_s_hs300_dg_weight`;
DROP VIEW `ying`.`hs_s_hs300_dg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_dg_weight` AS
    SELECT 
        `a`.`dt` AS `dt`,
        SUM(`c`.`weight`) AS `dg_weight`
    FROM
        (`s_rt` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`ids` = `c`.`ids`)))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`dt`
    ORDER BY `a`.`dt` DESC;

-- 沪深300股票的加权跌停指数
SELECT * FROM `ying`.`hs_s_hs300_dt_weight`;
DROP VIEW `ying`.`hs_s_hs300_dt_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_dt_weight` AS
    SELECT 
        `a`.`dt` AS `dt`,
        SUM(`c`.`weight`) AS `dt_weight`
    FROM
        (`s_rt` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`ids` = `c`.`ids`)))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY  `a`.`dt`;

-- 沪深300股票的涨跌个数
SELECT * FROM `ying`.`hs_s_hs300_z_d_No`;
DROP VIEW `ying`.`hs_s_hs300_z_d_No`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_z_d_No` AS
    SELECT
        `s_rt`.`dt` AS `dt`,
        SUM(IF((`s_rt`.`chgrate` > 0),
            1,
            0)) AS `z`,
        SUM(IF((`s_rt`.`chgrate` < 0),
            1,
            0)) AS `d`
    FROM
        `s_rt`
    GROUP BY `s_rt`.`dt`
    ORDER BY `s_rt`.`dt` DESC;


-- 沪深300股票的加权涨指数
SELECT * FROM `ying`.`hs_s_hs300_z_weight`;
DROP VIEW `ying`.`hs_s_hs300_z_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_z_weight` AS
    SELECT 
        `a`.`dt` AS `dt`,
        SUM(`c`.`weight`) AS `z_weight`
    FROM
        (`s_rt` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`ids` = `c`.`ids`)))
    WHERE
        (`a`.`chgrate` > 0)
    GROUP BY `a`.`dt`
    ORDER BY `a`.`dt` DESC;

-- view 选择当前的涨跌过黄金分割点的股票（从当日最近时间的数据中选取）
SELECT * FROM ying.hs_s_hs300_zg_dg;
DROP VIEW `ying`.`hs_s_hs300_zg_dg`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zg_dg` AS
    SELECT 
        `rt300`.`ids` AS `ids`,
        `hs_s`.`name` AS `name`,
        `rt300`.`close` AS `close`,
        `rt300`.`chgrate` AS `chgrate`
    FROM
        ((`s_rt` `rt300`
        LEFT JOIN `s_rt` `b` ON (((`rt300`.`ids` = `b`.`ids`)
            AND ((`rt300`.`dt` < `b`.`dt`)
            OR ((`rt300`.`dt` = `b`.`dt`)
            AND (`rt300`.`id` < `b`.`id`))))))
        LEFT JOIN `hs_s` ON ((`rt300`.`ids` = `hs_s`.`ids`)))
    WHERE
        ((ISNULL(`b`.`ids`)
            AND (`rt300`.`chgrate` > 0)
            AND (`rt300`.`close` >= ROUND((1.0618 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`ids`)
            AND (`rt300`.`chgrate` < 0)
            AND (`rt300`.`close` <= ROUND((0.9382 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
                2))))
    ORDER BY `rt300`.`ids`;
	
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
        `s_rt`.`dt` AS `dt`,
        SUM(IF(((`s_rt`.`chgrate` > 0)
                AND (`s_rt`.`close` >= ROUND((1.0618 * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                    2))),
            1,
            0)) AS `zg`,
        SUM(IF(((`s_rt`.`chgrate` < 0)
                AND (`s_rt`.`close` <= ROUND((0.9382 * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                    2))),
            1,
            0)) AS `dg`
    FROM
        `s_rt`
    GROUP BY `s_rt`.`dt`
    ORDER BY `s_rt`.`dt` DESC;

-- 沪深300股票的加权涨金指数（涨超过黄金分割点）
SELECT * FROM `ying`.`hs_s_hs300_zg_weight`;
DROP VIEW `ying`.`hs_s_hs300_zg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zg_weight` AS
    SELECT 
        `a`.`dt` AS `dt`,
        SUM(`c`.`weight`) AS `zg_weight`
    FROM
        (`s_rt` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`ids` = `c`.`ids`)))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.0618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY date, `a`.`dt`
    ORDER BY `a`.`dt` DESC;

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
        `s_rt`.`dt` AS `dt`,
        SUM(IF(((`s_rt`.`chgrate` > 0)
                AND (`s_rt`.`close` >= ROUND((1.1 * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                    2))),
            1,
            0)) AS `zt`,
        SUM(IF(((`s_rt`.`chgrate` < 0)
                AND (`s_rt`.`close` <= ROUND((0.9 * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                    2))),
            1,
            0)) AS `dt`
    FROM
        `s_rt`
    GROUP BY `s_rt`.`dt`
    ORDER BY `s_rt`.`dt` DESC;	

-- 沪深300股票的加权涨停指数
SELECT * FROM `ying`.`hs_s_hs300_zt_weight`;
DROP VIEW `ying`.`hs_s_hs300_zt_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zt_weight` AS
    SELECT 
        `a`.`dt` AS `dt`,
        SUM(`c`.`weight`) AS `zt_weight`
    FROM
        (`s_rt` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`ids` = `c`.`ids`)))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.1 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`dt`
    ORDER BY `a`.`dt` DESC;
	
-- view 选择当前的涨跌停股票（从当日最近时间的数据中选取）
SELECT * FROM ying.hs_s_hs300_zt_dt;
DROP VIEW `ying`.`hs_s_hs300_zt_dt`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zt_dt` AS
    SELECT 
        `rt300`.`ids` AS `ids`,
        `hs_s`.`name` AS `name`,
        `rt300`.`close` AS `close`,
        `rt300`.`chgrate` AS `chgrate`
    FROM
        ((`s_rt` `rt300`
        LEFT JOIN `s_rt` `b` ON (((`rt300`.`ids` = `b`.`ids`)
            AND ((`rt300`.`dt` < `b`.`dt`)
            OR ((`rt300`.`dt` = `b`.`dt`)
            AND (`rt300`.`id` < `b`.`id`))))))
        LEFT JOIN `hs_s` ON ((`rt300`.`ids` = `hs_s`.`ids`)))
    WHERE
        ((ISNULL(`b`.`ids`)
            AND (`rt300`.`chgrate` > 0)
            AND (`rt300`.`close` >= ROUND((1.1 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`ids`)
            AND (`rt300`.`chgrate` < 0)
            AND (`rt300`.`close` <= ROUND((0.9 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
                2))))
    ORDER BY `rt300`.`ids`;

-- My own format ( 对应format after beatifying) 
-- CREATE 
--     ALGORITHM = UNDEFINED 
--     DEFINER = `gxh`@`%` 
--     SQL SECURITY DEFINER
-- VIEW `hs_s_hs300_lastest` AS
--     SELECT 
--         `rt300`.`ids` AS `ids`,
--         `rt300`.`dt` AS `dt`,
--         `rt300`.`close` AS `close`,
--         `rt300`.`chgrate` AS `chgrate`
--     FROM
--         (`s_rt` `rt300`
--         LEFT JOIN `s_rt` `b` ON (((`rt300`.`ids` = `b`.`ids`)
--             AND ((`rt300`.`dt` < `b`.`dt`)
--             OR ((`rt300`.`dt` = `b`.`dt`)
--             AND (`rt300`.`id` < `b`.`id`))))))
--     WHERE
--         ((ISNULL(`b`.`ids`)
--             AND (`rt300`.`date` = (CURDATE() - 1))) AND ((`rt300`.`chgrate` > 0)
--         AND (`rt300`.`close` >= ROUND((1.1 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
--             2)))) or ((ISNULL(`b`.`ids`)
--             AND (`rt300`.`date` = (CURDATE() - 1))) AND (((`rt300`.`chgrate` < 0)
--             AND (`rt300`.`close` <= ROUND((0.9 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
--                 2))))) 
--     ORDER BY `rt300`.`ids`;
	
-- view 选择当前数据
SELECT * FROM `ying`.`hs_s_hs300_lastest`;
DROP VIEW `ying`.`hs_s_hs300_lastest`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_lastest` AS
    SELECT 
        `rt300`.`ids` AS `ids`,
        `rt300`.`dt` AS `dt`,
        `rt300`.`close` AS `close`,
        `rt300`.`chgrate` AS `chgrate`
    FROM
        (`s_rt` `rt300`
        LEFT JOIN `s_rt` `b` ON (((`rt300`.`ids` = `b`.`ids`)
            AND ((`rt300`.`dt` < `b`.`dt`)
            OR ((`rt300`.`dt` = `b`.`dt`)
            AND (`rt300`.`id` < `b`.`id`))))))
    WHERE
        ISNULL(`b`.`ids`)
    ORDER BY `rt300`.`ids`;
        
-- 涨跌指数统计
SELECT * FROM `ying`.`hs_s_hs300_z_d_Statistics`;
DROP VIEW `ying`.`hs_s_hs300_z_d_Statistics`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_z_d_Statistics` AS
    SELECT 
        `a`.`dt` AS `dt`,
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
        LEFT JOIN `hs_s_hs300_zg_dg_No` `b` ON ((`a`.`dt` = `b`.`dt`)))
        LEFT JOIN `hs_s_hs300_zt_dt_No` `c` ON ((`a`.`dt` = `c`.`dt`)))
        LEFT JOIN `hs_s_hs300_z_weight` `zW` ON ((`a`.`dt` = `zW`.`dt`)))
        LEFT JOIN `hs_s_hs300_d_weight` `dW` ON ((`a`.`dt` = `dW`.`dt`)))
        LEFT JOIN `hs_s_hs300_zg_weight` `zgW` ON ((`a`.`dt` = `zgW`.`dt`)))
        LEFT JOIN `hs_s_hs300_dg_weight` `dgW` ON ((`a`.`dt` = `dgW`.`dt`)))
        LEFT JOIN `hs_s_hs300_zt_weight` `ztW` ON ((`a`.`dt` = `ztW`.`dt`)))
        LEFT JOIN `hs_s_hs300_dt_weight` `dtW` ON ((`a`.`dt` = `dtW`.`dt`)))
        LEFT JOIN `hs_s_hs300_chgrate5_weight` `rate5` ON ((`a`.`dt` = `rate5`.`dt`)))
    ORDER BY `a`.`dt` DESC;


-- 选择最近时间的数据（不用subquery） sql - Fetch the row which has the Max value for a column - Stack Overflow 
SELECT 
    a.ids, a.dt, a.close, a.chgrate5
FROM
    ying.s_rt AS a
        LEFT OUTER JOIN
    ying.s_rt AS b ON (a.ids = b.ids
        AND (a.time < b.time
        OR (a.time = b.time AND a.id < b.id)))
WHERE
    b.ids IS NULL;
    
-- 不同的dt的涨跌停板数量    
SELECT 
    date,
    dt,
    SUM(IF(chgrate > 0
            AND close >= ROUND(1.1 * (100 * close / (100 + chgrate)), 2),
        1,
        0)) AS zt,
    SUM(IF(chgrate < 0
            AND close <= ROUND(0.9 * (100 * close / (100 + chgrate)), 2),
        1,
        0)) AS dt
FROM
    ying.s_rt
WHERE
    date = CURDATE()
GROUP BY date, dt
ORDER BY dt DESC;

-- 加权涨跌停指数, 无subquery
SELECT 
    SUM(c.weight)
FROM
    (SELECT 
        ids
    FROM
        ying.s_rt
    WHERE
        chgrate > 0
            AND close >= ROUND(1.1 * (100 * close / (100 + chgrate)), 2)) AS a
        JOIN
    hs300_s_data_c AS c ON a.ids = c.ids;
    
-- 加权涨跌停指数, 无subquery
SELECT 
    SUM(c.weight)
FROM
    (SELECT 
        ids
    FROM
        ying.s_rt
    WHERE
        chgrate > 0
            AND close >= ROUND(1.1 * (100 * close / (100 + chgrate)), 2)) AS a
        JOIN
    hs300_s_data_c AS c ON a.ids = c.ids;
    
-- 加权涨跌停指数, 没有subquery
SELECT 
    a.date, a.dt, SUM(c.weight) as zt_weight
FROM
        ying.s_rt as a join hs300_s_data_c AS c ON a.ids = c.ids
    WHERE
        a.chgrate > 0 AND a.close >= ROUND(1.1 * (100 * a.close / (100 + a.chgrate)),2) GROUP BY date, a.dt;
        
-- 加权涨跌停指数, 没有subquery
SELECT 
    a.date, a.dt, SUM(c.weight) as zt_weight
FROM
        ying.s_rt as a join hs300_s_data_c AS c ON a.ids = c.ids
    WHERE
        a.chgrate > 0 AND a.close >= ROUND(1.1 * (100 * a.close / (100 + a.chgrate)),2) GROUP BY date, a.dt;



-- 在表ying.s_rt中选择上证50的数据    
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
--     ying.s_rt
-- WHERE
--     ids IN (SELECT DISTINCT
--             a.`ids`
--         FROM
--             `ying`.`hs_bk_gp_info_EM` AS a
--                 JOIN
--             ying.hs_bk_info_EM AS b ON (a.ids_bk = b.ids_bk)
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
        `s_rt`.`id` AS `id`,
        `s_rt`.`ids` AS `ids`,
        `s_rt`.`close` AS `close`,
        `s_rt`.`amount` AS `amount`,
        `s_rt`.`volume` AS `volume`,
        `s_rt`.`chgrate` AS `chgrate`,
        `s_rt`.`WeiBi` AS `WeiBi`,
        `s_rt`.`chgrate5` AS `chgrate5`,
        `s_rt`.`LiangBi` AS `LiangBi`,
        `s_rt`.`date` AS `date`,
        `s_rt`.`time` AS `time`,
        `s_rt`.`dt` AS `dt`
    FROM
        `s_rt`
    WHERE
        `s_rt`.`ids` IN (SELECT DISTINCT
                `a`.`ids`
            FROM
                ((`hs_bk_gp_info_EM` `a`
                JOIN `hs_bk_info_EM` `b` ON ((`a`.`ids_bk` = `b`.`ids_bk`)))
                JOIN `hs_bkhq_rt_EM` `c` ON ((`b`.`name_bk` = `c`.`name_bk`)))
            WHERE
                (`b`.`name_bk` = '上证50')
            ORDER BY `a`.`DateSys` DESC , `c`.`chgrate_bk` DESC) ORDER BY dt DESC;

    

-- 在表ying.s_rt中选择上证50的数据 tedd        
SELECT 
    a.id,
    a.ids,
    a.close,
    a.amount,
    a.volume,
    a.chgrate,
    a.WeiBi,
    a.chgrate5,
    a.LiangBi,
    a.date,
    a.time,
    a.dt
FROM
    ying.s_rt AS a
        RIGHT OUTER JOIN
    hs_s AS b ON (a.ids = b.ids AND b.f50SH = 1)
WHERE
    id IS NOT NULL
ORDER BY dt DESC;

-- 在表ying.s_rt中统计上证50的数据条数 tedd      
SELECT 
    count(a.id)
FROM
    ying.s_rt AS a
        RIGHT OUTER JOIN
    hs_s AS b ON (a.ids = b.ids AND b.f50SH = 1)
WHERE
    id IS NOT NULL; 

select count(*) from hs_s_sh50_rt_EM;
select count(id) from s_rt;


SELECT `s_rt`.`id`,
    `s_rt`.`ids`,
    `s_rt`.`close`,
    `s_rt`.`amount`,
    `s_rt`.`volume`,
    `s_rt`.`chgrate`,
    `s_rt`.`WeiBi`,
    `s_rt`.`chgrate5`,
    `s_rt`.`LiangBi`,
    `s_rt`.`date`,
    `s_rt`.`time`,
    `s_rt`.`dt`
FROM `ying`.`s_rt`;


SELECT 
    `s_rt`.`id`,
    `s_rt`.`ids`,
    `s_rt`.`close`,
    `s_rt`.`amount`,
    `s_rt`.`volume`,
    `s_rt`.`chgrate`,
    `s_rt`.`WeiBi`,
    `s_rt`.`chgrate5`,
    `s_rt`.`LiangBi`,
    `s_rt`.`date`,
    `s_rt`.`time`,
    `s_rt`.`dt`
FROM
    ying.s_rt
WHERE
    ids IN (SELECT DISTINCT
            a.`ids`
        FROM
            `ying`.`hs_bk_gp_info_EM` AS a
                JOIN
            ying.hs_bk_info_EM AS b ON (a.ids_bk = b.ids_bk)
                JOIN
            ying.hs_bkhq_rt_EM AS c ON (b.name_bk = c.name_bk)
        WHERE
            b.name_bk = '上证50'
        ORDER BY a.`DateSys` DESC , c.`chgrate_bk` DESC)
ORDER BY id; 

SELECT `hs_s_hs300_zt_dt_No`.`date` as '日期',
    `hs_s_hs300_zt_dt_No`.`dt` as '时间' ,
    `hs_s_hs300_zt_dt_No`.`zt` as '涨停股数',
    `hs_s_hs300_zt_dt_No`.`dt` as '跌停股数'
FROM `ying`.`hs_s_hs300_zt_dt_No`;

SELECT * FROM ying.hs_s_hs300_z_weight;
SELECT * FROM ying.hs_s_hs300_zt_weight;
SELECT * FROM ying.hs_s_hs300_dt_weight;