SELECT * FROM ying.hs_fund_f10_mother;

SELECT DISTINCT
    fjjj.`code`,
    fjjj.`b`,
    fjjj.`a`,
    ROUND(((1+fjjj.ratio_BoA) * mother.`NPV` - (fjjj.ratio_BoA * b.price + a.price)) / (fjjj.ratio_BoA * b.price + a.price),
            4) AS zjl,
    mother.`NPV` AS NPV_mother,
    b.NPV AS NPV_b,
    b.price AS price_b,
    a.NPV AS NPV_a,
    a.price AS price_a
FROM
    `ying`.`hs_fund_mother_son_daughter` AS fjjj
        JOIN
    ying.hs_fund_f10_mother AS mother ON fjjj.code = mother.code
        JOIN
    ying.hs_fund_fjjj_list_current AS b ON fjjj.b = b.code
        JOIN
    ying.hs_fund_fjjj_list_current AS a ON fjjj.a = a.code
ORDER BY zjl desc;

SELECT `hs_fund_mother_son_daughter`.`code`,
    `hs_fund_mother_son_daughter`.`b`,
    `hs_fund_mother_son_daughter`.`a`
FROM `ying`.`hs_fund_mother_son_daughter`;

SELECT `hs_fund_arbitrage`.`code`,
    `hs_fund_arbitrage`.`b`,
    `hs_fund_arbitrage`.`a`,
    `hs_fund_arbitrage`.`ratio_BoA`,
    `hs_fund_arbitrage`.`zjl`,
    `hs_fund_arbitrage`.`NPV_mother`,
    `hs_fund_arbitrage`.`NPV_b`,
    `hs_fund_arbitrage`.`price_b`,
    `hs_fund_arbitrage`.`NPV_a`,
    `hs_fund_arbitrage`.`price_a`
FROM `ying`.`hs_fund_arbitrage`;

DROP VIEW `ying`.`hs_fund_arbitrage`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_fund_arbitrage` AS
    SELECT DISTINCT
    fjjj.`code`,
    fjjj.`b`,
    fjjj.`a`,
    fjjj.ratio_BoA as 'ratio_BoA',
    ROUND(((1+fjjj.ratio_BoA) * mother.`NPV` - (fjjj.ratio_BoA * b.price + a.price)) / (fjjj.ratio_BoA * b.price + a.price),4) AS zjl,
    mother.`NPV` AS NPV_mother,
    b.NPV AS NPV_b,
    b.price AS price_b,
    a.NPV AS NPV_a,
    a.price AS price_a,
    (CASE WHEN ROUND(((1+fjjj.ratio_BoA) * mother.`NPV` - (fjjj.ratio_BoA * b.price + a.price)) / (fjjj.ratio_BoA * b.price + a.price),4) < -0.02 THEN '申购母基金，卖出基金A和B' WHEN ROUND(((1+fjjj.ratio_BoA) * mother.`NPV` - (fjjj.ratio_BoA * b.price + a.price)) / (fjjj.ratio_BoA * b.price + a.price),4) > 0.02 THEN '买入基金A和B，赎回母基金' else '耐心等待套利机会' END)
FROM
    `ying`.`hs_fund_mother_son_daughter` AS fjjj
        JOIN
    ying.hs_fund_f10_mother AS mother ON fjjj.code = mother.code
        JOIN
    ying.hs_fund_fjjj_list_current AS b ON fjjj.b = b.code
        JOIN
    ying.hs_fund_fjjj_list_current AS a ON fjjj.a = a.code
ORDER BY zjl;

SELECT 
    *
FROM
    `ying`.`hs_fund_arbitrage_cn`;
    
DROP VIEW `ying`.`hs_fund_arbitrage_cn`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_fund_arbitrage_cn` AS
    SELECT DISTINCT
    fjjj.`code` AS '母基金',
    fjjj.`b` as 'B基金',
    fjjj.`a` as 'A基金',
    fjjj.ratio_BoA as 'BA比例',
    ROUND(((1+fjjj.ratio_BoA) * mother.`NPV` - (fjjj.ratio_BoA * b.price + a.price)) / (fjjj.ratio_BoA * b.price + a.price),4) AS '折价率',
    mother.`NPV` AS '母净值',
    b.NPV AS 'b净值',
    b.price AS 'b价格',
    a.NPV AS 'a净值',
    a.price AS 'a价格',
    (CASE WHEN ROUND(((1+fjjj.ratio_BoA) * mother.`NPV` - (fjjj.ratio_BoA * b.price + a.price)) / (fjjj.ratio_BoA * b.price + a.price),4) < -0.02 THEN '申购母基金，卖出基金A和B' WHEN ROUND(((1+fjjj.ratio_BoA) * mother.`NPV` - (fjjj.ratio_BoA * b.price + a.price)) / (fjjj.ratio_BoA * b.price + a.price),4) > 0.02 THEN '买入基金A和B，赎回母基金' else '耐心等待套利机会' END) as '套利策略'
