SELECT * FROM `ying`.`hk_w_xts_test`;		
-- DROP TABLE `ying`.`hk_w_xts_test`;
CREATE TABLE `hk_w_xts_test` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL COMMENT '代码id; code id in table hk_w and in table hk_s',
  `date` date DEFAULT NULL COMMENT '交易日期; trade date',
  `open` decimal(7,3) unsigned DEFAULT NULL COMMENT '开盘价',
  `high` decimal(7,3) unsigned DEFAULT NULL COMMENT '最高价',
  `low` decimal(7,3) unsigned DEFAULT NULL COMMENT '最低价',
  `close` decimal(7,3) unsigned DEFAULT NULL COMMENT '收盘价',
  `volume` int(11) unsigned DEFAULT NULL COMMENT '成交量',
  `turnover` int(11) unsigned DEFAULT NULL COMMENT '成交量',
  `fR` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Result of data collection\n0: fail; 1: success',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_date` (`code`,`date`),
  CONSTRAINT `FK_hk_w_xts_test_hk_w` FOREIGN KEY (`code`) REFERENCES `hk_w_xts_test` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- DROP PROCEDURE `ying`.`hk_w_xts_test`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hk_w_xts_test`(IN code VARCHAR(6), date DATE, open DECIMAL(7,3), high DECIMAL(7,3), low DECIMAL(7,3), close DECIMAL(7,3), volume INT(10) UNSIGNED, turnover INT(10) UNSIGNED)
BEGIN
SET code = IF(code = '', NULL, code);
SET date = IF(date = '', NULL, Date);
SET open = IF(open = '', NULL, open);
SET high = IF(high = '', NULL, high);
SET low = IF(low = '', NULL, low);
SET close = IF(close = '', NULL, close);
SET volume = IF(volume = '', NULL, volume);
SET turnover = IF(turnover = '', NULL, turnover);

INSERT INTO `hk_w_xts_test` (`code`, `date`, `open`, `high`, `low`, `close`, `volume`, `turnover`) VALUES (code, date, open, high, low, close, volume, turnover) 
ON DUPLICATE KEY UPDate 
	`code` = IF(code IS NULL, `code`, code),
	`date` = IF(date IS NULL, `date`, date),
	`open` = IF(open IS NULL, `open`, open),
	`high` = IF(high IS NULL, `high`, high),
	`low` = IF(low IS NULL, `low`, low),
	`close` = IF(close IS NULL, `close`, close),
	`volume` = IF(volume IS NULL, `volume`, volume),
	`turnover` = IF(turnover IS NULL, `turnover`, turnover);
END$$
DELIMITER ;

CALL hk_w_xts_test('[标签:code]', '[标签:date]', '[标签:open]', '[标签:high]', '[标签:low]', '[标签:close]', '[标签:volume]', '[标签:turnover]') 
