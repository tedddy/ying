SELECT 
    code, amountXL, amountXLout,
    (amountXL - amountXLout) AS '超大单流入',
    amountL - amountLout AS '大单流入',
    amountS - amountSout AS '中单单流入',
    amountI - amountIout AS '小单流入',
    max(TimeSys),
    DateSys
--    max(TimeSys)    
FROM
    ying.hs_s_MoneyFlow_rt_EM
WHERE
    DateSys = CURRENT_DATE() AND
--      TimeSys > NOW() - INTERVAL 40 MINUTE AND  
-- , '601318', , '000726', '000511', '601928'
        code IN ('600550','002183','000002')
 GROUP BY code
ORDER BY code , Timesys DESC;




SELECT 
    code,
    amountXL - amountXLout AS '超大单流入',
    ROUND((amountXL - amountXLout) / (amountXL + amountXLout),
            4) AS '超大单流入占比',
    (amountL - amountLout) / (amountL + amountLout) AS '大单流入占比',
    amountL - amountLout AS '大单流入',
    amountS - amountSout AS '中单单流入',
    amountI - amountIout AS '小单流入',
    MAX(TimeSys),
    DateSys
FROM
    ying.hs_s_MoneyFlow_rt_EM
WHERE
    DateSys = CURDATE()
GROUP BY code, DateSys;

SELECT 
    amountXL - amountXLout
FROM
    ying.hs_s_MoneyFlow_rt_EM
WHERE
    TimeSys > NOW() - INTERVAL 3 MINUTE
        AND DateSys = CURDATE()
        AND code = '000002'
ORDER BY DateSys DESC , TimeSys DESC;

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
    ying.hs_s_MoneyFlow_rt_EM as rtmf
JOIN ying.hs300_s_data as hs300 on 
WHERE
    code = '002318';

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
    ying.hs_s_MoneyFlow_daily_EM
WHERE
    code = '002318';

DELETE FROM ying.hs_s_MoneyFlow_daily_EM 
WHERE
    id = 16926;

SELECT 
    *
FROM
    ying.hs_s_MoneyFlow_daily_EM
ORDER BY code , DateSys DESC;

-- date has to be included in quote
UPDATE hs_s_MoneyFlow_daily_EM 
SET 
    DateSys = '2015-02-27'
WHERE
    DateSys = '2015-02-28';
    
SELECT 
    *
FROM
    ying.hs_s_MoneyFlow_daily_EM
WHERE
    code = '002183';
    
DELETE FROM ying.hs_s_MoneyFlow_daily_EM 
WHERE
    DateSys = '2015-03-09'
    AND TimeSys > '19:52:36';
    
SELECT 
    *
FROM
    ying.hs_s_MoneyFlow_daily_EM
WHERE
    code = '601318';

DELETE FROM ying.hs_s_MoneyFlow_daily_EM 
WHERE
    id = 16926;