-- 网页：http://vip.stock.finance.sina.com.cn/mkt/#bkhq  板块汇总行情
-- 数据：http://biz.finance.sina.com.cn/hq/qmxIndustryHq.php ;

DROP TABLE `hs_bkhq_sina`;
CREATE TABLE `hs_bkhq_sina` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `NameSegmentEN` VARCHAR(8) DEFAULT NULL COMMENT 'NameSegmentEN',
  `NameSegmentCN` VARCHAR(10) DEFAULT NULL COMMENT 'NameSegmentCN',
  `NoStocks` VARCHAR(3) DEFAULT NULL COMMENT 'NoStocks',
  `AveragePrice` VARCHAR(18) DEFAULT NULL COMMENT 'AveragePrice',
  `ChangePrice` VARCHAR(18) DEFAULT NULL COMMENT 'ChangePrice',
  `ChangeRate` VARCHAR(18) DEFAULT NULL COMMENT 'ChangeRate',
  `VolumeTotal` VARCHAR(12) DEFAULT NULL COMMENT 'VolumeTotal',
  `AmountTotal` VARCHAR(12) DEFAULT NULL COMMENT 'AmountTotal',
  `CodeLeader` VARCHAR(8) DEFAULT NULL COMMENT 'CodeLeader',
  `ChangeRateLeader` VARCHAR(18) DEFAULT NULL COMMENT 'ChangeRateLeader',
  `price` VARCHAR(8) DEFAULT NULL COMMENT 'price',
  `AmountChangeLeader` VARCHAR(8) DEFAULT NULL COMMENT 'AmountChangeLeader',
  `DataAll` VARCHAR(388) DEFAULT NULL COMMENT 'DataAll',
  `DateSys` date DEFAULT NULL COMMENT 'DateSystem',
  `TimeSys` time DEFAULT NULL COMMENT 'TimeSystem',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`NameSegmentEN`,`DateSys`, `TimeSys`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DELIMITER $$   
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_bkhq_sina`(IN NameSegmentEN VARCHAR(8), NameSegmentCN VARCHAR(10), NoStocks VARCHAR(3), AveragePrice VARCHAR(18), ChangePrice VARCHAR(18), ChangeRate VARCHAR(18), VolumeTotal VARCHAR(12), AmountTotal VARCHAR(12), CodeLeader VARCHAR(8), ChangeRateLeader VARCHAR(18), price VARCHAR(8), AmountChangeLeader VARCHAR(8), DataAll VARCHAR(388), DateSys DATE, TimeSys TIME)
BEGIN
SET NameSegmentEN = IF(NameSegmentEN = '', NULL, NameSegmentEN);
SET NameSegmentCN = IF(NameSegmentCN = '', NULL, NameSegmentCN);
SET NoStocks = IF(NoStocks = '', NULL, NoStocks);
SET AveragePrice = IF(AveragePrice = '', NULL, AveragePrice);
SET ChangePrice = IF(ChangePrice = '', NULL, ChangePrice);
SET ChangeRate = IF(ChangeRate = '', NULL, ChangeRate);
SET VolumeTotal = IF(VolumeTotal = '', NULL, VolumeTotal);
SET AmountTotal = IF(AmountTotal = '', NULL, AmountTotal);
SET CodeLeader = IF(CodeLeader = '', NULL, CodeLeader);
SET ChangeRateLeader = IF(ChangeRateLeader = '', NULL, ChangeRateLeader);
SET price = IF(price = '', NULL, price);
SET AmountChangeLeader = IF(AmountChangeLeader = '', NULL, AmountChangeLeader);
SET DataAll = IF(DataAll = '', NULL, DataAll);
SET DateSys = CURDATE();
SET TimeSys = CURTIME();

INSERT INTO `hs_bkhq_sina` (`NameSegmentEN`, `NameSegmentCN`, `NoStocks`, `AveragePrice`, `ChangePrice`, `ChangeRate`, `VolumeTotal`, `AmountTotal`, `CodeLeader`, `ChangeRateLeader`, `price`, `AmountChangeLeader`, `DataAll`, `DateSys`, `TimeSys`) VALUES (NameSegmentEN, NameSegmentCN, NoStocks, AveragePrice, ChangePrice, ChangeRate, VolumeTotal, AmountTotal, CodeLeader, ChangeRateLeader, price, AmountChangeLeader, DataAll, DateSys, TimeSys)
ON DUPLICATE KEY UPDate
`NameSegmentEN` = IF(NameSegmentEN IS NULL, `NameSegmentEN`, NameSegmentEN),
`NameSegmentCN` = IF(NameSegmentCN IS NULL, `NameSegmentCN`, NameSegmentCN),
`NoStocks` = IF(NoStocks IS NULL, `NoStocks`, NoStocks),
`AveragePrice` = IF(AveragePrice IS NULL, `AveragePrice`, AveragePrice),
`ChangePrice` = IF(ChangePrice IS NULL, `ChangePrice`, ChangePrice),
`ChangeRate` = IF(ChangeRate IS NULL, `ChangeRate`, ChangeRate),
`VolumeTotal` = IF(VolumeTotal IS NULL, `VolumeTotal`, VolumeTotal),
`AmountTotal` = IF(AmountTotal IS NULL, `AmountTotal`, AmountTotal),
`CodeLeader` = IF(CodeLeader IS NULL, `CodeLeader`, CodeLeader),
`ChangeRateLeader` = IF(ChangeRateLeader IS NULL, `ChangeRateLeader`, ChangeRateLeader),
`price` = IF(price IS NULL, `price`, price),
`AmountChangeLeader` = IF(AmountChangeLeader IS NULL, `AmountChangeLeader`, AmountChangeLeader),
`DataAll` = IF(DataAll IS NULL, `DataAll`, DataAll);
END$$
DELIMITER ;


CALL hs_bkhq_sina('[标签:NameSegmentEN]','[标签:NameSegmentCN]','[标签:NoStocks]','[标签:AveragePrice]','[标签:ChangePrice]','[标签:ChangeRate]','[标签:VolumeTotal]','[标签:AmountTotal]','[标签:CodeLeader]','[标签:ChangeRateLeader]','[标签:price]','[标签:AmountChangeLeader]','[标签:DataAll]', '','')
