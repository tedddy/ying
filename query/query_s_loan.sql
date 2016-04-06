




CREATE TABLE `i_nmc` (
  `idi` char(6) NOT NULL COMMENT 'index code',
  `i_nmc` bigint(13) DEFAULT NULL COMMENT '流通市值',
  PRIMARY KEY (`idi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


SELECT * FROM ying.s_loan ORDER BY ids, `dt` DESC;

SELECT * FROM ying.s_loan ORDER BY `dt` DESC, ids;

-- UPDATE ying.s_loan set mkt = 2 where mkt= 0 ORDER BY `dt` DESC;

SELECT * FROM ying.s_loan_mkt where `dt` = '2015-09-02' and mkt = '1' order by `dt` desc;

SELECT * FROM ying.s_loan;

SELECT count(*) FROM ying.s_loan;

SELECT * FROM ying.s_loan where mkt = 0;

SELECT * FROM ying.s_loan where ids is null;
DElETE FROM ying.s_loan where ids is null;
DElETE FROM ying.s_loan_mkt where ids is null;


SELECT * FROM ying.s_loan where date is null and bMargin is null;
-- delete FROM ying.s_loan where date is null and bMargin is null; 

SELECT * FROM ying.s_loan where ids = '601318' order by `dt` desc;

SELECT * FROM ying.s_loan where ids = '601880' order by `dt` desc;

SELECT * FROM ying.s_loan where ids is NULL and mkt = 1 order by `dt` desc;
SELECT * FROM ying.s_loan where ids is NULL and mkt = 2 order by `dt` desc;
SELECT * FROM ying.s_loan where ids = '600030' order by `dt` desc;
SELECT * FROM ying.s_loan where ids = '601318' order by `dt` desc;
SELECT * FROM ying.s_loan where ids = '601989' order by `dt` desc;
SELECT * FROM ying.s_loan where ids = '601918' order by `dt` desc;
SELECT * FROM ying.s_loan where ids = '600839' order by `dt` desc;
SELECT * FROM ying.s_loan where ids = '600839' order by `dt` desc;
SELECT * FROM ying.s_loan where ids = '000031' order by `dt` desc;
SELECT * FROM ying.s_loan where ids = '601718' order by `dt` desc;

SELECT DISTINCT
    CONCAT('http://datainterface.eastmoney.com/EM_DataCenter/JS.aspx?type=FD&sty=MTE&mkt=',
            mkt,
            '&ids=',
            ids,
            '&st=0&sr=1&p=1&ps=1000&') AS 'hs_loan_history_EM'
FROM
    `s_loan`
WHERE
    ids IS NOT NULL;
    
SELECT DISTINCT CONCAT('http://datainterface.eastmoney.com/EM_DataCenter/JS.aspx?type=FD&sty=MTE&mkt=',mkt,'&ids=', ids, '&st=0&sr=1&p=1&ps=1000&') AS 'hs_loan_history_EM' FROM `ying`.`s_loan` where ids is NOT NULL;