-- 上证50涨跌指数统计 tedd
SELECT * FROM `ying`.`hs_s_sh50_z_d_Statistics`;
SELECT TimeSlot, rate5, z - d AS dif_zd, zW - dW AS dif_zdW, zg - dg AS dif_zdg, zgW - dgW AS dif_zdgW, zt - dt AS dif_zdt, ztW - dtW AS dif_zdtW FROM `ying`.`hs_s_sh50_z_d_Statistics` WHERE  date(TimeSlot) = curdate() - 1 or date(TimeSlot) = curdate(); 

SELECT * FROM `ying`.`hs_s_sh50_z_d_Statistics` WHERE date = '15-08-31' or date = '15-09-01'; -- date = CURDATE() - 1 or date = CURDATE();

-- 沪深300涨跌指数统计 tedd
SELECT * FROM `ying`.`hs_s_hs300_z_d_Statistics`;
SELECT TimeSlot, rate5, z - d AS dif_zd, zW - dW AS dif_zdW, zg - dg AS dif_zdg, zgW - dgW AS dif_zdgW, zt - dt AS dif_zdt, ztW - dtW AS dif_zdtW FROM `ying`.`hs_s_hs300_z_d_Statistics` WHERE  date(TimeSlot) >= curdate() - 3 or date(TimeSlot) = curdate(); 


-- 沪深300股票, 中证500的涨停跌停个数
SELECT  a.TimeSlot, a.zt AS zt50, a.dt AS dt50, b.zt AS zt300, b.dt AS dt300, c.zt AS zt500, c.dt AS dt500, a.zt - a.dt AS zdt50, b.zt - b.dt AS zdt300, c.zt - c.dt AS zdt500 FROM `ying`.`hs_s_sh50_zt_dt_No` a     LEFT JOIN `ying`.`hs_s_hs300_zt_dt_No` b ON (((`a`.`TimeSlot` = `b`.`TimeSlot`)))     LEFT JOIN `ying`.`hs_s_zz500_zt_dt_No` c ON (((`a`.`TimeSlot` = `c`.`TimeSlot`)));

SELECT  a.TimeSlot as '日期和时间', a.zt AS '50涨停', a.dt AS '50跌停', b.zt AS '300涨停', b.dt AS '300跌停', c.zt AS '500涨停', c.dt AS '500跌停' FROM `ying`.`hs_s_sh50_zt_dt_No` a     LEFT JOIN `ying`.`hs_s_hs300_zt_dt_No` b ON (( (`a`.`TimeSlot` = `b`.`TimeSlot`)))     LEFT JOIN `ying`.`hs_s_zz500_zt_dt_No` c ON (((`a`.`TimeSlot` = `c`.`TimeSlot`)));

SELECT `hs_s_zz500_zt_dt_No`.`date` as '日期',
    `hs_s_zz500_zt_dt_No`.`TimeSlot` as '时间' ,
    `hs_s_zz500_zt_dt_No`.`zt` as '涨停股数',
    `hs_s_zz500_zt_dt_No`.`dt` as '跌停股数'
FROM `ying`.`hs_s_zz500_zt_dt_No`;

SELECT * FROM `ying`.`hs_s_sh50_zt_dt_No`;
SELECT * FROM `ying`.`hs_s_hs300_zt_dt_No`;
SELECT * FROM `ying`.`hs_s_zz500_zt_dt_No`;


SELECT 
    date,
    TimeSlot,
    z - d AS dif_zd,
    zW - dW AS dif_zdW,
    zg - dg AS dif_zdg,
    zgW - dgW AS dif_zdgW,
    zt - dt AS dif_zdt,
    ztW - dtW AS dif_zdtW
FROM
    `ying`.`hs_s_hs300_z_d_Statistics`
WHERE
    date = CURDATE() - 1 or date = CURDATE();


SELECT * FROM ying.hs_s_hs300_rt_EM where date = curdate() - 1 and time <= '11:00:00' and time >= '10:40:00';
SELECT * FROM ying.hs_s_hs300_rt_EM where date = curdate() and TimeSlot >= '14:59:00'  and chgrate < -9 order by id desc;



SELECT * FROM ying.hs_s_hs300_zt_weight;
SELECT * FROM ying.hs_s_hs300_dt_weight;


-- 沪深300股票, 中证500的涨跌个数
SELECT * FROM `ying`.`hs_s_hs300_z_d_No`;
SELECT * FROM `ying`.`hs_s_zz500_z_d_No`;

-- 沪深300股票的加权5分钟涨速指数
SELECT * FROM `ying`.`hs_s_hs300_chgrate5_weight` ORDER BY date DESC, TimeSlot DESC;