-- ying locoy project hs_index_rt_EM
-- 
-- Steps:
-- 1. change hs_index_rt_EM
-- 2. change labels by replacing one by one.
-- 	2.1 note: step 2 and step 3 can be done at the same time to save time
-- 3. create table and setup mysql procedure
-- 	3.1 note: add unique statement: UNIQUE KEY `UniqueKeyName` (``,``,``)
-- 	3.2 note: change the data type of each field & change the length of VARCHAR
-- 	3.3 note: for each field of the table, make a good comment including a standardized and consistant field, and the original label in the datasource. 
-- 4. setup locoy project: 192.168.137.172 gxh locoy ying
-- 	4.1 数据库地址：C:\火车采集器V8\Data\（*）\SpiderResult.db3
-- 5. test
-- 	5.1 note: test with a few records;
	
select * from `ying`.`hs_index_rt_EM`;
-- DROP TABLE `ying`.`hs_index_rt_EM`;	
CREATE TABLE `hs_index_rt_EM` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL COMMENT '"(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"',
  `close` decimal(9,2) unsigned DEFAULT NULL COMMENT '收盘价; "(*),(*),(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"',
  `volume` int(11) unsigned DEFAULT NULL COMMENT '成交量; "(*),(*),(*),(*),(*),(*),(*),(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"',
  `amount` bigint(12) unsigned DEFAULT NULL COMMENT '股票成交额; "(*),(*),(*),(*),(*),(*),(*),(*),(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"',
--  `time` time DEFAULT NULL COMMENT '"(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),[参数] [参数],(*),(*),(*),(*)"; 参数2',
  `TimeSlot` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_date_time` (`code`,`TimeSlot`)
) ENGINE=InnoDB AUTO_INCREMENT=631 DEFAULT CHARSET=utf8;


-- DROP procedure IF EXISTS `hs_index_rt_EM`;
DELIMITER $$
USE `ying`$$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_index_rt_EM`(IN code VARCHAR(6), close DECIMAL(9,2), volume BIGINT(11) UNSIGNED, amount BIGINT(12) UNSIGNED, time VARCHAR(9), TimeSlot datetime)
BEGIN
SET code = IF(code = '', NULL, code);
SET close = IF(close = '', NULL, close);
SET volume = IF(volume = '', NULL, volume);
SET amount = IF(amount = '', NULL, amount);
SET time = IF(time = '', NULL, time);
SET TimeSlot =  cast(CONCAT(curdate(), ' ', CASE WHEN time <= '09:27:00' THEN '09:25:00' WHEN time <= '09:32:00' THEN '09:30:00' WHEN time <= '09:37:00' THEN '09:35:00' WHEN time <= '09:42:00' THEN '09:40:00' WHEN time <= '09:47:00' THEN '09:45:00' WHEN time <= '09:52:00' THEN '09:50:00' WHEN time <= '09:57:00' THEN '09:55:00' WHEN time <= '10:02:00' THEN '10:00:00' WHEN time <= '10:07:00' THEN '10:05:00' WHEN time <= '10:12:00' THEN '10:10:00' WHEN time <= '10:17:00' THEN '10:15:00' WHEN time <= '10:22:00' THEN '10:20:00' WHEN time <= '10:27:00' THEN '10:25:00' WHEN time <= '10:32:00' THEN '10:30:00' WHEN time <= '10:37:00' THEN '10:35:00' WHEN time <= '10:42:00' THEN '10:40:00' WHEN time <= '10:47:00' THEN '10:45:00' WHEN time <= '10:52:00' THEN '10:50:00' WHEN time <='10:57:00' THEN '10:55:00' WHEN time <='11:02:00' THEN '11:00:00' WHEN time <='11:07:00' THEN '11:05:00' WHEN time <='11:12:00' THEN '11:10:00' WHEN time <='11:17:00' THEN '11:15:00' WHEN time <='11:22:00' THEN '11:20:00' WHEN time <='11:27:00' THEN '11:25:00' WHEN time <='11:33:00' THEN '11:30:00' WHEN (time <='13:07:00' and time > '13:00:00') THEN '13:05:00' WHEN time <='13:12:00' THEN '13:10:00' WHEN time <='13:17:00' THEN '13:15:00' WHEN time <='13:22:00' THEN '13:20:00' WHEN time <='13:27:00' THEN '13:25:00' WHEN time <='13:32:00' THEN '13:30:00' WHEN time <='13:37:00' THEN '13:35:00' WHEN time <='13:42:00' THEN '13:40:00' WHEN time <='13:47:00' THEN '13:45:00' WHEN time <='13:52:00' THEN '13:50:00' WHEN time <='13:57:00' THEN '13:55:00' WHEN time <='14:02:00' THEN '14:00:00' WHEN time <='14:07:00' THEN '14:05:00' WHEN time <='14:12:00' THEN '14:10:00' WHEN time <='14:17:00' THEN '14:15:00' WHEN time <='14:22:00' THEN '14:20:00' WHEN time <='14:27:00' THEN '14:25:00' WHEN time <='14:32:00' THEN '14:30:00' WHEN time <='14:37:00' THEN '14:35:00' WHEN time <='14:42:00' THEN '14:40:00' WHEN time <='14:47:00' THEN '14:45:00' WHEN time <='14:52:00' THEN '14:50:00' WHEN time <='14:57:00' THEN '14:55:00' WHEN time <='15:01:00' THEN '15:00:00' WHEN time <='15:07:00' THEN '15:05:00' end) as datetime);

