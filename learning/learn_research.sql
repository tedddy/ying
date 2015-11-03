-- start: learning and researching E:\bYun\securities\ying\proc\d1_TMPL\proc_tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1.sql 

select cast(concat(date_sub(curdate(), interval 1 DAY), ' ', '00:00:01') as datetime);

select curdate()-1;

-- select lag

SELECT 
    @fieldTMPL_lag AS fieldTMPL_lag,
    @fieldTMPL_lag:=fieldTMPL AS fieldTMPL_current,
    t.`idTMPL`,
    t.`dtTMPL`,
    t.`fieldTMPL`
FROM
    `ying`.`tableTMPL` t,
    (SELECT @fieldTMPL_lag:=0.00) r
ORDER BY t.`idTMPL` , t.`dtTMPL` DESC;

-- select d1 for a given (`dtTMPL`, `idTMPL`)

SELECT 
    `dtTMPL`,
    `idTMPL`,
    fieldTMPL - @fieldTMPL_lag AS `fieldTMPL_d1`,
    @fieldTMPL_lag:=fieldTMPL `curr_fieldTMPL`
FROM
    `ying`.`tableTMPL` t,
    (SELECT @fieldTMPL_lag:=0) r
ORDER BY `idTMPL` , `dtTMPL`;


-- Find the lastest different (差分).
-- reference: sql - Simulate lag function in MySQL - Stack Overflow 
-- SET @quot=1000,@latest=1000; -- This query is necessary for running the following query
SELECT 
    B.*
FROM
    (SELECT 
        A.dtTMPL,
            round(A.fieldTMPL_d1, 2) as fieldTMPL_d1,
            IF(@comp <> A.idTMPL, 1, 0) AS LATEST,
            @comp:=A.idTMPL AS idTMPL
    FROM
        (SELECT 
        dtTMPL,
            idTMPL,
            fieldTMPL - @quot AS fieldTMPL_d1,
            @quot:=fieldTMPL curr_quote
    FROM
        `ying`.`tableTMPL`, (SELECT @quot = 0, @latest = 0) r
    ORDER BY idTMPL , dtTMPL) A
    ORDER BY idTMPL , dtTMPL DESC) B
WHERE
    B.LATEST = 1;

SET @quot=0,@latest=0; -- This query is necessary for running the following query
SELECT 
        dtTMPL,
            idTMPL,
            fieldTMPL - @quot AS fieldTMPL_d1,
            @quot:=fieldTMPL curr_quote
    FROM
        `ying`.`tableTMPL`
    ORDER BY idTMPL , dtTMPL;

SET @quot=0,@latest=0;
SELECT 
        A.dtTMPL,
            A.fieldTMPL_d1,
            IF(@comp <> A.idTMPL, 1, 0) AS LATEST,
            @comp:=A.idTMPL AS idTMPL
    FROM
        (SELECT 
        dtTMPL,
            idTMPL,
            fieldTMPL - @quot AS fieldTMPL_d1,
            @quot:=fieldTMPL curr_quote
    FROM
        `ying`.`tableTMPL`
    ORDER BY idTMPL , dtTMPL) A
    ORDER BY idTMPL , dtTMPL DESC;

-- Find the lasted different (差分). Another method
-- reference: sql - Simulate lag function in MySQL - Stack Overflow 
-- m max; l last

-- To achieve the desired result, first you need to find the last and next to last timestamps for each idTMPL. It is quite simple with the following query:
SELECT 
    c.idTMPL, c.m_dtTMPL, MAX(l.dtTMPL) AS l_dtTMPL
FROM
    (SELECT 
        idTMPL, MAX(dtTMPL) AS m_dtTMPL
    FROM
        tableTMPL
    GROUP BY idTMPL) AS c
        LEFT JOIN
    tableTMPL l ON c.idTMPL = l.idTMPL AND c.m_dtTMPL > l.dtTMPL
GROUP BY c.idTMPL , c.m_dtTMPL;

-- learning: join, group by
SELECT 
    c.idTMPL, c.m_dtTMPL, l.dtTMPL
FROM
    (SELECT 
        idTMPL, MAX(dtTMPL) AS m_dtTMPL
    FROM
        tableTMPL
    GROUP BY idTMPL) AS c
        LEFT JOIN
    tableTMPL l ON c.idTMPL = l.idTMPL AND c.m_dtTMPL > l.dtTMPL;


-- Now you have to join this subquery with the original table to get the desired results:
SELECT 
    c.idTMPL,
    l.fieldTMPL,
    COALESCE(l1.fieldTMPL, 0),
    (l.fieldTMPL - COALESCE(l1.fieldTMPL, 0)) AS result
