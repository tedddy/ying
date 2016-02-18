ying locoy project hs_fund_fjjj_jjjz

Steps:
1. change hs_fund_fjjj_jjjz
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
	
http://fund.eastmoney.com/f10/jjjz_150210.html	

http://fund.eastmoney.com/f10/F10DataApi.aspx?type=lsjz&code=150210&page=1&per=20&sdate=&edate=& (本网页的页面和页面源码在底部)

http://fund.eastmoney.com/f10/F10DataApi.aspx?type=lsjz&code=[参数]&
	
<tr><td>2015-07-24</td><td class='tor bold'>0.3600</td><td class='tor bold'>2.1390</td><td class='tor bold grn'>-3.49%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr>

<tr><td>[参数]</td><td class='(*)'>[参数]</td><td class='(*)'>[参数]</td><td class='(*)'>[参数]</td><td>[参数]</td><td>[参数]</td><td class='(*)'>[参数]</td></tr>

[参数]
[参数1]:date
[参数2]:jjjz
[参数3]:jjjz_accu
[参数4]:chgrate_jjjz 日增长率
[参数5]:sgzt (status_subscribe 申购状态)
[参数6]:shzt (status_Redemption 赎回状态)
[参数7]:fhsp divident 分红送配
[参数8]:
[参数9]:
[参数10]:
[参数11]:
[参数]:date
[参数]:time

【code】：150210
【date】：2015-07-24
【jjjz】：0.6270
【jjjz_accu】：1.7690
【chgrate_jjjz】：-2.79
【sgzt】：场内买入
【shzt】：场内卖出
【fhsp】：
;
	
