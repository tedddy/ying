SELECT * FROM ying.hs_fund_arbitrage_current;

SELECT DISTINCT
    arbitrage.`code` AS `母基金`,
    mother.name AS '基金名字',
    arbitrage.`a` AS `a基金`,
    arbitrage.`b` AS `b基金`,
    arbitrage.zjl AS `整体折价率`,
    arbitrage.jjjz_mother AS `母净值`,
    arbitrage.jjjz_b AS `b净值`,
    arbitrage.price_b AS `b价格`,
    ROUND((arbitrage.jjjz_b - arbitrage.price_b) / arbitrage.jjjz_b,4) AS `b基折价率`,
    arbitrage.jjjz_a AS `a净值`,
    arbitrage.price_a AS `a价格`
FROM
    ying.hs_fund_arbitrage_current AS arbitrage
        JOIN
    hs_fund_f10_mother AS mother ON arbitrage.code = mother.code
ORDER BY `b净值`, `b价格` , `b基折价率` DESC;
