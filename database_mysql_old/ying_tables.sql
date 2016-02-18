CREATE TABLE `hs_s_MoneyFlow_rt_EM` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(6) DEFAULT NULL COMMENT 'code',
  `amountXL` DECIMAL(10,2) UNSIGNED DEFAULT NULL COMMENT 'amountXL',
  `amountL` DECIMAL(10,2) UNSIGNED DEFAULT NULL COMMENT 'amountL',
  `amountS` DECIMAL(9,2) UNSIGNED DEFAULT NULL COMMENT 'amountS',
  `amountI` DECIMAL(8,2) UNSIGNED DEFAULT NULL COMMENT 'amountI',
  `amountIout` DECIMAL(8,2) UNSIGNED DEFAULT NULL COMMENT 'amountIout',
  `amountSout` DECIMAL(9,2) UNSIGNED DEFAULT NULL COMMENT 'amountSout',
  `amountLout` DECIMAL(10,2) UNSIGNED DEFAULT NULL COMMENT 'amountLout',
  `amountXLout` DECIMAL(10,2) UNSIGNED DEFAULT NULL COMMENT 'amountXLout',
  `TimeSys` TIME DEFAULT NULL COMMENT 'TimeSystem',
  `DateSys` DATE DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code`,`TimeSys`,`DateSys`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `hs_s_MoneyFlow_rt` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(6) DEFAULT NULL COMMENT 'code',
  `amountXL` DECIMAL(16,4) UNSIGNED DEFAULT NULL COMMENT 'amountXL',
  `amountXLout` DECIMAL(16,4) UNSIGNED DEFAULT NULL COMMENT 'amountXLout',
  `amountXLtotal` DECIMAL(16,4) UNSIGNED DEFAULT NULL COMMENT 'amountXLtotal',
  `amountL` DECIMAL(15,4) UNSIGNED DEFAULT NULL COMMENT 'amountL',
  `amountLout` DECIMAL(15,4) UNSIGNED DEFAULT NULL COMMENT 'amountLout',
  `amountLtotal` DECIMAL(15,4) UNSIGNED DEFAULT NULL COMMENT 'amountLtotal',
  `amountS` DECIMAL(14,4) UNSIGNED DEFAULT NULL COMMENT 'amountS',
  `amountSout` DECIMAL(14,4) UNSIGNED DEFAULT NULL COMMENT 'amountSout',
  `amountStotal` DECIMAL(14,4) UNSIGNED DEFAULT NULL COMMENT 'amountStotal',
  `amountI` DECIMAL(13,4) UNSIGNED DEFAULT NULL COMMENT 'amountI',
  `amountIout` DECIMAL(13,4) UNSIGNED DEFAULT NULL COMMENT 'amountIout',
  `amountItotal` DECIMAL(13,4) UNSIGNED DEFAULT NULL COMMENT 'amountItotal',
  `capital` INT(7) UNSIGNED DEFAULT NULL COMMENT 'capital',
  `price` DECIMAL(8,4) UNSIGNED DEFAULT NULL COMMENT 'price',
  `chgratio` DECIMAL(11,8) DEFAULT NULL COMMENT 'chgratio',
  `volume` DECIMAL(15,4) UNSIGNED DEFAULT NULL COMMENT 'volume',
  `tRation` DECIMAL(7,3) UNSIGNED DEFAULT NULL COMMENT 'Date source: tRation*100; Trigger: transform to tRation ',
  `compass` VARCHAR(18) DEFAULT NULL COMMENT '主力罗盘度',
  `netAmount` VARCHAR(18) DEFAULT NULL COMMENT 'netAmount',
  `TimeSys` TIME DEFAULT NULL COMMENT 'TimeSystem',
  `DateSys` DATE DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code`,`TimeSys`,`DateSys`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `hk_w_rt` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(5) NOT NULL COMMENT '代码',
  `price` decimal(7,3) unsigned DEFAULT NULL COMMENT '当前价',
  `buy` decimal(7,3) unsigned DEFAULT NULL COMMENT '买一价',
  `sell` decimal(7,3) unsigned DEFAULT NULL COMMENT '卖一价',
  `turnover` int(11) unsigned DEFAULT NULL COMMENT '权证成交额',
  `date` date DEFAULT NULL COMMENT '日期',
  `time` time DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_date_time` (`code`,`date`,`time`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `hk_s_rt` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(5) NOT NULL COMMENT '代码',
  `price` decimal(7,3) unsigned DEFAULT NULL COMMENT '当前价',
  `buy` decimal(7,3) unsigned DEFAULT NULL COMMENT '买一价',
  `sell` decimal(7,3) unsigned DEFAULT NULL COMMENT '卖一价',
  `amount` int(11) unsigned DEFAULT NULL COMMENT '股票成交额',
  `date` date DEFAULT NULL COMMENT '日期',
  `time` time DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_date_time` (`code`,`date`,`time`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


