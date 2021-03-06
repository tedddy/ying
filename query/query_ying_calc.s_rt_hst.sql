SELECT * from `ying_calc`.`s_rt_hst` where time(dt)='09:30:00' ORDER BY dt desc;

SELECT * from `ying_calc`.`s_rt_hst` where time(dt)='09:35:00' ORDER BY dt desc;

SELECT * from `ying_calc`.`s_rt_hst` where time(dt)='09:40:00' ORDER BY dt desc;



-- by hour at half
SELECT `dt`,ids,avg(close) FROM ying_calc.s_rt_hst where datediff(curdate(), dt) < 7 group by ids,FLOOR((UNIX_TIMESTAMP(`dt`) - 1800) / 3600)  ORDER BY `dt` desc; -- FLOOR((UNIX_TIMESTAMP(date) - 1800) / 3600) select date,AVG(AE) from mytable group by date(date),HOUR(date);   

-- by an hour at 00
SELECT `dt`,ids,avg(close) FROM ying_calc.s_rt_hst where datediff(curdate(), dt) < 7 group by ids,FLOOR((UNIX_TIMESTAMP(`dt`) - 3600) / 3600)  ORDER BY `dt` desc; -- FLOOR((UNIX_TIMESTAMP(date) - 1800) / 3600) select date,AVG(AE) from mytable group by date(date),HOUR(date); 

-- by half an hour
SELECT `dt`,ids,avg(close) FROM ying_calc.s_rt_hst where datediff(curdate(), dt) < 7 group by ids,FLOOR((UNIX_TIMESTAMP(`dt`) - 1800) / 1800)  ORDER BY `dt` desc; -- FLOOR((UNIX_TIMESTAMP(date) - 1800) / 3600) select date,AVG(AE) from mytable group by date(date),HOUR(date);  

select a.`dt`, a.`close`, a.`volume`, a.`amount` from (SELECT `dt`, `close`, `volume`, `amount` FROM `ying_calc`.`s_rt_hst` where ids = '600016' order by `dt` desc limit 98) as a order by a.`dt`;

select FLOOR(UNIX_TIMESTAMP(curdate())/3600), FLOOR((UNIX_TIMESTAMP(curdate()) - 180) / 3600), FLOOR((UNIX_TIMESTAMP(curdate()) - 1800) / 3600), FLOOR((UNIX_TIMESTAMP('2016-02-17 10:35:00') - 1800) / 3600);

SELECT dt as date, close, volume, amount FROM ying_calc.index_rt_hst where `idi` = '000300' ORDER BY `dt` DESC LIMIT 500;

SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '000839' ORDER BY `dt` DESC LIMIT 50;

SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '600100' ORDER BY `dt` DESC;
SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '600895' ORDER BY `dt` DESC;
SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '000039' ORDER BY `dt` DESC;
SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '600804' ORDER BY `dt` DESC;
SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '600638' ORDER BY `dt` DESC;
SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '300058' ORDER BY `dt` DESC;
SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '300251' ORDER BY `dt` DESC;
SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '002739' ORDER BY `dt` DESC;
SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '600895' ORDER BY `dt` DESC;
SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '600100' ORDER BY `dt` DESC;


SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '600030' ORDER BY `dt` DESC;
SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '601186' ORDER BY `dt` DESC;
SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '601766' ORDER BY `dt` DESC;
SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '601777' ORDER BY `dt` DESC;
SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '000919' ORDER BY `dt` DESC;
SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '002161' ORDER BY `dt` DESC;
SELECT * FROM ying_calc.s_rt_hst WHERE TIME(`dt`) = '14:00:00' ORDER BY `dt` DESC;
SELECT * FROM ying_calc.index_rt_hst WHERE TIME(`dt`) = '14:00:00' ORDER BY `dt` DESC;
SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '000917' ORDER BY `dt` DESC;
SELECT * FROM ying_calc.s_rt_hst WHERE `ids` = '002515' ORDER BY `dt` DESC;


SELECT * FROM `ying_calc`.index_rt_hst WHERE `dt` = '2015-12-08 13:15:00';



SELECT * FROM ying_calc.s_rt_hst ORDER BY `dt` DESC, ids;



SELECT * FROM ying_calc.s_rt_hst where `ids` in ('600030','600837','601211','601688') ORDER BY ids, `dt` DESC;

SELECT * FROM ying_calc.s_rt_hst where `ids` IN ('600036','601166','601288','601328') ORDER BY ids, `dt` DESC;

SELECT * FROM ying_calc.s_rt_hst WHERE `dt` = '2015-11-06 14:15:00' ORDER BY `dt` DESC, ids;

SELECT * FROM ying_calc.s_rt_hst WHERE time(`dt`) = '15:05:00' ORDER BY `dt` DESC, ids;

SELECT * FROM ying_calc.s_rt_hst WHERE `dt` = '2015-11-19 10:35:00' ORDER BY `dt` DESC, ids;

