SELECT * from `ying`.`fund_b`;
-- DROP TABLE `ying`.`fund_b`;
CREATE TABLE `fund_b` (
	`idf` VARCHAR(6) DEFAULT NULL COMMENT '[参数2]: b基金代码 old_field_name: idf',
	`close` decimal(6,3) unsigned NOT NULL COMMENT '[参数3]: b基金价格 old_field_name: close',
	`chgrate` decimal(6,3) NOT NULL COMMENT '[参数4]: 价格涨幅 old_field_name: chgrate_p',
	`chgrate_i` decimal(5,2) NOT NULL COMMENT '[参数16]: 指数涨幅 old_field_name: chgrate_index',
	`amount` decimal(8,2) unsigned NOT NULL COMMENT '[参数5]: 成交额（万元）',
	`jjjz` decimal(7,4) unsigned NOT NULL COMMENT '[参数6]: b基金净值 old_field_name: jjjz_b',
	`jjjz_est` decimal(7,3) unsigned NOT NULL COMMENT '[参数14]: 估计b基金净值 old_field_name: jjjz_b_est',
	`yjl` decimal(6,3) NOT NULL COMMENT '[参数8]: yjl 溢价率 fundb_discount_rt',
	`jjjz_m` decimal(6,4) unsigned NOT NULL COMMENT '[参数19]: jjjz_m 母基金净值',
	`yjl_m_est` decimal(6,3) NOT NULL COMMENT 'yjl_m_est 整体溢价率（估计） fundb_base_est_dis_rt',
	`l_p` decimal(6,3) unsigned NOT NULL COMMENT '[参数9]: 价格杠杆 fundb_price_leverage_rt old_field_name: leverate_p',
	`l_j` decimal(6,3) unsigned NOT NULL COMMENT '[参数10]: 净值杠杆 fundb_net_leverage_rt old_field_name: leverate_j',
	`cost_c` decimal(5,2) unsigned NOT NULL COMMENT '[参数11]: cost_c 融资成本 cost_capital',
	`recal_l` decimal(6,2) unsigned NOT NULL COMMENT '[参数12]: recal_l 下折母基需跌 fundb_lower_recalc_rt',
	`recal_u` decimal(6,2) unsigned NOT NULL COMMENT '[参数13]: recal_u 上折母基需涨 fundb_upper_recalc_rt',
	`dt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (`idf`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP PROCEDURE `ying`.`fund_b`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `fund_b`(IN idf VARCHAR(18), close VARCHAR(18), chgrate VARCHAR(18), chgrate_i VARCHAR(18), amount VARCHAR(18), jjjz VARCHAR(18), jjjz_est VARCHAR(18), yjl VARCHAR(18), jjjz_m VARCHAR(18), yjl_m_est VARCHAR(18), l_p VARCHAR(18), l_j VARCHAR(18), cost_c VARCHAR(18), recal_l VARCHAR(18), recal_u VARCHAR(18), d VARCHAR(18), t VARCHAR(18))
BEGIN
	
	DECLARE dt DATETIME;
	SET `idf` = idf;
	SET `close` = close;
	SET `chgrate` = chgrate;
	SET `chgrate_i` = chgrate_i;
	SET `amount` = amount;
	SET `jjjz` = jjjz;
	SET `jjjz_est` = jjjz_est;
	SET `yjl` = yjl;
	SET `jjjz_m` = jjjz_m;
	SET `yjl_m_est`	 = yjl_m_est;
	SET `l_p` = l_p;
	SET `l_j` = l_j;
	SET `cost_c` = cost_c;
	SET `recal_l` = recal_l;
	SET `recal_u` = recal_u;
	SET `d` = d;
	SET `t` = t;
	SET `dt` =  cast(CONCAT(d, ' ', CASE WHEN (t <= '09:27:00' and t > '9:00:00') THEN '09:25:00' WHEN t <= '09:32:00' THEN '09:30:00' WHEN t <= '09:37:00' THEN '09:35:00' WHEN t <= '09:42:00' THEN '09:40:00' WHEN t <= '09:47:00' THEN '09:45:00' WHEN t <= '09:52:00' THEN '09:50:00' WHEN t <= '09:57:00' THEN '09:55:00' WHEN t <= '10:02:00' THEN '10:00:00' WHEN t <= '10:07:00' THEN '10:05:00' WHEN t <= '10:12:00' THEN '10:10:00' WHEN t <= '10:17:00' THEN '10:15:00' WHEN t <= '10:22:00' THEN '10:20:00' WHEN t <= '10:27:00' THEN '10:25:00' WHEN t <= '10:32:00' THEN '10:30:00' WHEN t <= '10:37:00' THEN '10:35:00' WHEN t <= '10:42:00' THEN '10:40:00' WHEN t <= '10:47:00' THEN '10:45:00' WHEN t <= '10:52:00' THEN '10:50:00' WHEN t <='10:57:00' THEN '10:55:00' WHEN t <='11:02:00' THEN '11:00:00' WHEN t <='11:07:00' THEN '11:05:00' WHEN t <='11:12:00' THEN '11:10:00' WHEN t <='11:17:00' THEN '11:15:00' WHEN t <='11:22:00' THEN '11:20:00' WHEN t <='11:27:00' THEN '11:25:00' WHEN t <='11:33:00' THEN '11:30:00' WHEN (t <='13:07:00' and t > '13:00:00') THEN '13:05:00' WHEN t <='13:12:00' THEN '13:10:00' WHEN t <='13:17:00' THEN '13:15:00' WHEN t <='13:22:00' THEN '13:20:00' WHEN t <='13:27:00' THEN '13:25:00' WHEN t <='13:32:00' THEN '13:30:00' WHEN t <='13:37:00' THEN '13:35:00' WHEN t <='13:42:00' THEN '13:40:00' WHEN t <='13:47:00' THEN '13:45:00' WHEN t <='13:52:00' THEN '13:50:00' WHEN t <='13:57:00' THEN '13:55:00' WHEN t <='14:02:00' THEN '14:00:00' WHEN t <='14:07:00' THEN '14:05:00' WHEN t <='14:12:00' THEN '14:10:00' WHEN t <='14:17:00' THEN '14:15:00' WHEN t <='14:22:00' THEN '14:20:00' WHEN t <='14:27:00' THEN '14:25:00' WHEN t <='14:32:00' THEN '14:30:00' WHEN t <='14:37:00' THEN '14:35:00' WHEN t <='14:42:00' THEN '14:40:00' WHEN t <='14:47:00' THEN '14:45:00' WHEN t <='14:52:00' THEN '14:50:00' WHEN t <='14:57:00' THEN '14:55:00' WHEN t <='15:01:00' THEN '15:00:00' WHEN t <='23:59:59' THEN '15:05:00' end) as datetime);

INSERT INTO `fund_b` (`idf`, `close`, `chgrate`, `chgrate_i`, `amount`, `jjjz`, `jjjz_est`, `yjl`, `jjjz_m`, `yjl_m_est`, `l_p`, `l_j`, `cost_c`, `recal_l`, `recal_u`, `dt`) VALUES (idf, close, chgrate, chgrate_i, amount, jjjz, jjjz_est, yjl, jjjz_m, yjl_m_est, l_p, l_j, cost_c, recal_l, recal_u, dt) 
ON DUPLICATE KEY UPDate 
	`idf` = idf,
	`close` = close,
	`chgrate` = chgrate,
	`chgrate_i` = chgrate_i,
	`amount` = amount,
	`jjjz` = jjjz,
	`jjjz_est` = jjjz_est,
	`yjl` = yjl,
	`jjjz_m` = jjjz_m,
	`yjl_m_est` = yjl_m_est,
	`l_p` = l_p,
	`l_j` = l_j,
	`cost_c` = cost_c,
	`recal_l` = recal_l,
	`recal_u` = recal_u,
	`dt` = dt;
END$$
DELIMITER ;

CALL fund_b('[标签:idf]','[标签:close]','[标签:chgrate]','[标签:chgrate_i]','[标签:amount]','[标签:jjjz]','[标签:jjjz_est]','[标签:yjl]','[标签:jjjz_m]','[标签:yjl_m_est]','[标签:l_p]','[标签:l_j]','[标签:cost_c]','[标签:recal_l]','[标签:recal_u]','[标签:d]','[标签:t]');

-- ying locoy project fund_b
-- 
-- 网页： http://www.jisilu.cn/data/sfnew/#tlink_2 
-- 数据： http://www.jisilu.cn/data/sfnew/fundb_list/? 
-- 
-- {"fundb_base_fund_id":"160718","fundb_id":"150033","fundb_name":"\u591a\u5229\u8fdb\u53d6","status_cd":"N","recalc_to":null,"calc_info":null,"upper_recalc_price":null,"maturity_dt":null,"fundb_current_price":"1.211","fundb_increase_rt":"0.67%","fundb_volume":"30.23","fundb_value":"1.1210","fundb_nav_dt":"2015-08-07","fundb_discount_rt":"8.03%","fundb_price_leverage_rt":"4.290","fundb_net_leverage_rt":"4.634","fundb_capital_rasising_rt":"22.01%","fundb_lower_recalc_rt":"13.88%","fundb_upper_recalc_rt":"-","fundb_left_year":"\u6c38\u7eed","b_est_val":"1.108","fundb_index_id":"399923","fundb_index_name":"\u503a\u5238\u603b\u6307","fundb_index_increase_rt":"0.07%","funda_ratio":8,"fundb_ratio":2,"fundb_base_price":"1.0390","fundb_base_est_dis_rt":"-0.462%","last_time":"15:02:48","owned":0,"abrate":"8:2","fundb_base_est_dis_rt_tip":""}
-- 
-- {"fundb_base_fund_id":"[参数]","fundb_id":"[参数]","fundb_name":"(*)","status_cd":"(*)","recalc_to":(*),"calc_info":(*),"upper_recalc_price":(*),"maturity_dt":(*),"fundb_current_price":"[参数]","fundb_increase_rt":"[参数]","fundb_volume":"[参数]","fundb_value":"[参数]","fundb_nav_dt":"[参数]","fundb_discount_rt":"[参数]","fundb_price_leverage_rt":"[参数]","fundb_net_leverage_rt":"[参数]","fundb_capital_rasising_rt":"[参数]","fundb_lower_recalc_rt":"[参数]","fundb_upper_recalc_rt":"[参数]","fundb_left_year":"(*)","b_est_val":"[参数]","fundb_index_id":"[参数]","fundb_index_name":"(*)","fundb_index_increase_rt":"[参数]","funda_ratio":[参数],"fundb_ratio":[参数],"fundb_base_price":"[参数]","fundb_base_est_dis_rt":"[参数]","last_time":"[参数]","owned":(*),"abrate":"(*)","fundb_base_est_dis_rt_tip":"(*)"}
