
SELECT * FROM index_rt WHERE DATE(`dt`) = CURDATE() ORDER BY `dt` DESC, idi;

-- DELETE FROM index_rt where date(`dt`) = curdate();

SELECT * FROM index_rt;

SELECT * FROM ying.index_xts ORDER BY `dt` DESC, idi;

SELECT * FROM ying.index_xts ORDER BY idi, `dt` DESC;

SELECT * FROM index_rt ORDER BY `dt` DESC, amount desc, idi;

SELECT DISTINCT `dt` FROM index_rt ORDER BY `dt` DESC, idi;

-- DELETE FROM index_rt where date(dt) = curdate() ORDER BY `dt` DESC, amount desc, idi;
