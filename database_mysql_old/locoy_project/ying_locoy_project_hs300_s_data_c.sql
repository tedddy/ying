采集任务：hs300_s_data

CREATE TABLE `hs300_s_data_c` (
  `code` varchar(8) DEFAULT NULL COMMENT 'code',
  `name` varchar(12) DEFAULT NULL COMMENT 'name',
  `weight` decimal(4,2) DEFAULT NULL COMMENT 'weight',
  `gxzs` decimal(6,3) DEFAULT NULL COMMENT '贡献指数',
  `iName` varchar(12) DEFAULT NULL COMMENT 'iName',
  `iCode` varchar(8) DEFAULT NULL COMMENT 'iCode',
  `nmc` decimal(16,4) DEFAULT NULL COMMENT '单位：股 round in procedure',
  `mktcap` decimal(16,4) DEFAULT NULL COMMENT '单位：股 round in procedure',
  `last` decimal(7,3) DEFAULT NULL COMMENT '昨收盘',
  `chgprice` decimal(6,3) DEFAULT NULL COMMENT 'chgprice',
  `chgrate` decimal(5,3) DEFAULT NULL COMMENT 'chgrate',
  `buy` decimal(7,3) DEFAULT NULL COMMENT 'buy',
  `sell` decimal(7,3) DEFAULT NULL COMMENT 'sell',
  `close` decimal(7,3) DEFAULT NULL COMMENT 'close',
  `open` decimal(7,3) DEFAULT NULL COMMENT 'open',
  `high` decimal(7,3) DEFAULT NULL COMMENT 'high',
  `low` decimal(7,3) DEFAULT NULL COMMENT 'low',
  `volume` bigint(15) DEFAULT NULL COMMENT '单位：元（数据采集时为手，在procedure里用函数换算为股）',
  `amount` bigint(15) DEFAULT NULL COMMENT '单位：元',
  `ltsz` decimal(15,2) DEFAULT NULL COMMENT '单位：元',
  `TimeSys` time DEFAULT NULL COMMENT 'TimeSystem',
  `DateSys` date DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs300_s_data_c`(IN code VARCHAR(18), name VARCHAR(18), weight VARCHAR(18), iName VARCHAR(18), iCode VARCHAR(18), nmc VARCHAR(18), mktcap VARCHAR(18), last VARCHAR(18), chgprice VARCHAR(18), chgrate VARCHAR(18), buy VARCHAR(18), sell VARCHAR(18), close VARCHAR(18), open VARCHAR(18), high VARCHAR(18), low VARCHAR(18), volume VARCHAR(18), amount VARCHAR(18), gxzs VARCHAR(18), ltsz VARCHAR(18), TimeSys TIME, DateSys DATE)
BEGIN
SET code = IF(code = '', NULL, code);
SET name = IF(name = '', NULL, name);
SET weight = IF(weight = '', NULL, weight);
SET gxzs = IF(gxzs = '', NULL, gxzs);
SET iName = IF(iName = '', NULL, iName);
SET iCode = IF(iCode = '', NULL, iCode);
SET nmc = IF(nmc = '', NULL, nmc);
SET mktcap = IF(mktcap = '', NULL, mktcap);
SET last = IF(last = '', NULL, last);
SET chgprice = IF(chgprice = '', NULL, chgprice);
SET chgrate = IF(chgrate = '', NULL, chgrate);
SET buy = IF(buy = '', NULL, buy);
SET sell = IF(sell = '', NULL, sell);
SET close = IF(close = '', NULL, close);
SET open = IF(open = '', NULL, open);
SET high = IF(high = '', NULL, high);
SET low = IF(low = '', NULL, low);
SET volume = IF(volume = '', NULL, CAST(volume AS UNSIGNED));
SET amount = IF(amount = '', NULL, amount);
SET ltsz = IF(ltsz = '', NULL, ltsz);
SET TimeSys = CURTIME();
SET DateSys = CURDATE();

INSERT INTO `hs300_s_data_c` (`code`, `name`, `weight`, `gxzs`, `iName`, `iCode`, `nmc`, `mktcap`, `last`, `chgprice`, `chgrate`, `buy`, `sell`, `close`, `open`, `high`, `low`, `volume`, `amount`, `ltsz`, `TimeSys`, `DateSys`) VALUES (code, name, weight, gxzs, iName, iCode, nmc, mktcap, last, chgprice, chgrate, buy, sell, close, open, high, low, volume, amount, ltsz, TimeSys, DateSys) 
ON DUPLICATE KEY UPDate 
`code` = code,
`name` = name,
`weight` = weight,
`iName` = iName,
`iCode` = iCode,
`nmc` = nmc,
`mktcap` = mktcap,
`last` = last,
`chgprice` = chgprice,
`chgrate` = chgrate,
`buy` = buy,
`sell` = sell,
`close` = close,
`open` = open,
`high` = high,
`low` = low,
`volume` = volume,
`amount` = amount,
`gxzs` = gxzs,
`ltsz` = ltsz,
`TimeSys` = TimeSys,
`DateSys` = DateSys;
END$$
DELIMITER ;

CALL hs300_s_data_c('[标签:code]','[标签:name]','[标签:weight]','[标签:iName]','[标签:iCode]','[标签:nmc]','[标签:mktcap]','[标签:last]','[标签:chgprice]','[标签:chgrate]','[标签:buy]','[标签:sell]','[标签:close]','[标签:open]','[标签:high]','[标签:low]','[标签:volume]','[标签:amount]','[标签:gxzs]','[标签:ltsz]','','')

