SELECT DISTINCT
    f.code_fjjj_mother AS code_fjjj,
    f.name_index AS name_index,
    f.code_index AS code_index,
    a.zjl
FROM
    ying.hs_fund_fjjj_index AS f
        JOIN
    hs_fund_arbitrage_current AS a ON f.code_fjjj_mother = a.code
ORDER BY zjl;