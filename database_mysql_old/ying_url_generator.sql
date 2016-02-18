SELECT 
    CONCAT('http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/MoneyFlow.ssi_ssfx_flzjtj?daima=',
            (SELECT 
                    (CASE
                            WHEN fSH = 1 THEN 'sh'
                            ELSE 'sz'
                        END)
                ),
            code,
            '&') AS url_hs_s_MoneyFlow_rt
FROM
    hs_s
WHERE
    f300 = 1;

SELECT CONCAT('http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/MoneyFlow.ssi_ssfx_flzjtj?daima=', (SELECT (CASE WHEN fSH = 1 THEN 'sh' ELSE 'sz' END)), code, '&') as url_hs_s_MoneyFlow_rt FROM hs_s WHERE f300 = 1;  

/* hs_mLoan_sLoan */

SELECT 
    CONCAT('http://vip.stock.finance.sina.com.cn/q/go.php/vInvestConsult/kind/rzrq/index.phtml?symbol=',
            code,
            '&bdate=',
            CURDATE(),
            '&edate=',
            CURDATE()) AS url_hs_mLoan_sLoan
FROM
    hs_s
WHERE
    f300 = 1;  

-- http://vip.stock.finance.sina.com.cn/q/go.php/vInvestConsult/kind/rzrq/index.phtml?symbol=600030&bdate=2015-02-17&edate=2015-02-17  
