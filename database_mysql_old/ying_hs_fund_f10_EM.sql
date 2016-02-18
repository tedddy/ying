SELECT * FROM ying.hs_fund_f10_EM;

SELECT DISTINCT
    mother
FROM
    ying.hs_fund_f10_EM;
    
SELECT DISTINCT CONCAT('http://fund.eastmoney.com/f10/jbgk_',mother,'.html') AS 'url_hs_fund_f10_mother' FROM ying.hs_fund_f10_EM;

SELECT 
    f10.code, f10.index_target, info.code
FROM
    ying.hs_fund_f10_EM AS f10
        JOIN
    hs_index_info_sina AS info ON f10.index_target = info.name 
UNION SELECT 
    f10.code, f10.index_target, info.code
FROM
    ying.hs_fund_f10_EM AS f10
        JOIN
    hs_index_info_sina AS info ON f10.index_target = info.name_full;

SELECT 
    code, cat, name, index_target
FROM
    ying.hs_fund_f10_EM
WHERE
    code NOT IN (SELECT 
            f10.code
        FROM
            ying.hs_fund_f10_EM AS f10
                JOIN
            hs_index_info_sina AS info ON f10.index_target = info.name UNION SELECT 
            f10.code
        FROM
            ying.hs_fund_f10_EM AS f10
                JOIN
            hs_index_info_sina AS info ON f10.index_target = info.name_full);