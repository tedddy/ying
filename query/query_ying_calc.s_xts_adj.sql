SELECT * FROM `ying_calc`.`s_xts_adj` order by d desc limit 10000; 

SELECT group_concat(DISTINCT ids) FROM `ying_calc`.`s_xts_adj` where volume = 16777215 order by volume desc limit 10000;

SELECT * FROM `ying_calc`.`s_xts_adj` where volume = 16777215 order by volume desc limit 10000;

SELECT * FROM `ying_calc`.`s_xts_adj`;

SELECT count(*) FROM `ying_calc`.`s_xts_adj`;

SELECT max(amount) FROM `ying_calc`.`s_xts_adj`;

SELECT * FROM `ying_calc`.`s_xts_adj` ORDER BY d desc, ids;