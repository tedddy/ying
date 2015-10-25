-- start: 12:43 2015-10-24	create view for latest fa in s_xts_adj_hst_sina	end: 13:06 2015-10-25
-- E:\user_tony\Documents\GitHub\ying\view\view_s_xts_adj_hst_sina_faL.sql: L means latest
-- too slow!

DROP VIEW `s_xts_adj_hst_sina_faL_LeftJoin_slow`;
CREATE VIEW `s_xts_adj_hst_sina_faL_LeftJoin_slow` AS
SELECT 
    a.ids, a.d, a.fa
FROM
    s_xts_adj_hst_sina a
        LEFT JOIN
    s_xts_adj_hst_sina b ON a.ids = b.ids AND a.d < b.d
WHERE
    ISNULL(b.d);

SELECT * FROM s_xts_adj_hst_sina_faL;

-- much faster than the query above, although "Error Code: 1349. View's SELECT contains a subquery in the FROM clause"
SELECT a.ids, a.d, a.fa
FROM s_xts_adj_hst_sina a
INNER JOIN (
    SELECT ids, MAX(d) d
    FROM s_xts_adj_hst_sina
    GROUP BY ids
) b ON a.ids = b.ids AND a.d = b.d;
-- learning: DATEDIFF(a.d, CURDATE()) < 5   
	SELECT a.ids, a.d, a.fa
	FROM s_xts_adj_hst_sina a
	INNER JOIN (
		SELECT ids, MAX(d) d
		FROM s_xts_adj_hst_sina
		GROUP BY ids
	) b ON a.ids = b.ids AND a.d = b.d
	WHERE
		DATEDIFF(a.d, CURDATE()) < 5;