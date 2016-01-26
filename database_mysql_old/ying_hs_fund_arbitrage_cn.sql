CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_fund_arbitrage_cn` AS
    SELECT DISTINCT
        `fjjj`.`code` AS `母基金`,
        `fjjj`.`b` AS `B基金`,
        `fjjj`.`a` AS `A基金`,
        `fjjj`.`ratio_BoA` AS `BA比例`,
        ROUND(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`NPV`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`NPV`)),
                4) AS `折价率`,
        `mother`.`NPV` AS `母净值`,
        `b`.`NPV` AS `b净值`,
        `b`.`price` AS `b价格`,
        `a`.`NPV` AS `a净值`,
        `a`.`price` AS `a价格`,
        (CASE
            WHEN
                (ROUND(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`NPV`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`NPV`)),
                        4) < -(0.02))
            THEN
                '申购母基金，卖出基金A和B'
            WHEN
                (ROUND(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`NPV`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`NPV`)),
                        4) > 0.02)
            THEN
                '买入基金A和B，赎回母基金'
            ELSE '耐心等待套利机会'
        END) AS `套利策略`
    FROM
        (((`hs_fund_mother_son_daughter` `fjjj`
        JOIN `hs_fund_f10_mother` `mother` ON ((`fjjj`.`code` = `mother`.`code`)))
        JOIN `hs_fund_fjjj_list_current` `b` ON ((`fjjj`.`b` = `b`.`code`)))
        JOIN `hs_fund_fjjj_list_current` `a` ON ((`fjjj`.`a` = `a`.`code`)))
    ORDER BY ROUND(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`NPV`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`NPV`)),
            4);

SELECT 
    *
FROM
    ying.hs_fund_arbitrage_cn;