CREATE TABLE `hs_s_sina` (
  `id` mediumint(12) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(18) NOT NULL COMMENT 'code',
  `price` varchar(18) DEFAULT NULL COMMENT 'lasttrade',
  `chgprice` decimal(6,3) DEFAULT NULL COMMENT 'chgprice',  
  `chgrate` decimal(5,3) DEFAULT NULL COMMENT 'chgrate',
  `buy` decimal(7,3) DEFAULT NULL COMMENT 'buy',
  `sell` decimal(7,3) DEFAULT NULL COMMENT 'sell',
  `close` decimal(7,3) DEFAULT NULL COMMENT 'close',
  `open` decimal(7,3) DEFAULT NULL COMMENT 'open',
  `high` decimal(7,3) DEFAULT NULL COMMENT 'high',
  `low` decimal(7,3) DEFAULT NULL COMMENT 'low',
  `volume` bigint(15) DEFAULT NULL COMMENT '单位：元（数据采集时为手，在procedure里用函数换算为股）',
  `amount` bigint(15) DEFAULT NULL COMMENT '单位：元',
  `per` decimal(7,3) DEFAULT NULL COMMENT 'per',
  `pb` decimal(7,3) DEFAULT NULL COMMENT 'pb',
  `mktcap` decimal(16,4) DEFAULT NULL COMMENT '单位：股 round in procedure',
  `nmc` decimal(16,4) DEFAULT NULL COMMENT '单位：股 round in procedure',
  `tRatio` decimal(7,3) unsigned DEFAULT NULL COMMENT 'Date source: tRatio*100; Trigger: transform to tRatio',
  `ticktime` time DEFAULT NULL COMMENT 'ticktime',
  `DateSys` date NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_ticktime` (`code`,`ticktime`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `hs300_s_data` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(8) DEFAULT NULL COMMENT 'code',
  `name` varchar(12) DEFAULT NULL COMMENT 'name',
  `weight` decimal(4,2) DEFAULT NULL COMMENT 'weight',
  `gxzs` decimal(6,3) DEFAULT NULL COMMENT '贡献指数',
  `iName` varchar(12) DEFAULT NULL COMMENT 'iName',
  `iCode` varchar(8) DEFAULT NULL COMMENT 'iCode',
  `nmc` decimal(16,4) DEFAULT NULL COMMENT '单位：股 round in procedure',
  `mktcap` decimal(16,4) DEFAULT NULL COMMENT '单位：股 round in procedure',
  `last` decimal(7,3) DEFAULT NULL COMMENT '昨收盘',
  `chgprice` decimal(6,3) DEFAULT NULL COMMENT 'chgprice',
  `chgrate` decimal(5,3) DEFAULT NULL COMMENT 'chgrate',
  `buy` decimal(7,3) DEFAULT NULL COMMENT 'buy',
  `sell` decimal(7,3) DEFAULT NULL COMMENT 'sell',
  `close` decimal(7,3) DEFAULT NULL COMMENT 'close',
  `open` decimal(7,3) DEFAULT NULL COMMENT 'open',
  `high` decimal(7,3) DEFAULT NULL COMMENT 'high',
  `low` decimal(7,3) DEFAULT NULL COMMENT 'low',
  `volume` bigint(15) DEFAULT NULL COMMENT '单位：元（数据采集时为手，在procedure里用函数换算为股）',
  `amount` bigint(15) DEFAULT NULL COMMENT '单位：元',
  `ltsz` decimal(15,2) DEFAULT NULL COMMENT '单位：元',
  `TimeSys` time DEFAULT NULL COMMENT 'TimeSystem',
  `DateSys` date DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code`,`TimeSys`,`DateSys`)
) ENGINE=InnoDB AUTO_INCREMENT=26372 DEFAULT CHARSET=utf8;

CREATE TABLE `hs_s_MoneyFlow_rt` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL COMMENT 'code',
  `amountXL` decimal(16,4) unsigned DEFAULT NULL COMMENT 'amountXL',
  `amountXLout` decimal(16,4) unsigned DEFAULT NULL COMMENT 'amountXLout',
  `amountXLtotal` decimal(16,4) unsigned DEFAULT NULL COMMENT 'amountXLtotal',
  `amountL` decimal(15,4) unsigned DEFAULT NULL COMMENT 'amountL',
  `amountLout` decimal(15,4) unsigned DEFAULT NULL COMMENT 'amountLout',
  `amountLtotal` decimal(15,4) unsigned DEFAULT NULL COMMENT 'amountLtotal',
  `amountS` decimal(14,4) unsigned DEFAULT NULL COMMENT 'amountS',
  `amountSout` decimal(14,4) unsigned DEFAULT NULL COMMENT 'amountSout',
  `amountStotal` decimal(14,4) unsigned DEFAULT NULL COMMENT 'amountStotal',
  `amountI` decimal(13,4) unsigned DEFAULT NULL COMMENT 'amountI',
  `amountIout` decimal(13,4) unsigned DEFAULT NULL COMMENT 'amountIout',
  `amountItotal` decimal(13,4) unsigned DEFAULT NULL COMMENT 'amountItotal',
  `capital` int(7) unsigned DEFAULT NULL COMMENT 'capital',
  `price` decimal(8,4) unsigned DEFAULT NULL COMMENT 'price',
  `chgratio` decimal(11,8) DEFAULT NULL COMMENT 'chgratio',
  `volume` decimal(15,4) unsigned DEFAULT NULL COMMENT 'volume',
  `tRatio` decimal(7,3) unsigned DEFAULT NULL COMMENT 'Date source: tRatio*100; Trigger: transform to tRatio',
  `compass` varchar(18) DEFAULT NULL COMMENT '主力罗盘度',
  `netAmount` varchar(18) DEFAULT NULL COMMENT 'netAmount',
  `TimeSys` time DEFAULT NULL COMMENT 'TimeSystem',
  `DateSys` date DEFAULT NULL COMMENT 'DateSystem',
  `DatetimeSys` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code`,`TimeSys`,`DateSys`)
) ENGINE=InnoDB AUTO_INCREMENT=2063059 DEFAULT CHARSET=utf8;



【code】：603998
【fSH】：1
【trade】：41.88
【pricechange】：3.810
【changepercent】：10.008
【buy】：41.88
【sell】：0.00
【settlement】：38.07
【open】：36.90
【high】：41.88
【low】：35.08
【volume】：13617826
【amount】：553750069
【ticktime】：15:03:03
【per】：43.625
【pb】：5.511
【mktcap】：593574.62112
【nmc】：148414.344
【turnoverratio】：38.42719
