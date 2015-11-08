SELECT * FROM ying_calc.s_rt_hst;

SELECT * FROM ying_calc.s_rt_hst order by dt desc, ids;

SELECT * FROM ying_calc.s_rt_hst where dt = '2015-11-06 14:15:00' order by dt desc, ids;

SELECT * FROM ying_calc.s_rt_hst where chgrate = 0.00 and volume > 0.00 and dt = '2015-11-06 14:15:00' order by dt desc, ids;


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
    LEFT JOIN `index_stock_info` ON ((`ying_calc`.`s_rt_hst`.`ids` = `index_stock_info`.`ids`) and date(`ying_calc`.`s_rt_hst`.dt) = DATE_SUB(curdate(), interval 1 day))
    JOIN index_info ON (`index_stock_info`.`idi` = `index_info`.`idi`))
WHERE
    (`index_stock_info`.`idi` IS NOT NULL)
GROUP BY `ying_calc`.`s_rt_hst`.`dt` , `index_stock_info`.`idi`
ORDER BY `ying_calc`.`s_rt_hst`.`dt` DESC , `index_stock_info`.`idi`;