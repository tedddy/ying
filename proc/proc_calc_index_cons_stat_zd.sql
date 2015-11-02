DROP PROCEDURE `calc_index_cons_stat_zd`;

CALL `calc_index_cons_stat_zd`;

drop PROCEDURE `calc_index_cons_stat_zd`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `calc_index_cons_stat_zd`()
BEGIN
INSERT IGNORE INTO `ying_calc`.`index_cons_stat_zd`
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
-- 所有指数涨跌统计
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

-- select 
SELECT * FROM `ying_calc`.`index_cons_stat_zd` order by dt desc, idi;

-- TRUNCATE table `ying`.`s_rt`, to make the query above much faster.
TRUNCATE `ying`.`s_rt`;
END$$
DELIMITER ;


-- tedd improved: too many fields. z + d, zfg + dfg, zg + dz, zt + dt, 都是相等的。所以可以加列z + d，z-d, zfg-dfg, ..., zt-dt, 去掉z, d, ..., zt, dt, 
	SELECT 
    `index_stock_info`.`idi` AS `idi`,
    `index_info`.`name_i`,
    SUM((`s_rt`.`chgrate5` * `index_stock_info`.`weight`)) AS `rate5`,
    SUM(IF((`s_rt`.`chgrate` > 0), 1, - 1)) AS `zd`,
    SUM(IF((`s_rt`.`chgrate` > 0),
        `index_stock_info`.weight,
        - 1 * `index_stock_info`.weight)) AS `zdW`,
    SUM(IF(((`s_rt`.`chgrate` > 0)
            AND (`s_rt`.`close` >= ROUND(((1 + 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        1,
        IF(((`s_rt`.`chgrate` < 0)
                AND (`s_rt`.`close` <= ROUND(((1 - 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                    2))),
            - 1,
            0))) AS `zd382`,
    SUM(IF(((`s_rt`.`chgrate` > 0)
            AND (`s_rt`.`close` >= ROUND(((1 + 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        `index_stock_info`.weight,
        IF(((`s_rt`.`chgrate` < 0)
                AND (`s_rt`.`close` <= ROUND(((1 - 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                    2))),
            - 1 * `index_stock_info`.weight,
            0))) AS `zd382W`,
    SUM(IF(((`s_rt`.`chgrate` > 0)
            AND (`s_rt`.`close` >= ROUND(((1 + 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        1,
        IF(((`s_rt`.`chgrate` < 0)
                AND (`s_rt`.`close` <= ROUND(((1 - 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                    2))),
            1,
            0))) AS `zd618`,
    SUM(IF(((`s_rt`.`chgrate` > 0)
            AND (`s_rt`.`close` >= ROUND(((1 + 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        `index_stock_info`.weight,
        IF(((`s_rt`.`chgrate` < 0)
                AND (`s_rt`.`close` <= ROUND(((1 - 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                    2))),
            - 1 * `index_stock_info`.weight,
            0))) AS `zd618W`,
    SUM(IF(((`s_rt`.`chgrate` > 0)
            AND (`s_rt`.`close` >= ROUND(((1 + 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        1,
        IF(((`s_rt`.`chgrate` < 0)
                AND (`s_rt`.`close` <= ROUND(((1 - 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                    2))),
            - 1,
            0))) AS `zd1000`,
    SUM(IF(((`s_rt`.`chgrate` > 0)
            AND (`s_rt`.`close` >= ROUND(((1 + 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        `index_stock_info`.weight,
        IF(((`s_rt`.`chgrate` < 0)
                AND (`s_rt`.`close` <= ROUND(((1 - 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                    2))),
            - 1 * `index_stock_info`.weight,
            0))) AS `zd1000W`,
    `s_rt`.`dt` AS `dt`
FROM
    (`s_rt`
    LEFT JOIN `index_stock_info` ON ((`s_rt`.`ids` = `index_stock_info`.`ids`))
    JOIN index_info ON (`index_stock_info`.`idi` = `index_info`.`idi`))
WHERE
    (`index_stock_info`.`idi` IS NOT NULL)
GROUP BY `s_rt`.`dt` , `index_stock_info`.`idi`
ORDER BY `s_rt`.`dt` DESC , `index_stock_info`.`idi`;

-- tedd improve: too many fields. z + d, zfg + dfg, zg + dz, zt + dt, 都是相等的。所以可以加列z + d，z-d, zfg-dfg, ..., zt-dt, 去掉z, d, ..., zt, dt, 
    SELECT 
    `index_stock_info`.`idi` AS `idi`,
    `index_info`.`name_i`,
    SUM((`s_rt`.`chgrate5` * `index_stock_info`.`weight`)) AS `rate5`,
    SUM(IF((`s_rt`.`chgrate` > 0), 1, 0)) AS `z`,
    SUM(IF((`s_rt`.`chgrate` > 0),
        `index_stock_info`.weight,
        0)) AS `zw`,
    SUM(IF((`s_rt`.`chgrate` < 0), 1, 0)) AS `d`,
    SUM(IF((`s_rt`.`chgrate` < 0),
        `index_stock_info`.weight,
        0)) AS `dw`,
    SUM(IF(((`s_rt`.`chgrate` > 0)
            AND (`s_rt`.`close` >= ROUND(((1+0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        1,
        0)) AS `zfg`,
    SUM(IF(((`s_rt`.`chgrate` > 0)
            AND (`s_rt`.`close` >= ROUND(((1+0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        `index_stock_info`.weight,
        0)) AS `zfgw`,
    SUM(IF(((`s_rt`.`chgrate` < 0)
            AND (`s_rt`.`close` <= ROUND(((1-0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        1,
        0)) AS `dfg`,
    SUM(IF(((`s_rt`.`chgrate` < 0)
            AND (`s_rt`.`close` <= ROUND(((1-0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        `index_stock_info`.weight,
        0)) AS `dfgw`,
    SUM(IF(((`s_rt`.`chgrate` > 0)
            AND (`s_rt`.`close` >= ROUND(((1+0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        1,
        0)) AS `zg`,
    SUM(IF(((`s_rt`.`chgrate` > 0)
            AND (`s_rt`.`close` >= ROUND(((1+0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        `index_stock_info`.weight,
        0)) AS `zgw`,
    SUM(IF(((`s_rt`.`chgrate` < 0)
            AND (`s_rt`.`close` <= ROUND(((1-0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        1,
        0)) AS `dg`,
    SUM(IF(((`s_rt`.`chgrate` < 0)
            AND (`s_rt`.`close` <= ROUND(((1-0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        `index_stock_info`.weight,
        0)) AS `dgw`,
    SUM(IF(((`s_rt`.`chgrate` > 0)
            AND (`s_rt`.`close` >= ROUND(((1+0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        1,
        0)) AS `zt`,
    SUM(IF(((`s_rt`.`chgrate` > 0)
            AND (`s_rt`.`close` >= ROUND(((1+0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        `index_stock_info`.weight,
        0)) AS `ztw`,
    SUM(IF(((`s_rt`.`chgrate` < 0)
            AND (`s_rt`.`close` <= ROUND(((1-0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        1,
        0)) AS `d10`,
    SUM(IF(((`s_rt`.`chgrate` < 0)
            AND (`s_rt`.`close` <= ROUND(((1-0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
                2))),
        `index_stock_info`.weight,
        0)) AS `d10w`,
    `s_rt`.`dt` AS `dt`
FROM
    (`s_rt`
    LEFT JOIN `index_stock_info` ON ((`s_rt`.`ids` = `index_stock_info`.`ids`))
    JOIN index_info ON (`index_stock_info`.`idi` = `index_info`.`idi`))
WHERE
    (`index_stock_info`.`idi` IS NOT NULL)
GROUP BY `s_rt`.`dt` , `index_stock_info`.`idi`
ORDER BY `s_rt`.`dt` DESC , `index_stock_info`.`idi`;

-- version 1
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `calc_index_cons_stat_zd`()
BEGIN
INSERT IGNORE INTO `ying_calc`.`index_cons_stat_zd`
(`idi`,
`name_i`,
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
-- 所有指数涨跌统计
SELECT summary.idi AS '指数', info.name_i  AS '指数名称', ROUND(rate5,2) AS '五分钟涨速', z - d AS '涨跌数差', ROUND(zW - dW,2) AS '涨跌数差加权', zfg - dfg AS '涨跌超3.82', ROUND(zfgW - dfgW,2) AS '涨跌超3.82加权', zg - dg AS '涨跌超6.18', ROUND(zgW - dgW,2) AS '涨跌超6.18加权', zt - d10 AS '涨跌停差', ROUND(ztW - d10W,2) AS '涨跌停差加权', dt FROM `ying`.`index_cons_stat_zd` summary JOIN index_info info ON (summary.idi = info.idi) ORDER BY summary.dt DESC, summary.idi;
END$$
DELIMITER ;
