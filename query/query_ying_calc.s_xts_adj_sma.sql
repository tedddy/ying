-- 持股

SELECT * FROM `ying_calc`.`s_xts_adj_sma` where `ids` in ('300251','002161','601777','000919') and `dt` > '2015-10-21' order by ids, `dt` DESC;

-- 券商
SELECT * FROM `ying_calc`.`s_xts_adj_sma` where `ids` in ('600030','600837','601211','601688') and `dt` > '2015-10-21' order by ids, `dt` DESC;

-- 银行
SELECT * FROM `ying_calc`.`s_xts_adj_sma` where `ids` in ('600036','601166','601288','601328') and `dt` >= '2015-10-05' order by ids, `dt` DESC;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` where `ids` in ('002161','002326','300251','000568') and `dt` > '2015-10-01' order by ids, `dt` DESC;
SELECT * FROM `ying_calc`.`s_xts_adj_sma` where `ids` in (002161) and `dt` > '2015-10-01' order by ids, `dt` DESC;
SELECT `dt`, `ids`, `close5`, `close5_d1`, `amount5`, `amount5_d1` FROM `ying_calc`.`s_xts_adj_sma` where `ids` in (300251) and `dt` > '2015-10-01' order by ids, `dt` DESC;
SELECT `dt`, `ids`, `close5`, `close5_d1`, `amount5`, `amount5_d1` FROM `ying_calc`.`s_xts_adj_sma` where `ids` in (000568) and `dt` > '2015-10-01' order by ids, `dt` DESC;


SELECT * FROM `ying_calc`.`s_xts_adj_sma` order by ids, `dt` desc;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` where ids = '600446' order by ids, `dt` desc;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` order by ids, `dt`;


SELECT max(close5_d1), min(close5_d1) FROM `ying_calc`.`s_xts_adj_sma` order by ids, `dt` desc;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` order by close5_d1, ids, `dt` desc;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` where ids = '603077' order by ids, `dt` desc;
SELECT * FROM `ying_calc`.`s_xts_adj_sma` where ids = '601318' order by ids, `dt` desc;




SELECT count(*) FROM `ying_calc`.`s_xts_adj_sma` where amount5 > 0;


SELECT * FROM ying_calc.s_xts_adj_sma where `ids` = '002562' order by `dt` desc;
SELECT * FROM ying_calc.s_xts_adj_sma where `ids` = '002161' order by `dt` desc;
SELECT * FROM ying_calc.s_xts_adj_sma where `ids` = '000547' order by `dt` desc;
SELECT * FROM ying_calc.s_xts_adj_sma where `ids` = '002326' order by `dt` desc;


SELECT * FROM ying_calc.s_xts_adj_sma order by ids, `dt` desc;

SELECT * FROM ying_calc.s_xts_adj_sma order by ids, `dt`;

SELECT * FROM ying_calc.s_xts_adj_sma where `ids` = '300059' order by `dt` desc;

SELECT min(close10_d1) FROM ying_calc.s_xts_adj_sma order by amount5 desc;

SELECT * FROM ying_calc.s_xts_adj_sma where close10_d1 = '-9999.99' order by ids, `dt`;

SELECT DISTINCT ids FROM ying_calc.s_xts_adj_sma where close10_d1 = '-9999.99' order by ids, `dt`;

SELECT * FROM ying_calc.s_xts_adj_sma where ids = '300459' order by ids, `dt`;

SELECT * FROM ying_calc.s_xts_adj_sma where close10_d1 = '-9999.99' and ids = '002721' order by ids, `dt`;


SELECT ids, avg(close5_d1), avg(close10_d1), avg(close20_d1), avg(close30_d1) FROM ying_calc.s_xts_adj_sma group by ids order by `dt` desc limit 5;

SELECT * FROM ying_calc.s_xts_adj_sma order by `dt` desc, ids;

SELECT * FROM ying_calc.s_xts_adj_sma order by ids, `dt`;

SELECT * FROM ying_calc.s_xts_adj_sma order by amount5 desc;

SELECT * FROM ying_calc.s_xts_adj_sma where amount5 = 9999.99 order by `dt` desc;

SELECT * FROM ying_calc.s_xts_adj_sma where ids = '603599' order by `dt` desc;

SELECT * FROM ying_calc.s_xts_adj_sma where ids = '603599' order by `dt` desc;

SELECT * FROM ying_calc.s_xts_adj_sma where ids = '300055' order by `dt` desc;
