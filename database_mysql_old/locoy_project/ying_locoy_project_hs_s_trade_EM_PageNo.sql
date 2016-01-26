ying locoy project hs_s_trade_EM_PageNo

Steps:
1. change hs_s_trade_EM_PageNo
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
	
网页: http://quote.eastmoney.com/f1.html?code=601318&market=1 
数据: http://hqdigi2.eastmoney.com/EM_Quote2010NumericApplication/CompatiblePage.aspx?Type=OB&stk=6013181&Reference=xml&limit=0&page=1& 所有成交(第一页）

var jsTimeSharingData={pages:[参数],data:["[参数],30.00,0,0";


[参数]
[参数1]: code_mkt &stk=6013181& &stk=[参数]& 从网址中提取
[参数2]: page_no jsTimeSharingData={pages:[参数],data: 
[参数3]: time 
[参数]:DateSys;

SELECT * FROM `ying`.`hs_s_trade_EM_PageNo`;	
DROP TABLE `ying`.`hs_s_trade_EM_PageNo`;
CREATE TABLE `hs_s_trade_EM_PageNo` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(18) DEFAULT NULL COMMENT 'code',
  `page_no` varchar(18) DEFAULT NULL COMMENT 'page_no',
  `mkt` varchar(18) DEFAULT NULL COMMENT 'mkt',
  `time` time DEFAULT NULL COMMENT 'Time',
  `DateSys` date DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_page_no` (`code`,`page_no`,`time`,`DateSys`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP PROCEDURE `ying`.`hs_s_trade_EM_PageNo`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_trade_EM_PageNo`(IN code_mkt VARCHAR(18), code VARCHAR(18), page_no VARCHAR(18), mkt VARCHAR(18), time TIME, DateSys DATE)
BEGIN
SET code = IF(code_mkt = '', NULL, SUBSTRING(code_mkt FROM 1 FOR 6));
SET page_no = IF(page_no = '', NULL, page_no);
SET mkt = IF(code_mkt = '', NULL, SUBSTRING(code_mkt FROM 7 FOR 7));
SET time = IF(time = '', NULL, time);
SET DateSys = CURDATE();

INSERT INTO `hs_s_trade_EM_PageNo` (`code`, `page_no`, `mkt`, `time`, `DateSys`) VALUES (code, page_no, mkt, time, DateSys) 
ON DUPLICATE KEY UPDate 
`code` = code,
`page_no` = page_no,
`mkt` = mkt,
`time` = time,
`DateSys` = DateSys;
END$$
DELIMITER ;

CALL hs_s_trade_EM_PageNo('[标签:code_mkt]','','[标签:page_no]','','[标签:time]','');

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