SELECT * FROM ying.s_rt_sma ;

SELECT * FROM ying.s_rt_sma order by ids, dt desc, volume5 desc;

SELECT * FROM ying.s_rt_sma where volume5 > 300 order by ids, dt desc;

SELECT * FROM ying.s_rt_sma where dt > '2015-10-01' order by dt;

SELECT count(*) FROM ying.s_rt_sma;

SELECT * FROM ying.s_rt_sma where dt > '2015-10-01' and `ids`='601318' order by dt desc;


-- UPDATE `ying`.`s_rt_sma` SET `sma5c`='0' WHERE `ids`='000001' ;

-- UPDATE `ying`.`s_rt_sma` SET `sma5c`='0' WHERE `ids`='000001';

SELECT * from `ying`.`s_rt_sma` WHERE `ids`='000001' and `dt`='2015-10-15 09:30:00';

SELECT * from `ying`.`s_rt_sma` WHERE `ids`='000001' and `sma5c`=0;

SELECT count(*) from `ying`.`s_rt_sma` WHERE `ids`='000001' and `sma5c`=0;