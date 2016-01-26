ying locoy project hs_fund_b_jsl

Steps:
1. change hs_fund_b_jsl
2. change labels by replacing one by one.
	2.1 note: step 2 and step 3 can be done at the same time to save time
3. create table and setup mysql procedure
	3.1 note: add unique statement: UNIQUE KEY `UniqueKeyName` (``,``,``)
	3.2 note: change the data type of each field & change the length of VARCHAR
	3.3 note: for each field of the table, make a good comment including a standardized and consistant field, and the original label in the datasource. 
4. setup locoy project: 192.168.137.172 gxh locoy ying
	4.1 数据库地址：C:\火车采集器V8\Data\(*)\SpiderResult.db3
5. test
	5.1 note: test with a few records

网页： http://www.jisilu.cn/data/sfnew/#tlink_2 
数据： http://www.jisilu.cn/data/sfnew/fundb_list/? 

{"fundb_base_fund_id":"160718","fundb_id":"150033","fundb_name":"\u591a\u5229\u8fdb\u53d6","status_cd":"N","recalc_to":null,"calc_info":null,"upper_recalc_price":null,"maturity_dt":null,"fundb_current_price":"1.211","fundb_increase_rt":"0.67%","fundb_volume":"30.23","fundb_value":"1.1210","fundb_nav_dt":"2015-08-07","fundb_discount_rt":"8.03%","fundb_price_leverage_rt":"4.290","fundb_net_leverage_rt":"4.634","fundb_capital_rasising_rt":"22.01%","fundb_lower_recalc_rt":"13.88%","fundb_upper_recalc_rt":"-","fundb_left_year":"\u6c38\u7eed","b_est_val":"1.108","fundb_index_id":"399923","fundb_index_name":"\u503a\u5238\u603b\u6307","fundb_index_increase_rt":"0.07%","funda_ratio":8,"fundb_ratio":2,"fundb_base_price":"1.0390","fundb_base_est_dis_rt":"-0.462%","last_time":"15:02:48","owned":0,"abrate":"8:2","fundb_base_est_dis_rt_tip":""}

{"fundb_base_fund_id":"[参数]","fundb_id":"[参数]","fundb_name":"(*)","status_cd":"(*)","recalc_to":(*),"calc_info":(*),"upper_recalc_price":(*),"maturity_dt":(*),"fundb_current_price":"[参数]","fundb_increase_rt":"[参数]","fundb_volume":"[参数]","fundb_value":"[参数]","fundb_nav_dt":"[参数]","fundb_discount_rt":"[参数]","fundb_price_leverage_rt":"[参数]","fundb_net_leverage_rt":"[参数]","fundb_capital_rasising_rt":"[参数]","fundb_lower_recalc_rt":"[参数]","fundb_upper_recalc_rt":"[参数]","fundb_left_year":"(*)","b_est_val":"[参数]","fundb_index_id":"[参数]","fundb_index_name":"(*)","fundb_index_increase_rt":"[参数]","funda_ratio":[参数],"fundb_ratio":[参数],"fundb_base_price":"[参数]","fundb_base_est_dis_rt":"[参数]","last_time":"[参数]","owned":(*),"abrate":"(*)","fundb_base_est_dis_rt_tip":"(*)"}
	
[参数]
[参数1]: code_m 母基金代码 
[参数2]: code_b b基金代码 
[参数3]: price_b b基金价格 
[参数4]: chgrate_p 价格涨幅
[参数5]: amount 成交额（万元）
[参数6]: jjjz_b b基金净值
[参数7]: date
[参数8]: yjl 溢价率 fundb_discount_rt
[参数9]: leverage_p 价格杠杆 fundb_price_leverage_rt
[参数10]: leverage_j 净值杠杆 fundb_net_leverage_rt
[参数11]: cost_c 融资成本 cost_capital
[参数12]: recal_l 下折母基需跌 fundb_lower_recalc_rt
[参数13]: recal_u 上折母基需涨 fundb_upper_recalc_rt
[参数14]: jjjz_b_est 估计b基金净值
[参数15]: code_index 标的指数代码
[参数16]: chgrate_index 指数涨幅
[参数17]: a_ratio a基金比例
[参数18]: b_ratio b基金比例
[参数19]: jjjz_m 母基金净值
[参数20]: yjl_m_est 整体溢价率（估计） fundb_base_est_dis_rt
[参数21]: ticktime
[参数]:date
[参数]:time;

