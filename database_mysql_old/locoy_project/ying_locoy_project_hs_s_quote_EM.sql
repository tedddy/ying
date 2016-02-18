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
	
url: http://hqdigi2.eastmoney.com/EM_Quote2010NumericApplication/CompatiblePage.aspx?Type=fs&jsName=js&stk=1502102

var js={skif:"2,150210,国企改B,0.932,0.085,10.04%,,,0.900,0.847,0.932,0.888,0.00%,0.000,1.510,5.19%,0.924,33858057,420344,312681,,,19280894,14577162,100.00%,803329,1,2015-07-24 15:05:00,-1",bsif:["0.000,0,0","0.000,0,0","0.000,0,0","0.000,0,0","0.000,0,0","0.932,502245,0","0.931,158697,0","0.930,53723,0","0.929,39727,0","0.928,48936,0"],dtif:["15:00:25,0.932,420344,-1","14:57:15,0.931,7404,-1","14:56:57,0.931,51671,1","14:56:45,0.930,21498,1","14:56:33,0.929,52398,1","14:56:21,0.928,70956,1","14:56:12,0.928,92635,-1","14:56:00,0.928,148965,-1","14:55:48,0.929,151426,1","14:55:39,0.929,111161,1","14:55:27,0.928,144883,-1","14:55:18,0.929,93942,1","14:55:06,0.929,49805,1","14:54:54,0.927,24595,1","14:54:45,0.925,40008,1","14:54:33,0.919,30834,1","14:54:24,0.916,26919,1","14:54:12,0.914,33229,1","14:54:00,0.910,68495,1","14:53:51,0.906,25438,0","14:53:39,0.903,69898,1","14:53:24,0.902,66144,1","14:53:15,0.900,74111,1","14:53:03,0.899,44978,1","14:52:54,0.898,140146,-1"],dpif:["1,000001,上证指数,4070.91,-53.01,-1.29%,80637840,228,131,755,,,,,,1","2,399001,深证成指,13518.51,-236.01,-1.72%,74418313,328,418,1019,,,,,,1"]};

CREATE TABLE `LocoyProjectName` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
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

CREATE DEFINER=`gxh`@`%` PROCEDURE `LocoyProjectName`(IN in_1 VARCHAR(18), in_2 VARCHAR(18), in_3 VARCHAR(18), in_4 VARCHAR(18), in_5 VARCHAR(18), in_6 VARCHAR(18), in_7 VARCHAR(18), in_8 VARCHAR(18), in_9 VARCHAR(18), in10 VARCHAR(18), in11 VARCHAR(18), in12 VARCHAR(18), in13 VARCHAR(18), in14 VARCHAR(18), in15 VARCHAR(18), in16 VARCHAR(18), in17 VARCHAR(18), in18 VARCHAR(18), in19 VARCHAR(18), in20 VARCHAR(18), in21 VARCHAR(18), in22 VARCHAR(18), TimeSys TIME, DateSys DATE)
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

INSERT INTO `LocoyProjectName` (`in_1`, `in_2`, `in_3`, `in_4`, `in_5`, `in_6`, `in_7`, `in_8`, `in_9`, `in10`, `in11`, `in12`, `in13`, `in14`, `in15`, `in16`, `in17`, `in18`, `in19`, `in20`, `in21`, `in22`, `TimeSys`, `DateSys`) VALUES (in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, TimeSys, DateSys) 
ON DUPLICATE KEY UPDate 
`in_1` = IF(in_1 IS NULL, `in_1`, in_1),
`in_2` = IF(in_2 IS NULL, `in_2`, in_2),
`in_3` = IF(in_3 IS NULL, `in_3`, in_3),
`in_4` = IF(in_4 IS NULL, `in_4`, in_4),
`in_5` = IF(in_5 IS NULL, `in_5`, in_5),
`in_6` = IF(in_6 IS NULL, `in_6`, in_6),
`in_7` = IF(in_7 IS NULL, `in_7`, in_7),
`in_8` = IF(in_8 IS NULL, `in_8`, in_8),
`in_9` = IF(in_9 IS NULL, `in_9`, in_9),
`in10` = IF(in10 IS NULL, `in10`, in10),
`in11` = IF(in11 IS NULL, `in11`, in11),
`in12` = IF(in12 IS NULL, `in12`, in12),
`in13` = IF(in13 IS NULL, `in13`, in13),
`in14` = IF(in14 IS NULL, `in14`, in14),
`in15` = IF(in15 IS NULL, `in15`, in15),
`in16` = IF(in16 IS NULL, `in16`, in16),
`in17` = IF(in17 IS NULL, `in17`, in17),
`in18` = IF(in18 IS NULL, `in18`, in18),
`in19` = IF(in19 IS NULL, `in19`, in19),
`in20` = IF(in20 IS NULL, `in20`, in20),
`in21` = IF(in21 IS NULL, `in21`, in21),
`in22` = IF(in22 IS NULL, `in22`, in22),
`TimeSys` = TimeSys,
`DateSys` = DateSys;
END

CALL LocoyProjectName('[标签:in_1]','[标签:in_2]','[标签:in_3]','[标签:in_4]','[标签:in_5]','[标签:in_6]','[标签:in_7]','[标签:in_8]','[标签:in_9]','[标签:in10]','[标签:in11]','[标签:in12]','[标签:in13]','[标签:in14]','[标签:in15]','[标签:in16]','[标签:in17]','[标签:in18]','[标签:in19]','[标签:in20]','[标签:in21]','[标签:in22]','','')

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