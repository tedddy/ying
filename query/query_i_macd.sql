SELECT mOsc_am_d1_EMA FROM ying.i_macd order by dt desc, bl_cl;

SELECT * FROM ying.i_macd where close_SD_relative > 0.03 order by dt desc, bl_cl;

SELECT * FROM ying.i_macd_view_latest where mOsc_cl > 0  order by dt desc, bl_cl;

SELECT * FROM ying.i_macd_view_latest where mOsc_cl > 0  order by dt desc, mOsc_cl desc;

SELECT * FROM ying.i_macd where mOsc_cl > 0 and mOsc_am > 0 and mOsc_cl_d2_EMA > 0 order by dt desc, bl_cl;

SELECT * FROM ying.i_macd where mOsc_cl > 0 and mOsc_am > 0 and mOsc_cl_d2_EMA > 0 and mOsc_am_d1_EMA > 0 order by dt desc, bl_cl;

SELECT * FROM ying.i_macd where `dt` = curdate() - 2 order by bl_cl;

-- hold
SELECT * FROM ying.i_macd where `idi` = '399934' order by dt desc; -- 中证金融

SELECT * FROM ying.i_macd where `idi` = '399959' order by dt desc; -- 军工指数 150222

SELECT * FROM ying.i_macd where `idi` = '399986' order by dt desc; -- 中证银行 150228

SELECT * FROM ying.i_macd where `idi` = '399394' order by dt desc; -- 医疗B 国政医药

-- watch
SELECT * FROM ying.i_macd where `idi` = '399396' order by dt desc; -- 医疗B 国政医药

SELECT * FROM ying.i_macd where `idi` = '399805' order by dt desc;

SELECT * FROM ying.i_macd where `idi` = '399989' order by dt desc;

SELECT * FROM ying.i_macd where `idi` = '000006' order by dt desc;

SELECT * FROM ying.i_macd where `idi` = '399006' order by dt desc;

SELECT * FROM ying.i_macd where `idi` = '399989' order by dt desc;

SELECT * FROM ying.i_macd where (datediff(curdate(),`dt`) < 88) order by dt desc;

SELECT * FROM ying.i_macd where `idi` = '399934' order by dt desc;

SELECT `idi`, `name_i` FROM ying.i_info;

SELECT * FROM ying.i_macd where `idi` = '399006' order by dt desc;

SELECT * FROM ying.i_macd where `idi` = '000006' order by dt desc;


SELECT * FROM ying.i_macd where `idi` = '399959' order by dt desc;

SELECT * FROM ying.i_macd where `idi` = '399393' order by dt desc;

SELECT * FROM ying.i_macd where `idi` = '399934' order by dt desc;


SELECT * FROM ying.i_macd where `idi` = '000974' order by dt desc;

SELECT * FROM ying.i_macd where `dt` = '2016-03-04' order by close_d1 desc;

SELECT * FROM ying.i_macd where `dt` = '2016-03-04' order by mOsc_cl_d1 desc;

SELECT * FROM ying.i_macd join ying.i_info on i_macd.idi = i_info.idi where i_macd.`dt` = '2016-03-04' and i_macd.mOsc_cl > -10 and i_macd.mOsc_cl < 10 order by i_macd.mOsc_cl desc;

SELECT * FROM ying.i_macd where `dt` = '2016-03-03' order by mOsc_cl_d1 desc;

SELECT * FROM ying.i_macd where `dt` = '2016-03-02' order by mOsc_cl_d1 desc;

SELECT * FROM ying.i_macd where `dt` = '2016-03-01' order by mOsc_cl_d1 desc;