SELECT * FROM ying.s_xts_adj_hst_sina_cur_day;
SELECT * FROM ying.s_xts_adj_hst_sina_cur_day where `dt` = '0000-00-00';

DELETE FROM ying.s_xts_adj_hst_sina_cur_day where `dt` = '0000-00-00';

DELETE FROM ying.s_xts_adj_hst_sina where `dt` = '0000-00-00';


CREATE TABLE `ying`.`s_xts_adj_hst_sina_cur_day` (
  `ids` varchar(6) NOT NULL COMMENT 'stock id 股票代码',
  `dt` date NOT NULL DEFAULT '0000-00-00' COMMENT 'trade date 交易日期',
  `open` decimal(10,3) unsigned NOT NULL COMMENT 'open 开盘价',
  `high` decimal(10,3) unsigned NOT NULL COMMENT 'high 最高价',
  `low` decimal(10,3) unsigned NOT NULL COMMENT 'low 最低价',
  `close` decimal(10,3) unsigned NOT NULL COMMENT 'close 收盘价',
  `volume` int(11) unsigned NOT NULL COMMENT 'volume 成交量',
  `amount` bigint(12) unsigned NOT NULL COMMENT 'amount 股票成交额',
  `fa` decimal(10,3) unsigned NOT NULL DEFAULT '0.000' COMMENT 'fa 复权因子 (factor for adjusted close)',
  PRIMARY KEY (`ids`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