DROP TABLE `ying`.`hs_fund_fjjj_jjjz`;
CREATE TABLE `hs_fund_fjjj_jjjz` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(6) DEFAULT NULL COMMENT 'code',
  `date` date DEFAULT NULL COMMENT 'date',
  `jjjz` decimal(7,4) DEFAULT NULL COMMENT 'jjjz',
  `jjjz_accu` decimal(7,4) DEFAULT NULL COMMENT 'jjjz_accu',
  `chgrate_jjjz` decimal(5,2) DEFAULT NULL COMMENT 'chgrate_jjjz',
  `sgzt` VARCHAR(18) DEFAULT NULL COMMENT 'sgzt',
  `shzt` VARCHAR(18) DEFAULT NULL COMMENT 'shzt',
  `fhsp` VARCHAR(18) DEFAULT NULL COMMENT 'fhsp',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP PROCEDURE `ying`.`hs_fund_fjjj_jjjz`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_fund_fjjj_jjjz`(IN code VARCHAR(18), date VARCHAR(18), jjjz VARCHAR(18), jjjz_accu VARCHAR(18), chgrate_jjjz VARCHAR(18), sgzt VARCHAR(18), shzt VARCHAR(18), fhsp VARCHAR(18))
BEGIN
SET code = IF(code = '', NULL, code);
SET date = IF(date = '', NULL, date);
SET jjjz = IF(jjjz = '', NULL, jjjz);
SET jjjz_accu = IF(jjjz_accu = '', NULL, jjjz_accu);
SET chgrate_jjjz = IF(chgrate_jjjz = '', NULL, chgrate_jjjz);
SET sgzt = IF(sgzt = '', NULL, sgzt);
SET shzt = IF(shzt = '', NULL, shzt);
SET fhsp = IF(fhsp = '', NULL, fhsp);

INSERT INTO `hs_fund_fjjj_jjjz` (`code`, `date`, `jjjz`, `jjjz_accu`, `chgrate_jjjz`, `sgzt`, `shzt`, `fhsp`) VALUES (code, date, jjjz, jjjz_accu, chgrate_jjjz, sgzt, shzt, fhsp) 
ON DUPLICATE KEY UPDate 
`code` = IF(code IS NULL, `code`, code),
`date` = IF(date IS NULL, `date`, date),
`jjjz` = IF(jjjz IS NULL, `jjjz`, jjjz),
`jjjz_accu` = IF(jjjz_accu IS NULL, `jjjz_accu`, jjjz_accu),
`chgrate_jjjz` = IF(chgrate_jjjz IS NULL, `chgrate_jjjz`, chgrate_jjjz),
`sgzt` = IF(sgzt IS NULL, `sgzt`, sgzt),
`shzt` = IF(shzt IS NULL, `shzt`, shzt),
`fhsp` = IF(fhsp IS NULL, `fhsp`, fhsp);
END$$
DELIMITER ;

CALL hs_fund_fjjj_jjjz('[标签:code]','[标签:date]','[标签:jjjz]','[标签:jjjz_accu]','[标签:chgrate_jjjz]','[标签:sgzt]','[标签:shzt]','[标签:fhsp]')

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

http://fund.eastmoney.com/f10/F10DataApi.aspx?type=lsjz&code=150210&page=1&per=20&sdate=&edate=&

http://fund.eastmoney.com/f10/F10DataApi.aspx?type=lsjz&code=150210&page=1&per=20&sdate=&edate=& (本网页的页面源码)

var apidata={ content:"
净值日期	单位净值	累计净值	日增长率	申购状态	赎回状态	分红送配
2015-07-24	0.6270	1.7690	-2.79%	场内买入	场内卖出	
2015-07-23	0.6450	1.7870	9.14%	场内买入	场内卖出	
2015-07-22	0.5910	1.7330	3.50%	场内买入	场内卖出	
2015-07-21	0.5710	1.7130	2.15%	场内买入	场内卖出	
2015-07-20	0.5590	1.7010	4.29%	场内买入	场内卖出	
2015-07-17	0.5360	1.6780	17.03%	场内买入	场内卖出	
2015-07-16	0.4580	1.6000	7.01%	场内买入	场内卖出	
2015-07-15	0.4280	1.5700	-18.63%	场内买入	场内卖出	
2015-07-14	0.5260	1.6680	-1.87%	场内买入	场内卖出	
2015-07-13	0.5360	1.6780	17.29%	场内买入	场内卖出	
2015-07-10	0.4570	1.5990	21.87%	场内买入	场内卖出	
2015-07-09	0.3750	1.5170	27.12%	场内买入	场内卖出	
2015-07-08	0.2950	1.4370	-21.75%	场内买入	场内卖出	
2015-07-07	0.3770	1.5190	-17.32%	场内买入	场内卖出	
2015-07-06	0.4560	1.5980	-2.56%	场内买入	场内卖出	
2015-07-03	0.4680	1.6100	-17.89%	场内买入	场内卖出	
2015-07-02	0.5700	1.7120	-15.18%	场内买入	场内卖出	
2015-07-01	0.6720	1.8140	-12.27%	场内买入	场内卖出	
2015-06-30	0.7660	1.9080	12.48%	场内买入	场内卖出	
2015-06-29	0.6810	1.8230	-11.90%	场内买入	场内卖出	
",records:143,pages:8,curpage:1};

var apidata={ content:"<table class='w782 comm lsjz'><thead><tr><th class='first'>净值日期</th><th>单位净值</th><th>累计净值</th><th>日增长率</th><th>申购状态</th><th>赎回状态</th><th class='tor last'>分红送配</th></tr></thead><tbody><tr><td>2015-07-24</td><td class='tor bold'>0.3600</td><td class='tor bold'>2.1390</td><td class='tor bold grn'>-3.49%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-07-23</td><td class='tor bold'>0.3730</td><td class='tor bold'>2.1520</td><td class='tor bold red'>5.97%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-07-22</td><td class='tor bold'>0.3520</td><td class='tor bold'>2.1310</td><td class='tor bold red'>2.62%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-07-21</td><td class='tor bold'>0.3430</td><td class='tor bold'>2.1220</td><td class='tor bold red'>0.29%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-07-20</td><td class='tor bold'>0.3420</td><td class='tor bold'>2.1210</td><td class='tor bold red'>2.40%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-07-17</td><td class='tor bold'>0.3340</td><td class='tor bold'>2.1130</td><td class='tor bold red'>6.37%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-07-16</td><td class='tor bold'>0.3140</td><td class='tor bold'>2.0930</td><td class='tor bold red'>0.96%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-07-15</td><td class='tor bold'>0.3110</td><td class='tor bold'>2.0900</td><td class='tor bold grn'>-3.72%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-07-14</td><td class='tor bold'>0.3230</td><td class='tor bold'>2.1020</td><td class='tor bold red'>5.56%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-07-13</td><td class='tor bold'>0.3060</td><td class='tor bold'>2.0850</td><td class='tor bold red'>6.25%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-07-10</td><td class='tor bold'>0.2880</td><td class='tor bold'>2.0670</td><td class='tor bold red'>1.77%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-07-09</td><td class='tor bold'>0.2830</td><td class='tor bold'>2.0620</td><td class='tor bold grn'>-7.21%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-07-08</td><td class='tor bold'>0.3050</td><td class='tor bold'>2.0840</td><td class='tor bold grn'>-16.21%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-07-07</td><td class='tor bold'>0.3640</td><td class='tor bold'>2.1430</td><td class='tor bold grn'>-17.27%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-07-06</td><td class='tor bold'>0.4400</td><td class='tor bold'>2.2190</td><td class='tor bold grn'>-3.72%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-07-03</td><td class='tor bold'>0.4570</td><td class='tor bold'>2.2360</td><td class='tor bold grn'>-12.79%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-07-02</td><td class='tor bold'>0.5240</td><td class='tor bold'>2.3030</td><td class='tor bold grn'>-12.37%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-07-01</td><td class='tor bold'>0.5980</td><td class='tor bold'>2.3770</td><td class='tor bold grn'>-10.48%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-06-30</td><td class='tor bold'>0.6680</td><td class='tor bold'>2.4470</td><td class='tor bold red'>13.41%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr><tr><td>2015-06-29</td><td class='tor bold'>0.5890</td><td class='tor bold'>2.3680</td><td class='tor bold grn'>-11.69%</td><td>场内买入</td><td>场内卖出</td><td class='red unbold'></td></tr></tbody></table>",records:868,pages:44,curpage:1};