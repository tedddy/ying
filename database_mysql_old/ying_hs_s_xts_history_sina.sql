SELECT * FROM ying.hs_s_xts_history_sina;

-- test
SELECT DISTINCT
    `code`, YEAR(`date`) AS `year`, QUARTER(`date`) AS `quarter`
FROM
    ying.hs_s_xts_history_sina
WHERE
    code = '601318';


SELECT 
    xts.`code`, COUNT(*)
FROM
    (SELECT DISTINCT
        `code`, YEAR(`date`), QUARTER(`date`)
    FROM
        ying.hs_s_xts_history_sina) xts
GROUP BY xts.`code`;

SELECT DISTINCT
    s.code, dt.year, dt.quarter
FROM
    hs_s AS s
        JOIN
    year_quarter AS dt
WHERE
    code = '601318' AND dt.year < '2016'
        AND CONCAT(YEAR(s.pDate), QUARTER(s.pDate)) <= CONCAT(dt.year, dt.quarter);
        
SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/', s.code, '.phtml?year=', dt.year,'&jidu=', dt.quarter) AS 'hs_s_xts_history_sina_current' FROM hs_s as s join year_quarter as dt  where s.fW > 0 AND dt.year = year(curdate()) and dt.quarter = quarter(curdate());

-- url for locoy project hs_s_xts_history_sina: missing quarters where dt.year > '2014' and dt.year < '2016'.
-- the following query has no line breaks and extra whitespaces and tabs.
	-- line breaks are removed by notepad++; refer to "How to remove linebreaks in Notepad++? - Super User"
	-- extra whitespaces and tabs are trimmed by http://www.textfixer.com/tools/remove-white-spaces.php
SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/', s.code, '.phtml?year=', dt.year, '&jidu=', dt.quarter) AS 'hs_s_xts_history_missing_2015' FROM hs_s AS s JOIN (SELECT * FROM (SELECT DISTINCT s.code, dt.year, dt.quarter FROM hs_s AS s JOIN year_quarter AS dt WHERE dt.year > '2014' AND dt.year < '2016' AND CONCAT(YEAR(s.pDate), QUARTER(s.pDate)) <= CONCAT(dt.year, dt.quarter)) a WHERE NOT EXISTS( SELECT DISTINCT `code`, YEAR(`date`) AS `year`, QUARTER(`date`) AS `quarter` FROM ying.hs_s_xts_history_sina WHERE code = a.code AND YEAR(`date`) = a.year AND QUARTER(`date`) = a.quarter)) AS dt ON s.code = dt.code WHERE s.fW > 0 AND CONCAT(YEAR(s.pDate), QUARTER(s.pDate)) <= CONCAT(dt.year, dt.quarter); 

-- url for locoy project hs_s_xts_history_sina: missing quarters where dt.year > '2014' and dt.year < '2016'.

SELECT DISTINCT
    CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/',
            s.code,
            '.phtml?year=',
            dt.year,
            '&jidu=',
            dt.quarter) AS 'hs_s_xts_history_missing_2015'
FROM
    hs_s AS s
        JOIN
    (SELECT 
        *
    FROM
        (SELECT DISTINCT
        s.code, dt.year, dt.quarter
    FROM
        hs_s AS s
    JOIN year_quarter AS dt
    WHERE
        dt.year > '2014' AND dt.year < '2016'
            AND CONCAT(YEAR(s.pDate), QUARTER(s.pDate)) <= CONCAT(dt.year, dt.quarter)) a
    WHERE
        NOT EXISTS( SELECT DISTINCT
                `code`, YEAR(`date`) AS `year`, QUARTER(`date`) AS `quarter`
            FROM
                ying.hs_s_xts_history_sina
            WHERE
                code = a.code AND YEAR(`date`) = a.year
                    AND QUARTER(`date`) = a.quarter)) AS dt ON s.code = dt.code
WHERE
    s.fW > 0
        AND CONCAT(YEAR(s.pDate), QUARTER(s.pDate)) <= CONCAT(dt.year, dt.quarter);

-- look for which quarters' data is missing in ying.hs_s_xts_history_sina where dt.year > '2014' and dt.year < '2016'. This query takes much less time than the next one.
SELECT 
    *
