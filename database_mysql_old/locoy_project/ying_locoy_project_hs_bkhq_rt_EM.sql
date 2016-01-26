-- ying locoy project hs_bkhq_rt_EM
-- 
-- Steps:
-- 1. change hs_bkhq_rt_EM
-- 2. change labels by replacing one by one.
-- 	2.1 note: step 2 and step 3 can be done at the same time to save time
-- 3. create table and setup mysql procedure
-- 	3.1 note: add unique statement: UNIQUE KEY `UniqueKeyName` (``,``,``)
-- 	3.2 note: change the data type of each field & change the length of VARCHAR
-- 	3.3 note: for each field of the table, make a good comment including a standardized and consistant field, and the original label in the datasource. 
-- 4. setup locoy project: 192.168.137.172 gxh locoy ying
-- 	4.1 数据库地址：C:\火车采集器V8\Data\（*）\SpiderResult.db3
-- 5. test
-- 5.1 note: test with a few records;	

DROP TABLE `ying`.`hs_bkhq_rt_EM`;
CREATE TABLE `hs_bkhq_rt_EM` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name_bk` varchar(18) DEFAULT NULL COMMENT 'name_bk',
  `chgrate_bk` decimal(5,2) DEFAULT NULL COMMENT 'chgrate_bk',
  `mktcap_bk` decimal(8,2) unsigned DEFAULT NULL COMMENT 'mktcap_bk',
  `tRatio_bk` decimal(5,2) unsigned DEFAULT NULL COMMENT 'tRatio_bk',
  `up_no` int(4) unsigned DEFAULT NULL COMMENT 'up_no',
  `down_no` int(4) unsigned DEFAULT NULL COMMENT 'down_no',
  `code` varchar(6) DEFAULT NULL COMMENT 'code',
  `chgrate` decimal(5,2) DEFAULT NULL COMMENT 'chgrate',
  `TimeSys` time DEFAULT NULL COMMENT 'TimeSystem',
  `DateSys` date DEFAULT NULL COMMENT 'DateSystem',
  `TimeSlot` time DEFAULT NULL,
  `f_high` tinyint(1) unsigned DEFAULT '0',
  `f_low` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP PROCEDURE `ying`.`hs_bkhq_rt_EM`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_bkhq_rt_EM`(IN name_bk VARCHAR(18), chgrate_bk VARCHAR(18), mktcap_bk VARCHAR(18), tRatio_bk VARCHAR(18), up_no VARCHAR(18), down_no VARCHAR(18), code VARCHAR(18), chgrate VARCHAR(18), f_high VARCHAR(18), f_low VARCHAR(18), TimeSys TIME, DateSys DATE, TimeSlot Time)
BEGIN
SET name_bk = IF(name_bk = '', NULL, name_bk);
SET chgrate_bk = IF(chgrate_bk = '', NULL, chgrate_bk);
SET mktcap_bk = IF(mktcap_bk = '', NULL, mktcap_bk);
SET tRatio_bk = IF(tRatio_bk = '', NULL, tRatio_bk);
SET up_no = IF(up_no = '', NULL, up_no);
SET down_no = IF(down_no = '', NULL, down_no);
SET code = IF(code = '', NULL, code);
SET chgrate = IF(chgrate = '', NULL, chgrate);
SET f_high = IF(chgrate > chgrate_bk, 1, 0);
SET f_low = IF(chgrate < chgrate_bk, 1, 0);
SET TimeSys = CURTIME();
SET DateSys = CURDATE();
SET TimeSlot =  CASE WHEN TimeSys < '09:30:00' THEN '09:25:00' WHEN TimeSys < '09:40:00' THEN '09:35:00' WHEN TimeSys < '09:55:00' THEN '09:45:00' WHEN TimeSys < '10:10:00' THEN '10:00:00' WHEN TimeSys < '10:25:00' THEN '10:15:00' WHEN TimeSys < '10:40:00' THEN '10:30:00' WHEN TimeSys < '10:55:00' THEN '10:45:00' WHEN TimeSys < '11:10:00' THEN '11:00:00' WHEN TimeSys < '11:25:00' THEN '11:15:00' WHEN TimeSys < '11:40:00' THEN '11:30:00' WHEN TimeSys < '13:25:00' THEN '13:15:00' WHEN TimeSys < '13:40:00' THEN '13:30:00' WHEN TimeSys < '13:55:00' THEN '13:45:00' WHEN TimeSys < '14:10:00' THEN '14:00:00' WHEN TimeSys < '14:25:00' THEN '14:15:00' WHEN TimeSys < '14:40:00' THEN '14:30:00' WHEN TimeSys < '14:55:00' THEN '14:45:00' WHEN TimeSys < '15:30:00' THEN '15:00:00' end;


INSERT INTO `hs_bkhq_rt_EM` (`name_bk`, `chgrate_bk`, `mktcap_bk`, `tRatio_bk`, `up_no`, `down_no`, `code`, `chgrate`, `f_high`, `f_low`, `TimeSys`, `DateSys`, `TimeSlot`) VALUES (name_bk, chgrate_bk, mktcap_bk, tRatio_bk, up_no, down_no, code, chgrate, f_high, f_low, TimeSys, DateSys, TimeSlot) 
ON DUPLICATE KEY UPDate 
`name_bk` = IF(name_bk IS NULL, `name_bk`, name_bk),
`chgrate_bk` = IF(chgrate_bk IS NULL, `chgrate_bk`, chgrate_bk),
`mktcap_bk` = IF(mktcap_bk IS NULL, `mktcap_bk`, mktcap_bk),
`tRatio_bk` = IF(tRatio_bk IS NULL, `tRatio_bk`, tRatio_bk),
`up_no` = IF(up_no IS NULL, `up_no`, up_no),
`down_no` = IF(down_no IS NULL, `down_no`, down_no),
`code` = IF(code IS NULL, `code`, code),
`chgrate` = IF(chgrate IS NULL, `chgrate`, chgrate),
`f_high` = f_high,
`f_low` = f_low,
`TimeSys` = TimeSys,
`DateSys` = DateSys,
`TimeSlot` = TimeSlot;
END$$
DELIMITER ;


CALL hs_bkhq_rt_EM('[标签:name_bk]','[标签:chgrate_bk]','[标签:mktcap_bk]','[标签:tRatio_bk]','[标签:up_no]','[标签:down_no]','[标签:code]','[标签:chgrate]','','','','','')

板块名称	相关资讯	涨跌幅	总市值(亿) 	换手率	上涨家数	下跌家数	领涨股票 	涨跌幅
"航天航空,7.37%,1687.79,18.79,15,0,600184,光电股份,10.01,480,2"
"保险,-0.18%,11522.98,0.93,2,2,601336,新华保险,-1.96,474,2"
"[参数],[参数],[参数],[参数],[参数],[参数],[参数],[参数],[参数],[参数],(*)"

[参数] 
[参数1]:name_bk 板块名称
[参数2]:chgrate_bk
[参数3]:mktcap_bk
[参数4]:tRatio_bk
[参数5]:up_no
[参数6]:down_no
[参数7]:code
[参数8]:name
[参数9]:chgrate
[参数10]:info_page http://stock.eastmoney.com/hangye/hy[参数10].html

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
