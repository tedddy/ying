SELECT DISTINCT dt FROM `s_rt_hst` ORDER BY dt DESC LIMIT 200;

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

DELETE FROM `ying`.`s_rt` WHERE DATEDIFF(CURDATE(), DATE(dt)) > 3;

SELECT * FROM ying.s_rt;
