-- 更新moving average
-- 参考 procedure `hs_index_000001_m_all_by_id`， `ying`.`hs_index_000001_m5_by_id`
	-- 选择特定股票的数据, 插入表 hs_s_rt_EM_test

-- data for testing sproc	
	INSERT ignore INTO hs_s_rt_EM_test (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot) SELECT code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot FROM `ying`.`hs_s_rt_EM` WHERE code IN ('601318') and date <= curdate() - 1; 
	INSERT ignore INTO hs_s_rt_EM_test (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot) SELECT code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot FROM `ying`.`hs_s_rt_EM` WHERE code IN ('600030') and date <= curdate() - 1; 
	INSERT ignore INTO hs_s_rt_EM_test (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot) SELECT code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot FROM `ying`.`hs_s_rt_EM` WHERE code IN ('600000') and date <= curdate() - 1; 
    
    INSERT ignore INTO hs_s_rt_EM_test (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot) SELECT code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot FROM `ying`.`hs_s_rt_EM` WHERE code IN ('601318') and date > curdate() - 1; 
	INSERT ignore INTO hs_s_rt_EM_test (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot) SELECT code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot FROM `ying`.`hs_s_rt_EM` WHERE code IN ('600030') and date > curdate() - 1; 
	INSERT ignore INTO hs_s_rt_EM_test (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot) SELECT code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot FROM `ying`.`hs_s_rt_EM` WHERE code IN ('600000') and date > curdate() - 1; 
	INSERT ignore INTO hs_s_rt_EM_test (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot) SELECT code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot FROM `ying`.`hs_s_rt_EM` WHERE code IN ('600190') and date < '2015-10-09'; 
    INSERT ignore INTO hs_s_rt_EM_test (code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot) SELECT code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot FROM `ying`.`hs_s_rt_EM` WHERE code IN ('603077') and date < '2015-10-09'; 
    
    SELECT code, close, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, date, time, TimeSlot FROM `ying`.`hs_s_rt_EM` WHERE code IN ('603077') and date < '2015-10-09';

-- 更新row number （rownum）
SET @x = 0;     
SELECT @x:=IFNULL(@x,0)+1 AS r_no,id, TimeSlot FROM `ying`.`hs_s_rt_EM_test`;

-- 对`ying`.`hs_s_rt_EM_test`的所有行，按每只股票分别生成行号。        
CALL update_rownum();
DROP PROCEDURE update_rownum;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `update_rownum`()
BEGIN        
			DECLARE code_cur varchar(6);
			DECLARE done INT DEFAULT FALSE;
			DECLARE cur_code CURSOR FOR
				 SELECT DISTINCT `code` FROM `ying`.`hs_s_rt_EM_test`;	 
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
			OPEN cur_code;
			LOOP_code: LOOP
				FETCH cur_code INTO code_cur;
				IF NOT done THEN
					SET @x = 0;
			UPDATE `ying`.`hs_s_rt_EM_test` a
			INNER JOIN
			(SELECT 
				@x:=IFNULL(@x, 0) + 1 AS idsub, id, TimeSlot
			FROM
				`ying`.`hs_s_rt_EM_test`
			WHERE
				`hs_s_rt_EM_test`.code = code_cur
			ORDER BY TimeSlot) b ON a.id = b.id 
			SET a.idsub = b.idsub where a.idsub = 0;
			ELSE
				LEAVE LOOP_code;
			END IF;
			END LOOP LOOP_code;
			CLOSE cur_code;					
		END$$
DELIMITER ;


