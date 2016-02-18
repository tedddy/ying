SELECT * FROM ying.hs_s where f300 = 1;

SELECT * FROM ying.hs_s where f50A = 1;

SELECT * FROM ying.hs_s where f300 = 1 and code = '000001' or code = '601318';

SELECT sum(mktcap), sum(nmc) FROM ying.hs_s where f300 = 1;

SELECT * FROM ying.hs_s;

SELECT count(*) FROM ying.hs_s;

SELECT * FROM ying.hs_s where code = '';

-- DELETE FROM `ying`.`hs_s` WHERE `code`='';


-- update `ying`.`hs_s` set fMKT = 2 where fSH = 0; 

-- http://hqdigi2.eastmoney.com/EM_Quote2010NumericApplication/CompatiblePage.aspx?Type=OB&stk=6013181&Reference=xml&limit=0&page=1&;
-- 
SELECT CONCAT('http://hqdigi2.eastmoney.com/EM_Quote2010NumericApplication/CompatiblePage.aspx?Type=OB&stk=', code, fMKT, '&Reference=xml&limit=0&page=1&') AS 'hs_s_trade_EM_PageNo' FROM `hs_s`;

-- http://vip.stock.finance.sina.com.cn/corp/go.php/vCI_CorpInfo/stockid/600030.phtml
-- 
SELECT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vCI_CorpInfo/stockid/', code, '.phtml') AS 'hs_s_CorpInfo' FROM `hs_s`;

select hs_s.code, hs_s.fMKT, PageNo.page_no from hs_s join hs_s_trade_EM_PageNo as PageNo on hs_s.code = PageNo.code;


SELECT CONCAT('http://hqdigi2.eastmoney.com/EM_Quote2010NumericApplication/CompatiblePage.aspx?Type=OB&stk=', url.code, url.fMKT, '&Reference=xml&limit=0&page=', url.page_no,'&') AS 'hs_s_trade_EM' FROM (select hs_s.code, hs_s.fMKT, PageNo.page_no from hs_s join hs_s_trade_EM_PageNo as PageNo on hs_s.code = PageNo.code) AS url;



SELECT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vCI_StockStructure/stockid/', code, '.phtml') AS 'url_hs_s_mktcap' FROM `hs_s`;



SELECT 
    *
FROM
    ying.hs_s where f300 = 1 and f50SH = 1;
    
SELECT 
    *
FROM
    ying.hs_s where f300 = 0 and f50SH = 1;
    
SELECT 
    *
FROM
    ying.hs_s where f300 = 1;

SELECT 
    *
FROM
    ying.hs_s
WHERE
    f300 = 1;
    
SELECT 
    *
FROM
    ying.hs_s
WHERE
    f50SH = 1;


-- 更新中证军工flag            
UPDATE ying.hs_s 
SET 
    fZZJG = 1
WHERE code IN ('000519','000547','000561','000733','000738','000748','000768','000801','000901','002013','002023','002025','002046','002049','002111','002151','002179','002190','002214','002253','002260','002268','002297','002338','002368','002405','002414','002465','002544','300008','300024','300034','300045','300053','300065','300101','300114','300123','300177','300252','300324','300354','600038','600118','600150','600151','600184','600271','600316','600343','600372','600391','600435','600456','600480','600482','600501','600523','600562','600677','600685','600760','600765','600815','600839','600855','600879','600893','600967','600990','601890','601989');

-- 增加一列 tedd
ALTER TABLE `ying`.`hs_s` 
ADD COLUMN `fZZJG` TINYINT(1) NULL DEFAULT '0' COMMENT '1: 中证国防' AFTER `fZZGF`;


-- 更新中证国防flag            
UPDATE ying.hs_s 
SET 
    fZZGF = 1
WHERE code IN ('000547','000561','000738','000768','000901','002013','002023','002025','002111','002151','002179','002190','002214','002338','002414','002465','002519','002520','300045','300101','300252','300397','600038','600118','600184','600316','600343','600372','600391','600435','600501','600562','600677','600685','600765','600855','600879','600893','600990','601989');

