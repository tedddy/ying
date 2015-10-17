
DROP TABLE `ying`.`fund_b`;
CREATE TABLE `fund_b` (
  `idf` VARCHAR(6) DEFAULT NULL COMMENT '[参数2]: b基金代码 old_field_name: code_b',
  `close` decimal(6,3) unsigned DEFAULT NULL COMMENT '[参数3]: b基金价格 old_field_name: price_b',
  `chgrate` decimal(6,3) DEFAULT NULL COMMENT '[参数4]: 价格涨幅 old_field_name: chgrate_p',
  `amount` decimal(8,2) unsigned DEFAULT NULL COMMENT '[参数5]: 成交额（万元）',
  `jjjz` decimal(7,4) unsigned DEFAULT NULL COMMENT '[参数6]: b基金净值 old_field_name: jjjz_b',
  `jjjz_est` decimal(6,3) unsigned DEFAULT NULL COMMENT '[参数14]: 估计b基金净值 old_field_name: jjjz_b_est',
  `yjl` decimal(6,3) DEFAULT NULL COMMENT '[参数8]: yjl 溢价率 fundb_discount_rt',
  `idi` VARCHAR(6) DEFAULT NULL COMMENT '[参数15]: 标的指数代码 old_field_name: code_index',
  `chgrate_i` decimal(5,2) DEFAULT NULL COMMENT '[参数16]: 指数涨幅 old_field_name: chgrate_index',
  `idf_m` VARCHAR(6) DEFAULT NULL COMMENT '[参数1]: 母基金代码 old_field_name: code_m',
  `jjjz_m` decimal(6,4) unsigned DEFAULT NULL COMMENT '[参数19]: jjjz_m 母基金净值',
  `yjl_m_est` decimal(6,3) DEFAULT NULL COMMENT 'yjl_m_est 整体溢价率（估计） fundb_base_est_dis_rt',
  `l_p` decimal(6,3) unsigned DEFAULT NULL COMMENT '[参数9]: 价格杠杆 fundb_price_leverage_rt old_field_name: leverage_p',
  `l_j` decimal(6,3) unsigned DEFAULT NULL COMMENT '[参数10]: 净值杠杆 fundb_net_leverage_rt old_field_name: leverage_j',
  `cost_c` decimal(5,2) unsigned DEFAULT NULL COMMENT '[参数11]: cost_c 融资成本 cost_capital',
  `recal_l` decimal(5,2) unsigned DEFAULT NULL COMMENT '[参数12]: recal_l 下折母基需跌 fundb_lower_recalc_rt',
  `recal_u`decimal(5,2) unsigned DEFAULT NULL COMMENT '[参数13]: recal_u 上折母基需涨 fundb_upper_recalc_rt',
  `cs_a` tinyint(1) DEFAULT NULL COMMENT '[参数17]: a基金占比（成数） old_field_name: a_ratio',
  `cs_b` tinyint(1) DEFAULT NULL COMMENT '[参数18]: b基金占比（成数） old_field_name: b_ratio',
  `d` date DEFAULT NULL COMMENT '[参数7]: date old_field_name:',
  `t` time DEFAULT NULL COMMENT '[参数21]: old_field_name: ticktime',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`idf`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP PROCEDURE `ying`.`fund_b`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `fund_b`(IN code_m VARCHAR(18), code_b VARCHAR(18), price_b VARCHAR(18), chgrate_p VARCHAR(18), amount VARCHAR(18), jjjz_b VARCHAR(18), date VARCHAR(18), yjl VARCHAR(18), leverate_p VARCHAR(18), leverate_j VARCHAR(18), cost_c VARCHAR(18), recal_l VARCHAR(18), recal_u VARCHAR(18), jjjz_b_est VARCHAR(18), code_index VARCHAR(18), chgrate_index VARCHAR(18), a_ratio VARCHAR(18), b_ratio VARCHAR(18), jjjz_m VARCHAR(18), yjl_m_est VARCHAR(18), ticktime VARCHAR(18))
BEGIN
SET idf = code_b;
SET code_m = code_m;
SET price_b = price_b;
SET chgrate_p = chgrate_p;
SET amount = amount;
SET jjjz_b = jjjz_b;
SET date = date;
SET yjl = yjl;
SET leverate_p = leverate_p;
SET leverate_j = leverate_j;
SET cost_c = cost_c;
SET recal_l = recal_l;
SET recal_u = recal_u;
SET jjjz_b_est = jjjz_b_est;
SET code_index = code_index;
SET chgrate_index = chgrate_index;
SET a_ratio = a_ratio;
SET b_ratio = b_ratio;
SET jjjz_m = jjjz_m;
SET ticktime = ticktime);
SET yjl_m_est = yjl_m_est;