CALL `hs_s_rt_EM_test_m_all_multiple_stocks`();
DROP PROCEDURE `hs_s_rt_EM_test_m_all_multiple_stocks`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_rt_EM_test_m_all_multiple_stocks`()
BEGIN        
	DECLARE code_cur varchar(6);
	DECLARE done INT DEFAULT FALSE;
	DECLARE cur_code CURSOR FOR
		 SELECT DISTINCT code FROM `ying`.`hs_s_rt_EM_test`
		 ORDER BY code;   
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
	
	OPEN cur_code;
	LOOP_code: LOOP
		FETCH cur_code INTO code_cur;
		IF NOT done THEN
		CALL `hs_s_rt_EM_test_m_all`(code_cur);
			ELSE
				LEAVE LOOP_code;
			END IF;
	END LOOP LOOP_code;
	CLOSE cur_code;		         
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_rt_EM_test_m_all`(IN idStock varchar(6))
BEGIN

			DECLARE mv5 DOUBLE;
			DECLARE mv10 DOUBLE;
			DECLARE mv20 DOUBLE;
			DECLARE mv30 DOUBLE;
			DECLARE mv60 DOUBLE;
			DECLARE mv120 DOUBLE;
			DECLARE t INT;
			DECLARE done INT DEFAULT FALSE;
			DECLARE cur_t CURSOR FOR
				 SELECT DISTINCT idsub FROM `ying`.`hs_s_rt_EM_test` where code = idStock
				 ORDER BY idsub;	    
			DECLARE cur_mv5 CURSOR FOR
				 SELECT AVG(close) FROM `ying`.`hs_s_rt_EM_test`
				 WHERE idsub >= (t - (5-1)) AND idsub <= t and code = idStock;	    
			DECLARE cur_mv10 CURSOR FOR
				 SELECT AVG(close) FROM `ying`.`hs_s_rt_EM_test` 
				 WHERE idsub >= (t - (10-1)) AND idsub <= t and code = idStock; 
			DECLARE cur_mv20 CURSOR FOR
				 SELECT AVG(close) FROM `ying`.`hs_s_rt_EM_test` 
				 WHERE idsub >= (t - (20-1)) AND idsub <= t and code = idStock;	    
			DECLARE cur_mv30 CURSOR FOR
				 SELECT AVG(close) FROM `ying`.`hs_s_rt_EM_test` 
				 WHERE idsub >= (t - (30-1)) AND idsub <= t and code = idStock; 
			DECLARE cur_mv60 CURSOR FOR
				 SELECT AVG(close) FROM `ying`.`hs_s_rt_EM_test` 
				 WHERE idsub >= (t - (60-1)) AND idsub <= t and code = idStock;	    
			DECLARE cur_mv120 CURSOR FOR
				 SELECT AVG(close) FROM `ying`.`hs_s_rt_EM_test` 
				 WHERE idsub >= (t - (120-1)) AND idsub <= t and code = idStock;
				 -- Here you define the interval of your MV.
				 -- If you want a mv_length-day MV, then the interval is between t-(mv_length - 1)s and t         
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
			
			OPEN cur_t;
			LOOP_ID: LOOP
				FETCH cur_t INTO t;
				IF NOT done THEN
					OPEN cur_mv5;
					FETCH cur_mv5 INTO mv5;
					CLOSE cur_mv5;
					UPDATE `ying`.`hs_s_rt_EM_test`
						SET m5 = mv5
						WHERE idsub=t and code = idStock;
					OPEN cur_mv10;
					FETCH cur_mv10 INTO mv10;
					CLOSE cur_mv10;
					UPDATE `ying`.`hs_s_rt_EM_test`
						SET m10 = mv10
						WHERE idsub=t and code = idStock;
					OPEN cur_mv20;
					FETCH cur_mv20 INTO mv20;
					CLOSE cur_mv20;
					UPDATE `ying`.`hs_s_rt_EM_test`
						SET m20 = mv20
						WHERE idsub=t and code = idStock;
					OPEN cur_mv30;
					FETCH cur_mv30 INTO mv30;
					CLOSE cur_mv30;
					UPDATE `ying`.`hs_s_rt_EM_test`
						SET m30 = mv30
						WHERE idsub=t and code = idStock;
					OPEN cur_mv60;
					FETCH cur_mv60 INTO mv60;
					CLOSE cur_mv60;
					UPDATE `ying`.`hs_s_rt_EM_test`
						SET m60 = mv60
						WHERE idsub=t and code = idStock;
					OPEN cur_mv120;
					FETCH cur_mv120 INTO mv120;
					CLOSE cur_mv120;
					UPDATE `ying`.`hs_s_rt_EM_test`
						SET m120 = mv120
						WHERE idsub=t and code = idStock;
				ELSE
					LEAVE LOOP_ID;
				END IF;
			END LOOP LOOP_ID;
			CLOSE cur_t;
		END$$
DELIMITER ;


