SELECT * FROM `ying_calc`.`index_cons_stat_zd` order by `dt` desc;

SELECT 
    `index_cons_stat_zd`.`idi` AS '指数id',
    `index_cons_stat_zd`.`name_i` AS '指数名称',
    `index_cons_stat_zd`.`n` AS '股票总数',
    `index_cons_stat_zd`.`zd1000` AS '净涨跌停数',
    `index_cons_stat_zd`.`zd` AS '净涨跌数',
    `index_cons_stat_zd`.`zd618` AS '净涨跌数(中幅涨跌)',
    `index_cons_stat_zd`.`zd382` AS '净涨跌数(小幅涨跌)',
    `index_cons_stat_zd`.`dt` AS '日期'
FROM
    `ying_calc`.`index_cons_stat_zd`
WHERE
    idi in ('000300', '000016')	
ORDER BY `dt` DESC;

SELECT * FROM `ying_calc`.`index_cons_stat_zd` where idi = '000016' order by `dt` desc;


SELECT * FROM `ying_calc`.`index_cons_stat_zd` where idi = '399102' order by `dt` desc;

SELECT * FROM `ying_calc`.`index_cons_stat_zd` where idi = '399807' order by `dt` desc;

SELECT * FROM `ying_calc`.`index_cons_stat_zd` where time(dt) = "15:05:00" order by `dt` desc;

