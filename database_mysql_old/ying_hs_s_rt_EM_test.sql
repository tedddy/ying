	INSERT ignore INTO hs_s_rt_EM_test (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot) SELECT code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot FROM `ying`.`hs_s_rt_EM` WHERE code IN ('601318') and date <= curdate() - 1; 
	INSERT ignore INTO hs_s_rt_EM_test (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot) SELECT code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot FROM `ying`.`hs_s_rt_EM` WHERE code IN ('600030') and date <= curdate() - 1; 
	INSERT ignore INTO hs_s_rt_EM_test (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot) SELECT code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot FROM `ying`.`hs_s_rt_EM` WHERE code IN ('600000') and date <= curdate() - 1; 
    
    INSERT ignore INTO hs_s_rt_EM_test (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot) SELECT code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot FROM `ying`.`hs_s_rt_EM` WHERE code IN ('601318') and date > curdate() - 1; 
	INSERT ignore INTO hs_s_rt_EM_test (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot) SELECT code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot FROM `ying`.`hs_s_rt_EM` WHERE code IN ('600030') and date > curdate() - 1; 
	INSERT ignore INTO hs_s_rt_EM_test (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot) SELECT code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot FROM `ying`.`hs_s_rt_EM` WHERE code IN ('600000') and date > curdate() - 1; 

SELECT * FROM ying.hs_s_rt_EM_test order by code desc, idsub desc;

SELECT * FROM ying.hs_s_rt_EM_test order by id;
delete from ying.hs_s_rt_EM_test where date = '2015-10-09';
SELECT * FROM ying.hs_s_rt_EM_test order by TimeSlot desc;

SELECT idsub FROM `ying`.`hs_s_rt_EM_test` order by idsub desc;

SELECT idsub FROM `ying`.`hs_s_rt_EM_test` WHERE `code` = '600486' ORDER BY idsub desc limit 1;	

SELECT idsub, volume FROM `ying`.`hs_s_rt_EM_test` WHERE `code` = '600486' ORDER BY volume desc;	

SELECT idsub FROM `ying`.`hs_s_rt_EM_test` WHERE `code` = '600486' ORDER BY idsub desc limit 1;

SELECT round(avg(idsub)) FROM `ying`.`hs_s_rt_EM_test` WHERE `code` = '600190';	

SELECT * FROM ying.hs_s_rt_EM_test where date > '2015-10-08' order by idsub desc;

select * from ying.hs_s_rt_EM_test where code = '600716' order by code, idsub;
delete from ying.hs_s_rt_EM_test where code = '600030';

update ying.hs_s_rt_EM_test set m5 = 0;

