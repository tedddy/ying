/*
ying_calc locoy project LocoyProjectName

Steps:
1. change LocoyProjectName
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
	
网址： http://quote.eastmoney.com/center/list.html#52_1
数据：http://183.136.160.59/EM_Quote2010NumericApplication/index.aspx?type=s&sortType=E&sortRule=-1&pageSize=20&page=1&jsName=quote_123&style=52&
参考：
源码：

"259465,25946(code),恒指摩通六八沽Ｆ(name),0.171,0.164,0.187,0.187,0.160,87872,5193040128,0.016,9.36%,0.169,15.79%,0.00%,0,100096,-2147483648,0,-1,0,0.00%,0.000,0.00%,0.000,,0.191,0.186,2016-02-17 16:01:00,2,0,0,0"

"259465,25946,恒指摩通六八沽Ｆ,0.171,0.164,0.187,0.187,0.160,87872,5193040128,0.016,9.36%,0.169,15.79%,0.00%,0,100096,-2147483648,0,-1,0,0.00%,0.000,0.00%,0.000,,0.191,0.186,2016-02-17 16:01:00,2,0,0,0"


[参数]
[参数1]: 
[参数2]: 
[参数3]: 
[参数4]: 
[参数5]: 
[参数6]: 
[参数7]: 
[参数8]: 
[参数9]: 
[参数10]: 
[参数11]: 
[参数12]: 
[参数13]: 
[参数14]: 
[参数15]: 
[参数16]: 
[参数17]: 
[参数18]: 
[参数19]: 
[参数]:DateSys
[参数]:TimeSys;
*/

SELECT * FROM `ying_calc`.`LocoyProjectName`;		
-- DROP TABLE `ying_calc`.`LocoyProjectName`;
CREATE TABLE `ying_calc`.`LocoyProjectName` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `in_1` VARCHAR(18) DEFAULT NULL COMMENT 'in_1',
  `in_2` VARCHAR(18) DEFAULT NULL COMMENT 'in_2',
  `in_3` VARCHAR(18) DEFAULT NULL COMMENT 'in_3',
  `in_4` VARCHAR(18) DEFAULT NULL COMMENT 'in_4',
  `in_5` VARCHAR(18) DEFAULT NULL COMMENT 'in_5',
  `in_6` VARCHAR(18) DEFAULT NULL COMMENT 'in_6',
  `in_7` VARCHAR(18) DEFAULT NULL COMMENT 'in_7',
  `in_8` VARCHAR(18) DEFAULT NULL COMMENT 'in_8',
  `in_9` VARCHAR(18) DEFAULT NULL COMMENT 'in_9',
  `in10` VARCHAR(18) DEFAULT NULL COMMENT 'in10',
  `in11` VARCHAR(18) DEFAULT NULL COMMENT 'in11',
  `in12` VARCHAR(18) DEFAULT NULL COMMENT 'in12',
  `in13` VARCHAR(18) DEFAULT NULL COMMENT 'in13',
  `in14` VARCHAR(18) DEFAULT NULL COMMENT 'in14',
  `in15` VARCHAR(18) DEFAULT NULL COMMENT 'in15',
  `in16` VARCHAR(18) DEFAULT NULL COMMENT 'in16',
  `in17` VARCHAR(18) DEFAULT NULL COMMENT 'in17',
  `in18` VARCHAR(18) DEFAULT NULL COMMENT 'in18',
  `in19` VARCHAR(18) DEFAULT NULL COMMENT 'in19',
  `in20` VARCHAR(18) DEFAULT NULL COMMENT 'in20',
  `in21` VARCHAR(18) DEFAULT NULL COMMENT 'in21',
  `in22` VARCHAR(18) DEFAULT NULL COMMENT 'in22',
  `TimeSys` TIME DEFAULT NULL COMMENT 'TimeSystem',
  `DateSys` DATE DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (``,``)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- DROP PROCEDURE `ying_calc`.`LocoyProjectName`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`LocoyProjectName`(IN in_1 VARCHAR(18), in_2 VARCHAR(18), in_3 VARCHAR(18), in_4 VARCHAR(18), in_5 VARCHAR(18), in_6 VARCHAR(18), in_7 VARCHAR(18), in_8 VARCHAR(18), in_9 VARCHAR(18), in10 VARCHAR(18), in11 VARCHAR(18), in12 VARCHAR(18), in13 VARCHAR(18), in14 VARCHAR(18), in15 VARCHAR(18), in16 VARCHAR(18), in17 VARCHAR(18), in18 VARCHAR(18), in19 VARCHAR(18), in20 VARCHAR(18), in21 VARCHAR(18), in22 VARCHAR(18), TimeSys TIME, DateSys DATE)