-- 增加一列 tedd
ALTER TABLE `ying`.`hs_s` 
ADD COLUMN `fZZGF` TINYINT(1) NULL DEFAULT '0' COMMENT '1: 中证国防' AFTER `fDSGN`;

-- 修改列
ALTER TABLE `ying`.`hs_s` 
CHANGE COLUMN `fZZGF` `fZZGF` TINYINT(1) NULL DEFAULT '0' COMMENT '1: 中证国防；指数代码：399973' ;
            
UPDATE ying.hs_s 
SET 
    fW = 5
WHERE
    code IN ('000726', '000511', '601928', '600716');
    
UPDATE ying.hs_s 
SET 
    fW = 9
WHERE
    code IN ('002183', '600550');
    
select concat('\'',code,'\'') from hs_s where f50SH = 1; -- tedd

SELECT 
    b.code
FROM
    (SELECT DISTINCT
        a.`code`
    FROM
        `ying`.`hs_bk_gp_info_EM` AS a
    JOIN ying.hs_bk_info_EM AS b ON (a.code_bk = b.code_bk)
    JOIN ying.hs_bkhq_rt_EM AS c ON (b.name_bk = c.name_bk)
    WHERE
        b.name_bk = '上证50'
            AND a.code NOT IN (SELECT 
                code
            FROM
                hs_s_sh50_rt_EM)
    ORDER BY a.`DateSys` DESC , c.`chgrate_bk` DESC) AS b;

UPDATE ying.hs_s 
SET 
    f50A = 1
WHERE
    code IN (SELECT DISTINCT
            code
        FROM
            ying.a50_s); 
            
-- 更新中证500指数
UPDATE `ying`.`hs_s` 
SET 
    f500 = 0;
    
UPDATE `ying`.`hs_s` 
SET 
    f500 = 1
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
            b.name_bk = '中证500'
        ORDER BY a.`DateSys` DESC , c.`chgrate_bk` DESC); 

-- 更新沪深300指数
UPDATE `ying`.`hs_s` 
SET 
    f300 = 0;
    
UPDATE `ying`.`hs_s` 
SET 
    f300 = 1
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
            b.name_bk = 'HS300'
        ORDER BY a.`DateSys` DESC , c.`chgrate_bk` DESC); 

-- 更新上证50指数
-- UPDATE `ying`.`hs_s` SET f50SH = 0;
    
UPDATE `ying`.`hs_s` 
SET 
    f50SH = 1
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
        ORDER BY a.`DateSys` DESC , c.`chgrate_bk` DESC); 
        
-- 更新创业板指数
UPDATE `ying`.`hs_s` 
SET 
    fCYB = 1
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
            b.name_bk = '创业板'
        ORDER BY a.`DateSys` DESC , c.`chgrate_bk` DESC); 

SELECT * FROM ying.hs_s where code IN (SELECT DISTINCT
            a.`code`
        FROM
            `ying`.`hs_bk_gp_info_EM` AS a
                JOIN
            ying.hs_bk_info_EM AS b ON (a.code_bk = b.code_bk)
                JOIN
            ying.hs_bkhq_rt_EM AS c ON (b.name_bk = c.name_bk)
        WHERE
            b.name_bk = '上证50'
        ORDER BY a.`DateSys` DESC , c.`chgrate_bk` DESC);

INSERT INTO `ying`.`hs_s`
(`code`,
`fW`)
VALUES
('600550',9);
    
SELECT 
    CONCAT('http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/MoneyFlow.ssl_qsfx_lscjfb?daima=',
            (SELECT 
                    (CASE
                            WHEN fSH = 1 THEN 'sh'
                            ELSE 'sz'
                        END)
                ),
            hs_s.code,
            '&page=',
            numbers.number,
            '&num=20&sort=opendate&asc=0') AS url_hs_s_MoneyFlow_HistoricalData
FROM
    ying.hs_s,
    ying.numbers
WHERE
    numbers.number <= 60 AND hs_s.fW = 5;