FROM
    (SELECT 
        c.idTMPL, c.m_dtTMPL, MAX(l.dtTMPL) AS l_dtTMPL
    FROM
        (SELECT 
        idTMPL, MAX(dtTMPL) AS m_dtTMPL
    FROM
        tableTMPL
    GROUP BY idTMPL) AS c
    LEFT JOIN tableTMPL l ON c.idTMPL = l.idTMPL
        AND c.m_dtTMPL > l.dtTMPL
    GROUP BY c.idTMPL , c.m_dtTMPL) AS c
        LEFT JOIN
    tableTMPL AS l ON l.idTMPL = c.idTMPL
        AND l.dtTMPL = c.m_dtTMPL
        LEFT JOIN
    tableTMPL AS l1 ON l1.idTMPL = c.idTMPL
        AND l1.dtTMPL = c.l_dtTMPL;

-- end: learning and researching E:\bYun\securities\ying\proc\d1_TMPL\proc_tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1.sql 


SHOW COLUMNS FROM `hs_index_000001` LIKE 'm%';


-- 时间的difference
select timediff('2015-10-09 15:05:00', '2015-10-09 00:05:00');
select timediff('2015-10-09 15:05:00', '0000-00-00 00:05:00');


-- lag https://app.yinxiang.com/shard/s22/nl/4928451/fb4a2bc0-b995-427c-a298-07430b53f6e9 select @lagfield,@lagfiled:=targField,t.* from table t ,(select @lagfield:='') r

SELECT @bmargin_lag as bmargin_lag, @bmargin_lag:=bmargin as bmargin_current, t.id, t.date, t.bMargin FROM ying.hs_s_loan_EM t , (SELECT @bmargin_lag:=0) r WHERE t.code IS NULL AND t.fMKT = '1' ORDER BY date DESC;


SELECT @bmargin_lag, @bmargin_lag:=bmargin, t.id, t.date, t.bMargin FROM ying.hs_s_loan_EM t , (SELECT @bmargin_lag:=0) r WHERE t.code IS NULL AND t.fMKT = '1' ORDER BY date DESC;

SELECT @bmargin_lag, @bmargin_lag:=bmargin, @bmargin_lag - @bmargin_lag:=bmargin,t.id, t.date, t.bMargin FROM ying.hs_s_loan_EM t , (SELECT @bmargin_lag:=0) r WHERE t.code IS NULL AND t.fMKT = '1' ORDER BY date DESC; -- why "@bmargin_lag - @bmargin_lag:=bmargin" is 0 while the first and the second are different?

SELECT @bmargin_lag, @bmargin_lag - @bmargin_lag:=bmargin,t.id, t.date, t.bMargin FROM ying.hs_s_loan_EM t , (SELECT @bmargin_lag:=0) r WHERE t.code IS NULL AND t.fMKT = '1' ORDER BY date DESC; -- why there is no show?

-- moving average
SELECT * FROM `ying`.`hs_index_000001` ORDER BY id DESC;

SELECT id , ROUND((SELECT AVG(close_index) FROM  `ying`.`hs_index_000001` a WHERE a.date >= DATE_ADD(b.date,INTERVAL -5 DAY) AND  a.date< b.date), 2) avg_5 , date FROM  `ying`.`hs_index_000001` b;

SELECT id , ROUND((SELECT AVG(close_index) FROM  `ying`.`hs_index_000001` a WHERE a.id > b.id - 100 AND  a.id <= b.id), 2) avg_100 , date FROM  `ying`.`hs_index_000001` b;

SELECT * FROM  `ying`.`hs_index_000001` a WHERE a.date >= DATE_ADD('2005-01-04',INTERVAL -5 DAY) AND  a.date< '2005-01-04';

-- lag for close_index
SET @a :=0; SET @b :=1;
SELECT 
    r.id, r.close_index, r1.close_index - r.close_index  AS 'lag'
FROM
    (SELECT 
        IF(@a, @a:=@a + 1, @a:=1) AS rownum, id, close_index
    FROM
        `ying`.`hs_index_000001`) AS r
        LEFT JOIN
    (SELECT 
        IF(@b, @b:=@b + 1, @b:=1) AS rownum, id, close_index
    FROM
        `ying`.`hs_index_000001`) AS r1 ON r.rownum = r1.rownum;

-- lag https://app.yinxiang.com/shard/s22/nl/4928451/8a3d5c5e-99c9-4175-a35c-b6debe76011b
-- lag for moving_average
SET @a :=0; SET @b :=1;
SELECT 
    r.id, r.moving_average, r1.moving_average - r.moving_average  AS 'lag'
FROM
    (SELECT 
        IF(@a, @a:=@a + 1, @a:=1) AS rownum, id, moving_average
    FROM
        `ying`.`hs_index_000001`) AS r
        LEFT JOIN
    (SELECT 
        IF(@b, @b:=@b + 1, @b:=1) AS rownum, id, moving_average
    FROM
        `ying`.`hs_index_000001`) AS r1 ON r.rownum = r1.rownum;
        
-- MySQL中的ROWNUM的实现

set @x = 0;     
select @x:=ifnull(@x,0)+1 as r_no,id, date from `ying`.`hs_index_000001`;

