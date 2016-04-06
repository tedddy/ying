/*
ying_calc locoy project LocoyProjectName

Steps:
1. change LocoyProjectName
2. change labels by replacing one by one.
	2.1 note: step 2 and step 3 can be done at the same time to save time
3. create table and setup mysql procedure
	3.1 note: add unique statement: UNIQUE KEY `UniqueKeyName` (``,``,``)
	3.2 note: change the data type of each field & change the length of VARCHAR
	3.3 note: for each field of the table, make a good comment including a standardized and consistant field, and the original label in the datasource. 
4. setup locoy project: 192.168.137.172 gxh locoy ying_calc
	4.1 数据库地址：C:\火车采集器V8\Data\(*)\SpiderResult.db3
5. test
	5.1 note: test with a few records
	
网址： 
数据：http://push3.gtimg.cn/q=hk26106,hk25951,hk26320,hk25946,hk25787,hk25803,hk19905,hk19540,hk25804,hk25312,hk26190,hk26037,hk25486,hk25994,hk25525,hk25931,hk25457,hk25426,hk26284,hk26153,hkHSI&m=push&
参考：
源码：

pv_hk26106(code)="100~恒指瑞银六九沽H~26106~0.162(close)~0.182(yesterday)~0.165(open)~5856730000.0(volume)~0~0~0.162~0~0~0~0~0~0~0~0~0~0.162~0~0~0~0~0~0~0~0~0~10000~2016/02/18 16:01:00(datetime)~-0.020(chgprice)~-10.99(chgrate)~0.165(high)~0.161(low)~0.162~5856730000.0~954596220.000(turnover)~0.000~0.00~S~0~0~2.20~7300.000~17000.000~恒指瑞银六九沽H~2016-09-29~0.247~0.161~0~";

pv_hk25951="100~恒指摩通六四沽I~25951~0.116~0.144~0.120~7148070000.0~0~0~0.116~0~0~0~0~0~0~0~0~0~0.116~0~0~0~0~0~0~0~0~0~10000~2016/02/18 16:01:00~-0.028~-19.44~0.121~0.111~0.116~7148070000.0~828362020.000~0.000~0.00~~0~0~6.94~6000.000~18400.000~恒指摩通六四沽I~2016-04-28~0.189~0.111~0~";

pv_hk[参数]="100~[参数]~(*)~[参数]~[参数]~[参数]~[参数]~(*)~(*)~(*)~(*)~(*)~(*)~(*)~(*)~(*)~(*)~(*)~(*)~(*)~(*)~(*)~(*)~(*)~(*)~(*)~(*)~(*)~(*)~(*)~[参数]~-[参数]~[参数]~[参数]~[参数]~(*)~(*)~[参数]~(*)~(*)~(*)~(*)~(*)~(*)~(*)~(*)~(*)~[参数]~[参数]~[参数]~(*)~";

时间用正则表达式

code name close settlement open volume datetime chgprice chgrate high low turnover eDate high_52 low_52


*/

-- tedd: group_concat
SELECT concat('http://push2.gtimg.cn/q=', CONCAT('hk',code), '&m=push') as hk_w_rt_qq FROM `ying_calc`.`hk_w_sg` where `Turnover($K)` > 0;

INSERT into `ying_calc`.`hk_w_rt_qq_url` SELECT concat('http://push2.gtimg.cn/q=', GROUP_CONCAT(CONCAT('hk',code))) as hk_w_rt_qq FROM `ying_calc`.`hk_w_sg` GROUP BY DATE_FORMAT(`Maturity(YY-MM-DD)`, '%m-%d') DESC;

SELECT concat('http://push2.gtimg.cn/q=', GROUP_CONCAT(CONCAT('hk',code))) as hk_w_rt_qq FROM `ying_calc`.`hk_w_sg` GROUP BY DATE_FORMAT(`Maturity(YY-MM-DD)`, '%m-%d') DESC;


SELECT count(*) FROM `ying_calc`.`hk_w_rt_qq`;		
SELECT * FROM `ying_calc`.`hk_w_rt_qq`;	
SELECT sum(turnover) FROM `ying_calc`.`hk_w_rt_qq`;		
	
-- DROP TABLE `ying`.`hk_w_rt_qq`;

CREATE TABLE `ying`.`hk_w_rt_qq` (
  `code` varchar(5) NOT NULL COMMENT '代码id; code id in table hk_w and in table hk_s',
  `close` decimal(7,3) unsigned DEFAULT NULL COMMENT '收盘价',
  `volume` int(11) unsigned DEFAULT NULL COMMENT '成交量',
  `turnover` int(11) unsigned DEFAULT NULL COMMENT '成交量',  
  `dt` datetime DEFAULT NULL COMMENT '交易日期; trade datetime',
  PRIMARY KEY (`code`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DROP PROCEDURE `ying`.`hk_w_rt_qq`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying`.`hk_w_rt_qq`(IN code varchar(8), close varchar(18), volume varchar(18), turnover varchar(18), dt varchar(18))
BEGIN
SET code = IF(code = '', NULL, code);
SET close = IF(close = '', NULL, close);
SET volume = IF(volume = '', NULL, volume);
SET turnover = IF(turnover = '', NULL, turnover);
SET dt = IF(dt = '', NULL, dt);

INSERT INTO `ying`.`hk_w_rt_qq` (`code`, `close`, `volume`, `turnover`, `dt`) VALUES (code, close, volume, turnover, dt) 
ON DUPLICATE KEY UPDATE 
	`close` = close,
	`volume` = volume,
	`turnover` = turnover;
END$$
DELIMITER ;

CALL `ying`.`hk_w_rt_qq`('[标签:code]', '[标签:close]', '[标签:volume]', '[标签:turnover]', '[标签:dt]');