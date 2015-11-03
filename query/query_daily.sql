SELECT * FROM `ying_calc`.`index_cons_stat_zd` order by dt desc;

SELECT * FROM ying.hs_s_loan_EM where code is NULL and fMKT = 1 order by id desc;
SELECT * FROM ying.hs_s_loan_EM where code is NULL and fMKT = 2 order by id desc;
SELECT * FROM ying.hs_s_loan_EM order by id desc;
SELECT * FROM ying.hs_s_loan_EM where code = '601106' order by id desc;

-- delete null records
DELETE FROM ying.hs_s_loan_EM where date = '0000-00-00' and bMargin is null;
SELECT * FROM ying.hs_s_loan_EM where date = '0000-00-00' and bMargin is null;

SELECT * FROM ying.hs_s_loan_EM where code = '300152' order by date desc;
SELECT * FROM ying.hs_s_loan_EM where code = '000786' order by id desc;
SELECT * FROM ying.hs_s_loan_EM where code = '600030' order by id desc;
SELECT * FROM ying.hs_s_loan_EM where code = '601318' order by id desc;
SELECT * FROM ying.hs_s_loan_EM where code = '601989' order by id desc;
SELECT * FROM ying.hs_s_loan_EM where code = '601918' order by id desc;
SELECT * FROM ying.hs_s_loan_EM where code = '600839' order by id desc;
SELECT * FROM ying.hs_s_loan_EM where code = '600839' order by id desc;
SELECT * FROM ying.hs_s_loan_EM where code = '000031' order by id desc;