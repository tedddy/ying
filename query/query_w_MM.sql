SELECT * FROM ying.w_MM ORDER BY d DESC;

SELECT COUNT(*) FROM ying.w_MM;

    SELECT 
        `w_MM`.`d` AS `d`,
        `info`.`uCode` AS `uCode`,
        `info`.`nature` AS `nature`,
        SUM(`w_MM`.`buy_MM`) AS `sum_buy_MM`,
        SUM(`w_MM`.`sell_MM`) AS `sum_sell_MM`
    FROM
        (`w_MM`
        JOIN `hk_w` `info` ON ((`w_MM`.`idw` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
    GROUP BY `info`.`uCode` , `w_MM`.`d` , `info`.`nature`
    ORDER BY `w_MM`.`d` DESC , `info`.`uCode`;

-- UPDATE ying.w_MM SET buy_MM = buy_MM * 100;

-- UPDATE ying.w_MM SET buy_MM = ROUND(buy_MM * 100);

-- UPDATE ying.w_MM SET sell_MM = ROUND(sell_MM * 100); 

-- UPDATE ying.w_MM SET outstanding = ROUND(outstanding * 100);