SELECT * FROM ying_calc.s_rt_hst ORDER BY `dt`;

SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '000007' ORDER BY `dt` DESC;

SELECT * FROM ying_calc.s_rt_hst ORDER BY `dt` DESC, ids;

SELECT * FROM ying_calc.s_rt_hst WHERE `dt` = '2015-11-06 14:15:00' ORDER BY `dt` DESC, ids;

SELECT * FROM ying_calc.s_rt_hst WHERE time(`dt`) = '15:05:00' ORDER BY `dt` DESC, ids;

SELECT * FROM ying_calc.s_rt_hst WHERE `dt` = '2015-11-19 10:35:00' ORDER BY `dt` DESC, ids;

SELECT * FROM ying_calc.s_rt_hst WHERE chgrate = 0.00 AND volume > 0.00 AND `dt` = '2015-11-06 14:15:00' ORDER BY `dt` DESC, ids;

SELECT * FROM ying_calc.s_rt_hst WHERE `cjezb` <= '0.00';

-- DELETE FROM ying_calc.s_rt_hst WHERE `dt` = '2015-11-09 15:05:00';

	SELECT 
    `index_stock_info`.`idi` AS `idi`,
    `index_info`.`name_i`,
    SUM(IF((`ying_calc`.`s_rt_hst`.`volume` > 0), 1, 0)) AS `n`,
    ROUND(SUM((`ying_calc`.`s_rt_hst`.`chgrate5` * `index_stock_info`.`weight`)),2) AS `rate5`,
    SUM(IF((`ying_calc`.`s_rt_hst`.`chgrate` > 0), 1, - 1)) AS `zd`,
    ROUND(SUM(IF((`ying_calc`.`s_rt_hst`.`chgrate` > 0),
        `index_stock_info`.weight,
        - 1 * `index_stock_info`.weight)),2) AS `zdW`,
    SUM(IF(((`ying_calc`.`s_rt_hst`.`chgrate` > 0)
            AND (`ying_calc`.`s_rt_hst`.`close` >= ROUND(((1 + 0.0382) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                2))),
        1,
        IF(((`ying_calc`.`s_rt_hst`.`chgrate` < 0)
                AND (`ying_calc`.`s_rt_hst`.`close` <= ROUND(((1 - 0.0382) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                    2))),
            - 1,
            0))) AS `zd382`,
   ROUND(SUM(IF(((`ying_calc`.`s_rt_hst`.`chgrate` > 0)
            AND (`ying_calc`.`s_rt_hst`.`close` >= ROUND(((1 + 0.0382) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                2))),
        `index_stock_info`.weight,
        IF(((`ying_calc`.`s_rt_hst`.`chgrate` < 0)
                AND (`ying_calc`.`s_rt_hst`.`close` <= ROUND(((1 - 0.0382) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                    2))),
            - 1 * `index_stock_info`.weight,
            0))),2) AS `zd382W`,
    SUM(IF(((`ying_calc`.`s_rt_hst`.`chgrate` > 0)
            AND (`ying_calc`.`s_rt_hst`.`close` >= ROUND(((1 + 0.0618) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                2))),
        1,
        IF(((`ying_calc`.`s_rt_hst`.`chgrate` < 0)
                AND (`ying_calc`.`s_rt_hst`.`close` <= ROUND(((1 - 0.0618) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                    2))),
            1,
            0))) AS `zd618`,
    ROUND(SUM(IF(((`ying_calc`.`s_rt_hst`.`chgrate` > 0)
            AND (`ying_calc`.`s_rt_hst`.`close` >= ROUND(((1 + 0.0618) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                2))),
        `index_stock_info`.weight,
        IF(((`ying_calc`.`s_rt_hst`.`chgrate` < 0)
                AND (`ying_calc`.`s_rt_hst`.`close` <= ROUND(((1 - 0.0618) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                    2))),
            - 1 * `index_stock_info`.weight,
            0))),2) AS `zd618W`,
    SUM(IF(((`ying_calc`.`s_rt_hst`.`chgrate` > 0)
            AND (`ying_calc`.`s_rt_hst`.`close` >= ROUND(((1 + 0.1) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                2))),
        1,
        IF(((`ying_calc`.`s_rt_hst`.`chgrate` < 0)
                AND (`ying_calc`.`s_rt_hst`.`close` <= ROUND(((1 - 0.1) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                    2))),
            - 1,
            0))) AS `zd1000`,
   ROUND( SUM(IF(((`ying_calc`.`s_rt_hst`.`chgrate` > 0)
            AND (`ying_calc`.`s_rt_hst`.`close` >= ROUND(((1 + 0.1) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                2))),
        `index_stock_info`.weight,
        IF(((`ying_calc`.`s_rt_hst`.`chgrate` < 0)
                AND (`ying_calc`.`s_rt_hst`.`close` <= ROUND(((1 - 0.1) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                    2))),
            - 1 * `index_stock_info`.weight,
            0))),2) AS `zd1000W`,
    `ying_calc`.`s_rt_hst`.`dt` AS `dt`
FROM
    (`ying_calc`.`s_rt_hst`
    LEFT JOIN `index_stock_info` ON ((`ying_calc`.`s_rt_hst`.`ids` = `index_stock_info`.`ids`) AND DATE(`ying_calc`.`s_rt_hst`.`dt`) = DATE_SUB(CURDATE(), INTERVAL 1 DAY))
    JOIN index_info ON (`index_stock_info`.`idi` = `index_info`.`idi`))
WHERE
    (`index_stock_info`.`idi` IS NOT NULL)
GROUP BY `ying_calc`.`s_rt_hst`.`dt` , `index_stock_info`.`idi`
ORDER BY `ying_calc`.`s_rt_hst`.`dt` DESC , `index_stock_info`.`idi`;