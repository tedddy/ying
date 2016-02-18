SELECT 
    date, ticktime, price, netAmount
FROM
    ying.hs300_MoneyFlow
WHERE
    date > '2015-02-10'
ORDER BY date DESC , ticktime DESC;

/*
DELETE FROM ying.hs300_MoneyFlow 
WHERE
DateSys = '2015-03-03' AND ticktime < '12:59:59' AND ticktime > '11:33:00';
*/
    
SELECT * FROM ying.hs300_MoneyFlow 
WHERE
    DateSys = '2015-03-03' AND ticktime < '12:59:59' AND ticktime > '11:33:00';
    
SELECT 
    count(distinct date)
FROM
    ying.hs300_MoneyFlow
WHERE
    date > '15-01-31' AND date < '15-03-01'; 