-- backup 151009
CALL `hs_s_rt_EM_test_m_all`('601318');
DROP PROCEDURE `hs_s_rt_EM_test_m_all`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_rt_EM_test_m_all`(IN idStock varchar(6))
BEGIN

			DECLARE mv5 DOUBLE;
			DECLARE mv10 DOUBLE;
			DECLARE mv20 DOUBLE;
			DECLARE mv30 DOUBLE;
			DECLARE mv60 DOUBLE;
			DECLARE mv120 DOUBLE;
			DECLARE t INT;
			DECLARE done INT DEFAULT FALSE;
			DECLARE cur_t CURSOR FOR
				 SELECT DISTINCT idsub FROM `ying`.`hs_s_rt_EM_test` where code = idStock
				 ORDER BY idsub;	    
			DECLARE cur_mv5 CURSOR FOR
				 SELECT AVG(close) FROM `ying`.`hs_s_rt_EM_test`
				 WHERE idsub >= (t - (5-1)) AND idsub <= t and code = idStock;	    
			DECLARE cur_mv10 CURSOR FOR
				 SELECT AVG(close) FROM `ying`.`hs_s_rt_EM_test` 
				 WHERE idsub >= (t - (10-1)) AND idsub <= t and code = idStock; 
			DECLARE cur_mv20 CURSOR FOR
				 SELECT AVG(close) FROM `ying`.`hs_s_rt_EM_test` 
				 WHERE idsub >= (t - (20-1)) AND idsub <= t and code = idStock;	    
			DECLARE cur_mv30 CURSOR FOR
				 SELECT AVG(close) FROM `ying`.`hs_s_rt_EM_test` 
				 WHERE idsub >= (t - (30-1)) AND idsub <= t and code = idStock; 
			DECLARE cur_mv60 CURSOR FOR
				 SELECT AVG(close) FROM `ying`.`hs_s_rt_EM_test` 
				 WHERE idsub >= (t - (60-1)) AND idsub <= t and code = idStock;	    
			DECLARE cur_mv120 CURSOR FOR
				 SELECT AVG(close) FROM `ying`.`hs_s_rt_EM_test` 
				 WHERE idsub >= (t - (120-1)) AND idsub <= t and code = idStock;
				 -- Here you define the interval of your MV.
				 -- If you want a mv_length-day MV, then the interval is between t-(mv_length - 1)s and t         
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
			
			OPEN cur_t;
			LOOP_ID: LOOP
				FETCH cur_t INTO t;
				IF NOT done THEN
					OPEN cur_mv5;
					FETCH cur_mv5 INTO mv5;
					CLOSE cur_mv5;
					UPDATE `ying`.`hs_s_rt_EM_test`
						SET m5 = mv5
						WHERE idsub=t and code = idStock;
					OPEN cur_mv10;
					FETCH cur_mv10 INTO mv10;
					CLOSE cur_mv10;
					UPDATE `ying`.`hs_s_rt_EM_test`
						SET m10 = mv10
						WHERE idsub=t and code = idStock;
					OPEN cur_mv20;
					FETCH cur_mv20 INTO mv20;
					CLOSE cur_mv20;
					UPDATE `ying`.`hs_s_rt_EM_test`
						SET m20 = mv20
						WHERE idsub=t and code = idStock;
					OPEN cur_mv30;
					FETCH cur_mv30 INTO mv30;
					CLOSE cur_mv30;
					UPDATE `ying`.`hs_s_rt_EM_test`
						SET m30 = mv30
						WHERE idsub=t and code = idStock;
					OPEN cur_mv60;
					FETCH cur_mv60 INTO mv60;
					CLOSE cur_mv60;
					UPDATE `ying`.`hs_s_rt_EM_test`
						SET m60 = mv60
						WHERE idsub=t and code = idStock;
					OPEN cur_mv120;
					FETCH cur_mv120 INTO mv120;
					CLOSE cur_mv120;
					UPDATE `ying`.`hs_s_rt_EM_test`
						SET m120 = mv120
						WHERE idsub=t and code = idStock;
				ELSE
					LEAVE LOOP_ID;
				END IF;
			END LOOP LOOP_ID;
			CLOSE cur_t;
		END$$
DELIMITER ;


-- 在表ying.hs_s_rt_EM中选择创业板的数据    
SELECT * FROM hs_s_fZZGF_rt_EM_view;
DROP VIEW hs_s_fCYB_rt_EM_view;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_fCYB_rt_EM_view` AS
    SELECT 
        `a`.`id` AS `id`,
        `a`.`code` AS `code`,
        `a`.`close` AS `close`,
        `a`.`amount` AS `amount`,
        `a`.`volume` AS `volume`,
        `a`.`chgrate` AS `chgrate`,
        `a`.`WeiBi` AS `WeiBi`,
        `a`.`chgrate5` AS `chgrate5`,
        `a`.`LiangBi` AS `LiangBi`,
        `a`.`date` AS `date`,
        `a`.`time` AS `time`,
        `a`.`TimeSlot` AS `TimeSlot`
    FROM
        (`hs_s` `b`
        LEFT JOIN `hs_s_rt_EM` `a` ON (((`a`.`code` = `b`.`code`)
            AND (`b`.`fCYB` = 1))))
    WHERE
        (`a`.`id` IS NOT NULL)
    ORDER BY `a`.`TimeSlot` DESC;

-- 在表ying.hs_s_rt_EM中选择沪深300的数据    
SELECT * FROM hs_s_hs300_rt_EM_view;
DROP VIEW hs_s_hs300_rt_EM_view;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_rt_EM_view` AS
    SELECT 
        `a`.`id` AS `id`,
        `a`.`code` AS `code`,
        `a`.`close` AS `close`,
        `a`.`amount` AS `amount`,
        `a`.`volume` AS `volume`,
        `a`.`chgrate` AS `chgrate`,
        `a`.`WeiBi` AS `WeiBi`,
        `a`.`chgrate5` AS `chgrate5`,
        `a`.`LiangBi` AS `LiangBi`,
        `a`.`date` AS `date`,
        `a`.`time` AS `time`,
        `a`.`TimeSlot` AS `TimeSlot`
    FROM
        (`hs_s` `b`
        LEFT JOIN `hs_s_rt_EM` `a` ON (((`a`.`code` = `b`.`code`)
            AND (`b`.`f300` = 1))))
    WHERE
        (`a`.`id` IS NOT NULL)
    ORDER BY `a`.`TimeSlot` DESC;

-- 在表ying.hs_s_rt_EM中选择中证500的数据    
SELECT * FROM hs_s_zz500_rt_EM_view;
-- DROP VIEW hs_s_zz500_rt_EM_view;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_zz500_rt_EM_view` AS
    SELECT 
        `a`.`id` AS `id`,
        `a`.`code` AS `code`,
        `a`.`close` AS `close`,
        `a`.`amount` AS `amount`,
        `a`.`volume` AS `volume`,
        `a`.`chgrate` AS `chgrate`,
        `a`.`WeiBi` AS `WeiBi`,
        `a`.`chgrate5` AS `chgrate5`,
        `a`.`LiangBi` AS `LiangBi`,
        `a`.`date` AS `date`,
        `a`.`time` AS `time`,
        `a`.`TimeSlot` AS `TimeSlot`
    FROM
        (`hs_s` `b`
        LEFT JOIN `hs_s_rt_EM` `a` ON (((`a`.`code` = `b`.`code`)
            AND (`b`.`f500` = 1))))
    WHERE
        (`a`.`id` IS NOT NULL)
    ORDER BY `a`.`TimeSlot` DESC;	
		