INSERT INTO `hs_index_rt_EM` (`code`, `close`, `volume`, `amount`, `TimeSlot`) VALUES (code, close, volume, amount, TimeSlot) 
ON DUPLICATE KEY UPDate
`close` = IF(close IS NULL, `close`, close),
`volume` = IF(volume IS NULL, `volume`, volume),
`amount` = IF(amount IS NULL, `amount`, amount);
END$$

DELIMITER ;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_index_xts_EM`(IN code VARCHAR(6), date DATE, open DECIMAL(9,2), high DECIMAL(9,2), low DECIMAL(9,2), close DECIMAL(9,2), volume BIGINT(11) UNSIGNED, amount BIGINT(12) UNSIGNED, time VARCHAR(9), fSH VARCHAR(9))
BEGIN
SET code = IF(code = '', NULL, code);
SET date = IF(date = '', NULL, Date);
SET open = IF(open = '', NULL, open);
SET high = IF(high = '', NULL, high);
SET low = IF(low = '', NULL, low);
SET close = IF(close = '', NULL, close);
SET volume = IF(volume = '', NULL, volume);
SET amount = IF(amount = '', NULL, amount);
SET time = IF(time = '', NULL, time);
SET fSH = IF(fSH = '', NULL, fSH);

INSERT INTO `hs_index_xts_EM` (`code`, `date`, `open`, `high`, `low`, `close`, `volume`, `amount`, `time`,  `fSH`) VALUES (code, date, open, high, low, close, volume, amount, time, fSH) 
ON DUPLICATE KEY UPDate
	`open` = IF(open IS NULL, `open`, open),
	`high` = IF(high IS NULL, `high`, high),
	`low` = IF(low IS NULL, `low`, low),
	`close` = IF(close IS NULL, `close`, close),
	`volume` = IF(volume IS NULL, `volume`, volume),
	`amount` = IF(amount IS NULL, `amount`, amount),
	`time` = IF(time IS NULL, `time`, time),
	`fSH` = IF(fSH IS NULL, `fSH`, fSH);

END$$
DELIMITER ;





-- CALL hs_index_rt_EM('[标签:code]', '[标签:close]', '[标签:volume]', '[标签:amount]', '[标签:time]') 
-- 
-- "3993072,399307,深证转债,214.38,234.64,235.08,245.30,217.78,96593,66584,20.69,9.65%,145.07,12.84%,0.00%,0,392,66584,0,-1,-1,0.19%,0.00,0.00%,0.00,,0.00,0.00,2015-07-17 15:05:00,7,0,0,0"
--  
-- code: 
-- "(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"
-- name
-- "(*),(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"
-- open
-- "(*),(*),(*),(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"
-- high
-- "(*),(*),(*),(*),(*),(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"
-- low
-- "(*),(*),(*),(*),(*),(*),(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"
-- price
-- "(*),(*),(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"
-- volume
-- "(*),(*),(*),(*),(*),(*),(*),(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"
-- amount
-- "(*),(*),(*),(*),(*),(*),(*),(*),(*),[参数],(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*)"
-- datetime
-- "(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),(*),[参数],(*),(*),(*),(*)"
-- 
-- original field name		name of gxh		Chinese
-- code					code			证券代码
-- symbol					code			证券代码
-- trade					price			成交价
-- pricechange				chgprice		成交价涨跌		`chgprice` decimal(6,3) DEFAULT NULL COMMENT 'chgprice',
-- changepercent			chgrate			成交价涨跌幅	`chgrate` decimal(5,3) DEFAULT NULL COMMENT 'chgrate',
-- settlement				close			昨日成交价
-- buy						buy				买入价
-- sell					sell			卖出价
-- open					open			开盘价
-- high					high			最高价
-- low						low				最低价
-- volume					volume			成交量
-- amount					amount			成交额
-- ticktime				ticktime		当时时间
-- per						per				市盈率
-- pb						pb				市净率
-- mktcap					mktcap			总股本
-- nmc						nmc				流通股本
-- turnoverratio			tRatio			换手率
-- WEIGHING				weight			权重
-- INAME					iName			指数名称
-- HYSYMBOL				iCode			指数代码	
-- ltgb					nmc				流通股本
-- zgb						mktcap			总股本
-- prevtrade				last			昨收盘
-- gxzs					gxzs			贡献指数
-- ltsz					ltsz			流通市值
-- netamount				netAmount		净流入
-- ratioamount				netRate			净流入率
-- r0						amountXL		特大单流入额 超大单流入
-- r1						amountL		    大单流入额 大单流入
-- r2						amountS			小单流入额 中单流入
-- r3						amountI			散单流入额(I: individual) 小单流入
-- r0_net					netXL			特大单净流入 超大单净流入
-- r1_net					netL		    大单净流入 
-- r2_net					netS			小单净流入 中单净流入
-- r3_net					netI			散单净流入(I: individual) 小单净流入
-- turnover				amount			换手率*100
-- r0x_ratio				ratioXL			主力罗盘度
-- 