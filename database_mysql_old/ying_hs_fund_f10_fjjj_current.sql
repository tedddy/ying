SELECT * FROM ying.hs_fund_f10_fjjj_AB_current;

SELECT DISTINCT
    mother
FROM
    ying.hs_fund_f10_fjjj_AB_current;
    
SELECT DISTINCT CONCAT('http://fund.eastmoney.com/f10/jbgk_',mother,'.html') AS 'url_hs_fund_f10_mother' FROM ying.hs_fund_f10_fjjj_AB_current;



SELECT 
    f10.code, f10.index_target, info.code
FROM
    ying.hs_fund_f10_fjjj_AB_current AS f10
        JOIN
    hs_index_info_sina AS info ON f10.index_target = info.name 
UNION SELECT 
    f10.code, f10.index_target, info.code
FROM
    ying.hs_fund_f10_fjjj_AB_current AS f10
        JOIN
    hs_index_info_sina AS info ON f10.index_target = info.name_full;
    
SELECT distinct
    f10.mother, f10.index_target, info.code
FROM
    ying.hs_fund_f10_fjjj_AB_current AS f10
        JOIN
    hs_index_info_sina AS info ON f10.index_target = info.name 
UNION SELECT distinct
    f10.mother, f10.index_target, info.code
FROM
    ying.hs_fund_f10_fjjj_AB_current AS f10
        JOIN
    hs_index_info_sina AS info ON f10.index_target = info.name_full;

SELECT 
    code, cat, name, index_target
FROM
    ying.hs_fund_f10_fjjj_AB_current
WHERE
    code NOT IN (SELECT 
            f10.code
        FROM
            ying.hs_fund_f10_fjjj_AB_current AS f10
                JOIN
            hs_index_info_sina AS info ON f10.index_target = info.name UNION SELECT 
            f10.code
        FROM
            ying.hs_fund_f10_fjjj_AB_current AS f10
                JOIN
            hs_index_info_sina AS info ON f10.index_target = info.name_full);

UPDATE `ying`.`hs_fund_f10_fjjj_AB_current` SET `index_target`='中证800金融' WHERE `index_target`='中证800非银金融';
UPDATE `ying`.`hs_fund_f10_fjjj_AB_current` SET `index_target`='中证800金融' WHERE `index_target`='中证800制药与生物技术';
UPDATE `ying`.`hs_fund_f10_fjjj_AB_current` SET `index_target`='800有色' WHERE `index_target`='中证800有色';
UPDATE `ying`.`hs_fund_f10_fjjj_AB_current` SET `index_target`='移动互联' WHERE `index_target`='中证互联网';


-- UPDATE `ying`.`hs_fund_f10_fjjj_AB_current` SET `index_target`='中证800金融' WHERE `id`='17';
-- UPDATE `ying`.`hs_fund_f10_fjjj_AB_current` SET `index_target`='中证800金融' WHERE `id`='50';
-- UPDATE `ying`.`hs_fund_f10_fjjj_AB_current` SET `index_target`='中证800金融' WHERE `id`='92';
-- UPDATE `ying`.`hs_fund_f10_fjjj_AB_current` SET `index_target`='中证800金融' WHERE `id`='104';
