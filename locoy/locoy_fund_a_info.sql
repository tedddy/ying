
SELECT * FROM `fund_a_info`;		
-- DROP TABLE `fund_a_info`;
CREATE TABLE `fund_a_info` (
    `idf` CHAR(6) NOT NULL COMMENT 'fund id',
    `idf_m` CHAR(6) NOT NULL COMMENT 'base (mother) fund id',
    `idi` CHAR(6) NOT NULL COMMENT 'target index id',
    PRIMARY KEY (`idf`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

-- DROP PROCEDURE `fund_a_info`;
DELIMITER $$

CREATE DEFINER=`gxh`@`%` PROCEDURE `fund_a_info`(IN idf VARCHAR(18), idf_m VARCHAR(18), idi VARCHAR(18))
BEGIN

	SET idf = IF(idf = '', NULL, idf);
	SET idf_m = IF(idf_m = '', NULL, idf_m);
	SET idi = IF(idi = '', NULL, idi);

	INSERT INTO `fund_a_info` (`idf`, `idf_m`, `idi`) VALUES (idf, idf_m, idi) 
	ON DUPLICATE KEY UPDate 
		`idf` = idf,
		`idf_m` = idf_m,
		`idi` = idi;
END$$

DELIMITER ;

CALL fund_a_info('[标签:idf]','[标签:idf_m]','[标签:idi]')

/*
ying locoy project fund_a_info
	
网址：http://www.jisilu.cn/data/sfnew/#tlink_3
数据：http://www.jisilu.cn/data/sfnew/funda_list/?
参考：
源码：

{"id":"150022","cell":{"owned":0,"coupon_descr_s":"+3.0%","coupon_descr":"+3.0%","calc_info":null,"funda_volume":"6391.37","funda_index_increase_rt":"1.30%","funda_lower_recalc_rt":"15.96%","fundb_upper_recalc_rt":"193.51%","funda_increase_rt":"1.46%","funda_left_year":"\u6c38\u7eed","funda_base_fund_id":"163109","funda_id":"150022","funda_name":"\u6df1\u6210\u6307A","last_time":"15:02:50","funda_current_price":"0.836","funda_nav_dt":"2015-10-15","funda_value":"1.0454","funda_discount_rt":"20.03%","funda_coupon":"5.75","funda_coupon_next":"4.75","funda_profit_rt":"7.27%","funda_profit_rt_next":"6.025%","funda_index_id":"399001","funda_index_name":"\u6df1\u8bc1\u6210\u6307","abrate":"5:5","funda_base_est_dis_rt_tip":"","funda_base_est_dis_rt":"-0.65%","fund_descr":"\u6bcf\u5e74\u7b2c\u4e00\u4e2a\u5de5\u4f5c\u65e5\u5b9a\u6298\uff0c\u65e0\u4e0b\u6298\uff0cA\u4e0d\u53c2\u4e0e\u4e0a\u6298\uff0c\u51c0\u503c<1\u5143\u65e0\u5b9a\u6298","left_recalc_year":"0.21918","status_cd":"N","next_recalc_dt":"2016-01-04<\/span>","lower_recalc_profit_rt":"-","fundb_upper_recalc_rt_info":"\u6df1\u6210\u6307A\u4e0d\u53c2\u4e0e\u4e0a\u6298","funda_amount_increase":"160","funda_amount":188589,"funda_amount_increase_rt":"0.09%","funda_base_est_dis_rt_t1":"-0.46%","funda_base_est_dis_rt_t2":"-0.23%"}}

*/
