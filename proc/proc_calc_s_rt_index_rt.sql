DROP PROCEDURE `ying`.`calc_s_rt_index_rt`;

SELECT * FROM `ying`.`s_rt`;
CALL `ying`.`calc_s_rt_index_rt`;

-- DROP PROCEDURE `ying`.`calc_s_rt_index_rt`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying`.`calc_s_rt_index_rt`()
BEGIN
	DECLARE dt_latest DATETIME;
	DECLARE amount_000902 INT(10);
        INSERT IGNORE INTO `ying_calc`.`index_cons_stat_zd`
		(
		`idi`,
		`name_i`,
		`n`,
		`rate5`,
		`zd`,
		`zdW`,
		`zd382`,
		`zd382W`,
		`zd618`,
		`zd618W`,
		`zd1000`,
		`zd1000W`,
		`dt`
		)
	-- 指数成分股涨跌统计
		SELECT 
		`index_stock_info`.`idi` AS `idi`,
		`index_info`.`name_i`,
		SUM(IF((`s_rt`.`volume` > 0), 1, 0)) AS `n`,
		ROUND(SUM((`s_rt`.`chgrate5` * `index_stock_info`.`weight`)),2) AS `rate5`,
		SUM(IF((`s_rt`.`chgrate` > 0), 1, - 1)) AS `zd`,
		ROUND(SUM(IF((`s_rt`.`chgrate` > 0),
		`index_stock_info`.weight,
		- 1 * `index_stock_info`.weight)),2) AS `zdW`,
		SUM(IF(((`s_rt`.`chgrate` > 0)
		    AND (`s_rt`.`close` >= ROUND(((1 + 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
			2))),
		1,
		IF(((`s_rt`.`chgrate` < 0)
			AND (`s_rt`.`close` <= ROUND(((1 - 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
			    2))),
		    - 1,
		    0))) AS `zd382`,
		ROUND(SUM(IF(((`s_rt`.`chgrate` > 0)
		    AND (`s_rt`.`close` >= ROUND(((1 + 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
			2))),
		`index_stock_info`.weight,
		IF(((`s_rt`.`chgrate` < 0)
			AND (`s_rt`.`close` <= ROUND(((1 - 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
			    2))),
		    - 1 * `index_stock_info`.weight,
		    0))),2) AS `zd382W`,
		SUM(IF(((`s_rt`.`chgrate` > 0)
		    AND (`s_rt`.`close` >= ROUND(((1 + 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
			2))),
		1,
		IF(((`s_rt`.`chgrate` < 0)
			AND (`s_rt`.`close` <= ROUND(((1 - 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
			    2))),
		    1,
		    0))) AS `zd618`,
		ROUND(SUM(IF(((`s_rt`.`chgrate` > 0)
		    AND (`s_rt`.`close` >= ROUND(((1 + 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
			2))),
		`index_stock_info`.weight,
		IF(((`s_rt`.`chgrate` < 0)
			AND (`s_rt`.`close` <= ROUND(((1 - 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
			    2))),
		    - 1 * `index_stock_info`.weight,
		    0))),2) AS `zd618W`,
		SUM(IF(((`s_rt`.`chgrate` > 0)
		    AND (`s_rt`.`close` >= ROUND(((1 + 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
			2))),
		1,
		IF(((`s_rt`.`chgrate` < 0)
			AND (`s_rt`.`close` <= ROUND(((1 - 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
			    2))),
		    - 1,
		    0))) AS `zd1000`,
		ROUND( SUM(IF(((`s_rt`.`chgrate` > 0)
		    AND (`s_rt`.`close` >= ROUND(((1 + 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
			2))),
		`index_stock_info`.weight,
		IF(((`s_rt`.`chgrate` < 0)
			AND (`s_rt`.`close` <= ROUND(((1 - 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
			    2))),
		    - 1 * `index_stock_info`.weight,
		    0))),2) AS `zd1000W`,
		`s_rt`.`dt` AS `dt`
	FROM
	    (`s_rt`
	    LEFT JOIN `index_stock_info` ON ((`s_rt`.`ids` = `index_stock_info`.`ids`))
	    JOIN index_info ON (`index_stock_info`.`idi` = `index_info`.`idi`))
	WHERE
	    (`index_stock_info`.`idi` IS NOT NULL)
	GROUP BY `s_rt`.`dt` , `index_stock_info`.`idi`
	ORDER BY `s_rt`.`dt` DESC , `index_stock_info`.`idi`;

-- Insert records into `ying_calc`.`s_rt_hst`
	INSERT IGNORE INTO `ying_calc`.`s_rt_hst` (`ids`, `dt`, `close`, `amount`, `cjezb`, `volume`, `chgrate`, `WeiBi`, `chgrate5`, `LiangBi`) 	
	SELECT 
	    s.`ids`,
	    s.`dt`,
	    s.`close`,
	    s.`amount`,
	    IF(i.amount > 0,
		ROUND(10000 * s.amount / i.amount, 2),
		0),
	    s.`volume`,
	    s.`chgrate`,
	    s.`WeiBi`,
	    s.`chgrate5`,
	    s.`LiangBi`
	FROM
	    `ying`.`s_rt` s
		LEFT JOIN
	    `ying`.index_rt i ON (i.idi = '000902' AND i.dt = s.dt);
  
  -- Insert records into `ying_calc`.`index_rt_hst`
  
  INSERT IGNORE INTO `ying_calc`.`index_rt_hst` (`idi`, `close`, `amount`, `cjezb`, `volume`, `dt`) SELECT 
	    i.`idi`,
	    i.`close`,
	    i.`amount`,
	    IF(i_000902.amount > 0,
		ROUND(100 * i.amount / i_000902.amount, 2),
		0),
	    i.`volume`,
	    i.`dt`
	FROM
	    `ying`.`index_rt` i
		LEFT JOIN
	    `ying`.`index_rt` i_000902 ON (i.dt = i_000902.dt and i_000902.`idi` = '000902');
  
	-- select 
	SELECT 
	    *
	FROM
	    `ying_calc`.`index_cons_stat_zd`
	ORDER BY dt DESC , idi;
		-- TRUNCATE table `ying`.`s_rt`, to make the query above much faster.
		TRUNCATE `ying`.`s_rt`;
		TRUNCATE `ying`.`index_rt`;
        
        -- Update sma
	SELECT 
	    MAX(dt)
	INTO dt_latest FROM
	    `ying_calc`.`s_rt_hst`;
            
	CALL `ying_calc`.`s_rt_hst_sma_amount_loop`(date_sub(dt_latest, INTERVAL 1 MINUTE ), '2018-08-08 15:05:00');
END$$
DELIMITER ;

-- history

-- DELIMITER $$
-- CREATE DEFINER=`gxh`@`%` PROCEDURE `calc_s_rt_index_rt`()
-- BEGIN
-- 	DECLARE dt_latest DATETIME;
--         INSERT IGNORE INTO `ying_calc`.`index_cons_stat_zd`
-- 		(
-- 		`idi`,
-- 		`name_i`,
-- 		`n`,
-- 		`rate5`,
-- 		`zd`,
-- 		`zdW`,
-- 		`zd382`,
-- 		`zd382W`,
-- 		`zd618`,
-- 		`zd618W`,
-- 		`zd1000`,
-- 		`zd1000W`,
-- 		`dt`
-- 		)
-- 	-- 指数成分股涨跌统计
-- 		SELECT 
-- 		`index_stock_info`.`idi` AS `idi`,
-- 		`index_info`.`name_i`,
-- 		SUM(IF((`s_rt`.`volume` > 0), 1, 0)) AS `n`,
-- 		ROUND(SUM((`s_rt`.`chgrate5` * `index_stock_info`.`weight`)),2) AS `rate5`,
-- 		SUM(IF((`s_rt`.`chgrate` > 0), 1, - 1)) AS `zd`,
-- 		ROUND(SUM(IF((`s_rt`.`chgrate` > 0),
-- 		`index_stock_info`.weight,
-- 		- 1 * `index_stock_info`.weight)),2) AS `zdW`,
-- 		SUM(IF(((`s_rt`.`chgrate` > 0)
-- 		    AND (`s_rt`.`close` >= ROUND(((1 + 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
-- 			2))),
-- 		1,
-- 		IF(((`s_rt`.`chgrate` < 0)
-- 			AND (`s_rt`.`close` <= ROUND(((1 - 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
-- 			    2))),
-- 		    - 1,
-- 		    0))) AS `zd382`,
-- 		ROUND(SUM(IF(((`s_rt`.`chgrate` > 0)
-- 		    AND (`s_rt`.`close` >= ROUND(((1 + 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
-- 			2))),
-- 		`index_stock_info`.weight,
-- 		IF(((`s_rt`.`chgrate` < 0)
-- 			AND (`s_rt`.`close` <= ROUND(((1 - 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
-- 			    2))),
-- 		    - 1 * `index_stock_info`.weight,
-- 		    0))),2) AS `zd382W`,
-- 		SUM(IF(((`s_rt`.`chgrate` > 0)
-- 		    AND (`s_rt`.`close` >= ROUND(((1 + 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
-- 			2))),
-- 		1,
-- 		IF(((`s_rt`.`chgrate` < 0)
-- 			AND (`s_rt`.`close` <= ROUND(((1 - 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
-- 			    2))),
-- 		    1,
-- 		    0))) AS `zd618`,
-- 		ROUND(SUM(IF(((`s_rt`.`chgrate` > 0)
-- 		    AND (`s_rt`.`close` >= ROUND(((1 + 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
-- 			2))),
-- 		`index_stock_info`.weight,
-- 		IF(((`s_rt`.`chgrate` < 0)
-- 			AND (`s_rt`.`close` <= ROUND(((1 - 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
-- 			    2))),
-- 		    - 1 * `index_stock_info`.weight,
-- 		    0))),2) AS `zd618W`,
-- 		SUM(IF(((`s_rt`.`chgrate` > 0)
-- 		    AND (`s_rt`.`close` >= ROUND(((1 + 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
-- 			2))),
-- 		1,
-- 		IF(((`s_rt`.`chgrate` < 0)
-- 			AND (`s_rt`.`close` <= ROUND(((1 - 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
-- 			    2))),
-- 		    - 1,
-- 		    0))) AS `zd1000`,
-- 		ROUND( SUM(IF(((`s_rt`.`chgrate` > 0)
-- 		    AND (`s_rt`.`close` >= ROUND(((1 + 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
-- 			2))),
-- 		`index_stock_info`.weight,
-- 		IF(((`s_rt`.`chgrate` < 0)
-- 			AND (`s_rt`.`close` <= ROUND(((1 - 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
-- 			    2))),
-- 		    - 1 * `index_stock_info`.weight,
-- 		    0))),2) AS `zd1000W`,
-- 		`s_rt`.`dt` AS `dt`
-- 	FROM
-- 	    (`s_rt`
-- 	    LEFT JOIN `index_stock_info` ON ((`s_rt`.`ids` = `index_stock_info`.`ids`))
-- 	    JOIN index_info ON (`index_stock_info`.`idi` = `index_info`.`idi`))
-- 	WHERE
-- 	    (`index_stock_info`.`idi` IS NOT NULL)
-- 	GROUP BY `s_rt`.`dt` , `index_stock_info`.`idi`
-- 	ORDER BY `s_rt`.`dt` DESC , `index_stock_info`.`idi`;
-- 
-- -- Insert records into `ying_calc`.`s_rt_hst`
-- 	INSERT IGNORE INTO `ying_calc`.`s_rt_hst` (`ids`, `dt`, `close`, `amount`, `cjezb`, `volume`, `chgrate`, `WeiBi`, `chgrate5`, `LiangBi`) 	
-- 	SELECT 
-- 	    s.`ids`,
-- 	    s.`dt`,
-- 	    s.`close`,
-- 	    s.`amount`,
-- 	    IF(i.amount > 0,
-- 		ROUND(10000 * s.amount / i.amount, 2),
-- 		0),
-- 	    s.`volume`,
-- 	    s.`chgrate`,
-- 	    s.`WeiBi`,
-- 	    s.`chgrate5`,
-- 	    s.`LiangBi`
-- 	FROM
-- 	    `ying`.`s_rt` s
-- 		LEFT JOIN
-- 	    `ying`.index_rt i ON (i.idi = '000902' AND i.dt = s.dt);
-- 	-- select 
-- 	SELECT 
-- 	    *
-- 	FROM
-- 	    `ying_calc`.`index_cons_stat_zd`
-- 	ORDER BY dt DESC , idi;
-- 	-- TRUNCATE table `ying`.`s_rt`, to make the query above much faster.
-- 	TRUNCATE `ying`.`s_rt`;
--         -- Update sma
--         -- SELECT max(dt) INTO dt_latest FROM `ying_calc`.`s_rt_hst`;
--         -- CALL `ying_calc`.`s_rt_hst-sma-amount-loop`(date_sub(dt_latest, INTERVAL 1 MINUTE ), '2018-08-08 15:05:00');
-- END$$
-- DELIMITER ;


-- research: update table with records from `ying_calc`.`s_rt_hst` instead of `ying`.`s_rt`

-- DELETE FROM `ying_calc`.`index_cons_stat_zd` where date(dt) = curdate() order by dt desc;

-- INSERT IGNORE INTO `ying_calc`.`index_cons_stat_zd`
-- (`idi`,
-- `name_i`,
-- `n`,
-- `rate5`,
-- `zd`,
-- `zdW`,
-- `zd382`,
-- `zd382W`,
-- `zd618`,
-- `zd618W`,
-- `zd1000`,
-- `zd1000W`,
-- `dt`)
-- 	SELECT 
--     `index_stock_info`.`idi` AS `idi`,
--     `index_info`.`name_i`,
--     SUM(IF((`ying_calc`.`s_rt_hst`.`volume` > 0), 1, 0)) AS `n`,
--     ROUND(SUM((`ying_calc`.`s_rt_hst`.`chgrate5` * `index_stock_info`.`weight`)),2) AS `rate5`,
--     SUM(IF((`ying_calc`.`s_rt_hst`.`chgrate` > 0), 1, - 1)) AS `zd`,
--     ROUND(SUM(IF((`ying_calc`.`s_rt_hst`.`chgrate` > 0),
--         `index_stock_info`.weight,
--         - 1 * `index_stock_info`.weight)),2) AS `zdW`,
--     SUM(IF(((`ying_calc`.`s_rt_hst`.`chgrate` > 0)
--             AND (`ying_calc`.`s_rt_hst`.`close` >= ROUND(((1 + 0.0382) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
--                 2))),
--         1,
--         IF(((`ying_calc`.`s_rt_hst`.`chgrate` < 0)
--                 AND (`ying_calc`.`s_rt_hst`.`close` <= ROUND(((1 - 0.0382) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
--                     2))),
--             - 1,
--             0))) AS `zd382`,
--    ROUND(SUM(IF(((`ying_calc`.`s_rt_hst`.`chgrate` > 0)
--             AND (`ying_calc`.`s_rt_hst`.`close` >= ROUND(((1 + 0.0382) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
--                 2))),
--         `index_stock_info`.weight,
--         IF(((`ying_calc`.`s_rt_hst`.`chgrate` < 0)
--                 AND (`ying_calc`.`s_rt_hst`.`close` <= ROUND(((1 - 0.0382) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
--                     2))),
--             - 1 * `index_stock_info`.weight,
--             0))),2) AS `zd382W`,
--     SUM(IF(((`ying_calc`.`s_rt_hst`.`chgrate` > 0)
--             AND (`ying_calc`.`s_rt_hst`.`close` >= ROUND(((1 + 0.0618) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
--                 2))),
--         1,
--         IF(((`ying_calc`.`s_rt_hst`.`chgrate` < 0)
--                 AND (`ying_calc`.`s_rt_hst`.`close` <= ROUND(((1 - 0.0618) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
--                     2))),
--             1,
--             0))) AS `zd618`,
--     ROUND(SUM(IF(((`ying_calc`.`s_rt_hst`.`chgrate` > 0)
--             AND (`ying_calc`.`s_rt_hst`.`close` >= ROUND(((1 + 0.0618) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
--                 2))),
--         `index_stock_info`.weight,
--         IF(((`ying_calc`.`s_rt_hst`.`chgrate` < 0)
--                 AND (`ying_calc`.`s_rt_hst`.`close` <= ROUND(((1 - 0.0618) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
--                     2))),
--             - 1 * `index_stock_info`.weight,
--             0))),2) AS `zd618W`,
--     SUM(IF(((`ying_calc`.`s_rt_hst`.`chgrate` > 0)
--             AND (`ying_calc`.`s_rt_hst`.`close` >= ROUND(((1 + 0.1) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
--                 2))),
--         1,
--         IF(((`ying_calc`.`s_rt_hst`.`chgrate` < 0)
--                 AND (`ying_calc`.`s_rt_hst`.`close` <= ROUND(((1 - 0.1) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
--                     2))),
--             - 1,
--             0))) AS `zd1000`,
--    ROUND( SUM(IF(((`ying_calc`.`s_rt_hst`.`chgrate` > 0)
--             AND (`ying_calc`.`s_rt_hst`.`close` >= ROUND(((1 + 0.1) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
--                 2))),
--         `index_stock_info`.weight,
--         IF(((`ying_calc`.`s_rt_hst`.`chgrate` < 0)
--                 AND (`ying_calc`.`s_rt_hst`.`close` <= ROUND(((1 - 0.1) * ((100 * `ying_calc`.`s_rt_hst`.`close`) / (100 + `ying_calc`.`s_rt_hst`.`chgrate`))),
--                     2))),
--             - 1 * `index_stock_info`.weight,
--             0))),2) AS `zd1000W`,
--     `ying_calc`.`s_rt_hst`.`dt` AS `dt`
-- FROM
--     (`ying_calc`.`s_rt_hst`
--     LEFT JOIN `index_stock_info` ON ((`ying_calc`.`s_rt_hst`.`ids` = `index_stock_info`.`ids`) AND DATE(`ying_calc`.`s_rt_hst`.dt) = DATE_SUB(CURDATE(), INTERVAL 1 DAY))
--     JOIN index_info ON (`index_stock_info`.`idi` = `index_info`.`idi`))
-- WHERE
--     (`index_stock_info`.`idi` IS NOT NULL)
-- GROUP BY `ying_calc`.`s_rt_hst`.`dt` , `index_stock_info`.`idi`
-- ORDER BY `ying_calc`.`s_rt_hst`.`dt` DESC , `index_stock_info`.`idi`;
-- 
-- 
-- -- tedd improved: too many fields. z + d, zfg + dfg, zg + dz, zt + dt, 都是相等的。所以可以加列z + d，z-d, zfg-dfg, ..., zt-dt, 去掉z, d, ..., zt, dt, 
-- 	SELECT 
--     `index_stock_info`.`idi` AS `idi`,
--     `index_info`.`name_i`,
--     SUM((`s_rt`.`chgrate5` * `index_stock_info`.`weight`)) AS `rate5`,
--     SUM(IF((`s_rt`.`chgrate` > 0), 1, - 1)) AS `zd`,
--     SUM(IF((`s_rt`.`chgrate` > 0),
--         `index_stock_info`.weight,
--         - 1 * `index_stock_info`.weight)) AS `zdW`,
--     SUM(IF(((`s_rt`.`chgrate` > 0)
--             AND (`s_rt`.`close` >= ROUND(((1 + 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                 2))),
--         1,
--         IF(((`s_rt`.`chgrate` < 0)
--                 AND (`s_rt`.`close` <= ROUND(((1 - 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                     2))),
--             - 1,
--             0))) AS `zd382`,
--     SUM(IF(((`s_rt`.`chgrate` > 0)
--             AND (`s_rt`.`close` >= ROUND(((1 + 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                 2))),
--         `index_stock_info`.weight,
--         IF(((`s_rt`.`chgrate` < 0)
--                 AND (`s_rt`.`close` <= ROUND(((1 - 0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                     2))),
--             - 1 * `index_stock_info`.weight,
--             0))) AS `zd382W`,
--     SUM(IF(((`s_rt`.`chgrate` > 0)
--             AND (`s_rt`.`close` >= ROUND(((1 + 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                 2))),
--         1,
--         IF(((`s_rt`.`chgrate` < 0)
--                 AND (`s_rt`.`close` <= ROUND(((1 - 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                     2))),
--             1,
--             0))) AS `zd618`,
--     SUM(IF(((`s_rt`.`chgrate` > 0)
--             AND (`s_rt`.`close` >= ROUND(((1 + 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                 2))),
--         `index_stock_info`.weight,
--         IF(((`s_rt`.`chgrate` < 0)
--                 AND (`s_rt`.`close` <= ROUND(((1 - 0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                     2))),
--             - 1 * `index_stock_info`.weight,
--             0))) AS `zd618W`,
--     SUM(IF(((`s_rt`.`chgrate` > 0)
--             AND (`s_rt`.`close` >= ROUND(((1 + 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                 2))),
--         1,
--         IF(((`s_rt`.`chgrate` < 0)
--                 AND (`s_rt`.`close` <= ROUND(((1 - 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                     2))),
--             - 1,
--             0))) AS `zd1000`,
--     SUM(IF(((`s_rt`.`chgrate` > 0)
--             AND (`s_rt`.`close` >= ROUND(((1 + 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                 2))),
--         `index_stock_info`.weight,
--         IF(((`s_rt`.`chgrate` < 0)
--                 AND (`s_rt`.`close` <= ROUND(((1 - 0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                     2))),
--             - 1 * `index_stock_info`.weight,
--             0))) AS `zd1000W`,
--     `s_rt`.`dt` AS `dt`
-- FROM
--     (`s_rt`
--     LEFT JOIN `index_stock_info` ON ((`s_rt`.`ids` = `index_stock_info`.`ids`))
--     JOIN index_info ON (`index_stock_info`.`idi` = `index_info`.`idi`))
-- WHERE
--     (`index_stock_info`.`idi` IS NOT NULL)
-- GROUP BY `s_rt`.`dt` , `index_stock_info`.`idi`
-- ORDER BY `s_rt`.`dt` DESC , `index_stock_info`.`idi`;
-- 
-- -- tedd improve: too many fields. z + d, zfg + dfg, zg + dz, zt + dt, 都是相等的。所以可以加列z + d，z-d, zfg-dfg, ..., zt-dt, 去掉z, d, ..., zt, dt, 
--     SELECT 
--     `index_stock_info`.`idi` AS `idi`,
--     `index_info`.`name_i`,
--     SUM((`s_rt`.`chgrate5` * `index_stock_info`.`weight`)) AS `rate5`,
--     SUM(IF((`s_rt`.`chgrate` > 0), 1, 0)) AS `z`,
--     SUM(IF((`s_rt`.`chgrate` > 0),
--         `index_stock_info`.weight,
--         0)) AS `zw`,
--     SUM(IF((`s_rt`.`chgrate` < 0), 1, 0)) AS `d`,
--     SUM(IF((`s_rt`.`chgrate` < 0),
--         `index_stock_info`.weight,
--         0)) AS `dw`,
--     SUM(IF(((`s_rt`.`chgrate` > 0)
--             AND (`s_rt`.`close` >= ROUND(((1+0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                 2))),
--         1,
--         0)) AS `zfg`,
--     SUM(IF(((`s_rt`.`chgrate` > 0)
--             AND (`s_rt`.`close` >= ROUND(((1+0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                 2))),
--         `index_stock_info`.weight,
--         0)) AS `zfgw`,
--     SUM(IF(((`s_rt`.`chgrate` < 0)
--             AND (`s_rt`.`close` <= ROUND(((1-0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                 2))),
--         1,
--         0)) AS `dfg`,
--     SUM(IF(((`s_rt`.`chgrate` < 0)
--             AND (`s_rt`.`close` <= ROUND(((1-0.0382) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                 2))),
--         `index_stock_info`.weight,
--         0)) AS `dfgw`,
--     SUM(IF(((`s_rt`.`chgrate` > 0)
--             AND (`s_rt`.`close` >= ROUND(((1+0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                 2))),
--         1,
--         0)) AS `zg`,
--     SUM(IF(((`s_rt`.`chgrate` > 0)
--             AND (`s_rt`.`close` >= ROUND(((1+0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                 2))),
--         `index_stock_info`.weight,
--         0)) AS `zgw`,
--     SUM(IF(((`s_rt`.`chgrate` < 0)
--             AND (`s_rt`.`close` <= ROUND(((1-0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                 2))),
--         1,
--         0)) AS `dg`,
--     SUM(IF(((`s_rt`.`chgrate` < 0)
--             AND (`s_rt`.`close` <= ROUND(((1-0.0618) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                 2))),
--         `index_stock_info`.weight,
--         0)) AS `dgw`,
--     SUM(IF(((`s_rt`.`chgrate` > 0)
--             AND (`s_rt`.`close` >= ROUND(((1+0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                 2))),
--         1,
--         0)) AS `zt`,
--     SUM(IF(((`s_rt`.`chgrate` > 0)
--             AND (`s_rt`.`close` >= ROUND(((1+0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                 2))),
--         `index_stock_info`.weight,
--         0)) AS `ztw`,
--     SUM(IF(((`s_rt`.`chgrate` < 0)
--             AND (`s_rt`.`close` <= ROUND(((1-0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                 2))),
--         1,
--         0)) AS `d10`,
--     SUM(IF(((`s_rt`.`chgrate` < 0)
--             AND (`s_rt`.`close` <= ROUND(((1-0.1) * ((100 * `s_rt`.`close`) / (100 + `s_rt`.`chgrate`))),
--                 2))),
--         `index_stock_info`.weight,
--         0)) AS `d10w`,
--     `s_rt`.`dt` AS `dt`
-- FROM
--     (`s_rt`
--     LEFT JOIN `index_stock_info` ON ((`s_rt`.`ids` = `index_stock_info`.`ids`))
--     JOIN index_info ON (`index_stock_info`.`idi` = `index_info`.`idi`))
-- WHERE
--     (`index_stock_info`.`idi` IS NOT NULL)
-- GROUP BY `s_rt`.`dt` , `index_stock_info`.`idi`
-- ORDER BY `s_rt`.`dt` DESC , `index_stock_info`.`idi`;
-- 
-- -- version 1
-- DELIMITER $$
-- CREATE DEFINER=`gxh`@`%` PROCEDURE `calc_s_rt_index_rt`()
-- BEGIN
-- INSERT IGNORE INTO `ying_calc`.`index_cons_stat_zd`
-- (`idi`,
-- `name_i`,
-- `rate5`,
-- `zd`,
-- `zdW`,
-- `zd382`,
-- `zd382W`,
-- `zd618`,
-- `zd618W`,
-- `zd1000`,
-- `zd1000W`,
-- `dt`)
-- -- 所有指数涨跌统计
-- SELECT summary.idi AS '指数', info.name_i  AS '指数名称', ROUND(rate5,2) AS '五分钟涨速', z - d AS '涨跌数差', ROUND(zW - dW,2) AS '涨跌数差加权', zfg - dfg AS '涨跌超3.82', ROUND(zfgW - dfgW,2) AS '涨跌超3.82加权', zg - dg AS '涨跌超6.18', ROUND(zgW - dgW,2) AS '涨跌超6.18加权', zt - d10 AS '涨跌停差', ROUND(ztW - d10W,2) AS '涨跌停差加权', dt FROM `ying`.`index_cons_stat_zd` summary JOIN index_info info ON (summary.idi = info.idi) ORDER BY summary.dt DESC, summary.idi;
-- END$$
-- DELIMITER ;
-- 