-- Version start from 150920.
-- [{symbol:"24702",warrant_name:"腾讯摩通六六购A",stock_symbol:"00700",stock_name:"腾讯控股",callputflag:"认购",strikeprice:"140.880",premium:"0.000",conversionratio:"100.000",maturitydate:"2016-06-30",publish_date:"2015-08-19",publisher:"摩根大通",lasttrade:"0.148",chgrate:"-6.9182390",volume:"1652260000",turnover:"248057000"},{symbol:"26551",warrant_name:"恒指瑞银六三沽J",stock_symbol:"HSI",stock_name:"恒生指数",callputflag:"认沽",strikeprice:"0.000",premium:"0.000",conversionratio:"0.000",maturitydate:"2016-03-30",publish_date:"2015-09-01",publisher:"瑞士银行",lasttrade:"0.151",chgrate:"6.3380282",volume:"1345740000",turnover:"204166620"}]
-- 
-- 
-- code: 参数1; close:参数2; volume: 参数3; turnover: 参数4
-- {symbol:"[参数]",warrant_name:"(*)",stock_symbol:"(*)",stock_name:"(*)",callputflag:"(*)",strikeprice:"(*)",premium:"(*)",conversionratio:"(*)",maturitydate:"(*)",publish_date:"(*)",publisher:"(*)",lasttrade:"[参数]",chgrate:"(*)",volume:"[参数]",turnover:"[参数]"}

select * from `ying`.`hk_w_xts_hs` order by TimeSlot desc, id desc;
DROP TABLE `ying`.`hk_w_xts_hs`;
CREATE TABLE `ying`.`hk_w_xts_hs` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(5) NOT NULL COMMENT '代码',
  `close` decimal(7,3) unsigned DEFAULT NULL COMMENT '当前价',
  `volume` int(11) unsigned DEFAULT NULL COMMENT 'volume',
  `turnover` int(11) unsigned DEFAULT NULL COMMENT '权证成交额',
  `TimeSlot` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_date_time` (`code`,`TimeSlot`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- DROP PROCEDURE hk_w_xts_hs;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying`.`hk_w_xts_hs`(IN code CHAR(5), close DECIMAL(7,3), volume  VARCHAR(18), turnover VARCHAR(18), TimeSlot VARCHAR(18))
BEGIN
SET code = IF(code = '', NULL, code);
SET close = IF(close = '', NULL, close);
SET volume = IF(volume = '', NULL, volume);
SET turnover = IF(turnover = '', NULL, turnover);
SET TimeSlot =  cast(CONCAT(curdate(), ' ', CASE WHEN (curtime() <='10:25:00' and curtime() > '10:10:00') THEN '10:00:00' WHEN (curtime() <='10:55:00' and curtime() > '10:40:00') THEN '10:30:00' WHEN (curtime() <='11:25:00' and curtime() > '11:10:00') THEN '11:00:00' WHEN (curtime() <='11:55:00' and curtime() > '11:40:00') THEN '11:30:00' WHEN (curtime() <='12:25:00' and curtime() > '12:10:00') THEN '12:00:00' WHEN (curtime() <='13:55:00' and curtime() > '13:40:00') THEN '13:30:00'  WHEN (curtime() <='14:20:00' and curtime() > '13:55:00') THEN '14:00:00' WHEN (curtime() <='14:55:00' and curtime() > '14:40:00') THEN '14:30:00' WHEN (curtime() <='15:25:00' and curtime() > '15:10:00') THEN '15:00:00' WHEN (curtime() <='15:55:00' and curtime() > '15:40:00') THEN '15:30:00' WHEN (curtime() <='16:25:00' and curtime() > '16:10:00') THEN '16:00:00' end) as datetime);


INSERT INTO `ying`.`hk_w_xts_hs` (`code`, `close`, `volume`, `turnover`, `TimeSlot`) VALUES (code, close, volume, turnover, TimeSlot) 
ON DUPLICATE KEY UPDATE 
	`close` = close,
	`volume` = volume,
	`turnover` = turnover;
END$$
DELIMITER ;

CALL `ying`.`hk_w_xts_hs`('[标签:code]', '[标签:close]', '[标签:volume]', '[标签:turnover]', '');
