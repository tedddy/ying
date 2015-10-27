SELECT DISTINCT dt FROM `s_rt_hst` ORDER BY dt DESC LIMIT 200;

CREATE TABLE `s_rt_hst` (
  `ids` VARCHAR(6) NOT NULL COMMENT 'stock id',
  `close` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'close',
  `volume` INT(10) UNSIGNED NOT NULL COMMENT '成交量',
  `amount` INT(10) UNSIGNED NOT NULL COMMENT '成交额',
  `chgrate` DECIMAL(5,2) NOT NULL COMMENT '涨跌幅',
  `WeiBi` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT '委比',
  `chgrate5` DECIMAL(5,2) NOT NULL COMMENT '五分钟涨幅',
  `LiangBi` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT '量比',
  `dt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id` MEDIUMINT(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) COMMENT 'PRIMARY AUTO_INCREMENT',
  UNIQUE KEY `unique_ids_dt` (`ids`,`dt`) COMMENT 'unique ids_dt'
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

-- Archive s_rt: move data from s_rt to s_rt_hst

INSERT INTO `ying`.`s_rt_hst`
(`ids`,
`close`,
`volume`,
`amount`,
`chgrate`,
`WeiBi`,
`chgrate5`,
`LiangBi`,
`dt`,
`id`)
SELECT `s_rt`.`ids`,
    `s_rt`.`close`,
    `s_rt`.`volume`,
    `s_rt`.`amount`,
    `s_rt`.`chgrate`,
    `s_rt`.`WeiBi`,
    `s_rt`.`chgrate5`,
    `s_rt`.`LiangBi`,
    `s_rt`.`dt`,
    `s_rt`.`id`
FROM `ying`.`s_rt` WHERE DATEDIFF(CURDATE(), DATE(dt)) <= 1
ON DUPLICATE KEY UPDATE
`id` = `s_rt`.`id`;

DELETE FROM `ying`.`s_rt` WHERE DATEDIFF(CURDATE(), DATE(dt)) > 7;

SELECT * FROM ying.s_rt;
