SELECT * FROM ying.index_xts ORDER BY a.`dt` desc, `idi`, `dt` DESC;

SELECT * FROM ying.index_xts WHERE `idi` = '000902' ORDER BY a.`dt` desc, `dt` DESC;

SELECT * FROM ying.index_xts WHERE `dt` = '2015-12-04';

	-- update `cjezb` of table `ying`.`index_xts` for CURDATE()
		UPDATE `ying`.`index_xts` a
		JOIN `ying`.`index_xts` b ON (b.`idi` = '000902' AND a.`dt` = b.`dt`) 
		SET a.`cjezb` = IF(b.amount > 0, ROUND(100 * a.amount / b.amount, 2),0) 
		WHERE datediff(curdate(),`a`.`dt`) < 15;

CALL `ying`.`index_xts_cjezb_d1`();
CALL `ying`.`index_xts_amount_d1`();
CALL `ying`.`index_xts_close_d1`();


-- list index ORDER BY a.`dt` desc, close_d1  指数涨幅排行
SELECT b.name_i, a.* FROM ying.index_xts a join i_info b on a.idi = b.idi where  datediff(curdate(),`a`.`dt`) < 15 ORDER BY a.`dt` desc, `close_d1` DESC;


-- list index ORDER BY a.`dt` desc, amount_d1 指数成交额增加率排行
SELECT b.name_i, a.* FROM ying.index_xts a join i_info b on a.idi = b.idi where  datediff(curdate(),`a`.`dt`) < 15 ORDER BY a.`dt` desc, `amount_d1` DESC;

-- 成交占比小，但指数涨幅大

SELECT b.name_i, a.* FROM ying.index_xts a join i_info b on a.idi = b.idi where  datediff(curdate(),`a`.`dt`) < 15 and a.close_d1 > 0 and a.cjezb_d1 < 0 ORDER BY a.`dt` desc, a.`cjezb_d1`;


-- 成交额增加，指数增加
SELECT b.name_i, a.* FROM ying.index_xts a join i_info b on a.idi = b.idi where  datediff(curdate(),`a`.`dt`) < 15 and a.`close_d1` > 0 and a.`amount_d1` >0 ORDER BY a.`dt` desc, a.`dt` desc,`close_d1`*`amount_d1` desc;

-- 成交额减少，指数涨
SELECT b.name_i, a.* FROM ying.index_xts a join i_info b on a.idi = b.idi where  datediff(curdate(),`a`.`dt`) < 15 and a.`close_d1` > 0 and a.`amount_d1` < 0 ORDER BY a.`dt` desc, `close_d1`*`amount_d1`;

-- 成交额减少，指数跌
SELECT b.name_i, a.* FROM ying.index_xts a join i_info b on a.idi = b.idi where  datediff(curdate(),`a`.`dt`) < 15 and a.`close_d1` < 0 and a.`amount_d1` < 0 ORDER BY a.`dt` desc, `close_d1`*`amount_d1`;