FROM
    (SELECT DISTINCT
        s.code, dt.year, dt.quarter
    FROM
        hs_s AS s
    JOIN year_quarter AS dt
    WHERE
        s.fW > 0 AND dt.year > '2014'
            AND dt.year < '2016'
            AND CONCAT(YEAR(s.pDate), QUARTER(s.pDate)) <= CONCAT(dt.year, dt.quarter)) a
WHERE
    NOT EXISTS( SELECT DISTINCT
            `code`, YEAR(`date`) AS `year`, QUARTER(`date`) AS `quarter`
        FROM
            ying.hs_s_xts_history_sina
        WHERE
            code = a.code AND YEAR(`date`) = a.year
                AND QUARTER(`date`) = a.quarter);

-- look for which quarters' data is missing in ying.hs_s_xts_history_sina        
SELECT 
    a.code, a.year, a.quarter
FROM
    (SELECT DISTINCT
        s.code, dt.year, dt.quarter
    FROM
        hs_s AS s
    JOIN year_quarter AS dt
    WHERE
        s.fW > 0 AND dt.year < '2016'
            AND CONCAT(YEAR(s.pDate), QUARTER(s.pDate)) <= CONCAT(dt.year, dt.quarter)) a
        LEFT OUTER JOIN
    (SELECT DISTINCT
        `code`, YEAR(`date`) AS `year`, QUARTER(`date`) AS `quarter`
    FROM
        ying.hs_s_xts_history_sina) b ON (a.code = b.code AND a.year = b.year
        AND a.quarter = b.quarter)
WHERE
    b.code IS NULL AND b.year IS NULL
        AND b.quarter IS NULL;

-- look for which quarters' data is missing in ying.hs_s_xts_history_sina. Problem: 0 row returned, and no message. Troubleshooting: in where clause, "year" in  "SELECT DISTINCT `code`, YEAR(`date`) AS `year`" cannot be used.
SELECT 
    *
FROM
    (SELECT DISTINCT
        s.code, dt.year, dt.quarter
    FROM
        hs_s AS s
    JOIN year_quarter AS dt
    WHERE
        dt.year < '2016' and CONCAT(YEAR(s.pDate), QUARTER(s.pDate)) <= CONCAT(dt.year, dt.quarter)) a
WHERE
    NOT EXISTS( SELECT DISTINCT
            `code`, YEAR(`date`) AS `year`, QUARTER(`date`) AS `quarter`
        FROM
            ying.hs_s_xts_history_sina
        WHERE
            code = a.code AND year = a.year
                AND quarter = a.quarter);
        
SELECT 
    a.code, a.year, a.quarter
FROM
    (SELECT DISTINCT
        s.code, dt.year, dt.quarter
    FROM
        hs_s AS s
    JOIN year_quarter AS dt
    WHERE
        CONCAT(YEAR(s.pDate), QUARTER(s.pDate)) <= CONCAT(dt.year, dt.quarter)) a
where not EXISTS
    (SELECT DISTINCT
        `code`, YEAR(`date`) AS `year`, QUARTER(`date`) AS `quarter`
    FROM
        ying.hs_s_xts_history_sina);
    
SELECT DISTINCT
    s.code, dt.year, dt.quarter
FROM
    hs_s AS s
        JOIN
    year_quarter AS dt
WHERE
    CONCAT(YEAR(s.pDate), QUARTER(s.pDate)) <= CONCAT(dt.year, dt.quarter);
    


SELECT * FROM ying.hs_s_xts_history_sina ORDER BY date DESC;

SELECT * FROM ying.hs_s_xts_history_sina WHERE code = '601318' ORDER BY date DESC;
SELECT * FROM ying.hs_s_xts_history_sina WHERE code = '600000' ORDER BY date DESC;


SELECT * FROM ying.hs_s_xts_history_sina WHERE open IS NULL;

SELECT COUNT(*) FROM ying.hs_s_xts_history_sina;

SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/', s.code, '.phtml?year=', date.year,'&jidu=', date.quarter) AS 'hs_s_xts_history_sina_1' FROM hs_s AS s JOIN year_quarter AS date  WHERE year <= '2006' AND CONCAT(YEAR(s.pDate), QUARTER(s.pDate)) <= CONCAT(date.year, date.quarter);

DELETE FROM ying.hs_s_xts_history_sina WHERE code = '[db:co';

