-- Insert the latest fa (复权因子 factor for adjusted close) into table s_xts_adj_hst_sina_faL

INSERT INTO s_xts_adj_hst_sina_faL SELECT 
    a.ids, a.d, a.fa
FROM
    s_xts_adj_hst_sina a
        INNER JOIN
    (SELECT 
        ids, MAX(d) d
    FROM
        (SELECT 
        a.ids AS ids, a.d AS d, a.fa AS fa
    FROM
        s_xts_adj_hst_sina a
    INNER JOIN (SELECT 
        ids, MIN(d) d
    FROM
        s_xts_adj_hst_sina
    GROUP BY ids , CASE
        WHEN fa > 4000 THEN ROUND(fa)
        WHEN fa > 1000 THEN ROUND(fa, 1)
        WHEN fa > 100 THEN ROUND(fa, 2)
        ELSE fa
    END
    ORDER BY d DESC , ids) b ON a.ids = b.ids AND a.d = b.d) c
    GROUP BY ids) b ON a.ids = b.ids AND a.d = b.d
ORDER BY fa DESC ON DUPLICATE KEY UPDATE ids = a.ids, d = a.d, fa = a.fa;

-- Developing process 

-- 	-- create a table to hold the latest fa in table s_xts_adj_hst_sina
-- 	-- DROP TABLE `s_xts_adj_hst_sina_faL`;
-- 	CREATE TABLE `s_xts_adj_hst_sina_faL` (
-- 	  `ids` VARCHAR(6) NOT NULL COMMENT 'stock id 股票代码',
-- 	  `d` DATE NOT NULL DEFAULT '0000-00-00' COMMENT 'trade date 交易日期',
-- 	  `fa` DECIMAL(10,3) UNSIGNED NOT NULL DEFAULT '0.000' COMMENT 'fa 复权因子 (factor for adjusted close)',
-- 	  PRIMARY KEY (`ids`)
-- 	) ENGINE=INNODB DEFAULT CHARSET=UTF8;
-- 
-- 	-- insert faL into the table above
-- 	INSERT INTO s_xts_adj_hst_sina_faL SELECT a.ids, a.d, a.fa
-- 	FROM s_xts_adj_hst_sina a
-- 	INNER JOIN (
-- 		SELECT ids, MAX(d) d
-- 		FROM s_xts_adj_hst_sina
-- 		GROUP BY ids
-- 		ORDER BY d DESC, ids
-- 	) b ON a.ids = b.ids AND a.d = b.d ON DUPLICATE KEY UPDATE ids = a.ids, d = a.d, fa = a.fa;
-- 
-- 	SELECT * FROM s_xts_adj_hst_sina_faL ORDER BY d DESC, ids;
-- 
-- 	-- select distinct (ids, fa)
-- 	SELECT 
-- 		a.ids AS ids, a.d AS d, a.fa AS fa
-- 	FROM
-- 		s_xts_adj_hst_sina a
-- 			INNER JOIN
-- 		(SELECT 
-- 			ids, MIN(d) d
-- 		FROM
-- 			s_xts_adj_hst_sina
-- 		GROUP BY ids , fa
-- 		ORDER BY d DESC , ids) b ON a.ids = b.ids AND a.d = b.d;
-- 
-- 	-- in the above table, select the lasted fa
-- 	-- learning: group by ids , CASE WHEN fa > 4000 THEN ROUND(fa) WHEN fa > 1000 THEN ROUND(fa, 1) WHEN fa > 100 THEN ROUND(fa, 2) ELSE fa END
-- 	SELECT 
-- 		a.ids, a.d, a.fa
-- 	FROM
-- 		s_xts_adj_hst_sina a
-- 			INNER JOIN
-- 		(SELECT 
-- 			ids, MAX(d) d
-- 		FROM
-- 			(SELECT 
-- 			a.ids AS ids, a.d AS d, a.fa AS fa
-- 		FROM
-- 			s_xts_adj_hst_sina a
-- 		INNER JOIN (SELECT 
-- 			ids, MIN(d) d
-- 		FROM
-- 			s_xts_adj_hst_sina
-- 		GROUP BY ids , CASE
-- 			WHEN fa > 4000 THEN ROUND(fa)
-- 			WHEN fa > 1000 THEN ROUND(fa, 1)
-- 			WHEN fa > 100 THEN ROUND(fa, 2)
-- 			ELSE fa
-- 		END
-- 		ORDER BY d DESC , ids) b ON a.ids = b.ids AND a.d = b.d) c
-- 		GROUP BY ids) b ON a.ids = b.ids AND a.d = b.d
-- 	ORDER BY fa DESC;
-- 		
-- 	-- insert records selected in above query to table `s_xts_adj_hst_sina_faL`
-- 	INSERT INTO s_xts_adj_hst_sina_faL SELECT 
-- 		a.ids, a.d, a.fa
-- 	FROM
-- 		s_xts_adj_hst_sina a
-- 			INNER JOIN
-- 		(SELECT 
-- 			ids, MAX(d) d
-- 		FROM
-- 			(SELECT 
-- 			a.ids AS ids, a.d AS d, a.fa AS fa
-- 		FROM
-- 			s_xts_adj_hst_sina a
-- 		INNER JOIN (SELECT 
-- 			ids, MIN(d) d
-- 		FROM
-- 			s_xts_adj_hst_sina
-- 		GROUP BY ids , CASE
-- 			WHEN fa > 4000 THEN ROUND(fa)
-- 			WHEN fa > 1000 THEN ROUND(fa, 1)
-- 			WHEN fa > 100 THEN ROUND(fa, 2)
-- 			ELSE fa
-- 		END
-- 		ORDER BY d DESC , ids) b ON a.ids = b.ids AND a.d = b.d) c
-- 		GROUP BY ids) b ON a.ids = b.ids AND a.d = b.d
-- 	ORDER BY fa DESC ON DUPLICATE KEY UPDATE ids = a.ids, d = a.d, fa = a.fa;