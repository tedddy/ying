SELECT * FROM ying.hs_index_info_china;

SELECT * FROM ying.hs_index_info_china order by code_index;

update ying.hs_index_info_china set date_start = '2015-09-30' where date_start = '2015-10-02'; 

-- url_hs_index_info_sina
SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN a.fSH = 1 THEN 'sh' ELSE 'sz' END)), a.code_index, '/ncp.shtml') as url_hs_index_info_sina FROM (select a.code_index as code_index, a.name_index as name_index, b.fW as fW, b.fD as fD, b.fSH as fSH, b.date_start as date_start from (SELECT MAX(`hs_index_info`.`code_index`) AS code_index, `hs_index_info`.`name_index` AS name_index FROM `ying`.`hs_index_info` GROUP BY `hs_index_info`.`name_index`) as a join `ying`.`hs_index_info` as b on a.code_index = b.code_index) as a;

-- url_hs_index_info_sina version after beatified
SELECT 
    CONCAT('http://finance.sina.com.cn/realstock/company/',
            (SELECT 
                    (CASE
                            WHEN a.fSH = 1 THEN 'sh'
                            ELSE 'sz'
                        END)
                ),
            a.code_index,
            '/ncp.shtml') AS url_hs_index_info_sina
FROM
    (SELECT 
        a.code_index AS code_index,
            a.name_index AS name_index,
            b.fW AS fW,
            b.fD AS fD,
            b.fSH AS fSH,
            b.date_start AS date_start
    FROM
        (SELECT 
        MAX(`hs_index_info`.`code_index`) AS code_index,
            `hs_index_info`.`name_index` AS name_index
    FROM
        `ying`.`hs_index_info`
    GROUP BY `hs_index_info`.`name_index`) AS a
    JOIN `ying`.`hs_index_info` AS b ON a.code_index = b.code_index) AS a;