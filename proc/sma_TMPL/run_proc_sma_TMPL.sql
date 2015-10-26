-- mysql ying_calc -u gxh -p;

CALL `s_xts_adj_ids_d_close_sma_multiPeriods_loop_dt_ids`('2015-01-01 00:00:01', '2016-01-01 00:00:01', 5, 10, 20, 30, 60, 120); -- run this in putty console

CALL `s_xts_adj_ids_d_amount_sma_multiPeriods_loop_dt_ids`('2015-01-01 00:00:01', '2016-01-01 00:00:01', 5, 10, 20, 30, 60, 120); -- run this in putty console

CALL `s_xts_adj_ids_d_close_sma_multiPeriods_loop_dt_ids`('2014-01-01 00:00:01', '2015-01-01 00:00:01', 5, 10, 20, 30, 60, 120);

CALL `s_xts_adj_ids_d_amount_sma_multiPeriods_loop_dt_ids`('2014-01-01 00:00:01', '2015-01-01 00:00:01', 5, 10, 20, 30, 60, 120);