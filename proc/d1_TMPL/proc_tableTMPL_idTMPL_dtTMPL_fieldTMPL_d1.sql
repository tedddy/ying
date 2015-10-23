-- add a column for value of d1
ALTER TABLE `ying`.`tableTMPL` ADD COLUMN `fieldTMPL_d1` DECIMAL(6,2) NULL COMMENT '' AFTER `fieldTMPL`;

-- UPDATE value of d1 into tableTMPL
SELECT * from tableTMPL order by idTMPL, dtTMPL desc;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1`()
BEGIN
UPDATE tableTMPL t
        INNER JOIN
    (SELECT 
        `dtTMPL`,
            `idTMPL`,
            fieldTMPL - @fieldTMPL_lag AS `fieldTMPL_d1`,
            @fieldTMPL_lag:=fieldTMPL `curr_fieldTMPL`
    FROM
        `ying`.`tableTMPL` t, (SELECT @fieldTMPL_lag:=0) r
    ORDER BY `idTMPL` , `dtTMPL`) d1 ON (t.idTMPL = d1.idTMPL
        AND t.dtTMPL = d1.dtTMPL) 
SET 
    t.fieldTMPL_d1 = d1.fieldTMPL_d1;
END$$
DELIMITER ;

-- Reference: file E:\bYun\securities\ying\learning\learning.sql; search key words: learning and researching E:\bYun\securities\ying\proc\d1_TMPL\proc_tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1.sql 

-- start: learning and researching E:\bYun\securities\ying\proc\d1_TMPL\proc_tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1.sql 

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
-- SET @quot=0,@latest=0; -- This query is necessary for running the following query
SELECT 
    B.*
FROM
    (SELECT 
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

-- start: learning and researching E:\bYun\securities\ying\proc\d1_TMPL\proc_tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1.sql 
