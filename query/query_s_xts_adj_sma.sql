-- 券商
SELECT * FROM `ying_calc`.`s_xts_adj_sma` where `ids` in ('600030','600837','601211','601688') and `d` > '2015-10-21' order by ids, d DESC;

-- 银行
SELECT * FROM `ying_calc`.`s_xts_adj_sma` where `ids` in ('600036','601166','601288','601328') and `d` >= '2015-10-05' order by ids, d DESC;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` where `ids` in ('002161','002326','300251','000568') and `d` > '2015-10-01' order by ids, d DESC;
SELECT * FROM `ying_calc`.`s_xts_adj_sma` where `ids` in (002161) and `d` > '2015-10-01' order by ids, d DESC;
SELECT `d`, `ids`, `close5`, `close5_d1`, `amount5`, `amount5_d1` FROM `ying_calc`.`s_xts_adj_sma` where `ids` in (300251) and `d` > '2015-10-01' order by ids, d DESC;
SELECT `d`, `ids`, `close5`, `close5_d1`, `amount5`, `amount5_d1` FROM `ying_calc`.`s_xts_adj_sma` where `ids` in (000568) and `d` > '2015-10-01' order by ids, d DESC;


SELECT * FROM `ying_calc`.`s_xts_adj_sma` order by ids, dt desc;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` where ids = '600446' order by ids, d desc;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` order by ids, d;


SELECT max(close5_d1), min(close5_d1) FROM `ying_calc`.`s_xts_adj_sma` order by ids, d desc;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` order by close5_d1, ids, d desc;


SELECT * FROM `ying_calc`.`s_xts_adj_sma` where ids = '603077' order by ids, d desc;
SELECT * FROM `ying_calc`.`s_xts_adj_sma` where ids = '601318' order by ids, d desc;




SELECT count(*) FROM `ying_calc`.`s_xts_adj_sma` where amount5 > 0;

