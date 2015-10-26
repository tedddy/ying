SELECT * FROM s_xts_adj;

SELECT count(*) FROM s_xts_adj;

CALL `s_xts_adj_ids_d_close_sma_multiPeriods_loop_dt_ids`('2015-01-01 00:00:01', '2016-01-01 00:00:01', 5, 10, 20, 30, 60, 120); -- run this in putty console

-- mysql ying_calc -u gxh -p 
