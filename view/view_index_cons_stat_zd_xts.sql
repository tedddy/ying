SELECT `index_cons_stat_zd_xts`.`idi`,
    `index_cons_stat_zd_xts`.`name_i` as '指数名称',
    `index_cons_stat_zd_xts`.`n` as '股票总数',
    `index_cons_stat_zd_xts`.`zd1000`as '净涨跌停数',
    `index_cons_stat_zd_xts`.`zd` as '净涨跌数',
    `index_cons_stat_zd_xts`.`zd618` as '净涨跌数(中幅涨跌)',
    `index_cons_stat_zd_xts`.`zd382` as '净涨跌数(小幅涨跌)',
    `index_cons_stat_zd_xts`.`dt` as '日期'
FROM `ying_calc`.`index_cons_stat_zd_xts` where `idi` = '000001' order by `dt` desc;

SELECT `index_cons_stat_zd_xts`.`idi`,
    `index_cons_stat_zd_xts`.`name_i` as '指数名称',
    `index_cons_stat_zd_xts`.`n` as '股票总数',
    `index_cons_stat_zd_xts`.`zd1000`as '净涨跌停数',
    `index_cons_stat_zd_xts`.`zd` as '净涨跌数',
    `index_cons_stat_zd_xts`.`zd618` as '净涨跌数(中幅涨跌)',
    `index_cons_stat_zd_xts`.`zd382` as '净涨跌数(小幅涨跌)',
    `index_cons_stat_zd_xts`.`dt` as '日期'
FROM `ying_calc`.`index_cons_stat_zd_xts` where `idi` = '000300' order by `dt` desc;

DROP VIEW `ying_calc`.`index_cons_stat_zd_xts`;

SELECT `index_cons_stat_zd_xts`.`idi`,
    `index_cons_stat_zd_xts`.`name_i`,
    `index_cons_stat_zd_xts`.`n`,
    `index_cons_stat_zd_xts`.`zd`,
    `index_cons_stat_zd_xts`.`zdW`,
    `index_cons_stat_zd_xts`.`zd382`,
    `index_cons_stat_zd_xts`.`zd382W`,
    `index_cons_stat_zd_xts`.`zd618`,
    `index_cons_stat_zd_xts`.`zd618W`,
    `index_cons_stat_zd_xts`.`zd1000`,
    `index_cons_stat_zd_xts`.`zd1000W`,
    `index_cons_stat_zd_xts`.`dt`
