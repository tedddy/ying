SELECT * FROM ying.hk_w_xts WHERE code = '18466';

SELECT 
    `hk_w_xts`.`id`,
    `hk_w_xts`.`code`,
    `hk_w_xts`.`date`,
    `hk_w_xts`.`open`,
    `hk_w_xts`.`high`,
    `hk_w_xts`.`low`,
    `hk_w_xts`.`close`,
    `hk_w_xts`.`volume`,
    `hk_w_xts`.`turnover`
FROM
    `ying`.`hk_w_xts`
ORDER BY id DESC;

SELECT 
    sum(`hk_w_xts`.`turnover`)
FROM
    `ying`.`hk_w_xts` 
where date = curdate() ORDER BY id DESC;

SELECT 
    `hk_w_xts`.`date`,
    `hk_w_xts`.`open`,
    `hk_w_xts`.`high`,
    `hk_w_xts`.`low`,
    `hk_w_xts`.`close`,
    `hk_w_xts`.`volume`,
    `hk_w_xts`.`turnover`
FROM
    `ying`.`hk_w_xts` 
where date = curdate() ORDER BY id DESC;


call hk_w_xts_fR;


-- 筛选出某只股票对应的权证 version 150505. This is too slow because of IN subquery. tedd
SELECT 
    xts.code,
    xts.date,
    xts.open,
    xts.close,
    xts.turnover,
    info.pDate
FROM
    ying.hk_w_xts AS xts
        LEFT JOIN
    ying.hk_w AS info ON xts.code = info.code
WHERE
    xts.date > '2015-11-03'
        AND xts.code IN (SELECT 
            info.code
        FROM
            ying.hk_w
        WHERE
            info.uCode = '03888')
ORDER BY xts.date DESC , xts.turnover DESC;


SELECT 
    xts.code,
    xts.date,
    xts.open,
    xts.close,
    xts.turnover,
    info.pDate
FROM
    ying.hk_w_xts AS xts
        LEFT JOIN
    ying.hk_w AS info ON xts.code = info.code
WHERE
            uCode = '02822'
ORDER BY xts.date DESC , xts.turnover DESC;


SELECT 
    xts.code,
    xts.date,
    xts.open,
    xts.close,
    sum(xts.turnover),
    info.pDate
FROM
    ying.hk_w_xts AS xts
        LEFT JOIN
    ying.hk_w AS info ON xts.code = info.code
WHERE
--    xts.date IN ('2015-11-06' , '2015-11-14')
    xts.date >= '2015-11-08'
        AND xts.code IN (SELECT 
            info.code
        FROM
            hk_w
        WHERE
            info.uCode = '02823')
GROUP BY info.code
ORDER BY xts.date DESC , xts.turnover DESC;

SELECT 
    *
FROM
    ying.hk_w_xts;

SELECT 
    *
FROM
    ying.hk_w_xts
WHERE
    code = '17562'
ORDER BY date DESC;

SELECT 
    table_call.date,
    table_call.uCode,
    hk_s_xts.amount,
    table_call.sum_call,
    table_put.sum_put
