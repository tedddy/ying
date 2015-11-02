INSERT INTO `ying_calc`.`index_cons_stat_zd`
(`idi`,
`name_i`,
`n`,
`rate5`,
`zd`,
`zdW`,
`zd382`,
`zd382W`,
`zd618`,
`zd618W`,
`zd1000`,
`zd1000W`,
`dt`)
	SELECT 
    `index_stock_info`.`idi` AS `idi`,
    `index_info`.`name_i`,
    SUM(IF((`s_rt`.`volume` > 0), 1, 0)) AS `n`,
    ROUND(SUM((`s_rt`.`chgrate5` * `index_stock_info`.`weight`)),2) AS `rate5`,
    SUM(IF((`s_rt`.`chgrate` > 0), 1, - 1)) AS `zd`,
    ROUND(SUM(IF((`s_rt`.`chgrate` > 0),
        `index_stock_info`.weight,
        - 1 * `index_stock_info`.weight)),2) AS `zdW`,
    SUM(IF(((`s_rt`.`chgrate` > 0)
            AND (`s_rt`.`close` >= ROUND(((1 + 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        1,
        IF(((`s_rt`.`chgrate` < 0)
                AND (`s_rt`.`close` <= ROUND(((1 - 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                    2))),
            - 1,
            0))) AS `zd382`,
   ROUND(SUM(IF(((`s_rt`.`chgrate` > 0)
            AND (`s_rt`.`close` >= ROUND(((1 + 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        `index_stock_info`.weight,
        IF(((`s_rt`.`chgrate` < 0)
                AND (`s_rt`.`close` <= ROUND(((1 - 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                    2))),
            - 1 * `index_stock_info`.weight,
            0))),2) AS `zd382W`,
    SUM(IF(((`s_rt`.`chgrate` > 0)
            AND (`s_rt`.`close` >= ROUND(((1 + 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        1,
        IF(((`s_rt`.`chgrate` < 0)
                AND (`s_rt`.`close` <= ROUND(((1 - 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                    2))),
            1,
            0))) AS `zd618`,
    ROUND(SUM(IF(((`s_rt`.`chgrate` > 0)
            AND (`s_rt`.`close` >= ROUND(((1 + 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        `index_stock_info`.weight,
        IF(((`s_rt`.`chgrate` < 0)
                AND (`s_rt`.`close` <= ROUND(((1 - 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                    2))),
            - 1 * `index_stock_info`.weight,
            0))),2) AS `zd618W`,
    SUM(IF(((`s_rt`.`chgrate` > 0)
            AND (`s_rt`.`close` >= ROUND(((1 + 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        1,
        IF(((`s_rt`.`chgrate` < 0)
                AND (`s_rt`.`close` <= ROUND(((1 - 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                    2))),
            - 1,
            0))) AS `zd1000`,
   ROUND( SUM(IF(((`s_rt`.`chgrate` > 0)
            AND (`s_rt`.`close` >= ROUND(((1 + 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        `index_stock_info`.weight,
        IF(((`s_rt`.`chgrate` < 0)
                AND (`s_rt`.`close` <= ROUND(((1 - 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                    2))),
            - 1 * `index_stock_info`.weight,
            0))),2) AS `zd1000W`,
    `s_rt`.`dt` AS `dt`
FROM
    (`s_rt`
    LEFT JOIN `index_stock_info` ON ((`s_rt`.`ids` = `index_stock_info`.`ids`))
    JOIN index_info ON (`index_stock_info`.`idi` = `index_info`.`idi`))
WHERE
    (`index_stock_info`.`idi` IS NOT NULL)
GROUP BY `s_rt`.`dt` , `index_stock_info`.`idi`
ORDER BY `s_rt`.`dt` DESC , `index_stock_info`.`idi`;

-- select * from hs_s_xts where amount is null;

DELETE FROM hs_s_xts WHERE amount IS NULL;

-- DELETE from hs_s_xts_history_sina where amount is null;

SELECT xts.code, xts.date, ROUND(xts.amount/hst.amount) FROM hs_s_xts xts LEFT JOIN ying.hs_s_xts_history_sina hst ON xts.code=hst.code AND xts.date=hst.date where ROUND(xts.amount/hst.amount) < 100 ORDER BY date DESC, code;

SELECT xts.code, xts.date, ROUND(xts.amount/hst.amount) FROM hs_s_xts xts LEFT JOIN ying.s_xts hst ON xts.code=hst.ids AND xts.date=hst.d where code = '601318' ORDER BY date DESC, code;

SELECT xts.ids, xts.d, ROUND(xts.amount/hst.amount) FROM ying.s_xts xts LEFT outer JOIN hs_s_xts hst ON xts.ids=hst.code where code = '601318';

SELECT xts.ids, xts.d, hst.amount FROM ying.s_xts xts LEFT JOIN hs_s_xts hst ON xts.ids=hst.code where xts.ids = '000001' and hst.code is null;


select * FROM hs_s_xts xts where code = '601318' ORDER BY date DESC, code;

select * FROM ying.s_xts where ids = '601318' ORDER BY d DESC, ids;

select * from ying.hs_s_xts_history_sina where code = '601318' ORDER BY date desc;