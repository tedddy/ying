SELECT * FROM `ying`.`index_cons_stat_zd` order by `dt` desc;


SELECT * FROM `ying`.`s_loan_mkt` where mkt = 1 order by `dt` desc;
SELECT * FROM `ying`.`s_loan_mkt` where mkt = 2 order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where `ids` IN ('601318','600030','600016','600036','601166','601288','601328') order by `dt` desc;

SELECT * FROM `ying`.`s_loan` where ids = '000839' order by `dt` desc;

SELECT * FROM `ying`.`s_loan` where ids = '600100' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '600895' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '000039' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '000917' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '002273' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '600705' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '300251' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '002604' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '600804' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '002642' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '601318' order by `dt` desc;


SELECT * FROM `ying`.`s_loan` where ids = '002739' order by `dt` desc;

SELECT * FROM `ying`.`s_loan` where ids = '300058' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '002161' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '600701' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '000778' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '601777' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '002515' order by `dt` desc;


SELECT * FROM `ying`.`s_loan` where ids = '600088' order by `dt` desc;


SELECT * FROM `ying`.`s_loan` where ids = '600036' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '601166' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '601288' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '601328' order by `dt` desc;


SELECT * FROM `ying`.`s_loan` order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '601106' order by `dt` desc;

-- delete null records
DELETE FROM `ying`.`s_loan` where date = '0000-00-00' and bMargin is null;
SELECT * FROM `ying`.`s_loan` where date = '0000-00-00' and bMargin is null;

SELECT * FROM `ying`.`s_loan` where ids = '601668' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '002183' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '300152' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '000786' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '600030' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '601318' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '601989' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '601918' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '601766' order by `dt` desc;

SELECT * FROM `ying`.`s_loan` where ids = '600839' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '600839' order by `dt` desc;
SELECT * FROM `ying`.`s_loan` where ids = '000031' order by `dt` desc;