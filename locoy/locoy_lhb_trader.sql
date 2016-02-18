/*
ying locoy project lhb_trader

Steps:
1. change lhb_trader
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
	
网址： 
数据：
参考：
源码：


"80154611(id_trader),0,92(上榜次数),71(买入次数),劲胜精密|山鼎设计|盛天网络(股票名称),1001428291.45(卖出额),,,,40(卖出次数),2397973252.08(龙虎榜成交金额),1396544960.63(买入额),华泰证券股份有限公司深圳益田路荣超商务中心证券营业部,300083.SZ|300492.SZ|300494.SZ(股票代码)"
"80190854,0,67,45,可立克|海伦钢琴|中毅达,613826073.18,福建,80000073,350000,32,1584619938.19,970793865.01,华泰证券股份有限公司厦门厦禾路证券营业部,002782.SZ|300329.SZ|600610.SH"

"[参数],(*),[参数],[参数],[参数],[参数],[参数],[参数],[参数],[参数],[参数],[参数],[参数],[参数]"

[参数]
[参数1]: id_trader
[参数2]: lhb
[参数3]: lhb_buy
[参数4]: name_s
[参数5]: amount_sell
[参数6]: lhb_sell
[参数7]: area
[参数8]: id_unknown
[参数9]: amount_unknown
[参数10]: amount
[参数11]: amount_buy
[参数12]: name_trader
[参数13]: ids_group
*/


SELECT * FROM `ying_calc`.`lhb_trader` order by amount desc;		
-- DROP TABLE `ying_calc`.`lhb_trader`;
CREATE TABLE `ying_calc`.`lhb_trader` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_trader` VARCHAR(18) DEFAULT NULL COMMENT 'id_trader',
  `lhb` SMALLINT(3) DEFAULT NULL COMMENT 'lhb',
  `lhb_buy` SMALLINT(3) DEFAULT NULL COMMENT 'lhb_buy',
  `name_s` VARCHAR(18) DEFAULT NULL COMMENT 'name_s',
  `amount_sell` bigint(10) DEFAULT NULL COMMENT 'amount_sell',
  `lhb_sell` SMALLINT(3) DEFAULT NULL COMMENT 'lhb_sell',
  `area` VARCHAR(18) DEFAULT NULL COMMENT 'area',
  `id_unknown` VARCHAR(18) DEFAULT NULL COMMENT 'id_unknown',
  `amount_unknown` VARCHAR(18) DEFAULT NULL COMMENT 'amount_unknown',
  `amount` bigint(10) DEFAULT NULL COMMENT 'amount',
  `amount_buy` bigint(10) DEFAULT NULL COMMENT 'amount_buy',
  `name_trader` VARCHAR(88) DEFAULT NULL COMMENT 'name_trader',
  `ids_group` VARCHAR(18) DEFAULT NULL COMMENT 'ids_group',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`id_trader`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- DROP PROCEDURE `ying_calc`.`lhb_trader`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`lhb_trader`(IN id_trader VARCHAR(88), lhb VARCHAR(18), lhb_buy VARCHAR(18), name_s VARCHAR(18), amount_sell VARCHAR(18), lhb_sell VARCHAR(18), area VARCHAR(18), id_unknown VARCHAR(18), amount_unknown VARCHAR(18), amount VARCHAR(18), amount_buy VARCHAR(18), name_trader VARCHAR(18), ids_group VARCHAR(18))
BEGIN
	SET id_trader = IF(id_trader = '', NULL, id_trader);
	SET lhb = IF(lhb = '', NULL, lhb);
	SET lhb_buy = IF(lhb_buy = '', NULL, lhb_buy);
	SET name_s = IF(name_s = '', NULL, name_s);
	SET amount_sell = IF(amount_sell = '', NULL, amount_sell);
	SET lhb_sell = IF(lhb_sell = '', NULL, lhb_sell);
	SET area = IF(area = '', NULL, area);
	SET id_unknown = IF(id_unknown = '', NULL, id_unknown);
	SET amount_unknown = IF(amount_unknown = '', NULL, amount_unknown);
	SET amount = IF(amount = '', NULL, amount);
	SET amount_buy = IF(amount_buy = '', NULL, amount_buy);
	SET name_trader = IF(name_trader = '', NULL, name_trader);
	SET ids_group = IF(ids_group = '', NULL, ids_group);

	INSERT INTO `ying_calc`.`lhb_trader` (`id_trader`, `lhb`, `lhb_buy`, `name_s`, `amount_sell`, `lhb_sell`, `area`, `id_unknown`, `amount_unknown`, `amount`, `amount_buy`, `name_trader`, `ids_group`) VALUES (id_trader, lhb, lhb_buy, name_s, amount_sell, lhb_sell, area, id_unknown, amount_unknown, amount, amount_buy, name_trader, ids_group) 
	ON DUPLICATE KEY UPDate 
		`id_trader` = id_trader,
		`lhb` = lhb,
		`lhb_buy` = lhb_buy,
		`name_s` = name_s,
		`amount_sell` = amount_sell,
		`lhb_sell` = lhb_sell,
		`area` = area,
		`id_unknown` = id_unknown,
		`amount_unknown` = amount_unknown,
		`amount` = amount,
		`amount_buy` = amount_buy,
		`name_trader` = name_trader,
		`ids_group` = ids_group;
END$$
DELIMITER ;

CALL `ying_calc`.`lhb_trader`('[标签:id_trader]','[标签:lhb]','[标签:lhb_buy]','[标签:name_s]','[标签:amount_sell]','[标签:lhb_sell]','[标签:area]','[标签:id_unknown]','[标签:amount_unknown]','[标签:amount]','[标签:amount_buy]','[标签:name_trader]','[标签:ids_group]')