INSERT INTO `fund_b` (`code_m`, `code_b`, `price_b`, `chgrate_p`, `amount`, `jjjz_b`, `date`, `yjl`, `leverate_p`, `leverate_j`, `cost_c`, `recal_l`, `recal_u`, `jjjz_b_est`, `code_index`, `chgrate_index`, `a_ratio`, `b_ratio`, `jjjz_m`, `yjl_m_est`, `ticktime`) VALUES (code_m, code_b, price_b, chgrate_p, amount, jjjz_b, date, yjl, leverate_p, leverate_j, cost_c, recal_l, recal_u, jjjz_b_est, code_index, chgrate_index, a_ratio, b_ratio, jjjz_m, yjl_m_est, ticktime)
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

CALL fund_b('[标签:code_m]','[标签:code_b]','[标签:price_b]','[标签:chgrate_p]','[标签:amount]','[标签:jjjz_b]','[标签:date]','[标签:yjl]','[标签:leverate_p]','[标签:leverate_j]','[标签:cost_c]','[标签:recal_l]','[标签:recal_u]','[标签:jjjz_b_est]','[标签:code_index]','[标签:chgrate_index]','[标签:a_ratio]','[标签:b_ratio]','[标签:jjjz_m]','[标签:yjl_m_est]','[标签:ticktime]')

-- ying locoy project fund_b
--
-- 网页： http://www.jisilu.cn/data/sfnew/#tlink_2
-- 数据： http://www.jisilu.cn/data/sfnew/fundb_list/?
--
-- {"fundb_base_fund_id":"160718","fundb_id":"150033","fundb_name":"\u591a\u5229\u8fdb\u53d6","status_cd":"N","recalc_to":null,"calc_info":null,"upper_recalc_price":null,"maturity_dt":null,"fundb_current_price":"1.211","fundb_increase_rt":"0.67%","fundb_volume":"30.23","fundb_value":"1.1210","fundb_nav_dt":"2015-08-07","fundb_discount_rt":"8.03%","fundb_price_leverage_rt":"4.290","fundb_net_leverage_rt":"4.634","fundb_capital_rasising_rt":"22.01%","fundb_lower_recalc_rt":"13.88%","fundb_upper_recalc_rt":"-","fundb_left_year":"\u6c38\u7eed","b_est_val":"1.108","fundb_index_id":"399923","fundb_index_name":"\u503a\u5238\u603b\u6307","fundb_index_increase_rt":"0.07%","funda_ratio":8,"fundb_ratio":2,"fundb_base_price":"1.0390","fundb_base_est_dis_rt":"-0.462%","last_time":"15:02:48","owned":0,"abrate":"8:2","fundb_base_est_dis_rt_tip":""}
--
-- {"fundb_base_fund_id":"[参数]","fundb_id":"[参数]","fundb_name":"(*)","status_cd":"(*)","recalc_to":(*),"calc_info":(*),"upper_recalc_price":(*),"maturity_dt":(*),"fundb_current_price":"[参数]","fundb_increase_rt":"[参数]","fundb_volume":"[参数]","fundb_value":"[参数]","fundb_nav_dt":"[参数]","fundb_discount_rt":"[参数]","fundb_price_leverage_rt":"[参数]","fundb_net_leverage_rt":"[参数]","fundb_capital_rasising_rt":"[参数]","fundb_lower_recalc_rt":"[参数]","fundb_upper_recalc_rt":"[参数]","fundb_left_year":"(*)","b_est_val":"[参数]","fundb_index_id":"[参数]","fundb_index_name":"(*)","fundb_index_increase_rt":"[参数]","funda_ratio":[参数],"fundb_ratio":[参数],"fundb_base_price":"[参数]","fundb_base_est_dis_rt":"[参数]","last_time":"[参数]","owned":(*),"abrate":"(*)","fundb_base_est_dis_rt_tip":"(*)"}