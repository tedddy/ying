-- TRUNCATE ying.hk_w_xts_sg; 

SELECT * from `ying`.`hk_w` where DateSys = curdate() order by dateSys desc;

SELECT * FROM ying.hk_w_sg_imported order by dt desc, `Turnover($K)` desc;

-- DELETE from ying.hk_w_xts_sg where dt = '2016-03-02';

SELECT * FROM ying.hk_w_xts_sg order by dt desc, turnover desc;

SELECT * FROM ying.hk_w_xts_sg_AM order by dt desc, turnover desc;

SELECT * FROM ying.hk_w_sg;

SELECT 	ying.hk_w_xts_sg.`dt` AS `dt`, `info`.`code`,	`info`.`uCode` AS `uCode`, 	`info`.`nature` AS `nature`, 	ying.hk_w_xts_sg.`turnover` AS `turnover` FROM (ying.hk_w_xts_sg 	JOIN `ying`.`hk_w_sg` `info` ON ((ying.hk_w_xts_sg.`code` = `info`.`code`))) WHERE (`info`.`uCode` IS NOT NULL) and uCode IN ('3333','3888','2822','2823','HSCE','6030') ORDER BY `info`.`uCode`, ying.hk_w_xts_sg.`dt` DESC, ying.hk_w_xts_sg.`turnover` DESC;

SELECT 	ying.hk_w_xts_sg.`dt` AS `dt`, `info`.`uCode` AS `uCode`, 	`info`.`nature` AS `nature`, SUM(ying.hk_w_xts_sg.`turnover`) AS `turnover` FROM 	(ying.hk_w_xts_sg 	JOIN `ying`.`hk_w_sg` `info` ON ((ying.hk_w_xts_sg.`code` = `info`.`code`))) WHERE (`info`.`uCode` IS NOT NULL) and uCode IN ('3333','3888','2828','6030','2822','2823') GROUP BY `info`.`uCode` , ying.hk_w_xts_sg.`dt` , `info`.`nature` ORDER BY `info`.`uCode`, ying.hk_w_xts_sg.`dt` DESC;

SELECT 
    `view_hk_w_xts_sg_groupBy_uCode`.`dt`,
    `view_hk_w_xts_sg_groupBy_uCode`.`uCode`,
    `view_hk_w_xts_sg_groupBy_uCode`.`nature`,
    `view_hk_w_xts_sg_groupBy_uCode`.`turnover`
FROM
    `ying`.`view_hk_w_xts_sg_groupBy_uCode`;

-- join view_hk_w_xts_sg_groupBy_uCode and view_hk_w_xts_sg_groupBy_uCode
SELECT 
    `view_hk_w_xts_sg_groupBy_uCode`.`dt`,
    `view_hk_w_xts_sg_groupBy_uCode`.`uCode`,
    `view_hk_w_xts_sg_groupBy_uCode`.`nature`,
    `view_hk_w_xts_sg_groupBy_uCode`.`turnover`,
    `view_w_MM_groupBy_uCode`.`sum_buy_MM`,
    `view_w_MM_groupBy_uCode`.`sum_sell_MM`
FROM
    `ying`.`view_hk_w_xts_sg_groupBy_uCode`
        LEFT JOIN
    `ying`.`view_w_MM_groupBy_uCode` ON (`view_hk_w_xts_sg_groupBy_uCode`.`dt` = `view_w_MM_groupBy_uCode`.`dt`
        AND `view_hk_w_xts_sg_groupBy_uCode`.`uCode` = `view_w_MM_groupBy_uCode`.`uCode`
        AND `view_hk_w_xts_sg_groupBy_uCode`.`nature` = `view_w_MM_groupBy_uCode`.`nature`);

SELECT `view_w_MM_groupBy_uCode`.`dt`,
    `view_w_MM_groupBy_uCode`.`uCode`,
    `view_w_MM_groupBy_uCode`.`nature`,
    `view_w_MM_groupBy_uCode`.`sum_buy_MM`,
    `view_w_MM_groupBy_uCode`.`sum_sell_MM`
FROM `ying`.`view_w_MM_groupBy_uCode`;



SELECT concat('http://hq.sinajs.cn/list=rt_hk',code) AS 'url_hk_w' FROM `hk_w_sg` where eDate > curdate();

SELECT * FROM ying.hk_w_xts_sg;

-- UPDATE `ying`.`hk_w_xts_sg` SET `dt`='2016-02-18' WHERE `dt`='2016-02-21';


