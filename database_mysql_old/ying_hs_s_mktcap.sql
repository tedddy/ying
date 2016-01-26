SELECT 
    *
FROM
    ying.hs_s_mktcap;

SELECT 
    *
FROM
    ying.hs_s_mktcap
WHERE
    code = '601318' AND cDate = '2015-07-28';

SELECT 
    *
FROM
    ying.hs_s_mktcap
ORDER BY id DESC;

SELECT 
    *
FROM
    ying.hs_s_mktcap
WHERE
    code = '601318'
ORDER BY cDate DESC;

-- 选择最近日期的mktcap （错误的语句，正确的在下面）
SELECT 
    code, MAX(cDate), mktcap, nmc 
FROM
    ying.hs_s_mktcap
GROUP BY code;

-- 选择最近日期的mktcap
SELECT 
    max.code, max.cDate_max, mktcap.mktcap, mktcap.nmc
FROM
    (SELECT 
        code, MAX(cDate) AS cDate_max
    FROM
        ying.hs_s_mktcap
    GROUP BY code) AS max
        JOIN
    ying.hs_s_mktcap AS mktcap ON max.code = mktcap.code
        AND max.cDate_max = mktcap.cDate;
-- 选择最近日期的mktcap（不用subquery） sql - Fetch the row which has the Max value for a column - Stack Overflow 
SELECT 
    a.code, a.cDate, a.mktcap, a.nmc
FROM
    ying.hs_s_mktcap AS a
        LEFT OUTER JOIN
    ying.hs_s_mktcap AS b ON (a.code = b.code
        AND (a.cDate < b.cDate
        OR (a.cDate = b.cDate AND a.id < b.id)))
WHERE
    b.code IS NULL;
        
        

-- temp view 
DROP VIEW `ying`.`z_hs_s_mktcap_c_2`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `z_hs_s_mktcap_c` AS
    SELECT 
    code, MAX(cDate) AS cDate_max
FROM
    ying.hs_s_mktcap
GROUP BY code;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_mktcap_c` AS
    SELECT 
    max.code, max.cDate_max, mktcap.mktcap, mktcap.nmc
FROM
    z_hs_s_mktcap_c AS max
        JOIN
    ying.hs_s_mktcap AS mktcap ON max.code = mktcap.code
        AND max.cDate_max = mktcap.cDate;

select * from `ying`.`hs_s_mktcap_c`;
DROP VIEW `ying`.`hs_s_mktcap_c`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_mktcap_c` AS -- c means current.
    SELECT 
    a.code, a.cDate, a.mktcap, a.nmc
FROM
    ying.hs_s_mktcap AS a
        LEFT OUTER JOIN
    ying.hs_s_mktcap AS b ON (a.code = b.code
        AND (a.cDate < b.cDate
        OR (a.cDate = b.cDate AND a.id < b.id)))
WHERE
    b.code IS NULL order by a.code;