-- 在表ying.hs_s_rt_EM中选择上证50的数据    
SELECT * FROM hs_s_sh50_rt_EM_view;
DROP VIEW hs_s_sh50_rt_EM_view;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_sh50_rt_EM_view` AS
    SELECT 
        `a`.`id` AS `id`,
        `a`.`code` AS `code`,
        `a`.`close` AS `close`,
        `a`.`amount` AS `amount`,
        `a`.`volume` AS `volume`,
        `a`.`chgrate` AS `chgrate`,
        `a`.`WeiBi` AS `WeiBi`,
        `a`.`chgrate5` AS `chgrate5`,
        `a`.`LiangBi` AS `LiangBi`,
        `a`.`date` AS `date`,
        `a`.`time` AS `time`,
        `a`.`TimeSlot` AS `TimeSlot`
    FROM
        (`hs_s` `b`
        LEFT JOIN `hs_s_rt_EM` `a` ON (((`a`.`code` = `b`.`code`)
            AND (`b`.`f50SH` = 1))))
    WHERE
        (`a`.`id` IS NOT NULL)
    ORDER BY `a`.`TimeSlot` DESC;

-- CREATE 
--     ALGORITHM = UNDEFINED 
--     DEFINER = `gxh`@`%` 
--     SQL SECURITY DEFINER
-- VIEW `hs_s_sh50_rt_EM_view` AS
-- SELECT 
--     a.id,
--     a.code,
--     a.close,
--     a.amount,
--     a.volume,
--     a.chgrate,
--     a.WeiBi,
--     a.chgrate5,
--     a.LiangBi,
--     a.date,
--     a.time,
--     a.TimeSlot
-- FROM
--     ying.hs_s_rt_EM AS a
--         RIGHT OUTER JOIN
--     hs_s AS b ON (a.code = b.code AND b.f50SH = 1)
-- WHERE
--     id IS NOT NULL
-- ORDER BY TimeSlot DESC;
		

-- 沪深300股票的加权5分钟涨速指数
SELECT * FROM `ying`.`hs_s_hs300_chgrate5_weight` ORDER BY TimeSlot DESC;
DROP VIEW `ying`.`hs_s_hs300_chgrate5_weight`;    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_chgrate5_weight` AS
    SELECT
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM((`a`.`chgrate5` * `c`.`weight`)) AS `chgrate5_weight`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC , SUM((`a`.`chgrate5` * `c`.`weight`)) DESC;

-- 沪深300股票的加权跌指数
SELECT * FROM `ying`.`hs_s_hs300_d_weight`;
DROP VIEW `ying`.`hs_s_hs300_d_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_d_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `d_weight`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        (`a`.`chgrate` < 0)
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;

-- 沪深300股票的加权跌金指数（跌超过黄金分割点）
SELECT * FROM `ying`.`hs_s_hs300_dg_weight`;
DROP VIEW `ying`.`hs_s_hs300_dg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_dg_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `dg_weight`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9382 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;

-- 沪深300股票的加权跌停指数
SELECT * FROM `ying`.`hs_s_hs300_dt_weight`;
DROP VIEW `ying`.`hs_s_hs300_dt_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_dt_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `dt_weight`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`chgrate` < 0)
            AND (`a`.`close` <= ROUND((0.9 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY  `a`.`TimeSlot`;

-- 沪深300股票的涨跌个数
SELECT * FROM `ying`.`hs_s_hs300_z_d_No`;
DROP VIEW `ying`.`hs_s_hs300_z_d_No`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_z_d_No` AS
    SELECT
        `hs_s_rt_EM`.`TimeSlot` AS `TimeSlot`,
        SUM(IF((`hs_s_rt_EM`.`chgrate` > 0),
            1,
            0)) AS `z`,
        SUM(IF((`hs_s_rt_EM`.`chgrate` < 0),
            1,
            0)) AS `d`
    FROM
        `hs_s_rt_EM`
    GROUP BY `hs_s_rt_EM`.`TimeSlot`
    ORDER BY `hs_s_rt_EM`.`TimeSlot` DESC;


