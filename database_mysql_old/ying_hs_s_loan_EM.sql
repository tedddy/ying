SELECT * FROM ying.hs_s_loan_EM;

SELECT * FROM ying.hs_s_loan_EM where date is null and bMargin is null;
delete FROM ying.hs_s_loan_EM where date is null and bMargin is null; 

SELECT * FROM ying.hs_s_loan_EM where code = '601318' order by id desc;

SELECT * FROM ying.hs_s_loan_EM where code is NULL and fMKT = 1 order by id desc;
SELECT * FROM ying.hs_s_loan_EM where code is NULL and fMKT = 2 order by id desc;
SELECT * FROM ying.hs_s_loan_EM where code = '600030' order by id desc;
SELECT * FROM ying.hs_s_loan_EM where code = '601318' order by id desc;
SELECT * FROM ying.hs_s_loan_EM where code = '601989' order by id desc;
SELECT * FROM ying.hs_s_loan_EM where code = '601918' order by id desc;
SELECT * FROM ying.hs_s_loan_EM where code = '600839' order by id desc;
SELECT * FROM ying.hs_s_loan_EM where code = '600839' order by id desc;
SELECT * FROM ying.hs_s_loan_EM where code = '000031' order by id desc;
SELECT * FROM ying.hs_s_loan_EM where code = '601718' order by id desc;

SELECT DISTINCT
    CONCAT('http://datainterface.eastmoney.com/EM_DataCenter/JS.aspx?type=FD&sty=MTE&mkt=',
            fMKT,
            '&code=',
            code,
            '&st=0&sr=1&p=1&ps=1000&') AS 'hs_loan_history_EM'
FROM
    `hs_s_loan_EM`
WHERE
    code IS NOT NULL;
    
SELECT DISTINCT CONCAT('http://datainterface.eastmoney.com/EM_DataCenter/JS.aspx?type=FD&sty=MTE&mkt=',fMKT,'&code=', code, '&st=0&sr=1&p=1&ps=1000&') AS 'hs_loan_history_EM' FROM `hs_s_loan_EM` where code is NOT NULL;