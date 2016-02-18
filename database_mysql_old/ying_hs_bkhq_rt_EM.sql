SELECT * FROM ying.hs_bkhq_rt_EM;


-- DELETE FROM `ying`.`hs_bkhq_rt_EM` WHERE `id`<='6422' and `id`>='6335';
-- UPDATE `ying`.`hs_bkhq_rt_EM` SET DateSys = current_date()-2 where DateSys = current_date();

-- UPDATE `ying`.`hs_bkhq_rt_EM` SET DateSys = current_date()-4 where DateSys = current_date();

-- UPDATE `ying`.`hs_bkhq_rt_EM` SET TimeSlot = '15:00:00' where DateSys = current_date();

SELECT * FROM ying.hs_bkhq_rt_EM where DateSys = current_date() order by id desc;

SELECT * FROM ying.hs_bkhq_rt_EM where name_bk = '通用航空' order by id desc;

SELECT * FROM ying.hs_bkhq_rt_EM order by DateSys desc, TimeSlot desc, chgrate_bk desc;

select name_bk, chgrate_bk, code, count(code), chgrate from ying.hs_bkhq_rt_EM group by code; 
SELECT 
    name_bk, chgrate_bk, code, COUNT(code)
FROM
    ying.hs_bkhq_rt_EM
WHERE
    chgrate_bk > 2 OR chgrate_bk < - 2
GROUP BY name_bk , code
ORDER BY chgrate_bk DESC; 

UPDATE `ying`.`hs_bkhq_rt_EM` SET `name_bk`='上证50' WHERE `name_bk`='上证50_';
UPDATE `ying`.`hs_bkhq_rt_EM` SET `name_bk`='央视50' WHERE `name_bk`='央视50_';
UPDATE `ying`.`hs_bkhq_rt_EM` SET `name_bk`='HS300' WHERE `name_bk`='HS300_';
UPDATE `ying`.`hs_bkhq_rt_EM` SET `name_bk`='上证180' WHERE `name_bk`='上证180_';

SELECT * FROM `ying`.`hs_bkhq_rt_EM` WHERE `name_bk` like '%\_'; -- 通配符的使用

