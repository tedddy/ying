SELECT * FROM `ying_calc`.`index_cons_stat_zd` order by `dt` desc;


SELECT * FROM `ying_calc`.`s_loan` where ids IN ('600036','601166','601288','601328') order by `dt` desc;

SELECT * FROM `ying_calc`.`s_loan` where ids = '002273' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '600705' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '300251' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '300058' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '002161' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '600701' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '000778' order by `dt` desc;


SELECT * FROM `ying_calc`.`s_loan` where ids = '600088' order by `dt` desc;


SELECT * FROM `ying_calc`.`s_loan` where ids = '600036' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '601166' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '601288' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '601328' order by `dt` desc;


SELECT * FROM `ying_calc`.`s_loan_mkt` where mkt = 1 order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan_mkt` where mkt = 2 order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '601106' order by `dt` desc;

-- delete null records
DELETE FROM `ying_calc`.`s_loan` where date = '0000-00-00' and bMargin is null;
SELECT * FROM `ying_calc`.`s_loan` where date = '0000-00-00' and bMargin is null;

SELECT * FROM `ying_calc`.`s_loan` where ids = '601668' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '002183' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '300152' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '000786' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '600030' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '601318' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '601989' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '601918' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '600839' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '600839' order by `dt` desc;
SELECT * FROM `ying_calc`.`s_loan` where ids = '000031' order by `dt` desc;