/*
ying_calc locoy project lhb_s_trader

Steps:
1. change lhb_s_trader
2. change labels by replacing one by one.
	2.1 note: step 2 and step 3 can be done at the same time to save time
3. create table and setup mysql procedure
	3.1 note: add unique statement: UNIQUE KEY `UniqueKeyName` (``,``,``)
	3.2 note: change the data type of each field & change the length of VARCHAR
	3.3 note: for each field of the table, make a good comment including a standardized and consistant field, and the original label in the datasource. 
4. setup locoy project: 192.168.137.172 gxh locoy ying_calc
	4.1 数据库地址：C:\火车采集器V8\Data\(*)\SpiderResult.db3
5. test
	5.1 note: test with a few records
	
网址： 
数据：
参考：
源码：

"当日换手率达到20%的证券(type),14956865.1,603299.SH,0,井神股份,2016-01-25"
"当日换手率达到20%的证券,14956865.1,603299.SH,0,井神股份,2016-01-25"

"连续三个交易日内收盘价格涨幅偏离值累计20%(type),15431512.31(amount_sell),002528.SZ(ids),14561898.5(amount_buy),英飞拓(name_s),2016-02-05(dt)"
"[参数],[参数],[参数],[参数],[参数],[参数]";
*/

SELECT * FROM `ying_calc`.`lhb_s_trader`;		
-- DROP TABLE `ying_calc`.`lhb_s_trader`;
CREATE TABLE `ying_calc`.`lhb_s_trader` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_trader` varchar(10) NOT NULL,
  `type` varchar(18) DEFAULT NULL COMMENT '连续三个交易日内收盘价格涨幅偏离值累计20% -> 20\n当日涨幅偏离值达7%的证券 -> 7\n当日跌幅偏离值达7%的证券 -> -7\n当日换手率达到20%的证券 -> t20 (t: turnover)\n当日价格振幅达到15%的证券 r15 (r: range)\nS、ST、*ST连续三个交易日内跌幅偏离值累计达到15% ->  s15\n连续三个交易日内收盘价跌幅偏离值累计20% -> -20\n日均换手率与前五个交易日的日均换手率的比值达到30倍，且换手率累计达20%的证券 ta3020(t: turnover; a: acumulated)',
  `amount_sell` varchar(18) DEFAULT NULL COMMENT 'amount_sell',
  `ids` varchar(18) DEFAULT NULL COMMENT 'ids',
  `amount_buy` varchar(18) DEFAULT NULL COMMENT 'amount_buy',
  `name_s` varchar(18) DEFAULT NULL COMMENT 'name_s',
  `dt` date DEFAULT NULL COMMENT 'dt',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`id_trader`,`ids`,`dt`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2501 DEFAULT CHARSET=utf8;


-- DROP PROCEDURE `ying_calc`.`lhb_s_trader`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`lhb_s_trader`(IN id_trader VARCHAR(18), type VARCHAR(18), amount_sell VARCHAR(18), ids VARCHAR(18), amount_buy VARCHAR(18), name_s VARCHAR(18), dt VARCHAR(18))
BEGIN
	SET type = IF(type = '', NULL, type);
	SET id_trader = IF(id_trader = '', NULL, id_trader);
	SET amount_sell = IF(amount_sell = '', NULL, amount_sell);
	SET ids = IF(ids = '', NULL, ids);
	SET amount_buy = IF(amount_buy = '', NULL, amount_buy);
	SET name_s = IF(name_s = '', NULL, name_s);
	SET dt = IF(dt = '', NULL, dt);

	INSERT INTO `ying_calc`.`lhb_s_trader` (`id_trader`, `type`, `amount_sell`, `ids`, `amount_buy`, `name_s`, `dt`) VALUES (id_trader, type, amount_sell, ids, amount_buy, name_s, dt) 
	ON DUPLICATE KEY UPDate 
		`type` = type,
		`id_trader` = id_trader,
		`amount_sell` = amount_sell,
		`ids` = ids,
		`amount_buy` = amount_buy,
		`name_s` = name_s,
		`dt` = dt;
END$$
DELIMITER ;

CALL `ying_calc`.`lhb_s_trader`('[标签:id_trader]','[标签:type]','[标签:amount_sell]','[标签:ids]','[标签:amount_buy]','[标签:name_s]','[标签:dt]')



[参数]
[参数1]:code
[参数2]:name
[参数3]:settlement
[参数4]:open
[参数5]:close
[参数6]:high
[参数7]:low
[参数8]:amount
[参数9]:volume
[参数10]:chgprice
[参数11]:chgrate
[参数12]:AvgTrade
[参数13]:ZhenFu
[参数14]:WeiBi
[参数15]:WeiCha
[参数16]:NA
[参数17]:NA
[参数18]:NA
[参数19]:NA
[参数20]:chgrate_5m(五分钟涨跌)
[参数21]:LiangBi
[参数22]:tRatio
[参数23]:per
[参数24]:buy
[参数25]:sell
[参数26]:date
[参数27]:time

CREATE TABLE `hs_s_xts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL COMMENT '代码id; code id in table hk_s and in table hk_s',
  `date` date DEFAULT NULL COMMENT '交易日期; trade date',
  `open` decimal(7,3) unsigned DEFAULT NULL COMMENT '开盘价',
  `high` decimal(7,3) unsigned DEFAULT NULL COMMENT '最高价',
  `low` decimal(7,3) unsigned DEFAULT NULL COMMENT '最低价',
  `close` decimal(7,3) unsigned DEFAULT NULL COMMENT '收盘价',
  `volume` int(11) unsigned DEFAULT NULL COMMENT '成交量',
  `amount` int(11) unsigned DEFAULT NULL COMMENT '股票成交额',
  `time` time DEFAULT NULL,
  `adjusted` decimal(7,3) unsigned DEFAULT NULL COMMENT '收盘价',
  `fR` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Result of data collection\n0: fail; 1: success',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stock_date` (`code`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `hs_s_hs300_EM` (
    `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(6) DEFAULT NULL COMMENT 'code',
    `open` DECIMAL(6 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'open',
    `close` DECIMAL(6 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'close',
    `high` DECIMAL(6 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'high',
    `low` DECIMAL(6 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'low',
    `amount` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount',
    `volume` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume',
    `chgrate` DECIMAL(5 , 2 ) DEFAULT NULL COMMENT 'chgrate',
    `WeiBi` DECIMAL(6 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'WeiBi',
    `chgrate5` DECIMAL(5 , 2 ) DEFAULT NULL COMMENT 'chgrate5',
    `LiangBi` DECIMAL(6 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'LiangBi',
    `tRatio` DECIMAL(5 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'tRatio',
    `date` DATE DEFAULT NULL COMMENT 'date',
    `time` TIME DEFAULT NULL COMMENT 'time',
    PRIMARY KEY (`id`),
    UNIQUE KEY `KeyName` (`code` , `date`)
)  ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `hs_s_loan_EM` (
    `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(6) DEFAULT NULL COMMENT 'code',
    `fSH` TINYINT(1) UNSIGNED DEFAULT NULL COMMENT 'fSH',
    `name` VARCHAR(18) DEFAULT NULL COMMENT 'name',
    `date` DATE DEFAULT NULL COMMENT 'date',
    `sCover` INT(9) UNSIGNED DEFAULT NULL COMMENT 'sCover',
    `sSell` INT(9) UNSIGNED DEFAULT NULL COMMENT 'sSell',
    `bStock` INT(11) UNSIGNED DEFAULT NULL COMMENT 'bStock',
    `mCover` BIGINT(11) UNSIGNED DEFAULT NULL COMMENT 'mCover',
    `mBuy` BIGINT(11) UNSIGNED DEFAULT NULL COMMENT 'mBuy',
    `bMargin` BIGINT(12) UNSIGNED DEFAULT NULL COMMENT 'bMargin',
    PRIMARY KEY (`id`),
    UNIQUE KEY `KeyName` (`code` , `date`)
)  ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `hs_fund_b_jsl` (
    `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
    `code_m` VARCHAR(6) DEFAULT NULL COMMENT 'code_m',
    `code_b` VARCHAR(6) DEFAULT NULL COMMENT 'code_b',
    `price_b` DECIMAL(6 , 3 ) UNSIGNED DEFAULT NULL COMMENT 'price_b',
    `chgrate_p` DECIMAL(6 , 3 ) DEFAULT NULL COMMENT 'chgrate_p',
    `amount` DECIMAL(8 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'amount',
    `jjjz_b` DECIMAL(7 , 4 ) UNSIGNED DEFAULT NULL COMMENT 'jjjz_b',
    `date` DATE DEFAULT NULL COMMENT 'date',
    `yjl` DECIMAL(6 , 3 ) DEFAULT NULL COMMENT 'yjl',
    `leverate_p` DECIMAL(6 , 3 ) UNSIGNED DEFAULT NULL COMMENT 'leverate_p',
    `leverate_j` DECIMAL(6 , 3 ) UNSIGNED DEFAULT NULL COMMENT 'leverate_j',
    `cost_c` DECIMAL(5 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'cost_c',
    `recal_l` DECIMAL(5 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'recal_l',
    `recal_u` DECIMAL(5 , 2 ) UNSIGNED DEFAULT NULL COMMENT 'recal_u',
    `jjjz_b_est` DECIMAL(6 , 3 ) UNSIGNED DEFAULT NULL COMMENT 'jjjz_b_est',
    `code_index` VARCHAR(6) DEFAULT NULL COMMENT 'code_index',
    `chgrate_index` DECIMAL(5 , 2 ) DEFAULT NULL COMMENT 'chgrate_index',
    `a_ratio` TINYINT(1) DEFAULT NULL COMMENT 'a_ratio',
    `b_ratio` TINYINT(1) DEFAULT NULL COMMENT 'b_ratio',
    `jjjz_m` DECIMAL(6 , 4 ) UNSIGNED DEFAULT NULL COMMENT 'jjjz_m',
    `yjl_m_est` DECIMAL(6 , 3 ) DEFAULT NULL COMMENT 'yjl_m_est',
    `ticktime` TIME DEFAULT NULL COMMENT 'ticktime',
    PRIMARY KEY (`id`),
    UNIQUE KEY `KeyName` (`code_b` , `date`)
)  ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;