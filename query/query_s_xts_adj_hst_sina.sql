SELECT * FROM `ying`.`s_xts_adj_hst_sina`;

SELECT * FROM `ying`.`s_xts_adj_hst_sina` ORDER BY `ids`, `dt` DESC;

SELECT * FROM `ying`.`s_xts_adj_hst_sina` ORDER BY `dt` DESC, `ids`;

SELECT distinct ids FROM `ying`.`s_xts_adj_hst_sina` where fa > 500 ORDER BY `ids`, `dt` DESC;


SELECT * FROM `ying`.`s_xts_adj_hst_sina` where high > 9999 ORDER BY `ids`, `dt` DESC;
