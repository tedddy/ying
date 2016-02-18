ying locoy project hs_s_sina

Steps:
1. change hs_s_sina
2. change labels by replacing one by one.
	2.1 note: step 2 and step 3 can be done at the same time to save time
3. create table and setup mysql procedure
	3.1 note: add unique statement: UNIQUE KEY `UniqueKeyName` (``,``,``)
	3.2 note: change the data type of each field & change the length of VARCHAR
	3.3 note: for each field of the table, make a good comment including a standardized and consistant field, and the original label in the datasource. 
4. setup locoy project: 192.168.137.172 gxh locoy ying
	4.1 数据库地址：C:\火车采集器V8\Data\（*）\SpiderResult.db3
5. test
	5.1 note: test with a few records

网址：
数据：
http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/Market_Center.getHQNodeData?page=1&num=2000&sort=code&asc=1&node=sh_a&symbol=
http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/Market_Center.getHQNodeData?page=1&num=2000&sort=code&asc=1&node=sz_a&symbol=
参考：
	
{symbol:"sz000001",code:"000001",name:"平安银行",trade:"11.10",pricechange:"0.100",changepercent:"0.909",buy:"11.09",sell:"11.10",settlement:"11.00",open:"11.03",high:"11.19",low:"10.88",volume:85107389,amount:940582957,ticktime:"15:05:54",per:6.416,pb:1.053,mktcap:15882630.51429,nmc:13102500.58269,turnoverratio:0.721}

【code】：000001
【fSH】：0
【close】：11.06
【chgprice】：-0.040
【chgrate】：-0.360
【buy】：11.06
【sell】：11.07
【settlement】：11.10
【open】：11.00
【high】：11.07
【low】：10.94
【volume】：11564118
【amount】：127197212
【per】：6.393
【pb】：1.049
【mktcap】：15825395.809734
【nmc】：13055284.364374
【tRatio】：0.09797
【time】：10:08:02;