select a.id, a.code_index, a.`date`,count(*) as rownum from hs_index_000001 a,hs_index_000001 b where a.`date`>=b.`date` group by a.id,a.`date`,a.code_index; 

select a.id, a.code, a.`date`,count(*) as rownum from `ying`.`hs_s_xts_history_sina` a,`ying`.`hs_s_xts_history_sina` b where a.`date`>=b.`date` group by a.id,a.`date`,a.code; -- Error Code: 2013. Lost connection to MySQL server during query

select a.id, a.code, a.`date`,count(*) as rownum from `ying`.`hs_s_xts_history_sina` a,`ying`.`hs_s_xts_history_sina` b where a.`date`>=b.`date` group by a.id,a.`date`; 

-- CALL `movingAvg_hs_index_000001_by_date`(); -- 0 row(s) affected, 2 warning(s): 1265 Data truncated for column 'moving_average' at row 1 1329 No data - zero rows fetched, selected, or processed

ALTER TABLE `ying`.`hs_index_000001` ADD COLUMN `test_EMV` decimal(8,3) NOT NULL COMMENT 'test exponential moving average' AFTER `amount_index`;

-- mysql calculate 5 day exponential moving average - Stack Overflow
select `date`, close_index, @a := ( @a*.5 + close_index *.5) AS moving_avg from hs_index_000001 Join (select @a := (select close_index from hs_index_000001 where date = '2005-01-04')) as X order by date;

set @a = 1242.774;    
select `date`, close_index, @a := ( @a*.5 + close_index *.5) AS moving_avg from hs_index_000001 order by date; 

 
 
CALL `movingAvg_hs_index_000001_by_id`(5); -- 0 row(s) affected, 1 warning(s): 1329 No data - zero rows fetched, selected, or processed

-- moving average
DROP PROCEDURE `movingAvg_hs_index_000001_by_id`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `movingAvg_hs_index_000001_by_id`(IN mv_length int(3))
BEGIN

    DECLARE mv DOUBLE;
    DECLARE t INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur_t CURSOR FOR
         SELECT DISTINCT id FROM `ying`.`hs_index_000001`
         ORDER BY id;	    
    DECLARE cur_mv CURSOR FOR
         SELECT AVG(close_index) FROM `ying`.`hs_index_000001`
         WHERE id >= (t - mv_length) AND id <= t;
         -- Here you define the interval of your MV.
         -- If you want a 20-day MV, then the interval is between t-19 and t         
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
    
    OPEN cur_t;
    LOOP_ID: LOOP
        FETCH cur_t INTO t;
        IF NOT done THEN
            OPEN cur_mv;
            FETCH cur_mv INTO mv;
            CLOSE cur_mv;
            UPDATE `ying`.`hs_index_000001`
                SET moving_average = mv
                WHERE id=t;
        ELSE
            LEAVE LOOP_ID;
        END IF;
    END LOOP LOOP_ID;
    CLOSE cur_t;
END$$
DELIMITER ;
 
         SELECT DISTINCT id FROM `ying`.`hs_index_000001`
         ORDER BY id;
		 SELECT AVG(close_index) FROM `ying`.`hs_index_000001`
         WHERE id >= (21 - 19) AND id <= 21;
         SELECT * FROM `ying`.`hs_index_000001`
         WHERE id >= (20 - 19) AND id <= 20;
         

DROP PROCEDURE `movingAvg_hs_index_000001_by_date`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `movingAvg_hs_index_000001_by_date`()
BEGIN

    DECLARE mv DOUBLE;
    DECLARE t DATE;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur_t CURSOR FOR
         SELECT DISTINCT date FROM `ying`.`hs_index_000001`
         ORDER BY date;
    DECLARE cur_mv CURSOR FOR
         SELECT AVG(close_index) FROM `ying`.`hs_index_000001`
         WHERE date BETWEEN DATE_ADD(t, INTERVAL -19 DAY) AND t;
         -- Here you define the interval of your MV.
         -- If you want a 20-day MV, then the interval is between t-19 and t
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;

    OPEN cur_t;
    LOOP_DATE: LOOP
        FETCH cur_t INTO t;
        IF NOT done THEN
            OPEN cur_mv;
            FETCH cur_mv INTO mv;
            CLOSE cur_mv;
            UPDATE `ying`.`hs_index_000001`
                SET moving_average = mv
                WHERE date=t;
        ELSE
            LEAVE LOOP_DATE;
        END IF;
    END LOOP LOOP_DATE;
    CLOSE cur_t;
END$$
DELIMITER ;



SELECT
     close_index,
     (
     SELECT
          AVG(close_index) AS moving_average
     FROM
          `ying`.`hs_index_000001` T2
     WHERE
          (
               SELECT
                    COUNT(*)
               FROM
                    `ying`.`hs_index_000001` T3
               WHERE
                    date BETWEEN T2.date AND T1.date
          ) BETWEEN 1 AND 2
     )
FROM
     `ying`.`hs_index_000001` T1; -- Error Code: 2013. Lost connection to MySQL server during query