FROM `ying_calc`.`index_cons_stat_zd_xts`;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `ying_calc`.`index_cons_stat_zd_xts` AS
    SELECT 
        `ying_calc`.`index_stock_info_all`.`idi` AS `idi`,
        `ying`.`index_info`.`name_i` AS `name_i`,
        SUM(IF((`ying_calc`.`s_xts_adj`.`volume` > 0),
            1,
            0)) AS `n`,
        SUM(IF((`ying_calc`.`s_xts_adj`.`close_d1` > 0),
            1,
            -(1))) AS `zd`,
        ROUND(SUM(IF((`ying_calc`.`s_xts_adj`.`close_d1` > 0),
                    (1 * `ying_calc`.`index_stock_info_all`.`weight`),
                    (-(1) * `ying_calc`.`index_stock_info_all`.`weight`))),
                2) AS `zdW`,
        SUM(IF(((`ying_calc`.`s_xts_adj`.`close_d1` > 0)
                AND (`ying_calc`.`s_xts_adj`.`close` >= ROUND(((1 + 0.0382) * ((100 * `ying_calc`.`s_xts_adj`.`close`) / (100 + `ying_calc`.`s_xts_adj`.`close_d1`))),
                    2))),
            1,
            IF(((`ying_calc`.`s_xts_adj`.`close_d1` < 0)
                    AND (`ying_calc`.`s_xts_adj`.`close` <= ROUND(((1 - 0.0382) * ((100 * `ying_calc`.`s_xts_adj`.`close`) / (100 + `ying_calc`.`s_xts_adj`.`close_d1`))),
                        2))),
                -(1),
                0))) AS `zd382`,
        ROUND(SUM(IF(((`ying_calc`.`s_xts_adj`.`close_d1` > 0)
                        AND (`ying_calc`.`s_xts_adj`.`close` >= ROUND(((1 + 0.0382) * ((100 * `ying_calc`.`s_xts_adj`.`close`) / (100 + `ying_calc`.`s_xts_adj`.`close_d1`))),
                            2))),
                    `ying_calc`.`index_stock_info_all`.`weight`,
                    IF(((`ying_calc`.`s_xts_adj`.`close_d1` < 0)
                            AND (`ying_calc`.`s_xts_adj`.`close` <= ROUND(((1 - 0.0382) * ((100 * `ying_calc`.`s_xts_adj`.`close`) / (100 + `ying_calc`.`s_xts_adj`.`close_d1`))),
                                2))),
                        (-(1) * `ying_calc`.`index_stock_info_all`.`weight`),
                        0))),
                2) AS `zd382W`,
        SUM(IF(((`ying_calc`.`s_xts_adj`.`close_d1` > 0)
                AND (`ying_calc`.`s_xts_adj`.`close` >= ROUND(((1 + 0.0618) * ((100 * `ying_calc`.`s_xts_adj`.`close`) / (100 + `ying_calc`.`s_xts_adj`.`close_d1`))),
                    2))),
            1,
            IF(((`ying_calc`.`s_xts_adj`.`close_d1` < 0)
                    AND (`ying_calc`.`s_xts_adj`.`close` <= ROUND(((1 - 0.0618) * ((100 * `ying_calc`.`s_xts_adj`.`close`) / (100 + `ying_calc`.`s_xts_adj`.`close_d1`))),
                        2))),
                1,
                0))) AS `zd618`,
        ROUND(SUM(IF(((`ying_calc`.`s_xts_adj`.`close_d1` > 0)
                        AND (`ying_calc`.`s_xts_adj`.`close` >= ROUND(((1 + 0.0618) * ((100 * `ying_calc`.`s_xts_adj`.`close`) / (100 + `ying_calc`.`s_xts_adj`.`close_d1`))),
                            2))),
                    `ying_calc`.`index_stock_info_all`.`weight`,
                    IF(((`ying_calc`.`s_xts_adj`.`close_d1` < 0)
                            AND (`ying_calc`.`s_xts_adj`.`close` <= ROUND(((1 - 0.0618) * ((100 * `ying_calc`.`s_xts_adj`.`close`) / (100 + `ying_calc`.`s_xts_adj`.`close_d1`))),
                                2))),
                        (-(1) * `ying_calc`.`index_stock_info_all`.`weight`),
                        0))),
                2) AS `zd618W`,
        SUM(IF(((`ying_calc`.`s_xts_adj`.`close_d1` > 0)
                AND (`ying_calc`.`s_xts_adj`.`close` >= ROUND(((1 + 0.1) * ((100 * `ying_calc`.`s_xts_adj`.`close`) / (100 + `ying_calc`.`s_xts_adj`.`close_d1`))),
                    2))),
            1,
            IF(((`ying_calc`.`s_xts_adj`.`close_d1` < 0)
                    AND (`ying_calc`.`s_xts_adj`.`close` <= ROUND(((1 - 0.1) * ((100 * `ying_calc`.`s_xts_adj`.`close`) / (100 + `ying_calc`.`s_xts_adj`.`close_d1`))),
                        2))),
                -(1),
                0))) AS `zd1000`,
        ROUND(SUM(IF(((`ying_calc`.`s_xts_adj`.`close_d1` > 0)
                        AND (`ying_calc`.`s_xts_adj`.`close` >= ROUND(((1 + 0.1) * ((100 * `ying_calc`.`s_xts_adj`.`close`) / (100 + `ying_calc`.`s_xts_adj`.`close_d1`))),
                            2))),
                    `ying_calc`.`index_stock_info_all`.`weight`,
                    IF(((`ying_calc`.`s_xts_adj`.`close_d1` < 0)
                            AND (`ying_calc`.`s_xts_adj`.`close` <= ROUND(((1 - 0.1) * ((100 * `ying_calc`.`s_xts_adj`.`close`) / (100 + `ying_calc`.`s_xts_adj`.`close_d1`))),
                                2))),
                        (-(1) * `ying_calc`.`index_stock_info_all`.`weight`),
                        0))),
                2) AS `zd1000W`,
        `ying_calc`.`s_xts_adj`.`dt` AS `dt`
    FROM
        ((`ying_calc`.`s_xts_adj`
        LEFT JOIN `ying_calc`.`index_stock_info_all` ON (((`ying_calc`.`s_xts_adj`.`ids` = `ying_calc`.`index_stock_info_all`.`ids`)
            AND ((TO_DAYS(CURDATE()) - TO_DAYS(CAST(`ying_calc`.`s_xts_adj`.`dt` AS DATE))) <= 100))))
        JOIN `ying`.`index_info` ON (((`ying_calc`.`index_stock_info_all`.`idi` = `ying`.`index_info`.`idi`)
            AND (`ying`.`index_info`.`fW` = 1))))
    WHERE
        (`ying_calc`.`index_stock_info_all`.`idi` IS NOT NULL)
    GROUP BY `ying_calc`.`s_xts_adj`.`dt` , `ying_calc`.`index_stock_info_all`.`idi`
    ORDER BY `ying_calc`.`s_xts_adj`.`dt` DESC , `ying_calc`.`index_stock_info_all`.`idi`;
