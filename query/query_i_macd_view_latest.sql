SELECT * FROM ying_calc.i_macd_view_latest order by mOsc_cl_d2_EMA desc;

SELECT * FROM ying_calc.i_macd_view_latest order by amount_d1 desc;

SELECT * FROM ying_calc.i_macd where idi in ('399973','399989') order by dt desc;

SELECT * FROM ying_calc.i_macd_view_latest where mOsc_cl > 0;

SELECT count(*) FROM ying_calc.i_macd_view_latest where mOsc_cl > 0;

SELECT * FROM ying_calc.i_macd_view_latest where mOsc_cl > 0 and mOsc_cl_d2_EMA > 0;

SELECT * FROM ying_calc.i_macd_view_latest where mOsc_cl < 0 and mOsc_cl_d2_EMA > 0 and mOsc_am > 0 order by mOsc_cl_d2_EMA desc;
 
SELECT count(*) FROM ying_calc.i_macd_view_latest where mOsc_cl and mOsc_cl_d2_EMA > 0 > 0;

SELECT * FROM ying_calc.i_macd_view_latest where mOsc_cl > 0 and mOsc_am > 0;

SELECT count(*) FROM ying_calc.i_macd_view_latest where mOsc_cl and mOsc_am > 0 > 0;