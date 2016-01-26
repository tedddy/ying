SELECT * FROM hk_w_sum_call_view;
SELECT * FROM hk_w_sum_call_view WHERE uCode = '03888' ORDER BY date DESC;
SELECT * FROM hk_w_sum_call_view WHERE uCode = '02822' ORDER BY date DESC;
SELECT * FROM hk_w_sum_call_view WHERE uCode = '02823' ORDER BY date DESC;

SELECT * FROM hk_w_sum_put_view;
SELECT * FROM hk_w_sum_put_view WHERE uCode = '03888' ORDER BY date DESC;

SELECT 
    table_call.date,
    table_call.uCode,
    hk_s_hgt.name,
    hk_s_xts.amount,
    table_call.sum_call,
    (table_call.sum_call / hk_s_xts.amount) * 100 AS rate_call,
    table_put.sum_put,
    (table_put.sum_put / hk_s_xts.amount) * 100 AS rate_put
FROM
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_call`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 1
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_call
        LEFT JOIN
    hk_s_hgt ON table_call.uCode = hk_s_hgt.code
        LEFT JOIN
    hk_s_xts ON table_call.date = hk_s_xts.date
        AND table_call.uCode = hk_s_xts.code
        LEFT JOIN
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 0
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_put ON table_call.date = table_put.date
        AND table_call.uCode = table_put.uCode
WHERE
    table_call.uCode IN ('03888', '02822', '02823')
        AND table_call.date > '2015-09-07'
ORDER BY table_call.uCode DESC , table_call.date DESC;

SELECT * FROM hk_w_per_uCode WHERE date > '2015-08-03' AND uCode = '03888';
SELECT * FROM hk_w_per_uCode;
SELECT COUNT(*) FROM hk_w_per_uCode;

-- DROP VIEW hk_w_per_uCode;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hk_w_per_uCode` AS
SELECT 
    xts.code,
    xts.date,
    xts.open,
    xts.close,
    xts.turnover,
    info.uCode,
    info.pDate
FROM
    ying.hk_w_xts AS xts
        LEFT JOIN
    ying.hk_w AS info ON (xts.code = info.code)
ORDER BY xts.date DESC , xts.turnover DESC;

SELECT * FROM hk_w_per_uCode_sum WHERE date > '2015-10-03' AND uCode = '03888' AND nature = 1;
SELECT * FROM hk_w_per_uCode_sum;
SELECT COUNT(*) FROM hk_w_per_uCode_sum;
DROP VIEW hk_w_per_uCode_sum;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hk_w_per_uCode_sum` AS
    SELECT 
        `hk_w_xts`.`date` AS `date`,
        `info`.`uCode` AS `uCode`,
        `info`.`nature` AS `nature`,
        SUM(`hk_w_xts`.`volume`) AS `sum_volume`,
        SUM(`hk_w_xts`.`turnover`) AS `sum_turnover`
    FROM
        (`hk_w_xts`
        JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`
    ORDER BY `hk_w_xts`.`date` DESC , `info`.`uCode`;

-- DROP VIEW hk_w_sum_call_view;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hk_w_sum_call_view` AS
    SELECT 
        `hk_w_xts`.`date` AS `date`,
        `info`.`uCode` AS `uCode`,
        SUM(`hk_w_xts`.`turnover`) AS `sum_call`
    FROM
        (`hk_w_xts`
        JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        ((`info`.`uCode` IS NOT NULL)
            AND (`info`.`nature` = 1))
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`
    ORDER BY `hk_w_xts`.`date` DESC , `info`.`uCode`;

-- DROP VIEW hk_w_sum_put_view;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hk_w_sum_put_view` AS
    SELECT 
        `hk_w_xts`.`date` AS `date`,
        `info`.`uCode` AS `uCode`,
        SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
        JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        ((`info`.`uCode` IS NOT NULL)
            AND (`info`.`nature` = 0))
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`
    ORDER BY `hk_w_xts`.`date` DESC , `info`.`uCode`;


SELECT * FROM hk_w_statistics;
SELECT * FROM hk_w_statistics WHERE sum IS NOT NULL AND uCode IN ('00241', '00268', '00861', '00981', '01060', '01068', '01165', '02357', '03888') AND date > '2015-10-01' ORDER BY uCode, date DESC;

SELECT * FROM hk_w_statistics WHERE sum IS NOT NULL AND uCode IN ('HSCEI', '02822', '02823') AND date > '2015-08-01' ORDER BY uCode, date DESC;