-- 沪深300股票的加权涨指数
SELECT * FROM `ying`.`hs_s_hs300_z_weight`;
DROP VIEW `ying`.`hs_s_hs300_z_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_z_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `z_weight`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        (`a`.`chgrate` > 0)
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;

-- view 选择当前的涨跌过黄金分割点的股票（从当日最近时间的数据中选取）
SELECT * FROM ying.hs_s_hs300_zg_dg;
DROP VIEW `ying`.`hs_s_hs300_zg_dg`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zg_dg` AS
    SELECT 
        `rt300`.`code` AS `code`,
        `hs_s`.`name` AS `name`,
        `rt300`.`close` AS `close`,
        `rt300`.`chgrate` AS `chgrate`
    FROM
        ((`hs_s_rt_EM` `rt300`
        LEFT JOIN `hs_s_rt_EM` `b` ON (((`rt300`.`code` = `b`.`code`)
            AND ((`rt300`.`TimeSlot` < `b`.`TimeSlot`)
            OR ((`rt300`.`TimeSlot` = `b`.`TimeSlot`)
            AND (`rt300`.`id` < `b`.`id`))))))
        LEFT JOIN `hs_s` ON ((`rt300`.`code` = `hs_s`.`code`)))
    WHERE
        ((ISNULL(`b`.`code`)
            AND (`rt300`.`chgrate` > 0)
            AND (`rt300`.`close` >= ROUND((1.0618 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`code`)
            AND (`rt300`.`chgrate` < 0)
            AND (`rt300`.`close` <= ROUND((0.9382 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
                2))))
    ORDER BY `rt300`.`code`;
	
	-- 沪深300股票的涨跌超过黄金分割点个数
SELECT 
    *
FROM
    `hs_s_hs300_zg_dg_No`;
DROP VIEW `hs_s_hs300_zg_dg_No`;    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zg_dg_No` AS
    SELECT
        `hs_s_rt_EM`.`TimeSlot` AS `TimeSlot`,
        SUM(IF(((`hs_s_rt_EM`.`chgrate` > 0)
                AND (`hs_s_rt_EM`.`close` >= ROUND((1.0618 * ((100 * `hs_s_rt_EM`.`close`) / (100 + `hs_s_rt_EM`.`chgrate`))),
                    2))),
            1,
            0)) AS `zg`,
        SUM(IF(((`hs_s_rt_EM`.`chgrate` < 0)
                AND (`hs_s_rt_EM`.`close` <= ROUND((0.9382 * ((100 * `hs_s_rt_EM`.`close`) / (100 + `hs_s_rt_EM`.`chgrate`))),
                    2))),
            1,
            0)) AS `dg`
    FROM
        `hs_s_rt_EM`
    GROUP BY `hs_s_rt_EM`.`TimeSlot`
    ORDER BY `hs_s_rt_EM`.`TimeSlot` DESC;

-- 沪深300股票的加权涨金指数（涨超过黄金分割点）
SELECT * FROM `ying`.`hs_s_hs300_zg_weight`;
DROP VIEW `ying`.`hs_s_hs300_zg_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zg_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `zg_weight`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.0618 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY date, `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;

-- 沪深300股票的涨停跌停个数
SELECT 
    *
FROM
    `hs_s_hs300_zt_dt_No`;
DROP VIEW `hs_s_hs300_zt_dt_No`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zt_dt_No` AS
    SELECT
        `hs_s_rt_EM`.`TimeSlot` AS `TimeSlot`,
        SUM(IF(((`hs_s_rt_EM`.`chgrate` > 0)
                AND (`hs_s_rt_EM`.`close` >= ROUND((1.1 * ((100 * `hs_s_rt_EM`.`close`) / (100 + `hs_s_rt_EM`.`chgrate`))),
                    2))),
            1,
            0)) AS `zt`,
        SUM(IF(((`hs_s_rt_EM`.`chgrate` < 0)
                AND (`hs_s_rt_EM`.`close` <= ROUND((0.9 * ((100 * `hs_s_rt_EM`.`close`) / (100 + `hs_s_rt_EM`.`chgrate`))),
                    2))),
            1,
            0)) AS `dt`
    FROM
        `hs_s_rt_EM`
    GROUP BY `hs_s_rt_EM`.`TimeSlot`
    ORDER BY `hs_s_rt_EM`.`TimeSlot` DESC;	

-- 沪深300股票的加权涨停指数
SELECT * FROM `ying`.`hs_s_hs300_zt_weight`;
DROP VIEW `ying`.`hs_s_hs300_zt_weight`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zt_weight` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        SUM(`c`.`weight`) AS `zt_weight`
    FROM
        (`hs_s_rt_EM` `a`
        JOIN `hs300_s_data_c` `c` ON ((`a`.`code` = `c`.`code`)))
    WHERE
        ((`a`.`chgrate` > 0)
            AND (`a`.`close` >= ROUND((1.1 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),
                2)))
    GROUP BY `a`.`TimeSlot`
    ORDER BY `a`.`TimeSlot` DESC;
	
-- view 选择当前的涨跌停股票（从当日最近时间的数据中选取）
SELECT * FROM ying.hs_s_hs300_zt_dt;
DROP VIEW `ying`.`hs_s_hs300_zt_dt`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_zt_dt` AS
    SELECT 
        `rt300`.`code` AS `code`,
        `hs_s`.`name` AS `name`,
        `rt300`.`close` AS `close`,
        `rt300`.`chgrate` AS `chgrate`
    FROM
        ((`hs_s_rt_EM` `rt300`
        LEFT JOIN `hs_s_rt_EM` `b` ON (((`rt300`.`code` = `b`.`code`)
            AND ((`rt300`.`TimeSlot` < `b`.`TimeSlot`)
            OR ((`rt300`.`TimeSlot` = `b`.`TimeSlot`)
            AND (`rt300`.`id` < `b`.`id`))))))
        LEFT JOIN `hs_s` ON ((`rt300`.`code` = `hs_s`.`code`)))
    WHERE
        ((ISNULL(`b`.`code`)
            AND (`rt300`.`chgrate` > 0)
            AND (`rt300`.`close` >= ROUND((1.1 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`code`)
            AND (`rt300`.`chgrate` < 0)
            AND (`rt300`.`close` <= ROUND((0.9 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
                2))))
    ORDER BY `rt300`.`code`;

-- My own format ( 对应format after beatifying) 
-- CREATE 
--     ALGORITHM = UNDEFINED 
--     DEFINER = `gxh`@`%` 
--     SQL SECURITY DEFINER
-- VIEW `hs_s_hs300_lastest` AS
--     SELECT 
--         `rt300`.`code` AS `code`,
--         `rt300`.`TimeSlot` AS `TimeSlot`,
--         `rt300`.`close` AS `close`,
--         `rt300`.`chgrate` AS `chgrate`
--     FROM
--         (`hs_s_rt_EM` `rt300`
--         LEFT JOIN `hs_s_rt_EM` `b` ON (((`rt300`.`code` = `b`.`code`)
--             AND ((`rt300`.`TimeSlot` < `b`.`TimeSlot`)
--             OR ((`rt300`.`TimeSlot` = `b`.`TimeSlot`)
--             AND (`rt300`.`id` < `b`.`id`))))))
--     WHERE
--         ((ISNULL(`b`.`code`)
--             AND (`rt300`.`date` = (CURDATE() - 1))) AND ((`rt300`.`chgrate` > 0)
--         AND (`rt300`.`close` >= ROUND((1.1 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
--             2)))) or ((ISNULL(`b`.`code`)
--             AND (`rt300`.`date` = (CURDATE() - 1))) AND (((`rt300`.`chgrate` < 0)
--             AND (`rt300`.`close` <= ROUND((0.9 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
--                 2))))) 
--     ORDER BY `rt300`.`code`;
	
-- view 选择当前数据
SELECT * FROM `ying`.`hs_s_hs300_lastest`;
DROP VIEW `ying`.`hs_s_hs300_lastest`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_lastest` AS
    SELECT 
        `rt300`.`code` AS `code`,
        `rt300`.`TimeSlot` AS `TimeSlot`,
        `rt300`.`close` AS `close`,
        `rt300`.`chgrate` AS `chgrate`
    FROM
        (`hs_s_rt_EM` `rt300`
        LEFT JOIN `hs_s_rt_EM` `b` ON (((`rt300`.`code` = `b`.`code`)
            AND ((`rt300`.`TimeSlot` < `b`.`TimeSlot`)
            OR ((`rt300`.`TimeSlot` = `b`.`TimeSlot`)
            AND (`rt300`.`id` < `b`.`id`))))))
    WHERE
        ISNULL(`b`.`code`)
    ORDER BY `rt300`.`code`;
        
-- 涨跌指数统计
SELECT * FROM `ying`.`hs_s_hs300_z_d_Statistics`;
DROP VIEW `ying`.`hs_s_hs300_z_d_Statistics`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_z_d_Statistics` AS
    SELECT 
        `a`.`TimeSlot` AS `TimeSlot`,
        `rate5`.`chgrate5_weight` AS `rate5`,
        `a`.`z` AS `z`,
        `a`.`d` AS `d`,
        (`a`.`z` - `a`.`d`) AS `z-d`,
        IFNULL(`zW`.`z_weight`, 0) AS `zW`,
        IFNULL(`dW`.`d_weight`, 0) AS `dW`,
        (IFNULL(`zW`.`z_weight`, 0) - IFNULL(`dW`.`d_weight`, 0)) AS `zW-dW`,
        `b`.`zg` AS `zg`,
        `b`.`dg` AS `dg`,
        IFNULL(`zgW`.`zg_weight`, 0) AS `zgW`,
        IFNULL(`dgW`.`dg_weight`, 0) AS `dgW`,
        (IFNULL(`zgW`.`zg_weight`, 0) - IFNULL(`dgW`.`dg_weight`, 0)) AS `zgW-dgW`,
        `c`.`zt` AS `zt`,
        `c`.`dt` AS `dt`,
        IFNULL(`ztW`.`zt_weight`, 0) AS `ztW`,
        IFNULL(`dtW`.`dt_weight`, 0) AS `dtW`,
        (IFNULL(`ztW`.`zt_weight`, 0) - IFNULL(`dtW`.`dt_weight`, 0)) AS `ztW-dtW`
    FROM
        (((((((((`hs_s_hs300_z_d_No` `a`
        LEFT JOIN `hs_s_hs300_zg_dg_No` `b` ON ((`a`.`TimeSlot` = `b`.`TimeSlot`)))
        LEFT JOIN `hs_s_hs300_zt_dt_No` `c` ON ((`a`.`TimeSlot` = `c`.`TimeSlot`)))
        LEFT JOIN `hs_s_hs300_z_weight` `zW` ON ((`a`.`TimeSlot` = `zW`.`TimeSlot`)))
        LEFT JOIN `hs_s_hs300_d_weight` `dW` ON ((`a`.`TimeSlot` = `dW`.`TimeSlot`)))
        LEFT JOIN `hs_s_hs300_zg_weight` `zgW` ON ((`a`.`TimeSlot` = `zgW`.`TimeSlot`)))
        LEFT JOIN `hs_s_hs300_dg_weight` `dgW` ON ((`a`.`TimeSlot` = `dgW`.`TimeSlot`)))
        LEFT JOIN `hs_s_hs300_zt_weight` `ztW` ON ((`a`.`TimeSlot` = `ztW`.`TimeSlot`)))
        LEFT JOIN `hs_s_hs300_dt_weight` `dtW` ON ((`a`.`TimeSlot` = `dtW`.`TimeSlot`)))
        LEFT JOIN `hs_s_hs300_chgrate5_weight` `rate5` ON ((`a`.`TimeSlot` = `rate5`.`TimeSlot`)))
    ORDER BY `a`.`TimeSlot` DESC;


-- 选择最近时间的数据（不用subquery） sql - Fetch the row which has the Max value for a column - Stack Overflow 
SELECT 
    a.code, a.TimeSlot, a.close, a.chgrate5
FROM
    ying.hs_s_rt_EM AS a
        LEFT OUTER JOIN
    ying.hs_s_rt_EM AS b ON (a.code = b.code
        AND (a.time < b.time
        OR (a.time = b.time AND a.id < b.id)))
WHERE
    b.code IS NULL;
    
-- 不同的TimeSlot的涨跌停板数量    
SELECT 
    date,
    TimeSlot,
    SUM(IF(chgrate > 0
            AND close >= ROUND(1.1 * (100 * close / (100 + chgrate)), 2),
        1,
        0)) AS zt,
    SUM(IF(chgrate < 0
            AND close <= ROUND(0.9 * (100 * close / (100 + chgrate)), 2),
        1,
        0)) AS dt
FROM
    ying.hs_s_rt_EM
WHERE
    date = CURDATE()
GROUP BY date, TimeSlot
ORDER BY TimeSlot DESC;

-- 加权涨跌停指数, 无subquery
SELECT 
    SUM(c.weight)
FROM
    (SELECT 
        code
    FROM
        ying.hs_s_rt_EM
    WHERE
        chgrate > 0
            AND close >= ROUND(1.1 * (100 * close / (100 + chgrate)), 2)) AS a
        JOIN
    hs300_s_data_c AS c ON a.code = c.code;
    
-- 加权涨跌停指数, 无subquery
SELECT 
    SUM(c.weight)
FROM
    (SELECT 
        code
    FROM
        ying.hs_s_rt_EM
    WHERE
        chgrate > 0
            AND close >= ROUND(1.1 * (100 * close / (100 + chgrate)), 2)) AS a
        JOIN
    hs300_s_data_c AS c ON a.code = c.code;
    
-- 加权涨跌停指数, 没有subquery
SELECT 
    a.date, a.TimeSlot, SUM(c.weight) AS zt_weight
FROM
        ying.hs_s_rt_EM AS a JOIN hs300_s_data_c AS c ON a.code = c.code
    WHERE
        a.chgrate > 0 AND a.close >= ROUND(1.1 * (100 * a.close / (100 + a.chgrate)),2) GROUP BY date, a.TimeSlot;
        
-- 加权涨跌停指数, 没有subquery
SELECT 
    a.date, a.TimeSlot, SUM(c.weight) AS zt_weight
FROM
        ying.hs_s_rt_EM AS a JOIN hs300_s_data_c AS c ON a.code = c.code
    WHERE
        a.chgrate > 0 AND a.close >= ROUND(1.1 * (100 * a.close / (100 + a.chgrate)),2) GROUP BY date, a.TimeSlot;



-- 在表ying.hs_s_rt_EM中选择上证50的数据    
SELECT * FROM hs_s_sh50_rt_EM_view_1;
DROP VIEW hs_s_sh50_rt_EM_view_1;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_sh50_rt_EM_view_1` AS
-- SELECT 
--     *
-- FROM
--     ying.hs_s_rt_EM
-- WHERE
--     code IN (SELECT DISTINCT
--             a.`code`
--         FROM
--             `ying`.`hs_bk_gp_info_EM` AS a
--                 JOIN
--             ying.hs_bk_info_EM AS b ON (a.code_bk = b.code_bk)
--                 JOIN
--             ying.hs_bkhq_rt_EM AS c ON (b.name_bk = c.name_bk)
--         WHERE
--             b.name_bk = '上证50'
--         ORDER BY a.`DateSys` DESC , c.`chgrate_bk` DESC); 
-- CREATE 
--     ALGORITHM = UNDEFINED 
--     DEFINER = `gxh`@`%` 
--     SQL SECURITY DEFINER
-- VIEW `hs_s_sh50_rt_EM_view_1` AS
    SELECT 
        `hs_s_rt_EM`.`id` AS `id`,
        `hs_s_rt_EM`.`code` AS `code`,
        `hs_s_rt_EM`.`close` AS `close`,
        `hs_s_rt_EM`.`amount` AS `amount`,
        `hs_s_rt_EM`.`volume` AS `volume`,
        `hs_s_rt_EM`.`chgrate` AS `chgrate`,
        `hs_s_rt_EM`.`WeiBi` AS `WeiBi`,
        `hs_s_rt_EM`.`chgrate5` AS `chgrate5`,
        `hs_s_rt_EM`.`LiangBi` AS `LiangBi`,
        `hs_s_rt_EM`.`date` AS `date`,
        `hs_s_rt_EM`.`time` AS `time`,
        `hs_s_rt_EM`.`TimeSlot` AS `TimeSlot`
    FROM
        `hs_s_rt_EM`
    WHERE
        `hs_s_rt_EM`.`code` IN (SELECT DISTINCT
                `a`.`code`
            FROM
                ((`hs_bk_gp_info_EM` `a`
                JOIN `hs_bk_info_EM` `b` ON ((`a`.`code_bk` = `b`.`code_bk`)))
                JOIN `hs_bkhq_rt_EM` `c` ON ((`b`.`name_bk` = `c`.`name_bk`)))
            WHERE
                (`b`.`name_bk` = '上证50')
            ORDER BY `a`.`DateSys` DESC , `c`.`chgrate_bk` DESC) ORDER BY TimeSlot DESC;

    

-- 在表ying.hs_s_rt_EM中选择上证50的数据 tedd        
SELECT 
    a.id,
    a.code,
    a.close,
    a.amount,
    a.volume,
    a.chgrate,
    a.WeiBi,
    a.chgrate5,
    a.LiangBi,
    a.date,
    a.time,
    a.TimeSlot
FROM
    ying.hs_s_rt_EM AS a
        RIGHT OUTER JOIN
    hs_s AS b ON (a.code = b.code AND b.f50SH = 1)
WHERE
    id IS NOT NULL
ORDER BY TimeSlot DESC;

-- 在表ying.hs_s_rt_EM中统计上证50的数据条数 tedd      
SELECT 
    COUNT(a.id)
FROM
    ying.hs_s_rt_EM AS a
        RIGHT OUTER JOIN
    hs_s AS b ON (a.code = b.code AND b.f50SH = 1)
WHERE
    id IS NOT NULL; 

SELECT COUNT(*) FROM hs_s_sh50_rt_EM;
SELECT COUNT(id) FROM hs_s_rt_EM;


SELECT `hs_s_rt_EM`.`id`,
    `hs_s_rt_EM`.`code`,
    `hs_s_rt_EM`.`close`,
    `hs_s_rt_EM`.`amount`,
    `hs_s_rt_EM`.`volume`,
    `hs_s_rt_EM`.`chgrate`,
    `hs_s_rt_EM`.`WeiBi`,
    `hs_s_rt_EM`.`chgrate5`,
    `hs_s_rt_EM`.`LiangBi`,
    `hs_s_rt_EM`.`date`,
    `hs_s_rt_EM`.`time`,
    `hs_s_rt_EM`.`TimeSlot`
FROM `ying`.`hs_s_rt_EM`;


SELECT 
    `hs_s_rt_EM`.`id`,
    `hs_s_rt_EM`.`code`,
    `hs_s_rt_EM`.`close`,
    `hs_s_rt_EM`.`amount`,
    `hs_s_rt_EM`.`volume`,
    `hs_s_rt_EM`.`chgrate`,
    `hs_s_rt_EM`.`WeiBi`,
    `hs_s_rt_EM`.`chgrate5`,
    `hs_s_rt_EM`.`LiangBi`,
    `hs_s_rt_EM`.`date`,
    `hs_s_rt_EM`.`time`,
    `hs_s_rt_EM`.`TimeSlot`
FROM
    ying.hs_s_rt_EM
WHERE
    code IN (SELECT DISTINCT
            a.`code`
        FROM
            `ying`.`hs_bk_gp_info_EM` AS a
                JOIN
            ying.hs_bk_info_EM AS b ON (a.code_bk = b.code_bk)
                JOIN
            ying.hs_bkhq_rt_EM AS c ON (b.name_bk = c.name_bk)
        WHERE
            b.name_bk = '上证50'
        ORDER BY a.`DateSys` DESC , c.`chgrate_bk` DESC)
ORDER BY id; 

SELECT `hs_s_hs300_zt_dt_No`.`date` AS '日期',
    `hs_s_hs300_zt_dt_No`.`TimeSlot` AS '时间' ,
    `hs_s_hs300_zt_dt_No`.`zt` AS '涨停股数',
    `hs_s_hs300_zt_dt_No`.`dt` AS '跌停股数'
FROM `ying`.`hs_s_hs300_zt_dt_No`;

SELECT * FROM ying.hs_s_hs300_z_weight;
SELECT * FROM ying.hs_s_hs300_zt_weight;
SELECT * FROM ying.hs_s_hs300_dt_weight;