-- by an hour at 00
SELECT `dt`,ids,avg(close) FROM ying_calc.s_rt_hst where datediff(curdate(), dt) < 7 group by ids,FLOOR((UNIX_TIMESTAMP(`dt`) - 3600) / 3600)  ORDER BY `dt` desc; -- FLOOR((UNIX_TIMESTAMP(date) - 1800) / 3600) select date,AVG(AE) from mytable group by date(date),HOUR(date); 

-- by half an hour
SELECT `dt`,ids,avg(close) FROM ying_calc.s_rt_hst where datediff(curdate(), dt) < 7 group by ids,FLOOR((UNIX_TIMESTAMP(`dt`) - 1800) / 1800)  ORDER BY `dt` desc; -- FLOOR((UNIX_TIMESTAMP(date) - 1800) / 3600) select date,AVG(AE) from mytable group by date(date),HOUR(date);  

select a.`dt`, a.`close`, a.`volume`, a.`amount` from (SELECT `dt`, `close`, `volume`, `amount` FROM `ying_calc`.`s_rt_hst` where ids = '600016' order by `dt` desc limit 98) as a order by a.`dt`;

select from_unixtime(FLOOR(UNIX_TIMESTAMP(curdate()))), from_unixtime(FLOOR(UNIX_TIMESTAMP(curdate())/3600)), FLOOR((UNIX_TIMESTAMP(curdate()) - 180) / 3600), FLOOR((UNIX_TIMESTAMP(curdate()) - 1800) / 3600), FLOOR((UNIX_TIMESTAMP('2016-02-17 10:35:00') - 1800) / 3600);

select CURRENT_TIMESTAMP(), now();

select from_unixtime(180*FLOOR((UNIX_TIMESTAMP(now()) + 180) / 180)), now();