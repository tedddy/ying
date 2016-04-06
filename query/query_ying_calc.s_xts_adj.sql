

SELECT dt as date, high as High, low as Low, close as Close, amount as Volume FROM ying.s_xts_adj where `ids` = 601318 and `dt` <> '0000-00-00' ORDER BY `dt` DESC LIMIT 1100 ;

SELECT * FROM `ying`.`s_xts` ORDER BY `dt` DESC LIMIT 10000; 

SELECT * FROM `ying`.`s_xts` where ids = '150210' ORDER BY `dt` DESC LIMIT 10000; 


SELECT * from `ying`.`s_xts_adj_hst_sina_faL` where ids = '601318';  

SELECT 
    a.ids, a.dt, a.close, b.close, a.volume, b.volume, a.amount, b.amount
FROM
    `ying`.`s_xts_adj` a
        JOIN
    `ying`.`s_xts` b ON (a.ids = b.ids AND a.dt = b.dt AND a.ids = '601318')
ORDER BY `dt` DESC
LIMIT 10000;  


SELECT * FROM `ying`.`s_xts_adj` ORDER BY `dt` DESC, `cjezb` DESC LIMIT 10000; 

SELECT GROUP_CONCAT(DISTINCT ids) FROM `ying`.`s_xts_adj` WHERE volume = 16777215 ORDER BY volume DESC LIMIT 10000;

SELECT * FROM `ying`.`s_xts_adj` WHERE volume = 16777215 ORDER BY volume DESC LIMIT 10000;

SELECT * FROM `ying`.`s_xts_adj` WHERE `ids` = '000039' ORDER BY `dt` DESC LIMIT 10000;

SELECT * FROM `ying`.`s_xts_adj` WHERE `ids` = '601777' ORDER BY `dt` DESC LIMIT 10000;
SELECT * FROM `ying`.`s_xts_adj` WHERE `ids` = '300251' ORDER BY `dt` DESC LIMIT 10000;
SELECT * FROM `ying`.`s_xts_adj` WHERE `ids` = '002161' ORDER BY `dt` DESC LIMIT 10000;
SELECT * FROM `ying`.`s_xts_adj` WHERE `ids` = '002515' ORDER BY `dt` DESC LIMIT 10000;
SELECT * FROM `ying`.`s_xts_adj` WHERE `ids` = '000778' ORDER BY `dt` DESC LIMIT 10000;



SELECT * FROM `ying`.`s_xts_adj`;

SELECT COUNT(*) FROM `ying`.`s_xts_adj`;

SELECT MAX(amount) FROM `ying`.`s_xts_adj`;

SELECT * FROM `ying`.`s_xts_adj` ORDER BY `dt` DESC, ids;

SELECT * FROM `ying`.`s_xts_adj` WHERE close <= 0.00 ORDER BY `dt` DESC LIMIT 10000; 

SELECT * FROM `ying`.`s_xts_adj` WHERE `dt` = '0000-00-00' ORDER BY `dt` DESC LIMIT 10000; 

