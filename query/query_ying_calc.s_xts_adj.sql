SELECT * FROM `ying_calc`.`s_xts_adj` ORDER BY `dt` DESC LIMIT 10000; 

SELECT * FROM `ying_calc`.`s_xts_adj` ORDER BY `dt` DESC, `cjezb` DESC LIMIT 10000; 

SELECT GROUP_CONCAT(DISTINCT ids) FROM `ying_calc`.`s_xts_adj` WHERE volume = 16777215 ORDER BY volume DESC LIMIT 10000;

SELECT * FROM `ying_calc`.`s_xts_adj` WHERE volume = 16777215 ORDER BY volume DESC LIMIT 10000;

SELECT * FROM `ying_calc`.`s_xts_adj` WHERE `ids` = '000039' ORDER BY `dt` DESC LIMIT 10000;

SELECT * FROM `ying_calc`.`s_xts_adj` WHERE `ids` = '601777' ORDER BY `dt` DESC LIMIT 10000;
SELECT * FROM `ying_calc`.`s_xts_adj` WHERE `ids` = '300251' ORDER BY `dt` DESC LIMIT 10000;
SELECT * FROM `ying_calc`.`s_xts_adj` WHERE `ids` = '002161' ORDER BY `dt` DESC LIMIT 10000;
SELECT * FROM `ying_calc`.`s_xts_adj` WHERE `ids` = '002515' ORDER BY `dt` DESC LIMIT 10000;
SELECT * FROM `ying_calc`.`s_xts_adj` WHERE `ids` = '000778' ORDER BY `dt` DESC LIMIT 10000;



SELECT * FROM `ying_calc`.`s_xts_adj`;

SELECT COUNT(*) FROM `ying_calc`.`s_xts_adj`;

SELECT MAX(amount) FROM `ying_calc`.`s_xts_adj`;

SELECT * FROM `ying_calc`.`s_xts_adj` ORDER BY `dt` DESC, ids;

SELECT * FROM `ying_calc`.`s_xts_adj` WHERE close <= 0.00 ORDER BY `dt` DESC LIMIT 10000; 

SELECT * FROM `ying_calc`.`s_xts_adj` WHERE `dt` = '0000-00-00' ORDER BY `dt` DESC LIMIT 10000; 