FROM
    `ying`.`hs_fund_mother_son_daughter` AS fjjj
        JOIN
    ying.hs_fund_f10_mother AS mother ON fjjj.code = mother.code
        JOIN
    ying.hs_fund_fjjj_list_current AS b ON fjjj.b = b.code
        JOIN
    ying.hs_fund_fjjj_list_current AS a ON fjjj.a = a.code
ORDER BY ROUND(((1+fjjj.ratio_BoA) * mother.`NPV` - (fjjj.ratio_BoA * b.price + a.price)) / (fjjj.ratio_BoA * b.price + a.price),4);

SELECT `hs_fund_arbitrage`.`code`,
    `hs_fund_arbitrage`.`b`,
    `hs_fund_arbitrage`.`a`,
    `hs_fund_arbitrage`.`zjl`,
    `hs_fund_arbitrage`.`NPV_mother`,
    `hs_fund_arbitrage`.`NPV_b`,
    `hs_fund_arbitrage`.`price_b`,
    `hs_fund_arbitrage`.`NPV_a`,
    `hs_fund_arbitrage`.`price_a`
FROM `ying`.`hs_fund_arbitrage`;

SELECT 
    *
FROM
    `ying`.`hs_fund_mother_son_daughter`;

DROP VIEW `ying`.`hs_fund_mother_son_daughter`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_fund_mother_son_daughter` AS
    SELECT 
        mother.code,
        son.code AS b,
        son.mktcap AS mktcap_b,
        daughter.code AS a,
        daughter.mktcap AS mktcap_a,
        round(son.mktcap/daughter.mktcap,4) AS ratio_BoA
    FROM
        ying.hs_fund_f10_mother AS mother
            JOIN
        ying.hs_fund_f10_fjjj_AB_current AS son ON son.mother = mother.code
            AND son.cat = '分级杠杆'
            JOIN
        ying.hs_fund_f10_fjjj_AB_current AS daughter ON daughter.mother = mother.code
            AND daughter.cat = '固定收益';


select fund_B.code as '母基金', fund_B.name as '名称', fund_B.b as 'B基金', fund_A.a as 'A基金' from (SELECT 
    mother.code, mother.name, son.code as b
FROM
    ying.hs_fund_f10_mother AS mother
        JOIN
    ying.hs_fund_f10_fjjj_AB_current AS son
WHERE
    son.mother = mother.code
        AND son.cat = '分级杠杆') AS fund_B join (SELECT 
    mother.code, son.code  as a
FROM
    ying.hs_fund_f10_mother AS mother
        JOIN
    ying.hs_fund_f10_fjjj_AB_current AS son
WHERE
    son.mother = mother.code
        AND son.cat = '固定收益') as fund_A on fund_B.code = fund_A.code;

SELECT 
    mother.code, son.code as b
FROM
    ying.hs_fund_f10_mother AS mother
        JOIN
    ying.hs_fund_f10_fjjj_AB_current AS son
WHERE
    son.mother = mother.code
        AND son.cat = '分级杠杆';
        
SELECT 
    mother.code, daughter.code as a
FROM
    ying.hs_fund_f10_mother AS mother
        JOIN
    ying.hs_fund_f10_fjjj_AB_current AS daughter
WHERE
    daughter.mother = mother.code
        AND daughter.cat = '固定收益';
        

