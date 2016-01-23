SELECT DISTINCT dt FROM `ying_calc`.`s_rt_hst` ORDER BY dt DESC LIMIT 200;

SELECT DISTINCT dt FROM `s_rt` ORDER BY dt DESC LIMIT 200;


-- DROP TABLE `ying_calc`.`s_rt_hst`;

CREATE TABLE `ying_calc`.`s_rt_hst` (
  `ids` varchar(6) NOT NULL COMMENT 'stock id',
  `dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `close` decimal(6,2) unsigned NOT NULL COMMENT 'close',
  `volume` int(10) unsigned NOT NULL COMMENT '成交量',
  `amount` int(10) unsigned NOT NULL COMMENT '成交额',
  `chgrate` decimal(5,2) NOT NULL COMMENT '涨跌幅',
  `WeiBi` decimal(6,2) unsigned NOT NULL COMMENT '委比',
  `chgrate5` decimal(5,2) NOT NULL COMMENT '五分钟涨幅',
  `LiangBi` decimal(6,2) unsigned NOT NULL COMMENT '量比',
  PRIMARY KEY (`ids`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- update cjezb

-- UPDATE `ying_calc`.`s_rt_hst` s
--         JOIN
--     `ying_calc`.`index_rt_hst` i ON (i.`idi` = '000902' AND s.`dt` = i.`dt`) 
-- SET 
--     s.`cjezb` = IF(i.amount > 0,
--         ROUND(10000 * s.amount / i.amount, 2),
--         0);

-- 

-- Archive s_rt: move data from s_rt to s_rt_hst

INSERT INTO `ying_calc`.`s_rt_hst`
(`ids`,
`close`,
`volume`,
`amount`,
`chgrate`,
`WeiBi`,
`chgrate5`,
`LiangBi`,
`dt`)
SELECT `s_rt`.`ids`,
    `s_rt`.`close`,
    `s_rt`.`volume`,
    `s_rt`.`amount`,
    `s_rt`.`chgrate`,
    `s_rt`.`WeiBi`,
    `s_rt`.`chgrate5`,
    `s_rt`.`LiangBi`,
    `s_rt`.`dt`
FROM `ying`.`s_rt` WHERE DATEDIFF(CURDATE(), DATE(dt)) <= 1
ON DUPLICATE KEY UPDATE
`ids` = `s_rt`.`ids`;

-- TRUNCATE `ying_calc`.`index_cons_stat_zd`;

DELETE FROM `ying`.`s_rt` WHERE dt < '2015-10-29 15:05:00';

SELECT * FROM ying.s_rt;
