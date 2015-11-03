
CALL `s_xts_adj_ids_d_amount_sma_multiPeriods_loop_dt_ids` (cast(concat((curdate(), ' ', '00:00:01')) as datetime), '2015-09-01 00:00:01', 5, 10, 20, 30, 60, 120); 



-- select * from hs_s_xts where amount is null;

DELETE FROM hs_s_xts WHERE amount IS NULL;

-- DELETE from hs_s_xts_history_sina where amount is null;

SELECT xts.code, xts.date, ROUND(xts.amount/hst.amount) FROM hs_s_xts xts LEFT JOIN ying.hs_s_xts_history_sina hst ON xts.code=hst.code AND xts.date=hst.date where ROUND(xts.amount/hst.amount) < 100 ORDER BY date DESC, code;

SELECT xts.code, xts.date, ROUND(xts.amount/hst.amount) FROM hs_s_xts xts LEFT JOIN ying.s_xts hst ON xts.code=hst.ids AND xts.date=hst.d where code = '601318' ORDER BY date DESC, code;

SELECT xts.ids, xts.d, ROUND(xts.amount/hst.amount) FROM ying.s_xts xts LEFT outer JOIN hs_s_xts hst ON xts.ids=hst.code where code = '601318';

SELECT xts.ids, xts.d, hst.amount FROM ying.s_xts xts LEFT JOIN hs_s_xts hst ON xts.ids=hst.code where xts.ids = '000001' and hst.code is null;


select * FROM hs_s_xts xts where code = '601318' ORDER BY date DESC, code;

select * FROM ying.s_xts where ids = '601318' ORDER BY d DESC, ids;

select * from ying.hs_s_xts_history_sina where code = '601318' ORDER BY date desc;