SELECT 
    *
FROM
    ying.hs300_s_data;

SELECT 
    *
FROM
    ying.hs300_s_data
WHERE
    code = '601318'
ORDER BY id DESC;

SELECT 
    *
FROM
    ying.hs300_s_data
WHERE
    DateSys = '2015-07-27'
ORDER BY id DESC;

DELETE FROM ying.hs300_s_data 
WHERE
    DateSys = '2015-05-08' and TimeSys < '15:00:00';

DELETE FROM ying.hs300_s_data 
WHERE
    DateSys = '2015-08-16';
    
-- 统计同一天采集数据的次数，目的是让每一天只有一次采集数据
select count(*), DateSys from ying.hs300_s_data where code = '601318' group by DateSys;

SELECT 
    `hs300_s_data`.`id`,
    `hs300_s_data`.`code`,
    `hs300_s_data`.`name`,
    `hs300_s_data`.`weight`,
    `hs300_s_data`.`gxzs`,
    `hs300_s_data`.`iName`,
    `hs300_s_data`.`iCode`,
    `hs300_s_data`.`nmc`,
    `hs300_s_data`.`mktcap`,
    `hs300_s_data`.`last`,
    `hs300_s_data`.`chgprice`,
    `hs300_s_data`.`chgrate`,
    `hs300_s_data`.`buy`,
    `hs300_s_data`.`sell`,
    `hs300_s_data`.`close`,
    `hs300_s_data`.`open`,
    `hs300_s_data`.`high`,
    `hs300_s_data`.`low`,
    `hs300_s_data`.`volume`,
    `hs300_s_data`.`amount`,
    `hs300_s_data`.`ltsz`,
    `hs300_s_data`.`TimeSys`,
    `hs300_s_data`.`DateSys`
FROM
    `ying`.`hs300_s_data`
ORDER BY id DESC;

-- 按日期统计涨跌停个股，用where语句，查询速度较慢

SELECT 
    a.DateSys, count_zt, count_dt
FROM
    (SELECT 
        COUNT(id) AS count_zt, DateSys
    FROM
        ying.hs300_s_data
    WHERE
        close >= ROUND(1.1 * (100 * close / (100 + chgrate)), 2)
    GROUP BY DateSys) a,
    (SELECT 
        COUNT(id) AS count_dt, DateSys
    FROM
        ying.hs300_s_data
    WHERE
        close <= ROUND(0.9 * (100 * close / (100 + chgrate)), 2)
    GROUP BY DateSys) b
WHERE
    a.DateSys = b.DateSys
ORDER BY DateSys DESC;

-- 按日期统计涨跌停个股，不用where语句，查询速度较快 
SELECT 
    DateSys,
    SUM(IF(close >= ROUND(1.1 * (100 * close / (100 + chgrate)), 2),
        1,
        0)) as zt,
    SUM(IF(close <= ROUND(0.9 * (100 * close / (100 + chgrate)), 2),
        1,
        0)) as dt
FROM
    ying.hs300_s_data
GROUP BY DateSys
ORDER BY DateSys DESC;


-- 查询weight（权重）
SELECT DISTINCT
    code, name, iname, weight
FROM
    ying.hs300_s_data
ORDER BY weight DESC;

-- 查询weight（权重）的变化
SELECT 
    code, name, weight, DateSys
FROM
    ying.hs300_s_data
WHERE
    code = 601318
ORDER BY DateSys DESC;

-- trigger
CREATE DEFINER=`gxh`@`%` TRIGGER `ying`.`hs300_s_data_BEFORE_INSERT`
BEFORE INSERT ON `ying`.`hs300_s_data`
FOR EACH ROW
SET NEW.volume = NEW.volume * 100