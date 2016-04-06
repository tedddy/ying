-- start: 12:43 2015-10-24	create view for latest fa in s_xts_adj_hst_sina	end: 13:06 2015-10-25
-- E:\user_tony\Documents\GitHub\ying\view\view_s_xts_adj_hst_sina_faL.sql: L means latest
-- too slow!

-- DROP VIEW `s_xts_adj_hst_sina_faL_LeftJoin_slow`;
CREATE VIEW `s_xts_adj_hst_sina_faL_LeftJoin_slow` AS
SELECT 
    a.ids, a.dtt, a.fa
FROM
    s_xts_adj_hst_sina a
        LEFT JOIN
    s_xts_adj_hst_sina b ON a.ids = b.ids AND a.dtt < b.dtt
WHERE
    ISNULL(b.dtt);
    
SELECT * FROM `s_xts_adj_hst_sina_faL_LeftJoin_slow` order by dt desc;

SELECT * FROM s_xts_adj_hst_sina_faL;

-- much faster than the query above, although "Error Code: 1349. View's SELECT contains a subquery in the FROM clause"
SELECT a.ids, a.dt, a.fa
FROM s_xts_adj_hst_sina a
INNER JOIN (
    SELECT ids, MAX(dt) dt
    FROM s_xts_adj_hst_sina
    GROUP BY ids
) b ON a.ids = b.ids AND a.dt = b.dt;

-- Revise last query to make it a view by dropping subquery. It takes too much time.
SELECT 
    a.ids, a.dt, a.fa
FROM
    s_xts_adj_hst_sina a
        LEFT JOIN
    s_xts_adj_hst_sina b ON (a.ids = b.ids AND a.dt < b.dt)
WHERE
    ISNULL(b.ids);
    
SELECT 
    DISTINCT a.ids
FROM
    s_xts_adj_hst_sina a;
    
-- Revise last query to make it a view by dropping subquery. 
SELECT 
    a.ids, a.dt, a.fa
FROM
    s_xts_adj_hst_sina a
ORDER BY dt DESC
LIMIT 2769;
    


-- learning: DATEDIFF(a.dt, CURDATE()) < 5   
	SELECT a.ids, a.dt, a.fa
	FROM s_xts_adj_hst_sina a
	INNER JOIN (
		SELECT ids, MAX(d) d
		FROM s_xts_adj_hst_sina
		GROUP BY ids
	) b ON a.ids = b.ids AND a.dt = b.dt
	WHERE
		DATEDIFF(a.dt, CURDATE()) < 5;