SELECT * FROM ying_calc.s_rt_hst WHERE chgrate = 0.00 AND volume > 0.00 AND `dt` = '2015-11-06 14:15:00' ORDER BY `dt` DESC, ids;

SELECT * FROM ying_calc.s_rt_hst WHERE `cjezb` <= '0.00';

-- DELETE FROM ying_calc.s_rt_hst WHERE `dt` = '2015-11-09 15:05:00';

	SELECT 
    `index_stock_info`.`idi` AS `idi`,
    `index_info`.`name_i`,
    SUM(IF((`ying_calc`.`s_rt_hst`.`volume` > 0), 1, 0)) AS `n`,
    ROUND(SUM((`ying_calc`.`s_rt_hst`.`chgrate5` * `index_stock_info`.`weight`)),2) AS `rate5`,
    SUM(IF((`ying_calc`.`s_rt_hst`.`chgrate` > 0), 1, - 1)) AS `zd`,
    ROUND(SUM(IF((`ying_calc`.`s_rt_hst`.`chgrate` > 0),
        `index_stock_info`.weight,
        - 1 * `index_stock_info`.weight)),2) AS `zdW`,
    SUM(IF(((`ying_calc`.`s_rt_hst`.`chgrate` > 0)
            AND (`ying_calc`.`s_rt_hst`.`close` >= ROUND(((1 + 0.0382) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                2))),
        1,
        IF(((`ying_calc`.`s_rt_hst`.`chgrate` < 0)
                AND (`ying_calc`.`s_rt_hst`.`close` <= ROUND(((1 - 0.0382) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                    2))),
            - 1,
            0))) AS `zd382`,
   ROUND(SUM(IF(((`ying_calc`.`s_rt_hst`.`chgrate` > 0)
            AND (`ying_calc`.`s_rt_hst`.`close` >= ROUND(((1 + 0.0382) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                2))),
        `index_stock_info`.weight,
        IF(((`ying_calc`.`s_rt_hst`.`chgrate` < 0)
                AND (`ying_calc`.`s_rt_hst`.`close` <= ROUND(((1 - 0.0382) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                    2))),
            - 1 * `index_stock_info`.weight,
            0))),2) AS `zd382W`,
    SUM(IF(((`ying_calc`.`s_rt_hst`.`chgrate` > 0)
            AND (`ying_calc`.`s_rt_hst`.`close` >= ROUND(((1 + 0.0618) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                2))),
        1,
        IF(((`ying_calc`.`s_rt_hst`.`chgrate` < 0)
                AND (`ying_calc`.`s_rt_hst`.`close` <= ROUND(((1 - 0.0618) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                    2))),
            1,
            0))) AS `zd618`,
    ROUND(SUM(IF(((`ying_calc`.`s_rt_hst`.`chgrate` > 0)
            AND (`ying_calc`.`s_rt_hst`.`close` >= ROUND(((1 + 0.0618) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                2))),
        `index_stock_info`.weight,
        IF(((`ying_calc`.`s_rt_hst`.`chgrate` < 0)
                AND (`ying_calc`.`s_rt_hst`.`close` <= ROUND(((1 - 0.0618) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                    2))),
            - 1 * `index_stock_info`.weight,
            0))),2) AS `zd618W`,
    SUM(IF(((`ying_calc`.`s_rt_hst`.`chgrate` > 0)
            AND (`ying_calc`.`s_rt_hst`.`close` >= ROUND(((1 + 0.1) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                2))),
        1,
        IF(((`ying_calc`.`s_rt_hst`.`chgrate` < 0)
                AND (`ying_calc`.`s_rt_hst`.`close` <= ROUND(((1 - 0.1) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                    2))),
            - 1,
            0))) AS `zd1000`,
   ROUND( SUM(IF(((`ying_calc`.`s_rt_hst`.`chgrate` > 0)
            AND (`ying_calc`.`s_rt_hst`.`close` >= ROUND(((1 + 0.1) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                2))),
        `index_stock_info`.weight,
        IF(((`ying_calc`.`s_rt_hst`.`chgrate` < 0)
                AND (`ying_calc`.`s_rt_hst`.`close` <= ROUND(((1 - 0.1) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
                    2))),
            - 1 * `index_stock_info`.weight,
            0))),2) AS `zd1000W`,
    `ying_calc`.`s_rt_hst`.`dt` AS `dt`
FROM
    (`ying_calc`.`s_rt_hst`
    LEFT JOIN `index_stock_info` ON ((`ying_calc`.`s_rt_hst`.`ids` = `index_stock_info`.`ids`) AND DATE(`ying_calc`.`s_rt_hst`.`dt`) = DATE_SUB(CURDATE(), INTERVAL 1 DAY))
    JOIN index_info ON (`index_stock_info`.`idi` = `index_info`.`idi`))
WHERE
    (`index_stock_info`.`idi` IS NOT NULL)
GROUP BY `ying_calc`.`s_rt_hst`.`dt` , `index_stock_info`.`idi`
ORDER BY `ying_calc`.`s_rt_hst`.`dt` DESC , `index_stock_info`.`idi`;