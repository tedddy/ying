
CALL `s_rt_sma_ids_dt_volume_multiPeriods_loop_dt_ids`(cast(concat(curdate(),' ','00:00:01') as DATETIME), '2018-08-08 15:05:00', 5, 10, 20, 30, 60, 120);

CALL `s_rt_sma_ids_dt_close_multiPeriods_loop_dt_ids`(cast(concat(curdate(),' ','00:00:01') as DATETIME), '2018-08-08 15:05:00', 5, 10, 20, 30, 60, 120);