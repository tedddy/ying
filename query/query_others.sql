SELECT `hs_s_xts_history_sina`.`id`,
    `hs_s_xts_history_sina`.`code`,
    `hs_s_xts_history_sina`.`date`,
    `hs_s_xts_history_sina`.`open`,
    `hs_s_xts_history_sina`.`high`,
    `hs_s_xts_history_sina`.`low`,
    `hs_s_xts_history_sina`.`close`,
    `hs_s_xts_history_sina`.`volume`,
    `hs_s_xts_history_sina`.`amount`
FROM `ying`.`hs_s_xts_history_sina`;

SELECT * FROM ying.hs_s_xts_history_sina;

SELECT * FROM ying.hs_s_xts_history_sina order by date desc;

SELECT * FROM ying.hs_s_xts_history_sina where code = '601318' order by date desc;

SELECT * FROM ying.hs_s_xts_history_sina where open is null;

SELECT count(*) FROM ying.hs_s_xts_history_sina;

-- url generator
SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/', s.code, '.phtml?year=', date.year,'&jidu=', date.quarter) AS 'hs_s_xts_history_sina_1' FROM hs_s as s join year_quarter as date  where year <= '2006' and concat(year(s.pDate), quarter(s.pDate)) <= concat(date.year, date.quarter);

-- url generator beatified
SELECT DISTINCT
    CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/',
            s.code,
            '.phtml?year=',
            date.year,
            '&jidu=',
            date.quarter) AS 'hs_s_xts_history_sina_1'
FROM
    hs_s AS s
        JOIN
    year_quarter AS date
WHERE
    year <= '2006'
        AND CONCAT(YEAR(s.pDate), QUARTER(s.pDate)) <= CONCAT(date.year, date.quarter);


delete from ying.hs_s_xts_history_sina where code = '[db:co';