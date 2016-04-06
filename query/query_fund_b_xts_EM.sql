SELECT * FROM ying.fund_b_xts_EM ORDER BY `dt`;

SELECT * FROM ying.fund_b_xts_EM where `idf` = '511010' ORDER BY `dt`;

SELECT DISTINCT x.idf, x.dt, if(z.amount = 0, NULL, round(100 * x.amount / z.amount, 3)) as cjezb FROM ying.fund_b_xts_EM x join fund_m_info y on (x.idf = y.idf_b or x.idf = y.idf_a or x.idf = y.idf_m) join index_xts z on (y.idi = z.idi  and x.dt = z.dt ) ORDER BY x.`dt`;

SELECT DISTINCT * FROM ying.fund_b_xts_EM x join fund_m_info y on (x.idf = y.idf_b or x.idf = y.idf_a or x.idf = y.idf_m) join index_xts z on (y.idi = z.idi  and x.dt = z.dt ) ORDER BY x.`dt`;


INSERT INTO `ying`.`fund_b_xts_EM`
(`idf`,
`dt`,
`cjezb`)
SELECT DISTINCT
    x.idf,
    x.dt,
    IF(z.amount = 0,
        NULL,
        round(100 * x.amount / z.amount, 3)) AS cjezb
FROM
    ying.fund_b_xts_EM x
        JOIN
    fund_m_info y ON (x.idf = y.idf_b OR x.idf = y.idf_a
        OR x.idf = y.idf_m)
        JOIN
    index_xts z ON (y.idi = z.idi AND x.dt = z.dt)
ORDER BY x.`dt` ON DUPLICATE KEY UPDATE `cjezb` = IF(z.amount = 0,NULL,round(100 * x.amount / z.amount, 3));


