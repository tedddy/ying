SELECT * FROM ying.hs_fund_mother_son_daughter;

SELECT DISTINCT
    code
FROM
    ying.hs_fund_mother_son_daughter 
UNION SELECT DISTINCT
    b
FROM
    ying.hs_fund_mother_son_daughter 
UNION SELECT DISTINCT
    a
FROM
    ying.hs_fund_mother_son_daughter;
    
SELECT DISTINCT code FROM ying.hs_fund_mother_son_daughter UNION SELECT DISTINCT b FROM ying.hs_fund_mother_son_daughter UNION SELECT DISTINCT a FROM ying.hs_fund_mother_son_daughter;

SELECT DISTINCT CONCAT('http://fund.eastmoney.com/f10/F10DataApi.aspx?type=lsjz&code=',a.code,'&page=1&per=20&sdate=&edate=&') AS 'url_hs_fund_f10_mother' FROM (SELECT DISTINCT code FROM ying.hs_fund_mother_son_daughter UNION SELECT DISTINCT b FROM ying.hs_fund_mother_son_daughter UNION SELECT DISTINCT a FROM ying.hs_fund_mother_son_daughter) AS a;