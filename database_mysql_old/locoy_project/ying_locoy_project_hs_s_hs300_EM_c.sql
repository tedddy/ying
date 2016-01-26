-- 母项目：ying locoy project hs_s_hs300_EM
-- 1. 去掉自增id
-- 2. 修改主键
-- 3. 去掉唯一键（UNIQUE Key）

DROP TABLE `ying`.`hs_s_hs300_EM_c`;
CREATE TABLE `hs_s_hs300_EM_c` (
  `code` varchar(6) NOT NULL DEFAULT '' COMMENT 'code',
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
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP PROCEDURE `ying`.`hs_s_hs300_EM_c`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_hs300_EM_c`(IN code VARCHAR(18), open VARCHAR(18), close VARCHAR(18), high VARCHAR(18), low VARCHAR(18), amount VARCHAR(18), volume VARCHAR(18), chgrate VARCHAR(18), WeiBi VARCHAR(18), chgrate5 VARCHAR(18), LiangBi VARCHAR(18), tRatio VARCHAR(18), date VARCHAR(18), time VARCHAR(18))
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

INSERT INTO `hs_s_hs300_EM_c` (`code`, `open`, `close`, `high`, `low`, `amount`, `volume`, `chgrate`, `WeiBi`, `chgrate5`, `LiangBi`, `tRatio`, `date`, `time`) VALUES (code, open, close, high, low, amount, volume, chgrate, WeiBi, chgrate5, LiangBi, tRatio, date, time) 
ON DUPLICATE KEY UPDate 
`code` = code,
`open` = open,
`close` = close,
`high` = high,
`low` = low,
`amount` = amount,
`volume` = volume,
`chgrate` = chgrate,
`WeiBi` = WeiBi,
`chgrate5` = chgrate5,
`LiangBi` = LiangBi,
`tRatio` = tRatio,
`date` = date,
`time` = time;
END$$
DELIMITER ;

CALL hs_s_hs300_EM_c('[标签:code]','[标签:open]','[标签:close]','[标签:high]','[标签:low]','[标签:amount]','[标签:volume]','[标签:chgrate]','[标签:WeiBi]','[标签:chgrate5]','[标签:LiangBi]','[标签:tRatio]','[标签:date]','[标签:time]')
