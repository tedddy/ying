ying locoy project hs_index_info_sina

Steps:
1. change hs_index_info_sina
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
	


CREATE TABLE `hs_index_info_sina` (
  `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(6) DEFAULT NULL COMMENT 'code',
  `name` VARCHAR(18) DEFAULT NULL COMMENT 'name',
  `name_full` VARCHAR(28) DEFAULT NULL COMMENT 'name_full',
  `TimeSys` TIME DEFAULT NULL COMMENT 'TimeSystem',
  `DateSys` DATE DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_index_info_sina`(IN code VARCHAR(18), name VARCHAR(18), name_full VARCHAR(18), TimeSys TIME, DateSys DATE)
BEGIN
SET code = IF(code = '', NULL, code);
SET name = IF(name = '', NULL, name);
SET name_full = IF(name_full = '', NULL, name_full);
SET TimeSys = CURTIME();
SET DateSys = CURDATE();

INSERT INTO `hs_index_info_sina` (`code`, `name`, `name_full`, `TimeSys`, `DateSys`) VALUES (code, name, name_full, TimeSys, DateSys) 
ON DUPLICATE KEY UPDate 
`code` = IF(code IS NULL, `code`, code),
`name` = IF(name IS NULL, `name`, name),
`name_full` = IF(name_full IS NULL, `name_full`, name_full),
`TimeSys` = TimeSys,
`DateSys` = DateSys;
END$$
DELIMITER ;

CALL hs_index_info_sina('[标签:code]','[标签:name]','[标签:name_full]','','')

original field name		name of gxh		Chinese
code					code			证券代码
symbol					code			证券代码
trade					price			成交价
pricechange				chgprice		成交价涨跌		`chgprice` decimal(6,3) DEFAULT NULL COMMENT 'chgprice',
changepercent			chgrate			成交价涨跌幅	`chgrate` decimal(5,3) DEFAULT NULL COMMENT 'chgrate',
settlement				settlement		昨日成交价
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