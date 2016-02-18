SELECT 
    CONCAT('http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/MoneyFlow.ssl_qsfx_lscjfb?daima=',
            hs_s.code,
            '&page=',
            numbers.number,
            '&num=20&sort=opendate&asc=0') AS url_hs_s_MoneyFlow_HistoricalData
FROM
    ying.hs_s,
    ying.numbers
WHERE
    numbers.number <= 60 and hs_s.fW = 5;

SELECT CONCAT('http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/MoneyFlow.ssl_qsfx_lscjfb?daima=', hs_s.code, '&page=', numbers.number, '&num=20&sort=opendate&asc=0') AS url_hs_s_MoneyFlow_HistoricalData FROM ying.hs_s, ying.numbers WHERE numbers.number <= 60 and hs_s.fW = 5;

SELECT 
    CONCAT('http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/MoneyFlow.ssl_qsfx_lscjfb?daima=',
            (SELECT 
                    (CASE
                            WHEN fSH = 1 THEN 'sh'
                            ELSE 'sz'
                        END)
                ),
            code,
            '&page=1&num=1&sort=opendate&asc=0') AS url_hs_s_MoneyFlow_fW5
FROM
    hs_s
WHERE
    fW = 5;

/* url for daily data */
SELECT 
    CONCAT('http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/MoneyFlow.ssl_qsfx_lscjfb?daima=',
            (SELECT 
                    (CASE
                            WHEN fSH = 1 THEN 'sh'
                            ELSE 'sz'
                        END)
                ),
            code,
            '&page=1&num=1&sort=opendate&asc=0') AS url_hs_s_MoneyFlowDaily
FROM
    hs_s
WHERE
    f300 = 1;

SELECT 
    distinct code
FROM
    ying.hs_s_MoneyFlow
ORDER BY date DESC;

SELECT 
    count(*)
FROM
    ying.hs_s_MoneyFlow
ORDER BY date DESC;

/* might be quicker and more flexible than the next query */
SELECT 
    t1.code,
    t1.date,
    t1.price,
    t1.netAmount,
    SUM(t2.netAmount) AS Acumulate_netAmount
FROM
    (SELECT 
        *
    FROM
        ying.hs_s_MoneyFlow
    WHERE
        `code` IN ('000726')) t1
        INNER JOIN
    (SELECT 
        *
    FROM
        ying.hs_s_MoneyFlow) t2 ON t2.date <= t1.date
        AND t2.`code` = t1.code
WHERE
    t1.date >= '2015-01-19'
        AND t2.date >= '2015-01-19'
GROUP BY t1.code , t1.date
ORDER BY t1.code , t1.date;


/* might be quicker and more flexible than the next query */
SELECT 
    t1.code,
    t1.date,
    t1.price,
    t1.netAmount,
    SUM(t2.netAmount) AS Acumulate_netAmount
FROM
    (SELECT 
        *
    FROM
        ying.hs_s_MoneyFlow
    WHERE
        `code` IN ('600030' , '601318')) t1
        INNER JOIN
    (SELECT 
        *
    FROM
        ying.hs_s_MoneyFlow) t2 ON t2.date <= t1.date
        AND t2.`code` = t1.code
WHERE
    t1.date >= '2015-01-19'
        AND t2.date >= '2015-01-19'
GROUP BY t1.code , t1.date
ORDER BY t1.code , t1.date;

/* quicker and more flexible than the next query */
SELECT 
    code,
    date,
    netAmount,
    (SELECT 
            SUM(netAmount)
        FROM
            ying.hs_s_MoneyFlow
        WHERE
            `date` >= '2015-01-19'
                AND `code` = a.`code`
                AND `date` <= MAX(a.`date`)) cumulative_netAmount
FROM
    ying.hs_s_MoneyFlow a
WHERE
    date >= '2015-01-19'
--        AND `code` IN ('600030' , '601318')
GROUP BY code , date 
ORDER BY code , date desc;

/* too slow */
SELECT 
    t1.code,
    t1.date,
    t2.netAmount,
    SUM(t2.netAmount) AS Acumulate_netAmount
FROM
    (SELECT 
        *
    FROM
        ying.hs_s_MoneyFlow
    WHERE
        `code` IN ('600030' , '601318')) t1
        INNER JOIN
    (SELECT 
        *
    FROM
        ying.hs_s_MoneyFlow
    WHERE
        `code` IN ('600030' , '601318')) t2 ON t2.date <= t1.date AND t2.code = t1.code
WHERE
    t1.date >= '2015-01-19'
        AND t2.date >= '2015-01-19'
GROUP BY t1.code , t1.date
ORDER BY t1.code , t1.date;

SET @cumulative_sum := 0;
SELECT 
    date,
    @cumulative_sum:=@cumulative_sum + netAmount AS cumulative_sum
FROM
    ying.hs_s_MoneyFlow
WHERE
    date >= '2015-01-19'
        AND `code` = '600030'
ORDER BY date;

SELECT 
    sum(netAmount)
FROM
    ying.hs_s_MoneyFlow
WHERE
    date >= '2015-01-19';