BEGIN
	SET in_1 = IF(in_1 = '', NULL, in_1);
	SET in_2 = IF(in_2 = '', NULL, in_2);
	SET in_3 = IF(in_3 = '', NULL, in_3);
	SET in_4 = IF(in_4 = '', NULL, in_4);
	SET in_5 = IF(in_5 = '', NULL, in_5);
	SET in_6 = IF(in_6 = '', NULL, in_6);
	SET in_7 = IF(in_7 = '', NULL, in_7);
	SET in_8 = IF(in_8 = '', NULL, in_8);
	SET in_9 = IF(in_9 = '', NULL, in_9);
	SET in10 = IF(in10 = '', NULL, in10);
	SET in11 = IF(in11 = '', NULL, in11);
	SET in12 = IF(in12 = '', NULL, in12);
	SET in13 = IF(in13 = '', NULL, in13);
	SET in14 = IF(in14 = '', NULL, in14);
	SET in15 = IF(in15 = '', NULL, in15);
	SET in16 = IF(in16 = '', NULL, in16);
	SET in17 = IF(in17 = '', NULL, in17);
	SET in18 = IF(in18 = '', NULL, in18);
	SET in19 = IF(in19 = '', NULL, in19);
	SET in20 = IF(in20 = '', NULL, in20);
	SET in21 = IF(in21 = '', NULL, in21);
	SET in22 = IF(in22 = '', NULL, in22);
	SET TimeSys = CURTIME();
	SET DateSys = CURDATE();

	INSERT INTO `ying_calc`.`LocoyProjectName` (`in_1`, `in_2`, `in_3`, `in_4`, `in_5`, `in_6`, `in_7`, `in_8`, `in_9`, `in10`, `in11`, `in12`, `in13`, `in14`, `in15`, `in16`, `in17`, `in18`, `in19`, `in20`, `in21`, `in22`, `TimeSys`, `DateSys`) VALUES (in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, TimeSys, DateSys) 
	ON DUPLICATE KEY UPDate 
		`in_1` = in_1,
		`in_2` = in_2,
		`in_3` = in_3,
		`in_4` = in_4,
		`in_5` = in_5,
		`in_6` = in_6,
		`in_7` = in_7,
		`in_8` = in_8,
		`in_9` = in_9,
		`in10` = in10,
		`in11` = in11,
		`in12` = in12,
		`in13` = in13,
		`in14` = in14,
		`in15` = in15,
		`in16` = in16,
		`in17` = in17,
		`in18` = in18,
		`in19` = in19,
		`in20` = in20,
		`in21` = in21,
		`in22` = in22,
		`TimeSys` = TimeSys,
		`DateSys` = DateSys;
END$$
DELIMITER ;

CALL `ying_calc`.`LocoyProjectName`('[标签:in_1]','[标签:in_2]','[标签:in_3]','[标签:in_4]','[标签:in_5]','[标签:in_6]','[标签:in_7]','[标签:in_8]','[标签:in_9]','[标签:in10]','[标签:in11]','[标签:in12]','[标签:in13]','[标签:in14]','[标签:in15]','[标签:in16]','[标签:in17]','[标签:in18]','[标签:in19]','[标签:in20]','[标签:in21]','[标签:in22]','','')



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