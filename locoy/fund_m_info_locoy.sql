
SELECT * FROM `ying`.`fund_m_info`;		
-- DROP TABLE `ying`.`fund_m_info`;
CREATE TABLE `fund_m_info` (
  `idf_m` CHAR(6) DEFAULT NULL COMMENT '母基代码 "base_fund_id":"[参数]" ',
  `idf_a` CHAR(6) DEFAULT NULL COMMENT 'A基代码 "fundA_id":"[参数]" ',
  `idf_b` CHAR(6) DEFAULT NULL COMMENT 'B基代码 "fundB_id":"[参数]" ',
  `idi` CHAR(6) DEFAULT NULL COMMENT '跟踪指数 "index_id":"[参数]" ',
  `cs_a` tinyint DEFAULT NULL COMMENT 'A基成数(ChengShu) "abrate":"[参数]:[参数]" ',
  `cs_b` tinyint DEFAULT NULL COMMENT 'B基成数(ChengShu) "abrate":"[参数]:[参数]" ',
  `recalc_u` decimal(4,2) DEFAULT NULL COMMENT '上折 "upper_recalc_price":"[参数]" "\u5b9a\u6298\u5f52\u4e00": "定折归一" 内容替换为 3 ; "\u65e0\u4e0a\u6298": "无上折" 内容替换为 9; "\u5230\u671f\u6298\u7b97": "到期折算" 内容替换为 9 ',
  `recalc_l` decimal(4,2) DEFAULT NULL COMMENT '下折 "lower_recalc_price":"[参数]" ',
  `dt_issue` date DEFAULT NULL COMMENT '创立日期 "issue_dt":"[参数]" ',
  `dt_maturity` date DEFAULT NULL COMMENT '到期日 "maturity_dt":"[参数]" ',
  `coupon` decimal(5,2) DEFAULT NULL COMMENT '本期利率 "coupon":"[参数]" ',
  `coupon_next` decimal(5,2) DEFAULT NULL COMMENT '下期利率 "coupon_next":"[参数]" ',
  `MKT` tinyint DEFAULT NULL COMMENT '"market":"[参数]" sz: 2; sh: 1',
  PRIMARY KEY (`idf_m`),
  UNIQUE KEY `idf_a` (`idf_a`),
  UNIQUE KEY `idf_b` (`idf_b`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- DROP PROCEDURE `ying`.`fund_m_info`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `fund_m_info`(IN idf_m VARCHAR(18), idf_a VARCHAR(18), idf_b VARCHAR(18), idi VARCHAR(18), cs_a VARCHAR(18), cs_b VARCHAR(18), recalc_u VARCHAR(18), recalc_l VARCHAR(18), dt_issue VARCHAR(18), dt_maturity VARCHAR(18), coupon VARCHAR(18), coupon_next VARCHAR(18), MKT VARCHAR(18))
BEGIN
	SET idf_m = IF(idf_m = '', NULL, idf_m);
	SET idf_a = IF(idf_a = '', NULL, idf_a);
	SET idf_b = IF(idf_b = '', NULL, idf_b);
	SET idi = IF(idi = '', NULL, idi);
	SET cs_a = IF(cs_a = '', NULL, cs_a);
	SET cs_b = IF(cs_b = '', NULL, cs_b);
	SET recalc_u = IF(recalc_u = '', NULL, recalc_u);
	SET recalc_l = IF(recalc_l = '', NULL, recalc_l);
	SET dt_issue = IF(dt_issue = '', NULL, dt_issue);
	SET dt_maturity = IF(dt_maturity = '', NULL, dt_maturity);
	SET coupon = IF(coupon = '', NULL, coupon);
	SET coupon_next = IF(coupon_next = '', NULL, coupon_next);
	SET MKT = IF(MKT = '', NULL, MKT);

	INSERT INTO `fund_m_info` (`idf_m`, `idf_a`, `idf_b`, `idi`, `cs_a`, `cs_b`, `recalc_u`, `recalc_l`, `dt_issue`, `dt_maturity`, `coupon`, `coupon_next`, `MKT`) VALUES (idf_m, idf_a, idf_b, idi, cs_a, cs_b, recalc_u, recalc_l, dt_issue, dt_maturity, coupon, coupon_next, MKT) 
	ON DUPLICATE KEY UPDate 
		`idf_m` = idf_m,
		`idf_a` = idf_a,
		`idf_b` = idf_b,
		`idi` = idi,
		`cs_a` = cs_a,
		`cs_b` = cs_b,
		`recalc_u` = recalc_u,
		`recalc_l` = recalc_l,
		`dt_issue` = dt_issue,
		`dt_maturity` = dt_maturity,
		`coupon` = coupon,
		`coupon_next` = coupon_next,
		`MKT` = MKT;
END$$
DELIMITER ;

CALL fund_m_info('[标签:idf_m]','[标签:idf_a]','[标签:idf_b]','[标签:idi]','[标签:cs_a]','[标签:cs_b]','[标签:recalc_u]','[标签:recalc_l]','[标签:dt_issue]','[标签:dt_maturity]','[标签:coupon]','[标签:coupon_next]','[标签:MKT]')

/*
ying locoy project fund_m_info

Steps:
1. change fund_m_info
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
	
网址： 	http://www.jisilu.cn/data/sfnew/#tlink_1
数据：	http://www.jisilu.cn/data/sfnew/fundm_list/?
参考：
源码：
{"id":"160127","cell":{"base_fund_id":"160127","base_fund_nm":"\u5357\u65b9\u6d88\u8d39","active_fl":"Y","mtrade":"N","market":"sz","fund_company_nm":"\u5357\u65b9\u57fa\u91d1","fund_manager":"\u848b\u79cb\u6d01","issue_dt":"2012-03-13","maturity_dt":"-","manage_fee":"1.750","index_id":"399942","index_nm":"\u4e3b\u52a8\u57fa\u91d1","upper_recalc_price":"\u5b9a\u6298\u5f52\u4e00","lower_recalc_price":"0.20","asset_ratio":"80.000","fully":"Y","a_ratio":5,"b_ratio":5,"fund_descr":"03\/13\uff0c\u5b9a\u6298\u65f6A\/B\/M\u5168\u5f521\uff0c\u53ef\u987a\u5ef6\u5b9a\u6298\u65e5","next_recalc_dt":"2016-03-14","fundA_id":"150049","fundA_nm":"\u6d88\u8d39\u6536\u76ca","coupon_descr":"+3.2%\uff0c\u52a8\u6001\u8c03\u6574","coupon_descr_s":"+3.2%","coupon":"4.95","coupon_next":"4.95","coupon_next2":null,"fundB_id":"150050","fundB_nm":"\u6d88\u8d39\u8fdb\u53d6","lower_recalc_comment":"B\u7c7b\u51c0\u503c\u4f4e\u4e8e","a_amount":null,"a_amount_increase_rt":null,"status_cd":"N","recalc_to":null,"calc_info":null,"apply_fee":"1.5%","apply_fee_tip":"100\u4e07\u4ee5\u4e0b\uff0c1.5%\r\n100\u4e07\uff08\u542b\uff09\u81f3500\u4e07\uff0c0.9%\r\n500\u4e07\uff08\u542b\uff09\u81f31000\u4e07\uff0c0.3%\r\n1000\u4e07\uff08\u542b\uff09\u4ee5\u4e0a\uff0c\u6bcf\u7b141000\u5143\r\n","redeem_fee":"0.5%","redeem_fee_tip":"\u6301\u67091\u5e74\u4ee5\u4e0b\uff0c0.5%\r\n\u6301\u67091\u5e74\u81f32\u5e74\uff0c0.3%\r\n\u6301\u67092\u5e74\u4ee5\u4e0a\uff0c0","min_apply_amount":null,"notes":"http:\/\/www.nffund.com\/new\/fundproduct\/?action=searchjjfl&fundcode=160127&index=2","price":"1.0030","last_chg_dt":"2015-10-16","b_gangan":"2.053","base_lower_recalc_rt":"38.73%","base_est_dis_rt":"-0.70%","left_year":"\u6c38\u7eed","abrate":"5:5","base_est_dis_rt_tip":""}
*/
