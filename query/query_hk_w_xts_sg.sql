-- TRUNCATE ying_calc.hk_w_xts_sg; 

SELECT * from `ying`.`hk_w` where DateSys = curdate() order by dateSys desc;

SELECT * FROM ying_calc.hk_w_sg_imported order by dt desc;

-- DELETE from ying_calc.hk_w_xts_sg where dt = '2016-02-26';

SELECT * FROM ying_calc.hk_w_xts_sg order by dt desc, code, turnover desc;

SELECT 	ying_calc.hk_w_xts_sg.`dt` AS `dt`, `info`.`code`,	`info`.`uCode` AS `uCode`, 	`info`.`nature` AS `nature`, 	ying_calc.hk_w_xts_sg.`turnover` AS `turnover` FROM 	(ying_calc.hk_w_xts_sg 	JOIN `ying_calc`.`hk_w_sg` `info` ON ((ying_calc.hk_w_xts_sg.`code` = `info`.`code`))) WHERE (`info`.`uCode` IS NOT NULL) and uCode IN ('3333','3888','2822','2823','HSCI,'6030') ORDER BY `info`.`uCode`, ying_calc.hk_w_xts_sg.`dt` DESC, ying_calc.hk_w_xts_sg.`turnover` DESC;


SELECT 	ying_calc.hk_w_xts_sg.`dt` AS `dt`, 	`info`.`uCode` AS `uCode`, 	`info`.`nature` AS `nature`, 	SUM(ying_calc.hk_w_xts_sg.`turnover`) AS `turnover` FROM 	(ying_calc.hk_w_xts_sg 	JOIN `ying_calc`.`hk_w_sg` `info` ON ((ying_calc.hk_w_xts_sg.`code` = `info`.`code`))) WHERE (`info`.`uCode` IS NOT NULL) and uCode IN ('3333','3888','2828','6030') GROUP BY `info`.`uCode` , ying_calc.hk_w_xts_sg.`dt` , `info`.`nature` ORDER BY `info`.`uCode`, ying_calc.hk_w_xts_sg.`dt` DESC;

SELECT concat('http://hq.sinajs.cn/list=rt_hk',code) AS 'url_hk_w' FROM `hk_w_sg` where eDate > curdate();

SELECT * FROM ying_calc.hk_w_xts_sg;

-- UPDATE `ying_calc`.`hk_w_xts_sg` SET `dt`='2016-02-18' WHERE `dt`='2016-02-21';


