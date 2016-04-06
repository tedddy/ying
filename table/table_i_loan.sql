CREATE TABLE `i_loan` (
  `idi` char(6) NOT NULL COMMENT 'index code',
  `dt` date NOT NULL,
  `i_bMargin` bigint(13) DEFAULT NULL COMMENT '指数融资余额',
  PRIMARY KEY (`idi`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT * FROM ying.i_loan order by `dt` desc;

SELECT * FROM ying.i_loan where dt < '2010-03-31';

DELETE FROM ying.i_loan where dt = '0000-00-00';

    -- update `close_d1` of table `ying`.`index_xts`    
		CALL `ying`.`index_xts_close_d1`;      
    -- update `close_d1` of table `ying`.`index_xts`    
		CALL `ying`.`index_xts_amount_d1`;    
    -- update `close_d1` of table `ying`.`index_xts`    
		CALL `ying`.`index_xts_cjezb_d1`;    

-- update value of nmc `ying`.`i_info` 流通市值 2016-02-14。
TRUNCATE table `ying`.`i_loan`;
INSERT INTO `ying`.`i_loan`
(`idi`,
`i_bMargin`)
SELECT
`ying`.`i_s`.`idi` AS `idi`,
SUM(`ying`.`s_loan`.`bMargin`) AS `i_loan`
FROM
(`ying`.`s_loan`
LEFT JOIN `ying`.`i_s` ON ((`ying`.`s_loan`.`ids` = `ying`.`i_s`.`ids`)))
WHERE
(`ying`.`i_s`.`idi` IS NOT NULL) and `ying`.`s_loan`.`dt` = '2016-03-23'
GROUP BY `ying`.`i_s`.`idi`;

SELECT 
    `ying`.`i_s`.`idi` AS `idi`,
    `ying`.`s_loan`.`dt` AS `dt`,
    SUM(`ying`.`s_loan`.`bMargin`) AS `i_loan`
FROM
    (`ying`.`s_loan`
    LEFT JOIN `ying`.`i_s` ON ((`ying`.`s_loan`.`ids` = `ying`.`i_s`.`ids`)))
WHERE
    (`ying`.`i_s`.`idi` IS NOT NULL) and `ying`.`i_s`.`idi` in ('399959','399934')
    
        AND `ying`.`s_loan`.`dt` > '2016-03-17'
GROUP BY `ying`.`i_s`.`idi`
ORDER BY `ying`.`s_loan`.`dt` DESC;

-- update value of bMargin of `ying`.`i_loan` for yesterday
TRUNCATE table `ying`.`i_loan`;
INSERT INTO `ying`.`i_loan`
(`idi`, `dt`, `i_bMargin`)
SELECT
`ying`.`i_s`.`idi` AS `idi`, `ying`.`s_loan`.`dt` AS `dt`,
SUM(`ying`.`s_loan`.`bMargin`) AS `i_loan`
FROM
(`ying`.`s_loan`
LEFT JOIN `ying`.`i_s` ON ((`ying`.`s_loan`.`ids` = `ying`.`i_s`.`ids`)))
WHERE
(`ying`.`i_s`.`idi` IS NOT NULL) and `ying`.`s_loan`.`dt` = curdate() - 1
GROUP BY `ying`.`i_s`.`idi`;

-- update value of bMargin of `ying`.`i_loan`。
TRUNCATE table `ying`.`i_loan`;
INSERT ignore INTO `ying`.`i_loan`
(`idi`,`dt`,
`i_bMargin`)
SELECT
`ying`.`i_s`.`idi` AS `idi`,
`ying`.`s_loan`.`dt` AS `dt`,
SUM(`ying`.`s_loan`.`bMargin`) AS `i_loan`
FROM
(`ying`.`s_loan`
LEFT JOIN `ying`.`i_s` ON ((`ying`.`s_loan`.`ids` = `ying`.`i_s`.`ids`)))
WHERE
(`ying`.`i_s`.`idi` IS NOT NULL) and `ying`.`s_loan`.`dt` = '2016-03-23'
GROUP BY `ying`.`i_s`.`idi`,`ying`.`s_loan`.`dt`;