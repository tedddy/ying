ying locoy project hs_loan_history_EM

Steps:
1. change hs_loan_history_EM
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
	
网址：
http://data.eastmoney.com/rzrq/detail/601318.html
数据：
http://datainterface.eastmoney.com/EM_DataCenter/JS.aspx?type=FD&sty=MTE&mkt=1&code=601318&st=0&sr=1&p=1&ps=1000&
参考：http://datainterface.eastmoney.com/EM_DataCenter/xml.aspx?type=FD&style=MTSIBC&mkt=1&code=601318 

"601318,融资融券_沪证,中国平安,27539712169,2015/8/18 0:00:00,96492,1380393,57510081.3,1837970,1636572599,1705439428,0,27597222250,21978152882" (http://datainterface.eastmoney.com/EM_DataCenter/JS.aspx?type=FD&sty=MTBD&mkt=1&p=1&ps=1000)

"601318,融资融券_沪证,中国平安,27539712169,2015/8/18,96492.00,1380393,57510081.30,1837970,1636572599.00,1705439428,27654732331.30,27597222250,68866829"

"601318,融资融券_沪证,中国平安,27510087766,2015/8/17,8200.00(融券偿还量),104500(融券卖出量),18267654.93(融券余额),554069(融券余量),1338919005.00(融资偿还额),1289804245(融资买入额),27546623075.93(融资融券余额),27528355421(融资余额),-47395394(融资净买额)"

"[参数],(*),[参数],(*),[参数],[参数],[参数],[参数],[参数],[参数],[参数],[参数],[参数],[参数]"
[参数]
[参数1]: code 代码
[网址中提取]: fSH 是否沪市
[参数2]: name 证券简称
[参数3]: date 日期
[参数4]: sCover 融券偿还量
[参数5]: sSell 融券卖出量
[参数6]: 融券余额 bStock_amount 
[参数7]: bStock 融券余量 bStock 
[参数8]: mCover 融资偿还额
[参数9]: mBuy 融资买入额
[参数10]: 融资融券余额 = 融资余额 + 融券余额
[参数11]: bMargin 融资余额
[参数12]: 融资净买额 = 融资买入额 - 融资偿还额 bMargin_net
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
	
DROP TABLE `ying`.`hs_loan_history_EM`;
CREATE TABLE `hs_loan_history_EM` (
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

DROP PROCEDURE `ying`.`hs_loan_history_EM`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_loan_history_EM`(IN in_1 VARCHAR(18), in_2 VARCHAR(18), in_3 VARCHAR(18), in_4 VARCHAR(18), in_5 VARCHAR(18), in_6 VARCHAR(18), in_7 VARCHAR(18), in_8 VARCHAR(18), in_9 VARCHAR(18), in10 VARCHAR(18), in11 VARCHAR(18), in12 VARCHAR(18), in13 VARCHAR(18), in14 VARCHAR(18), in15 VARCHAR(18), in16 VARCHAR(18), in17 VARCHAR(18), in18 VARCHAR(18), in19 VARCHAR(18), in20 VARCHAR(18), in21 VARCHAR(18), in22 VARCHAR(18), TimeSys TIME, DateSys DATE)
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

INSERT INTO `hs_loan_history_EM` (`in_1`, `in_2`, `in_3`, `in_4`, `in_5`, `in_6`, `in_7`, `in_8`, `in_9`, `in10`, `in11`, `in12`, `in13`, `in14`, `in15`, `in16`, `in17`, `in18`, `in19`, `in20`, `in21`, `in22`, `TimeSys`, `DateSys`) VALUES (in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, TimeSys, DateSys) 
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
END$$
DELIMITER ;

CALL hs_loan_history_EM('[标签:in_1]','[标签:in_2]','[标签:in_3]','[标签:in_4]','[标签:in_5]','[标签:in_6]','[标签:in_7]','[标签:in_8]','[标签:in_9]','[标签:in10]','[标签:in11]','[标签:in12]','[标签:in13]','[标签:in14]','[标签:in15]','[标签:in16]','[标签:in17]','[标签:in18]','[标签:in19]','[标签:in20]','[标签:in21]','[标签:in22]','','')

original field name		name of gxh		Chinese
zjl                     zjl             (折价率：(净值-价格)/净值) 
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
ticktime				ticktime（time）		当时时间
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
						WeiBi			委比
						LiangBi			量比
						LiangBi			5分钟涨跌


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