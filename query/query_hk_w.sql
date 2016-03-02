SELECT * FROM ying.hk_w ORDER BY pDate DESC;

SELECT * FROM ying.hk_w ORDER BY `dateSys` DESC;


SELECT count(*) FROM ying.hk_w ORDER BY pDate DESC;


SELECT * FROM ying.hk_w WHERE code = '01441' ORDER BY pDate DESC;

-- 筛选重要的权证
UPDATE `ying`.`hk_w` 
SET 
    `fW` = '3'
WHERE
    `uCode` IN ('03800' , '02823', '02822', '06837', 'HSCEI', '00998', '01788', '02727', '03333', '02357', '01066', '01068', '00268', '01833', '00861') OR `uCode` IN (SELECT DISTINCT code FROM hk_s_hgt_info);
    
SELECT concat('http://stock.finance.qq.com/hk/hklist/view/daily_trading.php?p=1&c=', code,'&b=00000000&max=', 1) AS 'url_hk_w_MarketMaker' FROM `hk_w` where eDate > curdate() and eDate > '0000-00-00' and (`uCode` IN ('03800' , '02823', '02822', '06837', 'HSCEI', '00998', '01788', '02727', '03333', '02357', '01066', '01068', '00268', '01833', '00861') or `uCode` IN (select distinct code from hk_s_hgt_info));

UPDATE `ying`.`hk_w` 
SET 
    `fW` = '1';
    
UPDATE `ying`.`hk_w` 
SET 
    `fW` = '0'
WHERE
    eDate < CURDATE();
    
SELECT DATEDIFF(CURDATE(), pDate) FROM hk_w WHERE code = '25597';

SELECT CONCAT('http://hq.sinajs.cn/list=rt_hk',code) AS 'url_hk_w' FROM `hk_w` WHERE eDate > CURDATE();


SELECT 
    *
FROM
    ying.hk_w
ORDER BY pDate DESC;

SELECT 
    `hk_w`.`code`,
    `hk_w`.`uCode`,
    `hk_w`.`enName`,
    `hk_w`.`name`,
    `hk_w`.`nature`,
    `hk_w`.`strike`,
    `hk_w`.`cRatio`,
    `hk_w`.`pDate`,
    `hk_w`.`eDate`,
    `hk_w`.`publisher`,
    `hk_w`.`fW`,
    `hk_w`.`fD`,
    `hk_w`.`dateSys`
FROM
    `ying`.`hk_w`
ORDER BY pDate DESC;


SELECT code, name INTO OUTFILE 'E:\\bYun\\securities\\database_mysql\\test2.txt' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' FROM `ying`.`hk_w`;

-- tedd: group_concat
SELECT
    COUNT(*), DATE_FORMAT(pDate, '%Y-%m'), GROUP_CONCAT(CONCAT('rt_hk',code))
FROM
    `ying`.`hk_w`
WHERE eDate > CURRENT_DATE() AND PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM CURDATE()), EXTRACT(YEAR_MONTH FROM `hk_w`.`pDate`)) < 50
GROUP BY DATE_FORMAT(pDate, '%Y-%m') DESC;

SET group_concat_max_len=200000;

-- 下面的语句正确，报错是bug
SHOW VARIABLES LIKE "group_concat_max_len";  

INSERT INTO test_group_concat
SELECT
    GROUP_CONCAT(CONCAT('rt_hk',code))
FROM
    `ying`.`hk_w`
WHERE eDate > CURRENT_DATE() AND PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM CURDATE()), EXTRACT(YEAR_MONTH FROM `hk_w`.`pDate`)) < 15
GROUP BY DATE_FORMAT(pDate, '%Y-%m') DESC;

SELECT 
    DATE_FORMAT(pDate, '%Y-%m'), GROUP_CONCAT(CONCAT('rt_hk',code))
FROM
    `ying`.`hk_w`
GROUP BY DATE_FORMAT(pDate, '%Y-%m') DESC;

SELECT 
    YEAR(`hk_w`.`pDate`),
    MONTH(`hk_w`.`pDate`),
    EXTRACT(YEAR_MONTH FROM `hk_w`.`pDate`),
    EXTRACT(YEAR_MONTH FROM CURDATE()),
    `hk_w`.`eDate`,
    `hk_w`.`publisher`,
    `hk_w`.`fW`,
    `hk_w`.`fD`,
    `hk_w`.`dateSys`
FROM
    `ying`.`hk_w`
ORDER BY pDate DESC;

SELECT 
    *
FROM
    hk_w
WHERE uCode = '03800';

SELECT 
    *
FROM
    hk_w
WHERE
    ucode = '00493';

-- 更新fD的值

UPDATE `ying`.`hk_w` 
SET 
    `fD` = '0';


-- 停止采集过期的权证的权证
UPDATE `ying`.`hk_w` 
SET 
    `fW` = '0'
WHERE
    eDate < CURDATE();
    
    



SELECT 
    MAX(pDate)
FROM
    ying.hk_w;

SELECT 
    *
FROM
    ying.hk_w
ORDER BY dateSys DESC;

SELECT * FROM ying.hk_w;

SELECT 
    code
FROM
    hk_w
WHERE
    uCode = '06030';
    
UPDATE ying.hk_w
  JOIN securities.hk_w ON ying.hk_w.code = securities.hk_w.code
   SET ying.hk_w.uCode = securities.hk_w.code_u  
 WHERE ying.hk_w.uCode IS NULL;
