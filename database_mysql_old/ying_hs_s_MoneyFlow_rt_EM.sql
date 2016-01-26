SELECT 
    code,
    amountXL - amountXLout AS '超大单流入',
    amountL - amountLout AS '大单流入',
    amountS - amountSout AS '中单单流入',
    amountI - amountIout AS '小单流入',
    TimeSys,
    DateSys
--    max(TimeSys)    
FROM
    ying.hs_s_MoneyFlow_rt_EM
WHERE
    DateSys = CURRENT_DATE() AND
--      TimeSys > NOW() - INTERVAL 40 MINUTE AND  
-- , '601318', , '000726', '000511', '601928'
        code IN ('600550','002183')
-- GROUP BY code
ORDER BY code , Timesys DESC;

SELECT 
    code,
    amountXL - amountXLout AS '超大单流入',
    (amountXL - amountXLout)/(amountXL + amountXLout) AS '超大单流入占比',    
    (amountL - amountLout)/(amountL + amountLout) AS '大单流入占比',
    amountL - amountLout AS '大单流入',
    amountS - amountSout AS '中单单流入',
    amountI - amountIout AS '小单流入',
    TimeSys, DateSys
--    max(TimeSys)    
FROM
    ying.hs_s_MoneyFlow_rt_EM
-- WHERE
--    code = '002318'
order by DateSys desc, TimeSys;

SELECT 
    code, amountXL, amountXLout, amountXLout - amountXL,
    (amountXL - amountXLout) AS 'aXLnet',
    (amountL - amountLout) AS 'aLnet',
    (amountS - amountSout) AS 'aSnet',
    (amountI - amountIout) AS 'aInet',
    MAX(TimeSys)
FROM
    ying.hs_s_MoneyFlow_rt_EM
WHERE
    DateSys = CURRENT_DATE() - 1 AND
    code IN ('600030' , '601318',
        '002183',
        '000726',
        '000511',
        '601928')
GROUP BY code
ORDER BY code , Timesys DESC;

SELECT 
    code,
    amountXL - amountXLout AS '超大单流入',
    amountL - amountLout AS '大单流入',
    amountS - amountSout AS '中单单流入',
    amountI - amountIout AS '小单流入',
    TimeSys
--    max(TimeSys)    
FROM
    ying.hs_s_MoneyFlow_rt_EM
WHERE
    DateSys = CURRENT_DATE() AND
--      TimeSys > NOW() - INTERVAL 40 MINUTE AND  
-- , '601318', , '000726', '000511', '601928'
        code IN ('600550','002183')
-- GROUP BY code
ORDER BY code , Timesys DESC;


SELECT
    *
FROM
    ying.hs_s_MoneyFlow_rt_EM
WHERE
    code IN ('600030' , '601318')
ORDER BY Datesys DESC , code , Timesys DESC;

SELECT CONCAT('http://s1.dfcfw.com/xml/', code, '.xml') as url_hs_s_MoneyFlow_rt_EM FROM hs_s WHERE f50A = 1 OR fW >= 5;

SELECT 
    *
FROM
    ying.hs_s_MoneyFlow_rt_EM
ORDER BY Datesys DESC , code, Timesys;

SELECT 
    COUNT(*)
FROM
    ying.hs_s_MoneyFlow_rt_EM;

/* url for daily data */
SELECT CONCAT('http://s1.dfcfw.com/xml/', code, '.xml') as url_hs_s_MoneyFlow_rt_EM FROM hs_s WHERE f300 = 1;  