SELECT * FROM hk_w_statistics WHERE sum IS NOT NULL AND uCode IN ('06030', '06837', '06886') AND date > '2015-08-01' ORDER BY uCode, date DESC;



-- DROP VIEW `hk_w_statistics`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hk_w_statistics` AS
    SELECT 
        `hk_w_xts`.`date` AS `date`,
        `info`.`uCode` AS `uCode`,
        SUM(`hk_w_xts`.`turnover`) AS `sum`
    FROM
        (`hk_w_xts`
        JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
--     WHERE
--         ((`hk_w_xts`.`date` IN ('2015-04-14' , '2015-04-13',
--             '2015-04-10',
--             '2015-04-09',
--             '2015-04-08'))
--             AND (`info`.`uCode` IS NOT NULL)
--             AND (`info`.`uCode` IN ('00998' , '06818',
--             '01988',
--             '00939',
--             '01288',
--             '06837',
--             'HSCEI')))
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date`;

-- DROP VIEW hk_w_statistics;
-- CREATE 
--     ALGORITHM = UNDEFINED 
--     DEFINER = `gxh`@`%` 
--     SQL SECURITY DEFINER
-- VIEW `hk_w_statistics` AS
--     SELECT 
--         `hk_w_xts`.`date` AS `date`,
--         `info`.`uCode` AS `uCode`,
--         SUM(`hk_w_xts`.`turnover`) AS `SUM(turnover)`
--     FROM
--         (`hk_w_xts`
--         JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
--     WHERE
--         ((`hk_w_xts`.`date` IN ('2015-04-14' , '2015-04-13',
--             '2015-04-10',
--             '2015-04-09',
--             '2015-04-08'))
--             AND (`info`.`uCode` IS NOT NULL)
--             AND (`info`.`uCode` IN ('00998' , '06818',
--             '01988',
--             '00939',
--             '01288',
--             '06837',
--             'HSCEI')))
--     GROUP BY `info`.`uCode` , `hk_w_xts`.`date`;
-- 

SELECT * FROM hk_w_sum_call_view;
DROP VIEW hk_w_sum_call_view;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hk_w_sum_call_view` AS
    SELECT 
        `hk_w_xts`.`date` AS `date`,
        `info`.`uCode` AS `uCode`,
        SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
        JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        ((`info`.`uCode` IS NOT NULL)
            AND (`info`.`nature` = 1))
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`
    ORDER BY date DESC , uCode;

SELECT * FROM hk_w_sum_put_view;
DROP VIEW hk_w_sum_put_view;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hk_w_sum_put_view` AS
    SELECT 
        `hk_w_xts`.`date` AS `date`,
        `info`.`uCode` AS `uCode`,
        SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
        JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        ((`info`.`uCode` IS NOT NULL)
            AND (`info`.`nature` = 0))
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`
    ORDER BY date DESC , Code;
    
-- tedd: view hk_w_per_uCode_archive is much slower than view hk_w_per_uCode because of "in" statement. 
DROP VIEW hk_w_per_uCode_archive;
SELECT * FROM hk_w_per_uCode_archive;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hk_w_per_uCode_archive` AS
SELECT 
    xts.code,
    xts.date,
    xts.open,
    xts.close,
    xts.turnover,
    info.pDate
FROM
    ying.hk_w_xts AS xts
        LEFT JOIN
    ying.hk_w AS info ON xts.code = info.code
WHERE
    xts.date > '2015-08-03'
        AND xts.code IN (SELECT 
            info.code
        FROM
            hk_w
        WHERE
            info.uCode = '03888')
ORDER BY xts.date DESC , xts.turnover DESC;



SELECT 
    table_call.date,
    table_call.uCode,
    hk_s_hgt.name,
    hk_s_xts.amount,
    table_call.sum_call,
    (table_call.sum_call / hk_s_xts.amount) * 100 AS rate_call,
    table_put.sum_put,
    (table_put.sum_put / hk_s_xts.amount) * 100 AS rate_put
FROM
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_call`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 1
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_call
        LEFT JOIN
    hk_s_hgt ON table_call.uCode = hk_s_hgt.code
        LEFT JOIN
    hk_s_xts ON table_call.date = hk_s_xts.date
        AND table_call.uCode = hk_s_xts.code
        LEFT JOIN
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 0
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_put ON table_call.date = table_put.date
        AND table_call.uCode = table_put.uCode
WHERE
    table_call.uCode IN ('01618', '00144', '00297', '02727', '01833', '02618')
        AND table_call.date > '2015-04-07'
ORDER BY table_call.uCode DESC , table_call.date DESC;

SELECT 
    table_call.date,
    table_call.uCode,
    hk_s_hgt.name,
    hk_s_xts.amount,
    table_call.sum_call,
    (table_call.sum_call / hk_s_xts.amount) * 100 AS rate_call,
    table_put.sum_put,
    (table_put.sum_put / hk_s_xts.amount) * 100 AS rate_put
FROM
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_call`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 1
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_call
        LEFT JOIN
    hk_s_hgt ON table_call.uCode = hk_s_hgt.code
        LEFT JOIN
    hk_s_xts ON table_call.date = hk_s_xts.date
        AND table_call.uCode = hk_s_xts.code
        LEFT JOIN
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 0
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_put ON table_call.date = table_put.date
        AND table_call.uCode = table_put.uCode
WHERE
    table_call.uCode IN ('02823', '02822')
        AND table_call.date > '2015-04-07'
ORDER BY table_call.uCode DESC , table_call.date DESC;

SELECT 
    table_call.date,
    table_call.uCode,
    hk_s_hgt.name,
    hk_s_xts.amount,
    table_call.sum_call,
    (table_call.sum_call / hk_s_xts.amount) * 100 AS rate_call,
    table_put.sum_put,
    (table_put.sum_put / hk_s_xts.amount) * 100 AS rate_put
FROM
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_call`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 1
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_call
        LEFT JOIN
    hk_s_hgt ON table_call.uCode = hk_s_hgt.code
        LEFT JOIN
    hk_s_xts ON table_call.date = hk_s_xts.date
        AND table_call.uCode = hk_s_xts.code
        LEFT JOIN
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 0
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_put ON table_call.date = table_put.date
        AND table_call.uCode = table_put.uCode
WHERE
    table_call.uCode IN ('00493', '03800', '03333', '01068', '00268', '03888', '02727', '01157')
        AND table_call.date > '2015-04-07'
ORDER BY table_call.uCode DESC , table_call.date DESC;

SELECT 
    table_call.date,
    table_call.uCode,
    hk_s_hgt.name,
    hk_s_xts.amount,
    table_call.sum_call,
    (table_call.sum_call / hk_s_xts.amount) * 100 AS rate_call,
    table_put.sum_put,
    (table_put.sum_put / hk_s_xts.amount) * 100 AS rate_put
FROM
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_call`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 1
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_call
        LEFT JOIN
    hk_s_hgt ON table_call.uCode = hk_s_hgt.code
        LEFT JOIN
    hk_s_xts ON table_call.date = hk_s_xts.date
        AND table_call.uCode = hk_s_xts.code
        LEFT JOIN
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 0
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_put ON table_call.date = table_put.date
        AND table_call.uCode = table_put.uCode
WHERE
    table_call.uCode IN ('00119','00123','00272', '00283', '00288', '00291', '00813', '00817', '00960', '01109', '01813', '02777', '03333', '03377', '03380', '03383')
        AND table_call.date > '2015-04-07'
ORDER BY table_call.uCode DESC , table_call.date DESC;

SELECT 
    table_call.date,
    table_call.uCode,
    hk_s_hgt.name,
    hk_s_xts.amount,
    table_call.sum_call,
    (table_call.sum_call / hk_s_xts.amount) * 100 AS rate_call,
    table_put.sum_put,
    (table_put.sum_put / hk_s_xts.amount) * 100 AS rate_put
FROM
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_call`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 1
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_call
        LEFT JOIN
    hk_s_hgt ON table_call.uCode = hk_s_hgt.code
        LEFT JOIN
    hk_s_xts ON table_call.date = hk_s_xts.date
        AND table_call.uCode = hk_s_xts.code
        LEFT JOIN
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 0
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_put ON table_call.date = table_put.date
        AND table_call.uCode = table_put.uCode
WHERE
    table_call.uCode IN ('00998', '06818', '01988', '00939', '01288', '06837', '03988', 'HSCEI')
        AND table_call.date > '2015-04-02'
ORDER BY table_call.uCode DESC , table_call.date DESC;

SELECT 
    table_call.date,
    table_call.uCode,
    hk_s_hgt.name,
    hk_s_xts.amount,
    table_call.sum_call,
    (table_call.sum_call / hk_s_xts.amount) * 100 AS rate_call,
    table_put.sum_put,
    (table_put.sum_put / hk_s_xts.amount) * 100 AS rate_put
FROM
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_call`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 1
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_call
        LEFT JOIN
    hk_s_hgt ON table_call.uCode = hk_s_hgt.code
        LEFT JOIN
    hk_s_xts ON table_call.date = hk_s_xts.date
        AND table_call.uCode = hk_s_xts.code
        LEFT JOIN
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 0
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_put ON table_call.date = table_put.date
        AND table_call.uCode = table_put.uCode
WHERE
    table_call.uCode IN (SELECT 
            code
        FROM
            hk_s_hgt)
        AND table_call.date > '2015-04-19'
ORDER BY table_call.uCode DESC , table_call.date DESC;

SELECT 
    table_call.date,
    table_call.uCode,
    hk_s_xts.amount,
    table_call.sum_call,
    (table_call.sum_call/hk_s_xts.amount)*100 AS rate_call,
    table_put.sum_put,
    (table_put.sum_put/hk_s_xts.amount)*100 AS rate_put
FROM
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_call`
    FROM
        (`hk_w_xts`
    JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 1
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_call
        LEFT JOIN
    hk_s_xts ON table_call.date = hk_s_xts.date
        AND table_call.uCode = hk_s_xts.code
        LEFT JOIN
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 0
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_put ON table_call.date = table_put.date
        AND table_call.uCode = table_put.uCode
WHERE
    table_call.uCode IN ('03888') AND table_call.date >= '2015-03-08'
ORDER BY table_call.uCode DESC , table_call.date DESC;

SELECT 
    table_call.date,
    table_call.uCode,
    hk_s_xts.amount,
    table_call.sum_call,
    (table_call.sum_call/hk_s_xts.amount)*100 AS rate_call,
    table_put.sum_put,
    (table_put.sum_put/hk_s_xts.amount)*100 AS rate_put
FROM
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_call`
    FROM
        (`hk_w_xts`
    JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 1
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_call
        LEFT JOIN
    hk_s_xts ON table_call.date = hk_s_xts.date
        AND table_call.uCode = hk_s_xts.code
        LEFT JOIN
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 0
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_put ON table_call.date = table_put.date
        AND table_call.uCode = table_put.uCode
WHERE
    table_call.uCode IN ('02823','02822') AND table_call.date >= '2015-03-02'
ORDER BY table_call.uCode DESC , table_call.date DESC;

SELECT 
    table_call.date,
    table_call.uCode,
    hk_s_xts.amount,
    table_call.sum_call,
    (table_call.sum_call/hk_s_xts.amount)*100 AS rate_call,
    table_put.sum_put,
    (table_put.sum_put/hk_s_xts.amount)*100 AS rate_put
FROM
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_call`
    FROM
        (`hk_w_xts`
    JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 1
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_call
        LEFT JOIN
    hk_s_xts ON table_call.date = hk_s_xts.date
        AND table_call.uCode = hk_s_xts.code
        LEFT JOIN
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 0
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_put ON table_call.date = table_put.date
        AND table_call.uCode = table_put.uCode
WHERE
    table_call.uCode IN ('HSCEI') AND table_call.date >= '2015-03-02'
ORDER BY table_call.uCode DESC , table_call.date DESC;

SELECT 
    table_call.date,
    table_call.uCode,
    hk_s_xts.amount,
    table_call.sum_call,
    (table_call.sum_call/hk_s_xts.amount)*100 AS rate_call,
    table_put.sum_put,
    (table_put.sum_put/hk_s_xts.amount)*100 AS rate_put
FROM
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_call`
    FROM
        (`hk_w_xts`
    JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 1
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_call
        LEFT JOIN
    hk_s_xts ON table_call.date = hk_s_xts.date
        AND table_call.uCode = hk_s_xts.code
        LEFT JOIN
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 0
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_put ON table_call.date = table_put.date
        AND table_call.uCode = table_put.uCode
WHERE
    table_call.uCode IN ('00493','01157','00998', '06818', '01988', '00939', '01288', '03328', '03988', '01398', '03968', 'HSCEI') AND table_call.date >= '2015-04-16'
ORDER BY table_call.uCode DESC , table_call.date DESC;

SELECT 
    table_call.date,
    table_call.uCode,
    hk_s_xts.amount,
    table_call.sum_call,
    (table_call.sum_call / hk_s_xts.amount) * 100 AS rate_call,
    table_put.sum_put,
    (table_put.sum_put / hk_s_xts.amount) * 100 AS rate_put
FROM
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_call`
    FROM
        (`hk_w_xts`
    JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 1
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_call
        LEFT JOIN
    hk_s_xts ON table_call.date = hk_s_xts.date
        AND table_call.uCode = hk_s_xts.code
        LEFT JOIN
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 0
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_put ON table_call.date = table_put.date
        AND table_call.uCode = table_put.uCode
WHERE
    table_call.uCode IN (SELECT 
            code
        FROM
            hk_s_hgt)
        AND table_call.date = '2015-04-16'
ORDER BY rate_call DESC;

SELECT 
    table_call.date,
    table_call.uCode,
    hk_s_xts.amount,
    table_call.sum_call,
    (table_call.sum_call/hk_s_xts.amount)*100 AS rate_call,
    table_put.sum_put,
    (table_put.sum_put/hk_s_xts.amount)*100 AS rate_put
FROM
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_call`
    FROM
        (`hk_w_xts`
    JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 1
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_call
        LEFT JOIN
    hk_s_xts ON table_call.date = hk_s_xts.date
        AND table_call.uCode = hk_s_xts.code
        LEFT JOIN
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 0
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_put ON table_call.date = table_put.date
        AND table_call.uCode = table_put.uCode
WHERE
    table_call.uCode IN ('00493','01157','00998', '06818', '01988', '00939', '01288', '03328', '03988', '01398', '03968', 'HSCEI') AND table_call.date > '2015-03-29'
ORDER BY table_call.uCode DESC , table_call.date DESC;

SELECT 
    table_call.date,
    table_call.uCode,
    hk_s_xts.amount,
    table_call.sum_call,
    (table_call.sum_call/hk_s_xts.amount)*100 AS rate_call,
    table_put.sum_put,
    (table_put.sum_put/hk_s_xts.amount)*100 AS rate_put
FROM
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_call`
    FROM
        (`hk_w_xts`
    JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 1
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_call
        LEFT JOIN
    hk_s_xts ON table_call.date = hk_s_xts.date
        AND table_call.uCode = hk_s_xts.code
        LEFT JOIN
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 0
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_put ON table_call.date = table_put.date
        AND table_call.uCode = table_put.uCode
WHERE
    table_call.uCode IN ('00493','01157','00998', '06818', '01988', '00939', '01288', '03328', '03988', '01398', '03968', 'HSCEI') AND table_call.date > '2015-03-29'
ORDER BY table_call.uCode DESC , table_call.date DESC;
    
SELECT 
    `hk_w_xts`.`date` AS `date`,
    `info`.`uCode` AS `uCode`,
    SUM(`hk_w_xts`.`turnover`) AS `sum_put`
FROM
    (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
WHERE
    (`info`.`uCode` IS NOT NULL)
        AND nature = 0
        AND uCode IN ('HSCEI' , '01339')
GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`
ORDER BY date DESC;

SELECT * FROM ying.hk_w_call WHERE uCode = '06030';

SELECT * FROM ying.hk_w_put WHERE uCode = '06030';

SELECT * FROM ying.hk_w_call WHERE uCode = '03800';

SELECT * FROM ying.hk_w_put WHERE uCode = '03800';


SELECT 
    ying.hk_w_call.date, ying.hk_w_call.uCode, ying.hk_w_call.sum_call, ying.hk_w_put.sum_put
FROM
    ying.hk_w_call
        JOIN
    ying.hk_w_put ON ying.hk_w_call.uCode = ying.hk_w_put.uCode
        AND ying.hk_w_call.date = ying.hk_w_put.date
WHERE
    ying.hk_w_call.uCode = 'HSCEI';
    
SELECT 
    ying.hk_w_call.date, ying.hk_w_call.uCode, ying.hk_w_call.sum_call, ying.hk_w_put.sum_put
FROM
    ying.hk_w_call
        LEFT JOIN
    ying.hk_w_put ON ying.hk_w_call.uCode = ying.hk_w_put.uCode
        AND ying.hk_w_call.date = ying.hk_w_put.date
WHERE
    ying.hk_w_call.uCode = '03800';
    
SELECT 
    ying.hk_w_call.date, ying.hk_w_call.uCode, ying.hk_w_call.sum_call, ying.hk_w_put.sum_put
FROM
    ying.hk_w_call
        LEFT JOIN
    ying.hk_w_put ON ying.hk_w_call.uCode = ying.hk_w_put.uCode
        AND ying.hk_w_call.date = ying.hk_w_put.date
WHERE
    ying.hk_w_call.uCode = '00998';

SELECT 
    ying.hk_w_call.date, ying.hk_w_call.uCode, ying.hk_w_call.sum_call, ying.hk_w_put.sum_put
FROM
    ying.hk_w_call
        LEFT JOIN
    ying.hk_w_put ON ying.hk_w_call.uCode = ying.hk_w_put.uCode
        AND ying.hk_w_call.date = ying.hk_w_put.date
WHERE
    ying.hk_w_call.uCode = '01988';