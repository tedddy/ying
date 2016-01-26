ying locoy project LocoyProjectName

Steps:
1. change LocoyProjectName
2. change labels by replacing one by one.
	2.1 note: step 2 and step 3 can be done at the same time to save time
3. create table and setup mysql procedure
	3.1 note: add unique statement: UNIQUE KEY `UniqueKeyName` (``,``,``)
	3.2 note: change the data type of each field & change the length of VARCHAR
	3.3 note: for each field of the table, make a good comment including a standardized and consistant field, and the original label in the datasource. 
4. setup locoy project: 192.168.137.172 gxh locoy ying
	4.1 数据库地址：C:\火车采集器V8\Data\（*）\SpiderResult.db3
5. test
	5.1 note: test with a few records
	
CREATE TABLE `hs_index_xts_EM` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL COMMENT '代码id; code id in table hk_s and in table hk_s',
  `date` date DEFAULT NULL COMMENT '交易日期; trade date',
  `open` decimal(9,2) unsigned DEFAULT NULL COMMENT '开盘价',
  `high` decimal(9,2) unsigned DEFAULT NULL COMMENT '最高价',
  `low` decimal(9,2) unsigned DEFAULT NULL COMMENT '最低价',
  `close` decimal(9,2) unsigned DEFAULT NULL COMMENT '收盘价',
  `volume` int(11) unsigned DEFAULT NULL COMMENT '成交量',
  `amount` bigint(12) unsigned DEFAULT NULL COMMENT '股票成交额',
  `time` time DEFAULT NULL,
  `adjusted` decimal(9,2) unsigned DEFAULT NULL COMMENT '调整收盘价',
  `fSH` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Result of data collection\n0: sz; 1: sh',
  `fR` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Result of data collection\n0: fail; 1: success',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_date_time` (`code`,`date`,`time`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_index_xts_EM`(IN code VARCHAR(6), date DATE, open DECIMAL(9,2), high DECIMAL(9,2), low DECIMAL(9,2), close DECIMAL(9,2), volume BIGINT(11) UNSIGNED, amount BIGINT(12) UNSIGNED, time VARCHAR(9), fSH VARCHAR(9))
BEGIN
SET code = IF(code = '', NULL, code);
SET date = IF(date = '', NULL, Date);
SET open = IF(open = '', NULL, open);
SET high = IF(high = '', NULL, high);
SET low = IF(low = '', NULL, low);
SET close = IF(close = '', NULL, close);
SET volume = IF(volume = '', NULL, volume);
SET amount = IF(amount = '', NULL, amount);
SET time = IF(time = '', NULL, time);
SET fSH = IF(fSH = '', NULL, fSH);

INSERT INTO `hs_index_xts_EM` (`code`, `date`, `open`, `high`, `low`, `close`, `volume`, `amount`, `time`,  `fSH`) VALUES (code, date, open, high, low, close, volume, amount, time, fSH) 
ON DUPLICATE KEY UPDate
	`open` = IF(open IS NULL, `open`, open),
	`high` = IF(high IS NULL, `high`, high),
	`low` = IF(low IS NULL, `low`, low),
	`close` = IF(close IS NULL, `close`, close),
	`volume` = IF(volume IS NULL, `volume`, volume),
	`amount` = IF(amount IS NULL, `amount`, amount),
	`time` = IF(time IS NULL, `time`, time),
	`fSH` = IF(fSH IS NULL, `fSH`, fSH);

END$$
DELIMITER ;


CALL hs_index_xts_EM('[标签:code]', '[标签:date]', '[标签:open]', '[标签:high]', '[标签:low]', '[标签:close]', '[标签:volume]', '[标签:amount]', '[标签:time]') 

"3993072,399307,深证转债,214.38,234.64,235.08,245.30,217.78,96593,66584,20.69,9.65%,145.07,12.84%,0.00%,0,392,66584,0,-1,-1,0.19%,0.00,0.00%,0.00,,0.00,0.00,2015-07-17 15:05:00,7,0,0,0"
 
code: 
"(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"
name
"(*),(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"
open
"(*),(*),(*),(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"
high
"(*),(*),(*),(*),(*),(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"
low
"(*),(*),(*),(*),(*),(*),(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"
price
"(*),(*),(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"
volume
"(*),(*),(*),(*),(*),(*),(*),(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"
amount
"(*),(*),(*),(*),(*),(*),(*),(*),(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"
datetime
"(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),[参数],(*),(*),(*),(*)"

original field name		name of gxh		Chinese
code					code			证券代码
symbol					code			证券代码
trade					price			成交价
pricechange				chgprice		成交价涨跌		`chgprice` decimal(6,3) DEFAULT NULL COMMENT 'chgprice',
changepercent			chgrate			成交价涨跌幅	`chgrate` decimal(5,3) DEFAULT NULL COMMENT 'chgrate',
settlement				close			昨日成交价
buy						buy				买入价
sell					sell			卖出价
open					open			开盘价
high					high			最高价
low						low				最低价
volume					volume			成交量
amount					amount			成交额
ticktime				ticktime		当时时间
per						per				市盈率
pb						pb				市净率
mktcap					mktcap			总股本
nmc						nmc				流通股本
turnoverratio			tRatio			换手率
WEIGHING				weight			权重
INAME					iName			指数名称
HYSYMBOL				iCode			指数代码	
ltgb					nmc				流通股本
zgb						mktcap			总股本
prevtrade				last			昨收盘
gxzs					gxzs			贡献指数
ltsz					ltsz			流通市值
netamount				netAmount		净流入
ratioamount				netRate			净流入率
r0						amountXL		特大单流入额 超大单流入
r1						amountL		    大单流入额 大单流入
r2						amountS			小单流入额 中单流入
r3						amountI			散单流入额(I: individual) 小单流入
r0_net					netXL			特大单净流入 超大单净流入
r1_net					netL		    大单净流入 
r2_net					netS			小单净流入 中单净流入
r3_net					netI			散单净流入(I: individual) 小单净流入
turnover				amount			换手率*100
r0x_ratio				ratioXL			主力罗盘度
