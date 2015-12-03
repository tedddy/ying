SELECT * FROM `ying_calc`.`s_loan` where ids = '600318' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '600804' order by `dt` desc;

SELECT * FROM ying_calc.s_loan_sma ORDER BY `ids`, `dt` DESC;

SELECT * FROM ying_calc.s_loan_sma ORDER BY `dt` DESC, `ids`;

SELECT * FROM ying_calc.s_loan_sma ORDER BY `dt` DESC, `bMargin5_d1` DESC;

SELECT * FROM ying_calc.s_loan_sma ORDER BY `dt` DESC, `bMargin5_d1` DESC;

SELECT * FROM ying_calc.s_loan_sma WHERE `dt` = '2015-11-06' ORDER BY `dt` DESC;

SELECT 
    `loan`.`dt`,
    `loan`.`ids`,
    `loan`.`bMargin5_d1`,
    `loan`.`bMargin10_d1`,
    `loan`.`bMargin20_d1`,
    `loan`.`bMargin30_d1`,
    `loan`.`bMargin60_d1`,
    `loan`.`bMargin120_d1`,
    `xts`.`close5_d1`,
    `xts`.`close10_d1`,
    `xts`.`close20_d1`,
    `xts`.`close30_d1`,
    `xts`.`close60_d1`,
    `xts`.`close120_d1`
FROM
    `ying_calc`.`s_loan_sma` AS loan
        JOIN
    `ying_calc`.`s_xts_adj_sma` AS xts ON (loan.`ids` = xts.`ids`
        AND loan.`dt` = xts.`dt`)
ORDER BY `loan`.`dt` DESC, `xts`.`close5_d1` DESC;

SELECT 
    `loan`.`dt`,
    `loan`.`ids`,
    `loan`.`bMargin5_d1`,
    `loan`.`bMargin10_d1`,
    `loan`.`bMargin20_d1`,
    `loan`.`bMargin30_d1`,
    `loan`.`bMargin60_d1`,
    `loan`.`bMargin120_d1`,
    `xts`.`close5_d1`,
    `xts`.`close10_d1`,
    `xts`.`close20_d1`,
    `xts`.`close30_d1`,
    `xts`.`close60_d1`,
    `xts`.`close120_d1`
FROM
    `ying_calc`.`s_loan_sma` AS loan
        JOIN
    `ying_calc`.`s_xts_adj_sma` AS xts ON (loan.`ids` = xts.`ids`
        AND loan.`dt` = xts.`dt`)
WHERE
    `loan`.`bMargin5_d1` > 5
        AND `xts`.`close5_d1` < 2
        AND `xts`.`close5_d1` > 0
ORDER BY `loan`.`dt` DESC , `xts`.`close5_d1`;

SELECT 
    `loan`.`dt`,
    `loan`.`ids` AS '代码',
    `loan`.`bMargin5_d1` AS '融资增加率5',
    `loan`.`bMargin10_d1` AS '融资增加率10',
    `xts`.`close_d1` AS '股价增幅',
    `xts_sma`.`close5_d1` AS '股价增幅5',
    `xts_sma`.`close10_d1` AS '股价增幅10'
FROM
    `ying_calc`.`s_loan_sma` AS loan
        JOIN
    `ying_calc`.`s_xts_adj_sma` AS xts_sma ON (loan.`ids` = xts_sma.`ids`
        AND loan.`dt` = xts_sma.`dt`)
        JOIN
    `ying_calc`.`s_xts_adj` AS xts ON (loan.`ids` = xts.`ids`
        AND loan.`dt` = xts.`dt`)
WHERE
    `loan`.`bMargin5_d1` > 5
        AND `xts_sma`.`close5_d1` < 2
        AND `xts_sma`.`close5_d1` > 0
ORDER BY `loan`.`dt` DESC , `xts_sma`.`close5_d1`;

SELECT 
    `loan`.`dt`,
    `loan`.`ids`,
    `loan`.`bMargin5_d1`,
    `loan`.`bMargin10_d1`,
    `loan`.`bMargin20_d1`,
    `loan`.`bMargin30_d1`,
    `loan`.`bMargin60_d1`,
    `loan`.`bMargin120_d1`,
    `xts`.`close5_d1`,
    `xts`.`close10_d1`,
    `xts`.`close20_d1`,
    `xts`.`close30_d1`,
    `xts`.`close60_d1`,
    `xts`.`close120_d1`
FROM
    `ying_calc`.`s_loan_sma` AS loan
        JOIN
    `ying_calc`.`s_xts_adj_sma` AS xts ON (loan.`ids` = xts.`ids`)
WHERE
    `loan`.`bMargin5_d1` > 3
        AND `xts`.`close5_d1` < 2
        AND `xts`.`close5_d1` > 0
        AND `loan`.`dt` = date_sub(curdate(), INTERVAL 2 DAY)
        AND `xts`.`dt` = date_sub(curdate(), INTERVAL 1 DAY)
ORDER BY `loan`.`dt` DESC , `xts`.`close5_d1` DESC;