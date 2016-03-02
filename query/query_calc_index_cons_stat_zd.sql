-- TRUNCATE `ying_calc`.`index_cons_stat_zd`;

SELECT * FROM `ying_calc`.`index_cons_stat_zd` order by `dt` desc;

-- DELETE FROM `ying_calc`.`index_cons_stat_zd` where date(`dt`) = curdate() order by `dt` desc;


SELECT summary.idi AS '指数', summary.name_i  AS '指数名称', ROUND(rate5,2) AS '五分钟涨速', `zd` AS '涨跌数差', zdW AS '涨跌数差加权', zd382 AS '涨跌超3.82', zd382W AS '涨跌超3.82加权', zd618 AS '涨跌超6.18', zd618W AS '涨跌超6.18加权', zd1000 AS '涨跌停差', zd1000W AS '涨跌停差加权', `dt` FROM `ying_calc`.`index_cons_stat_zd` summary JOIN index_info info ON (summary.idi = info.idi) ORDER BY summary.`dt` DESC;

-- 沪深300
SELECT `dt`, info.name_i  AS '指数名称', rate5 AS '五分钟涨速', z - `dt` AS '涨跌数差', zW - dW AS '涨跌数差加权', zfg - dfg AS '涨跌超3.82', zfgW - dfgW AS '涨跌超3.82加权', zg - dg AS '涨跌超6.18', zgW - dgW AS '涨跌超6.18加权', zt - d10 AS '涨跌停差', ztW - d10W AS '涨跌停差加权', summary.idi AS '指数' FROM `ying`.`index_cons_stat_zd` summary JOIN index_info info ON (summary.idi = info.idi) WHERE info.idi IN ('000300') ORDER BY summary.`dt` DESC, summary.idi; -- date(`dt`) = curdate() - 1 or or date(`dt`) >= '2015-09-29'

-- 创业板综
SELECT `dt`, info.name_i  AS '指数名称', rate5 AS '五分钟涨速', z - `dt` AS '涨跌数差', zW - dW AS '涨跌数差加权', zfg - dfg AS '涨跌超3.82', zfgW - dfgW AS '涨跌超3.82加权', zg - dg AS '涨跌超6.18', zgW - dgW AS '涨跌超6.18加权', zt - d10 AS '涨跌停差', ztW - d10W AS '涨跌停差加权', summary.idi AS '指数' FROM `ying`.`index_cons_stat_zd` summary JOIN index_info info ON (summary.idi = info.idi) WHERE info.idi IN ('399102') ORDER BY summary.`dt` DESC, summary.idi; -- date(`dt`) = curdate() - 1 or or date(`dt`) >= '2015-09-29'

SELECT * FROM `ying`.`index_cons_stat_zd`;

SELECT `dt`, idi, rate5, z - `dt` AS dif_zd, zW - dW AS dif_zdW, zfg - dfg AS dif_zdfg, zfgW - dfgW AS dif_zdfgW, zg - dg AS dif_zdg, zgW - dgW AS dif_zdgW, zt - `dt` AS dif_zdt, ztW - d10W AS dif_zd10W FROM `ying`.`index_cons_stat_zd` WHERE  DATE(`dt`) = CURDATE(); -- date(`dt`) = curdate() - 1 or 

-- SELECT zd.`dt` AS '时间', zd.z AS '上涨数', zd.`dt` AS '下跌数', zdfg.zfg AS '涨3.82', zdfg.dfg AS '跌3.82' , zdg.zg AS '涨6.18', zdg.dg AS '跌6.18' FROM `ying`.`hs_s_index_stat_z_d_No` zd join `ying`.`hs_s_index_stat_zfg_dfg_No` zdfg on (zd.`dt` = zdfg.`dt`)  join `ying`.`hs_s_index_stat_zg_dg_No` zdg on (zd.`dt` = zdg.`dt`);

-- in old version, query speed is much faster?! tedd Troubleshooting: too many rows of data
-- SELECT TimeSlot, info.name_i  AS '指数名称', rate5 AS '五分钟涨速', z - `dt` AS '涨跌数差', zW - dW AS '涨跌数差加权', zfg - dfg AS '涨跌超3.82', zfgW - dfgW AS '涨跌超3.82加权', zg - dg AS '涨跌超6.18', zgW - dgW AS '涨跌超6.18加权', zt - `dt` AS '涨跌停差', ztW - dtW AS '涨跌停差加权', summary.code_index AS '指数' FROM `ying`.`hs_s_index_stat_summary` summary JOIN hs_index_info info ON (summary.code_index = info.code_index) WHERE DATE(TimeSlot) >= CURDATE()-1 ORDER BY summary.TimeSlot DESC, summary.code_index; -- date(TimeSlot) = curdate() - 1 or or date(TimeSlot) >= '2015-09-29'