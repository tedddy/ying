SELECT DISTINCT
    arbitrage.`code` AS `母基金`,
    mother.name AS '基金名字',
    arbitrage.`b` AS `B基金`,
    arbitrage.zjl AS `整体折价率`,
    arbitrage.jjjz_mother AS `母净值`,
    arbitrage.jjjz_b AS `b净值`,
    arbitrage.price_b AS `b价格`,
    ROUND((arbitrage.jjjz_b - arbitrage.price_b) / arbitrage.jjjz_b,
            4) AS `b基折价率`,
    arbitrage.jjjz_a AS `a净值`,
    arbitrage.price_a AS `a价格`
FROM
    ying.hs_fund_arbitrage_current AS arbitrage
        JOIN
    hs_fund_f10_mother AS mother ON arbitrage.code = mother.code
WHERE
    arbitrage.b IN (150204 , 150316, 150029,
        150206,
        150182,
        150210,
        150180,
        150288,
        150322,
        150246,
        150224,
        150178,
        150118,
        150029,
        150172,
        150176,
        150222,
        150294)
ORDER BY `b价格` , `b基折价率` DESC;