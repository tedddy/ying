
SELECT * FROM index_rt where date(dt) = curdate();

-- DELETE FROM index_rt where date(dt) = curdate();

SELECT * FROM index_rt;

SELECT * FROM index_rt ORDER BY dt desc, idi;

SELECT DISTINCT dt FROM index_rt ORDER BY dt desc, idi;