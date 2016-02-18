CREATE TABLE `hs_s_zz500_EM` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL COMMENT 'code',
  `open` decimal(6,2) unsigned DEFAULT NULL COMMENT 'open',
  `close` decimal(6,2) unsigned DEFAULT NULL COMMENT 'close',
  `high` decimal(6,2) unsigned DEFAULT NULL COMMENT 'high',
  `low` decimal(6,2) unsigned DEFAULT NULL COMMENT 'low',
  `amount` int(10) unsigned DEFAULT NULL COMMENT 'amount',
  `volume` int(10) unsigned DEFAULT NULL COMMENT 'volume',
  `chgrate` decimal(5,2) DEFAULT NULL COMMENT 'chgrate',
  `WeiBi` decimal(6,2) unsigned DEFAULT NULL COMMENT 'WeiBi',
  `chgrate5` decimal(5,2) DEFAULT NULL COMMENT 'chgrate5',
  `LiangBi` decimal(6,2) unsigned DEFAULT NULL COMMENT 'LiangBi',
  `tRatio` decimal(5,2) unsigned DEFAULT NULL COMMENT 'tRatio',
  `date` date DEFAULT NULL COMMENT 'date',
  `time` time DEFAULT NULL COMMENT 'time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_zz500_EM`(IN code VARCHAR(18), open VARCHAR(18), close VARCHAR(18), high VARCHAR(18), low VARCHAR(18), amount VARCHAR(18), volume VARCHAR(18), chgrate VARCHAR(18), WeiBi VARCHAR(18), chgrate5 VARCHAR(18), LiangBi VARCHAR(18), tRatio VARCHAR(18), date VARCHAR(18), time VARCHAR(18))
BEGIN
SET code = IF(code = '', NULL, code);
SET open = IF(open = '', NULL, open);
SET close = IF(close = '', NULL, close);
SET high = IF(high = '', NULL, high);
SET low = IF(low = '', NULL, low);
SET amount = IF(amount = '', NULL, amount);
SET volume = IF(volume = '', NULL, volume);
SET chgrate = IF(chgrate = '', NULL, chgrate);
SET WeiBi = IF(WeiBi = '', NULL, WeiBi);
SET chgrate5 = IF(chgrate5 = '', NULL, chgrate5);
SET LiangBi = IF(LiangBi = '', NULL, LiangBi);
SET tRatio = IF(tRatio = '', NULL, tRatio);
SET date = IF(date = '', NULL, date);
SET time = IF(time = '', NULL, time);

INSERT INTO `hs_s_zz500_EM` (`code`, `open`, `close`, `high`, `low`, `amount`, `volume`, `chgrate`, `WeiBi`, `chgrate5`, `LiangBi`, `tRatio`, `date`, `time`) VALUES (code, open, close, high, low, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, tRatio, date, time) 
ON DUPLICATE KEY UPDate 
`code` = IF(code IS NULL, `code`, code),
`open` = IF(open IS NULL, `open`, open),
`close` = IF(close IS NULL, `close`, close),
`high` = IF(high IS NULL, `high`, high),
`low` = IF(low IS NULL, `low`, low),
`amount` = IF(amount IS NULL, `amount`, amount),
`volume` = IF(volume IS NULL, `volume`, volume),
`chgrate` = IF(chgrate IS NULL, `chgrate`, chgrate),
`WeiBi` = IF(WeiBi IS NULL, `WeiBi`, WeiBi),
`chgrate5` = IF(chgrate5 IS NULL, `chgrate5`, chgrate5),
`LiangBi` = IF(LiangBi IS NULL, `LiangBi`, LiangBi),
`tRatio` = IF(tRatio IS NULL, `tRatio`, tRatio),
`date` = IF(date IS NULL, `date`, date),
`time` = IF(time IS NULL, `time`, time);
END$$
DELIMITER ;

CALL hs_s_zz500_EM('[标签:code]','[标签:open]','[标签:close]','[标签:high]','[标签:low]','[标签:amount]','[标签:volume]','[标签:chgrate]','[标签:WeiBi]','[标签:chgrate5]','[标签:LiangBi]','[标签:tRatio]','[标签:date]','[标签:time]');
