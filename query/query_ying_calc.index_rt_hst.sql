SELECT * FROM ying_calc.index_rt_hst where `idi` = '399807' ORDER BY `dt` DESC;

SELECT * FROM ying_calc.index_rt_hst where `idi` = '000902' and TIME(`dt`) = '10:00:00' ORDER BY `dt` DESC;

SELECT * FROM ying_calc.index_rt_hst where `idi` in ('399807', '000001', '399947') ORDER BY `dt` DESC;

SELECT * FROM ying_calc.index_rt_hst where `idi` in ('000001') ORDER BY `dt` DESC;
SELECT * FROM ying_calc.index_rt_hst where `idi` in ('399947') ORDER BY `dt` DESC;


SELECT * FROM ying_calc.index_rt_hst ORDER BY `idi`, `dt` DESC;

SELECT * FROM ying_calc.index_rt_hst WHERE TIME(`dt`) = '14:00:00' ORDER BY `dt` DESC;

SELECT * FROM ying.index_rt ORDER BY `idi`, `dt` DESC;

CALL `ying_calc`.`index_rt_hst_cjezb_d1`;
SELECT * FROM ying_calc.index_rt_hst where date(`dt`) = curdate() ORDER BY `cjezb_d1` DESC;


CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `index_rt_hst` AS;
    SELECT 
        `a`.`dt` AS `dt`,
        `a`.`idi` AS `idi`,
        `a`.`close_d1` AS `close_d1`,
        `a`.`amount_d1` AS `amount_d1`,
        `a`.`cjezb_d1` AS `cjezb_d1`
    FROM
        (`ying_calc`.`index_rt_hst` `a`
        LEFT JOIN `ying_calc`.`index_rt_hst` `b` ON (((`a`.`idi` = `b`.`idi`)
            AND ((`a`.`dt` < `b`.`dt`)))))
    WHERE
        ISNULL(`b`.`idi`) AND datediff(date(`a`.`dt`), curdate()) < 3
    ORDER BY `a`.`cjezb_d1` DESC;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `ying_calc`.`index_rt_hst_latest` AS    
SELECT 
    `a`.`dt` AS `dt`,
    `a`.`idi` AS `idi`,
    `b`.`name_i` AS `name_i`,
    `a`.`close_d1` AS `close_d1`,
    `a`.`amount_d1` AS `amount_d1`,
    `a`.`cjezb_d1` AS `cjezb_d1`
FROM
    `ying_calc`.`index_rt_hst` `a` JOIN `ying_calc`.`i_info` `b` on (`a`.`idi` = `b`.`idi`)
WHERE
    DATE(`a`.`dt`) = CURDATE() AND (TIMEDIFF(CURTIME(), time(`dt`)) < '00:05:00' OR time(`dt`) = '15:05:00')
ORDER BY `a`.`dt` DESC , `a`.`cjezb_d1` DESC;

CALL `ying_calc`.`index_rt_hst_close_d1`;
CALL `ying_calc`.`index_rt_hst_amount_d1`;
CALL `ying_calc`.`index_rt_hst_cjezb_d1`;