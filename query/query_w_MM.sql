SELECT * FROM ying.w_MM ORDER BY `dt` DESC;

SELECT COUNT(*) FROM ying.w_MM;

    SELECT 
        `w_MM`.`dt` AS `dt`,
        right(`info`.`uCode`,4) AS `uCode`,
        `info`.`nature` AS `nature`,
        SUM(`w_MM`.`buy_MM`) AS `sum_buy_MM`,
        SUM(`w_MM`.`sell_MM`) AS `sum_sell_MM`
    FROM
        (ying.`w_MM`
        JOIN ying.`hk_w` `info` ON ((`w_MM`.`idw` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
    GROUP BY `info`.`uCode` , `w_MM`.`dt` , `info`.`nature`
    ORDER BY `w_MM`.`dt` DESC , `info`.`uCode`;

-- UPDATE ying.w_MM SET buy_MM = buy_MM * 100;

-- UPDATE ying.w_MM SET buy_MM = ROUND(buy_MM * 100);

-- UPDATE ying.w_MM SET sell_MM = ROUND(sell_MM * 100); 

-- UPDATE ying.w_MM SET outstanding = ROUND(outstanding * 100);