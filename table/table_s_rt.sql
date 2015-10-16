SELECT * FROM `ying`.`s_rt` order by dt desc, ids;
SELECT * FROM `ying`.`s_rt` where volume <= 0 and amount <=0 and weibi<=0;
SELECT * FROM `ying`.`s_rt` where time(dt) = '15:00:00' order by volume;

DELETE FROM `ying`.`s_rt` where close <= 0.0; 

-- DELETE FROM `ying`.`s_rt` where dt = '0000-00-00 00:00:00'; 
-- DELETE FROM `ying`.`hs_s_rt_EM` where TimeSlot = '0000-00-00 00:00:00'; 


-- DROP TABLE IF EXISTS `ying`.`s_rt`;

CREATE TABLE `ying`.`s_rt` (
  `ids` VARCHAR(6) NOT NULL COMMENT 'stock id',
  `close` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT '收盘价或当前价',
  `volume` INT(10) UNSIGNED NOT NULL COMMENT '成交量',
  `amount` INT(10) UNSIGNED NOT NULL COMMENT '成交额',
  `chgrate` DECIMAL(5,2) NOT NULL COMMENT '涨跌幅',
  `WeiBi` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT '委比',
  `chgrate5` DECIMAL(5,2) NOT NULL COMMENT '五分钟涨幅',
  `LiangBi` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT '量比',
  `dt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ids`,`dt`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE `s_rt` (
  `ids` varchar(6) NOT NULL COMMENT 'stock id',
  `close` decimal(6,2) unsigned NOT NULL COMMENT 'close',
  `volume` int(10) unsigned NOT NULL COMMENT 'volume',
  `amount` int(10) unsigned NOT NULL COMMENT 'amount',
  `chgrate` decimal(5,2) NOT NULL COMMENT '涨跌幅',
  `WeiBi` decimal(6,2) unsigned NOT NULL COMMENT '委比',
  `chgrate5` decimal(5,2) NOT NULL COMMENT '五分钟涨幅',
  `LiangBi` decimal(6,2) unsigned NOT NULL COMMENT '量比',
  `dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ids`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `s_rt` ( `s_rt`.`ids`,
    `s_rt`.`close`,
    `s_rt`.`volume`,
    `s_rt`.`amount`,
    `s_rt`.`chgrate`,
    `s_rt`.`WeiBi`,
    `s_rt`.`chgrate5`,
    `s_rt`.`LiangBi`,
    `s_rt`.`dt`)
SELECT `hs_s_rt_EM`.`code`,
    `hs_s_rt_EM`.`close`,
    `hs_s_rt_EM`.`volume`,
    `hs_s_rt_EM`.`amount`,
    `hs_s_rt_EM`.`chgrate`,
    `hs_s_rt_EM`.`WeiBi`,
    `hs_s_rt_EM`.`chgrate5`,
    `hs_s_rt_EM`.`LiangBi`,
    `hs_s_rt_EM`.`TimeSlot`
FROM `ying`.`hs_s_rt_EM`;

