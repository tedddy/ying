-- Task: Migrate from table `hs_s_xts` to table `s_xts`

/* Migrate from table `hs_s_xts` to table `s_xts`: step 2 
	10:16 2015-10-21 
    change table name
	delete id, time, fR
	change code to ids, date to d
    change primary key and delete unique key, delete AUTO_INCREMENT */

-- 10:15 2015-10-21

CREATE TABLE `s_xts` (
  `ids` varchar(6) NOT NULL COMMENT 'stock id 股票代码',
  `d` date DEFAULT NULL COMMENT 'trade date 交易日期',
  `open` decimal(7,3) unsigned DEFAULT NULL COMMENT 'open 开盘价',
  `high` decimal(7,3) unsigned DEFAULT NULL COMMENT 'high 最高价',
  `low` decimal(7,3) unsigned DEFAULT NULL COMMENT 'low 最低价',
  `close` decimal(7,3) unsigned DEFAULT NULL COMMENT 'close 收盘价',
  `volume` int(11) unsigned DEFAULT NULL COMMENT 'volume 成交量',
  `amount` bigint(12) unsigned DEFAULT NULL COMMENT 'amount 股票成交额',
  `adjusted` decimal(7,3) unsigned DEFAULT NULL COMMENT 'adjusted close 复权后的收盘价',
  PRIMARY KEY (`ids`,`d`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
