-- mysql ying_calc -u gxh -p;


CALL `ying_calc`.`s_xts_adj_sma_amount_loop`('2012-06-30', '2013-06-29', 5, 10, 20, 30, 60, 120);

CALL `ying_calc`.`s_xts_adj_sma_close_loop`('2012-06-30', '2013-06-29', 5, 10, 20, 30, 60, 120);

CALL `ying_calc`.`s_xts_adj_sma_amount_loop`('2012-01-01', '2012-06-30', 5, 10, 20, 30, 60, 120);

CALL `ying_calc`.`s_xts_adj_sma_close_loop`('2012-01-01', '2012-06-30', 5, 10, 20, 30, 60, 120); -- run this in putty console

CALL `ying_calc`.`s_xts_adj_sma_close_loop` (date_sub(curdate(), interval 4 DAY), '2018-08-08', 5, 10, 20, 30, 60, 120); 

CALL `ying_calc`.`s_xts_adj_sma_amount_loop` (date_sub(curdate(), interval 4 DAY), '2018-08-08', 5, 10, 20, 30, 60, 120); 

CALL `ying_calc`.`s_xts_adj_sma_amount_loop` ('2015-11-01 00:00:01', '2018-08-08 00:00:01', 5, 10, 20, 30, 60, 120); 

CALL `s_xts_adj_sma_amount_loop`('2015-01-01 00:00:01', '2015-09-01 00:00:01', 5, 10, 20, 30, 60, 120); -- run this in putty console

CALL `s_xts_adj_sma_close_loop`('2015-10-28 00:00:01', '2016-01-01 00:00:01', 5, 10, 20, 30, 60, 120); -- run this in putty console

CALL `s_xts_adj_sma_amount_loop`('2015-10-28 00:00:01', '2016-01-01 00:00:01', 5, 10, 20, 30, 60, 120); -- run this in putty console


CALL `s_xts_adj_sma_close_loop`('2013-01-01 00:00:01', '2014-01-01 00:00:01', 5, 10, 20, 30, 60, 120);

CALL `s_xts_adj_sma_amount_loop`('2013-01-01 00:00:01', '2014-01-01 00:00:01', 5, 10, 20, 30, 60, 120);

CALL `s_xts_adj_sma_close_loop`('2012-01-01 00:00:01', '2013-01-01 00:00:01', 5, 10, 20, 30, 60, 120);

CALL `s_xts_adj_sma_amount_loop`('2012-01-01 00:00:01', '2013-01-01 00:00:01', 5, 10, 20, 30, 60, 120);


CALL `s_xts_adj_sma_close_loop`('2015-10-24 00:00:01', '2016-01-01 00:00:01', 5, 10, 20, 30, 60, 120); -- run this in putty console

CALL `s_xts_adj_sma_amount_loop`('2015-10-24 00:00:01', '2016-01-01 00:00:01', 5, 10, 20, 30, 60, 120); -- run this in putty console

-- CALL `s_xts_adj_sma_close_loop`('2015-01-01 00:00:01', '2016-01-01 00:00:01', 5, 10, 20, 30, 60, 120); -- run this in putty console
-- 
-- CALL `s_xts_adj_sma_amount_loop`('2015-01-01 00:00:01', '2016-01-01 00:00:01', 5, 10, 20, 30, 60, 120); -- run this in putty console
-- 
-- CALL `s_xts_adj_sma_close_loop`('2014-01-01 00:00:01', '2015-01-01 00:00:01', 5, 10, 20, 30, 60, 120);
-- 
-- CALL `s_xts_adj_sma_amount_loop`('2014-01-01 00:00:01', '2015-01-01 00:00:01', 5, 10, 20, 30, 60, 120);