SELECT * FROM `ying`.`hs_s_sina`;		
DROP TABLE `ying`.`hs_s_sina`;
CREATE TABLE `hs_s_sina` (
    `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(6) DEFAULT NULL COMMENT 'code',
    `fSH` TINYINT(1) UNSIGNED DEFAULT NULL COMMENT 'fSH',
    `close` DECIMAL(7 , 3 ) UNSIGNED DEFAULT NULL COMMENT 'close',
    `chgprice` DECIMAL(7 , 3 ) UNSIGNED DEFAULT NULL COMMENT 'chgprice',
    `chgrate` VARCHAR(18) DEFAULT NULL COMMENT 'chgrate',
    `buy` DECIMAL(7 , 3 ) UNSIGNED DEFAULT NULL COMMENT 'buy',
    `sell` DECIMAL(7 , 3 ) UNSIGNED DEFAULT NULL COMMENT 'sell',
    `settlement` DECIMAL(7 , 3 ) UNSIGNED DEFAULT NULL COMMENT 'settlement',
    `open` DECIMAL(7 , 3 ) UNSIGNED DEFAULT NULL COMMENT '开盘价',
    `high` DECIMAL(7 , 3 ) UNSIGNED DEFAULT NULL COMMENT 'high',
    `low` DECIMAL(7 , 3 ) UNSIGNED DEFAULT NULL COMMENT 'low',
    `volume` INT(11) UNSIGNED DEFAULT NULL COMMENT 'volume',
    `amount` INT(11) UNSIGNED DEFAULT NULL COMMENT 'amount',
    `per` DECIMAL(6 , 3 ) UNSIGNED DEFAULT NULL COMMENT 'per',
    `pb` DECIMAL(6 , 3 ) UNSIGNED DEFAULT NULL COMMENT 'pb',
    `mktcap` DECIMAL(16 , 6 ) UNSIGNED DEFAULT NULL COMMENT 'mktcap',
    `nmc` DECIMAL(16 , 6 ) UNSIGNED DEFAULT NULL COMMENT 'nmc',
    `tRatio` DECIMAL(9 , 6 ) UNSIGNED DEFAULT NULL COMMENT 'tRatio',
    `time` time DEFAULT NULL COMMENT 'time',
    `DateSys` DATE DEFAULT NULL COMMENT 'DateSystem',
    PRIMARY KEY (`id`),
    UNIQUE KEY `KeyName` (`code` , `time` , `DateSys`)
)  ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

-- trigger的例子
-- CREATE DEFINER=`gxh`@`%` TRIGGER `ying`.`hs_s_sina_BEFORE_INSERT`
-- BEFORE INSERT ON `ying`.`hs_s_sina`
-- FOR EACH ROW
-- SET NEW.volume = NEW.volume * 100;
-- 
DROP PROCEDURE `ying`.`hs_s_sina`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_sina`(IN code VARCHAR(18), fSH VARCHAR(18), close VARCHAR(18), chgprice VARCHAR(18), chgrate VARCHAR(18), buy VARCHAR(18), sell VARCHAR(18), settlement VARCHAR(18), open VARCHAR(18), high VARCHAR(18), low VARCHAR(18), volume VARCHAR(18), amount VARCHAR(18), per VARCHAR(18), pb VARCHAR(18), mktcap VARCHAR(18), nmc VARCHAR(18), tRatio VARCHAR(18), time VARCHAR(18), DateSys DATE)

BEGIN
SET code = IF(code = '', NULL, code);
SET fSH = IF(fSH = '', NULL, fSH);
SET close = IF(close = '', NULL, close);
SET chgprice = IF(chgprice = '', NULL, chgprice);
SET chgrate = IF(chgrate = '', NULL, chgrate);
SET buy = IF(buy = '', NULL, buy);
SET sell = IF(sell = '', NULL, sell);
SET settlement = IF(settlement = '', NULL, settlement);
SET open = IF(open = '', NULL, open);
SET high = IF(high = '', NULL, high);
SET low = IF(low = '', NULL, low);
SET volume = IF(volume = '', NULL, volume);
SET amount = IF(amount = '', NULL, amount);
SET per = IF(per = '', NULL, per);
SET pb = IF(pb = '', NULL, pb);
SET mktcap = IF(mktcap = '', NULL, mktcap);
SET nmc = IF(nmc = '', NULL, nmc);
SET tRatio = IF(tRatio = '', NULL, tRatio);
SET time = IF(time = '', NULL, time);
SET DateSys = CURDATE();

INSERT INTO `hs_s_sina` (`code`, `fSH`, `close`, `chgprice`, `chgrate`, `buy`, `sell`, `settlement`, `open`, `high`, `low`, `volume`, `amount`, `per`, `pb`, `mktcap`, `nmc`, `tRatio`, `time`, `DateSys`) VALUES (code, fSH, close, chgprice, chgrate, buy, sell, settlement, open, high, low, volume, amount, per, pb, mktcap, nmc, tRatio, time, DateSys) 
ON DUPLICATE KEY UPDate 
`code` = IF(code IS NULL, `code`, code),
`fSH` = IF(fSH IS NULL, `fSH`, fSH),
`close` = IF(close IS NULL, `close`, close),
`chgprice` = IF(chgprice IS NULL, `chgprice`, chgprice),
`chgrate` = IF(chgrate IS NULL, `chgrate`, chgrate),
`buy` = IF(buy IS NULL, `buy`, buy),
`sell` = IF(sell IS NULL, `sell`, sell),
`settlement` = IF(settlement IS NULL, `settlement`, settlement),
`open` = IF(open IS NULL, `open`, open),
`high` = IF(high IS NULL, `high`, high),
`low` = IF(low IS NULL, `low`, low),
`volume` = IF(volume IS NULL, `volume`, volume),
`amount` = IF(amount IS NULL, `amount`, amount),
`per` = IF(per IS NULL, `per`, per),
`pb` = IF(pb IS NULL, `pb`, pb),
`mktcap` = IF(mktcap IS NULL, `mktcap`, mktcap),
`nmc` = IF(nmc IS NULL, `nmc`, nmc),
`tRatio` = IF(tRatio IS NULL, `tRatio`, tRatio),
`time` = IF(time IS NULL, `time`, time),
`DateSys` = DateSys;
END$$
DELIMITER ;

CALL hs_s_sina('[标签:code]','[标签:fSH]','[标签:close]','[标签:chgprice]','[标签:chgrate]','[标签:buy]','[标签:sell]','[标签:settlement]','[标签:open]','[标签:high]','[标签:low]','[标签:volume]','[标签:amount]','[标签:per]','[标签:pb]','[标签:mktcap]','[标签:nmc]','[标签:tRatio]','[标签:time]','[系统时间转化:yyyy-MM-dd]')