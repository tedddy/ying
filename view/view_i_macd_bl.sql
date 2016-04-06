SELECT * FROM ying_calc.view_i_macd_bl;

SELECT 
    `idi`,
    `dt`,
    `close`,
    `macd_cl`,
    `amount`,
    `macd_amount`,
    `bl`
FROM
    ying_calc.i_macd_bl
WHERE
    `idi` = '399006' AND `bl` IS NOT NULL
ORDER BY `bl`;

-- 背离排序
SELECT 
    a.`dt`, b.`name_i`, a.`idi`, a.`bl`
FROM
    `ying_calc`.`view_i_macd_bl` a
        JOIN
    `ying_calc`.`i_info` b ON (a.`idi` = b.`idi`);


SELECT 
    `a`.`dt` AS `dt`, `a`.`idi` AS `idi`, `a`.`bl` AS `bl`
FROM
    (`ying_calc`.`i_macd_bl` `a`
    LEFT JOIN `ying_calc`.`i_macd_bl` `b` ON (((`a`.`idi` = `b`.`idi`)
        AND (`a`.`bl` > `b`.`bl`))))
WHERE
    (ISNULL(`b`.`idi`)
        AND (`a`.`bl` IS NOT NULL))
ORDER BY `a`.`bl`;
    
    SELECT 
        `a`.`dt` AS `dt`, `a`.`idi` AS `idi`, `a`.`bl` AS `bl`
    FROM
        (`ying_calc`.`i_macd_bl` `a`
        LEFT JOIN `ying_calc`.`i_macd_bl` `b` ON (((`a`.`idi` = `b`.`idi`)
            AND (`a`.`bl` > `b`.`bl`))))
    WHERE
        (ISNULL(`b`.`idi`)
            AND (`a`.`bl` IS NOT NULL) and  (datediff(curdate(),`a`.`dt`))  and  (datediff(curdate(),`a`.`dt`) < 66) )
    ORDER BY `a`.`idi`;
    
    select datediff(curdate(),'2016-01-01');