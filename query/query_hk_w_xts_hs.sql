-- TRUNCATE ying.hk_w_rt_hs;
-- DROP table ying.hk_w_rt_hs;
CREATE TABLE `hk_w_rt_hs` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(5) NOT NULL COMMENT '代码',
  `close` decimal(7,3) unsigned DEFAULT NULL COMMENT '当前价',
  `turnover` int(11) unsigned DEFAULT NULL COMMENT '权证成交额',
  `TimeSlot` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_date_time` (`code`,`TimeSlot`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

SELECT * FROM ying.hk_w_rt_hs;

SELECT * FROM ying.hk_w_rt_hs where code = '17086';

update ying.hk_w_rt_hs set TimeSlot = '2016-02-19 16:00:00' where TimeSlot > '2016-02-19 16:00:00';