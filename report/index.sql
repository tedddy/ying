SELECT * FROM `ying_calc`.`index_xts` where idi = '000016' ORDER BY dt DESC, cjezb_d1 desc;

SELECT * FROM `ying_calc`.`index_xts_sma` where idi = '000016' ORDER BY dt DESC;


-- 成交额占比增加幅度
SELECT a.`idi`, b.name_i, a.`dt`, a.`cjezb_d1` FROM `ying_calc`.`index_xts` a join `ying_calc`.`i_info` b on a.idi = b.idi ORDER BY a.dt DESC, a.cjezb_d1 desc;

-- 指数对应的股票
SELECT * FROM ying.hs_index_cons where code_index in (select idi from `ying_calc`.`index_xts` where dt = '2016-02-19' and cjezb_d1 > 10 ORDER BY cjezb_d1 );

SELECT * FROM `ying_calc`.`index_xts` where dt = '2016-01-21' ORDER BY idi, dt DESC;

SELECT * FROM `ying_calc`.`index_xts` where idi = '000902' ORDER BY idi, dt DESC;
SELECT * FROM `ying`.`index_xts_hst_sina` ORDER BY d DESC, idi;
SELECT count(*) FROM `ying`.`index_xts_hst_sina`;


SELECT * FROM `ying_calc`.`index_xts` where dt = '2016-01-05' ORDER BY idi, dt DESC;

SELECT * FROM `ying_calc`.`index_xts` where cjezb_d1 is null order BY idi, dt DESC;

	-- update `cjezb` of table `ying_calc`.`index_xts`
		UPDATE `ying_calc`.`index_xts` a
		JOIN `ying_calc`.`index_xts` b ON (b.`idi` = '000902' AND a.`dt` = b.`dt`) 
		SET a.`cjezb` = IF(b.amount > 0, ROUND(100 * a.amount / b.amount, 2),0);