【code_mother】：160718
【code_b】：150033
【price_b】：1.211
【chgrate_p】：0.67
【amount】：30.23
【jjjz_b】：1.1210
【date】：2015-08-07
【yjl】：8.03
【leverage_p】：4.290
【leverage_j】：4.634
【cost_c】：22.01
【recal_l】：13.88
【recal_u】：
【jjjz_b_est】：1.108
【code_index】：399923
【chgrate_index】：0.07
【a_ratio】：8
【b_ratio】：2
【jjjz_m】：1.0390
【yjl_m_est】：-0.462
【ticktime】：15:02:48

	
DROP TABLE `ying`.`hs_fund_b_jsl`;
CREATE TABLE `hs_fund_b_jsl` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code_m` VARCHAR(6) DEFAULT NULL COMMENT 'code_m',
  `code_b` VARCHAR(6) DEFAULT NULL COMMENT 'code_b',
  `price_b` decimal(6,3) unsigned DEFAULT NULL COMMENT 'price_b',
  `chgrate_p` decimal(6,3) DEFAULT NULL COMMENT 'chgrate_p',
  `amount` decimal(8,2) unsigned DEFAULT NULL COMMENT 'amount',
  `jjjz_b` decimal(7,4) unsigned DEFAULT NULL COMMENT 'jjjz_b',
  `date` date DEFAULT NULL COMMENT 'date',
  `yjl` decimal(6,3) DEFAULT NULL COMMENT 'yjl',
  `leverate_p` decimal(6,3) unsigned DEFAULT NULL COMMENT 'leverate_p',
  `leverate_j` decimal(6,3) unsigned DEFAULT NULL COMMENT 'leverate_j',
  `cost_c` decimal(5,2) unsigned DEFAULT NULL COMMENT 'cost_c',
  `recal_l` decimal(5,2) unsigned DEFAULT NULL COMMENT 'recal_l',
  `recal_u`decimal(5,2) unsigned DEFAULT NULL COMMENT 'recal_u',
  `jjjz_b_est` decimal(6,3) unsigned DEFAULT NULL COMMENT 'jjjz_b_est',
  `code_index` VARCHAR(6) DEFAULT NULL COMMENT 'code_index',
  `chgrate_index` decimal(5,2) DEFAULT NULL COMMENT 'chgrate_index',
  `a_ratio` tinyint(1) DEFAULT NULL COMMENT 'a_ratio',
  `b_ratio` tinyint(1) DEFAULT NULL COMMENT 'b_ratio',
  `jjjz_m` decimal(6,4) unsigned DEFAULT NULL COMMENT 'jjjz_m',
  `yjl_m_est` decimal(6,3) DEFAULT NULL COMMENT 'yjl_m_est',
  `ticktime` time DEFAULT NULL COMMENT 'ticktime',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code_b`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP PROCEDURE `ying`.`hs_fund_b_jsl`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_fund_b_jsl`(IN code_m VARCHAR(18), code_b VARCHAR(18), price_b VARCHAR(18), chgrate_p VARCHAR(18), amount VARCHAR(18), jjjz_b VARCHAR(18), date VARCHAR(18), yjl VARCHAR(18), leverate_p VARCHAR(18), leverate_j VARCHAR(18), cost_c VARCHAR(18), recal_l VARCHAR(18), recal_u VARCHAR(18), jjjz_b_est VARCHAR(18), code_index VARCHAR(18), chgrate_index VARCHAR(18), a_ratio VARCHAR(18), b_ratio VARCHAR(18), jjjz_m VARCHAR(18), yjl_m_est VARCHAR(18), ticktime VARCHAR(18))
BEGIN
SET code_m = IF(code_m = '', NULL, code_m);
SET code_b = IF(code_b = '', NULL, code_b);
SET price_b = IF(price_b = '', NULL, price_b);
SET chgrate_p = IF(chgrate_p = '', NULL, chgrate_p);
SET amount = IF(amount = '', NULL, amount);
SET jjjz_b = IF(jjjz_b = '', NULL, jjjz_b);
SET date = IF(date = '', NULL, date);
SET yjl = IF(yjl = '', NULL, yjl);
SET leverate_p = IF(leverate_p = '', NULL, leverate_p);
SET leverate_j = IF(leverate_j = '', NULL, leverate_j);
SET cost_c = IF(cost_c = '', NULL, cost_c);
SET recal_l = IF(recal_l = '', NULL, recal_l);
SET recal_u = IF(recal_u = '', NULL, recal_u);
SET jjjz_b_est = IF(jjjz_b_est = '', NULL, jjjz_b_est);
SET code_index = IF(code_index = '', NULL, code_index);
SET chgrate_index = IF(chgrate_index = '', NULL, chgrate_index);
SET a_ratio = IF(a_ratio = '', NULL, a_ratio);
SET b_ratio = IF(b_ratio = '', NULL, b_ratio);
SET jjjz_m = IF(jjjz_m = '', NULL, jjjz_m);
SET yjl_m_est = IF(yjl_m_est = '', NULL, yjl_m_est);
SET ticktime = IF(ticktime = '', NULL, ticktime);

INSERT INTO `hs_fund_b_jsl` (`code_m`, `code_b`, `price_b`, `chgrate_p`, `amount`, `jjjz_b`, `date`, `yjl`, `leverate_p`, `leverate_j`, `cost_c`, `recal_l`, `recal_u`, `jjjz_b_est`, `code_index`, `chgrate_index`, `a_ratio`, `b_ratio`, `jjjz_m`, `yjl_m_est`, `ticktime`) VALUES (code_m, code_b, price_b, chgrate_p, amount, jjjz_b, date, yjl, leverate_p, leverate_j, cost_c, recal_l, recal_u, jjjz_b_est, code_index, chgrate_index, a_ratio, b_ratio, jjjz_m, yjl_m_est, ticktime) 
ON DUPLICATE KEY UPDate 
`code_m` = IF(code_m IS NULL, `code_m`, code_m),
`code_b` = IF(code_b IS NULL, `code_b`, code_b),
`price_b` = IF(price_b IS NULL, `price_b`, price_b),
`chgrate_p` = IF(chgrate_p IS NULL, `chgrate_p`, chgrate_p),
`amount` = IF(amount IS NULL, `amount`, amount),
`jjjz_b` = IF(jjjz_b IS NULL, `jjjz_b`, jjjz_b),
`date` = IF(date IS NULL, `date`, date),
`yjl` = IF(yjl IS NULL, `yjl`, yjl),
`leverate_p` = IF(leverate_p IS NULL, `leverate_p`, leverate_p),
`leverate_j` = IF(leverate_j IS NULL, `leverate_j`, leverate_j),
`cost_c` = IF(cost_c IS NULL, `cost_c`, cost_c),
`recal_l` = IF(recal_l IS NULL, `recal_l`, recal_l),
`recal_u` = IF(recal_u IS NULL, `recal_u`, recal_u),
`jjjz_b_est` = IF(jjjz_b_est IS NULL, `jjjz_b_est`, jjjz_b_est),
`code_index` = IF(code_index IS NULL, `code_index`, code_index),
`chgrate_index` = IF(chgrate_index IS NULL, `chgrate_index`, chgrate_index),
`a_ratio` = IF(a_ratio IS NULL, `a_ratio`, a_ratio),
`b_ratio` = IF(b_ratio IS NULL, `b_ratio`, b_ratio),
`jjjz_m` = IF(jjjz_m IS NULL, `jjjz_m`, jjjz_m),
`yjl_m_est` = IF(yjl_m_est IS NULL, `yjl_m_est`, yjl_m_est),
`ticktime` = IF(ticktime IS NULL, `ticktime`, ticktime);
END$$
DELIMITER ;

CALL hs_fund_b_jsl('[标签:code_m]','[标签:code_b]','[标签:price_b]','[标签:chgrate_p]','[标签:amount]','[标签:jjjz_b]','[标签:date]','[标签:yjl]','[标签:leverate_p]','[标签:leverate_j]','[标签:cost_c]','[标签:recal_l]','[标签:recal_u]','[标签:jjjz_b_est]','[标签:code_index]','[标签:chgrate_index]','[标签:a_ratio]','[标签:b_ratio]','[标签:jjjz_m]','[标签:yjl_m_est]','[标签:ticktime]')

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