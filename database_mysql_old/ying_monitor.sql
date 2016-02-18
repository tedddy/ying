SELECT 
    code,
    amountXL - amountXLout AS netXL,
    netAmount,
    TimeSys,
    DateSys,
    DatetimeSys
FROM
    ying.hs_s_MoneyFlow_rt
WHERE
    DateSys = CURRENT_DATE() and TimeSys > curtime() - 2000
        AND code IN ('600030' , '601318')
ORDER BY code , DateSys DESC , TimeSys DESC;

SELECT 
    code,
    amountXL - amountXLout AS aXLnet,
    amountL - amountLout AS aLnet,
    amountS - amountSout AS aSnet,
    amountI - amountIout AS aInet,
    TimeSys
FROM
    ying.hs_s_MoneyFlow_rt_EM
WHERE
    DateSys = CURRENT_DATE()
        AND TimeSys > CURTIME() - 2000
        AND code IN ('600030' , '601318')
ORDER BY code , Timesys DESC;