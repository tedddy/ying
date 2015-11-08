

SELECT * FROM `ying_calc`.`s_xts_adj_sma` where ids = '600446' order by ids, d desc;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` order by ids, d desc;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` order by ids, d;


SELECT max(close5_d1), min(close5_d1) FROM `ying_calc`.`s_xts_adj_sma` order by ids, d desc;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` order by close5_d1, ids, d desc;


SELECT * FROM `ying_calc`.`s_xts_adj_sma` where ids = '603077' order by ids, d desc;
SELECT * FROM `ying_calc`.`s_xts_adj_sma` where ids = '601318' order by ids, d desc;




SELECT count(*) FROM `ying_calc`.`s_xts_adj_sma` where amount5 > 0;

