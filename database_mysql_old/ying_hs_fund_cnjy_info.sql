SELECT 
    *
FROM
    ying.hs_fund_cnjy_info;
    
SELECT 
    code
FROM
    ying.hs_fund_cnjy_info;
    
SELECT CONCAT('http://fund.eastmoney.com/f10/jbgk_',code,'.html') AS 'url_hs_fund_cnjy_info' FROM ying.hs_fund_cnjy_info WHERE fB = 1 OR fA = 1;