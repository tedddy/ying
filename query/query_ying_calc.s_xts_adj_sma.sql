SELECT ids, avg(close5_d1), avg(close10_d1), avg(close20_d1), avg(close30_d1) FROM ying_calc.s_xts_adj_sma group by ids order by d desc limit 5;

SELECT * FROM ying_calc.s_xts_adj_sma order by d desc, ids;

SELECT * FROM ying_calc.s_xts_adj_sma order by d;

SELECT * FROM ying_calc.s_xts_adj_sma order by amount5 desc;

SELECT * FROM ying_calc.s_xts_adj_sma where amount5 = 9999.99 order by d desc;

SELECT * FROM ying_calc.s_xts_adj_sma where ids = '603599' order by d desc;

SELECT * FROM ying_calc.s_xts_adj_sma where ids = '603599' order by d desc;

SELECT * FROM ying_calc.s_xts_adj_sma where ids = '300055' order by d desc;