FROM
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_call`
    FROM
        (`hk_w_xts`
    JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 1
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_call
        JOIN
    hk_s_xts ON table_call.date = hk_s_xts.date
        AND table_call.uCode = hk_s_xts.code
        LEFT JOIN
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
    LEFT JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 0
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_put ON table_call.date = table_put.date
        AND table_call.uCode = table_put.uCode
WHERE
    table_call.uCode IN ('00493' , '01339', '03888')
ORDER BY code, date DESC;

SELECT 
    table_call.date,
    table_call.uCode,
    hk_s_xts.amount,
    table_call.sum_call,
    table_put.sum_put
FROM
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_call`
    FROM
        (`hk_w_xts`
    JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 0
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_call
        JOIN
    hk_s_xts ON table_call.date = hk_s_xts.date
        AND table_call.uCode = hk_s_xts.code
        LEFT JOIN
    (SELECT 
        `hk_w_xts`.`date` AS `date`,
            `info`.`uCode` AS `uCode`,
            SUM(`hk_w_xts`.`turnover`) AS `sum_put`
    FROM
        (`hk_w_xts`
    JOIN `hk_w` `info` ON ((`hk_w_xts`.`code` = `info`.`code`)))
    WHERE
        (`info`.`uCode` IS NOT NULL)
            AND nature = 0
    GROUP BY `info`.`uCode` , `hk_w_xts`.`date` , `info`.`nature`) AS table_put ON table_call.date = table_put.date
        AND table_call.uCode = table_put.uCode
WHERE
    table_call.uCode = 'HSCEI';

SELECT 
    date, info.uCode, SUM(turnover)
FROM
    hk_w_xts
        JOIN
    hk_w AS info ON hk_w_xts.code = info.code
WHERE
--    date IN ('2015-04-14', '2015-04-13', '2015-04-10', '2015-04-09', '2015-04-08')
	date > '2016-01-01'
        AND info.uCode IS NOT NULL
        AND info.uCode IN ('00998', '06818', '01988', '00939', '01288', '06837', 'HSCEI')
GROUP BY info.uCode, date;

SELECT 
        code, turnover AS turnover_last
    FROM
        ying.hk_w_xts
    WHERE
        date = '2016-02-22' AND 
            code IN (SELECT 
                code
            FROM
                hk_w
            WHERE
                uCode = '02822')
    GROUP BY code;

SELECT 
    SUM(code_turnover.turnover_last)/100000000
FROM
    (SELECT 
        code, turnover AS turnover_last
    FROM
        ying.hk_w_xts
    WHERE
        date = '2015-04-10' AND 
            code IN (SELECT 
                code
            FROM
                hk_w
            WHERE
                uCode = '02822')
    GROUP BY code) AS code_turnover;
    
SELECT 
    SUM(code_turnover.turnover_last)/100000000
FROM
    (SELECT 
        code, turnover AS turnover_last
    FROM
        ying.hk_w_xts
    WHERE
        date = '2015-04-08' AND 
            code IN (SELECT 
                code
            FROM
                hk_w
            WHERE
                uCode = '03800')
    GROUP BY code) AS code_turnover;
    
-- import data from database securities to database ying
INSERT INTO `ying`.`hk_w_xts`
(`code`,
`date`,
`open`,
`high`,
`low`,
`close`,
`volume`,
`turnover`)
SELECT `hk_xts`.`code`,
    `hk_xts`.`date`,
    `hk_xts`.`open`,
    `hk_xts`.`high`,
    `hk_xts`.`low`,
    `hk_xts`.`close`,
    `hk_xts`.`volume`,
    `hk_xts`.`turnover`
FROM `securities`.`hk_xts`
WHERE code IN (SELECT code FROM `securities`.`hk_w`);

delete from hk_w_xts where date = curdate();
delete from hk_s_xts where date = curdate();
 
/*
CREATE DEFINER=`gxh`@`%` PROCEDURE `hk_w_xts`(IN code VARCHAR(6), date DATE, open DECIMAL(7,3), high DECIMAL(7,3), low DECIMAL(7,3), close DECIMAL(7,3), volume INT(10) UNSIGNED, turnover INT(10) UNSIGNED)
BEGIN
SET code = IF(code = '', NULL, code);
SET date = IF(date = '', NULL, Date);
SET open = IF(open = '', NULL, open);
SET high = IF(high = '', NULL, high);
SET low = IF(low = '', NULL, low);
SET close = IF(close = '', NULL, close);
SET volume = IF(volume = '', NULL, volume);
SET turnover = IF(turnover = '', NULL, turnover);

INSERT INTO `hk_w_xts` (`code`, `date`, `open`, `high`, `low`, `close`, `volume`, `turnover`) VALUES (code, date, open, high, low, close, volume, turnover) 
ON DUPLICATE KEY UPDate 
	`code` = IF(code IS NULL, `code`, code),
	`date` = IF(date IS NULL, `date`, date),
	`open` = IF(open IS NULL, `open`, open),
	`high` = IF(high IS NULL, `high`, high),
	`low` = IF(low IS NULL, `low`, low),
	`close` = IF(close IS NULL, `close`, close),
	`volume` = IF(volume IS NULL, `volume`, volume),
	`turnover` = IF(turnover IS NULL, `turnover`, turnover);
END
*/

DELIMITER $$

CREATE 
	EVENT `hk_w_xts_fR` 
	ON SCHEDULE EVERY 1 DAY STARTS '2015-06-18 19:00:00' 
	DO BEGIN
	
		-- copy deleted posts
		INSERT INTO blog_archive (id, title, content) 
		SELECT id, title, content
		FROM blog
		WHERE deleted = 1;
	    
		-- copy associated audit records
		INSERT INTO audit_archive (id, blog_id, changetype, changetime) 
		SELECT audit.id, audit.blog_id, audit.changetype, audit.changetime 
		FROM audit
		JOIN blog ON audit.blog_id = blog.id
		WHERE blog.deleted = 1;
		
		-- remove deleted blogs and audit entries
		DELETE FROM blog WHERE deleted = 1;
	    
	END $$

DELIMITER ;