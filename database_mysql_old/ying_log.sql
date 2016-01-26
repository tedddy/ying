-- 150303
SELECT 
    *
FROM
    ying.hs_s_MoneyFlow_rt
WHERE
    code IN ('600030' , '601318')
ORDER BY code , DateSys DESC , TimeSys DESC;

-- 150227

SELECT 
    distinct code
FROM
    ying.hs300_s_data
WHERE
    code NOT IN (SELECT DISTINCT
            code
        FROM
            ying.hs_s);
            
UPDATE ying.hs_s SET f300 =  
CASE
  WHEN code in (select distinct code from hs300_s_data) = 1 THEN 1
  ELSE 0 
END;

INSERT INTO `hs_s` (`code`, `fW`, `f300`, `fSH`, `DateSys`) VALUES ('000562', '1', '1', '0', '2015-02-22');

SELECT 
    CONCAT('http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/MoneyFlow.ssl_qsfx_lscjfb?daima=', t.symbol, t.code, '&page=', numbers.number, '&num=20&sort=opendate&asc=0')
FROM
    (SELECT 
        code,
            (CASE
                WHEN fSH = 1 THEN 'sh'
                ELSE 'sz'
            END) symbol
    FROM
        hs_s, ying.numbers 
WHERE numbers.number <= 60 and
        f300 = 1) AS t; 
/* url for historical data */        
SELECT 
    CONCAT('http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/MoneyFlow.ssl_qsfx_lscjfb?daima=', (SELECT
            (CASE
                WHEN fSH = 1 THEN 'sh'
                ELSE 'sz'
            END)), code, '&page=', numbers.number, '&num=20&sort=opendate&asc=0') as url_hs300_s_data_txt
FROM   hs_s, ying.numbers 
WHERE f300 = 1; 

/* url for daily data */
SELECT 
    CONCAT('http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/MoneyFlow.ssl_qsfx_lscjfb?daima=', (SELECT
            (CASE
                WHEN fSH = 1 THEN 'sh'
                ELSE 'sz'
            END)), code, '&page=1&num=1&sort=opendate&asc=0') as url_hs300_s_dailydata_txt
FROM   hs_s
WHERE f300 = 1;  

/* url for daily data */
SELECT CONCAT('http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/MoneyFlow.ssl_qsfx_lscjfb?daima=', (SELECT (CASE WHEN fSH = 1 THEN 'sh' ELSE 'sz' END)), code, '&page=1&num=1&sort=opendate&asc=0') as url_hs_s_MoneyFlowDaily FROM hs_s WHERE f300 = 1;         

/* url for daily data */
SELECT CONCAT('http://s1.dfcfw.com/xml/', code, '.xml') as url_hs_s_MoneyFlow_rt_EM FROM hs_s WHERE f300 = 1;         

        
SELECT 
        code,
            CASE
                WHEN fSH = 1 THEN 'sh'
                ELSE 'sz'
            END
    FROM
        hs_s;

SELECT 
    t1.code,
    t1.date,
    t1.netAmount,
    SUM(t2.netAmount) AS Acumulate_netAmount
FROM
    (SELECT 
        *
    FROM
        ying.hs_s_MoneyFlow
    WHERE
        `code` IN ('600030' , '601318')) t1
        INNER JOIN
    (SELECT 
        *
    FROM
        ying.hs_s_MoneyFlow) t2 ON t2.date <= t1.date
        AND t2.`code` = t1.code
WHERE
    t1.date >= '2015-01-19'
        AND t2.date >= '2015-01-19'
GROUP BY t1.code , t1.date
ORDER BY t1.code , t1.date;

/* quicker and more flexible than the next query */
SELECT 
    code,
    date,
    netAmount,
    (SELECT 
            SUM(netAmount)
        FROM
            ying.hs_s_MoneyFlow
        WHERE
            `date` >= '2015-01-19'
                AND `code` = a.`code`
                AND `date` <= MAX(a.`date`)) cumulative_netAmount
FROM
    ying.hs_s_MoneyFlow a
WHERE
    date >= '2015-01-19'
--        AND `code` IN ('600030' , '601318')
GROUP BY code , date 
ORDER BY code , date ;

/* too slow */
SELECT 
    t1.code,
    t1.date,
    t2.netAmount,
    SUM(t2.netAmount) AS Acumulate_netAmount
FROM
    (SELECT 
        *
    FROM
        ying.hs_s_MoneyFlow
    WHERE
        `code` IN ('600030' , '601318')) t1
        INNER JOIN
    (SELECT 
        *
    FROM
        ying.hs_s_MoneyFlow
    WHERE
        `code` IN ('600030' , '601318')) t2 ON t2.date <= t1.date AND t2.code = t1.code
WHERE
    t1.date >= '2015-01-19'
        AND t2.date >= '2015-01-19'
GROUP BY t1.code , t1.date
ORDER BY t1.code , t1.date;

SET @cumulative_sum := 0;
SELECT 
    date,
    @cumulative_sum:=@cumulative_sum + netAmount AS cumulative_sum
FROM
    ying.hs_s_MoneyFlow
WHERE
    date >= '2015-01-19'
--        AND `code` = '600030'
GROUP BY date 
ORDER BY date ;

SELECT 
    sum(netAmount)
FROM
    ying.hs_s_MoneyFlow
WHERE
    date >= '2015-01-19';


-- 150226 

SELECT 
    *
FROM
    ying.hs_s_MoneyFlow
ORDER BY date DESC;

SET @cumulative_sum := 0;
SELECT 
    code,
    date,
    netAmount,
    @cumulative_sum:=@cumulative_sum + netAmount AS cumulative_sum
FROM
    ying.hs_s_MoneyFlow
WHERE
    date >= '2015-01-19'
        AND `code` = '600030'
GROUP BY code , date 
ORDER BY code , date ;

SELECT 
    code,
    date,
    netAmount,
    (SELECT 
            SUM(netAmount)
        FROM
            ying.hs_s_MoneyFlow
        WHERE
            `date` >= '2015-01-19'
                AND `code` = a.`code`
                AND `date` <= MAX(a.`date`)) cumulative_netAmount
FROM
    ying.hs_s_MoneyFlow a
WHERE
    date >= '2015-01-19'
        AND `code` IN ('600030' , '601318')
GROUP BY code , date 
ORDER BY code , date ;

SELECT 
    t1.date, SUM(t2.netAmount) AS Acumulate_netAmount
FROM
    (select * from ying.hs_s_MoneyFlow where `code` IN ('600030')) t1
        INNER JOIN
    (select * from ying.hs_s_MoneyFlow where `code` IN ('600030')) t2 ON t2.date <= t1.date
WHERE
    t1.date >= '2015-01-19'
        AND t2.date >= '2015-01-19'
GROUP BY t1.date
ORDER BY t1.date;

SELECT 
    *
FROM
    ying.hs300_MoneyFlow
ORDER BY date DESC , ticktime;

SELECT 
    *
FROM
    ying.hs300_MoneyFlow
WHERE
    date = CURDATE()
ORDER BY ticktime;

SELECT 
    *
FROM
    ying.hs300_s_data
ORDER BY code;

UPDATE ying.hs300_s_data 
SET 
    code = SUBSTRING(code, 3);

-- 150225

-- http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/MoneyFlow.ssl_qsfx_lscjfb?daima=sh600030&page=(*)&num=20&sort=opendate&asc=0

SELECT 
    CONCAT('http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/MoneyFlow.ssl_qsfx_lscjfb?daima=',
            hs300_s_data.code,
            '&page=',
            numbers.number,
            '&num=20&sort=opendate&asc=0')
FROM
    ying.hs300_s_data,
    ying.numbers
WHERE
    numbers.number <= 60;

SELECT 
    CONCAT('http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/MoneyFlow.ssl_qsfx_lscjfb?daima=',
            hs300_s_data.code,
            '&page=1&num=1&sort=opendate&asc=0')
FROM
    ying.hs300_s_dataDaily
WHERE
    numbers.number <= 60;

-- 150224

CREATE TABLE `hs300_s_data` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(6) DEFAULT NULL COMMENT 'code',
  `name` VARCHAR(12) DEFAULT NULL COMMENT 'name',
  `weight` DECIMAL(4,2) DEFAULT NULL COMMENT 'weight',
  `iName` VARCHAR(12) DEFAULT NULL COMMENT 'iName',
  `iCode` VARCHAR(8) DEFAULT NULL COMMENT 'iCode',
  `nmc` DECIMAL(16,4) DEFAULT NULL COMMENT '单位：股 round in procedure',
  `mktcap` DECIMAL(16,4) DEFAULT NULL COMMENT '单位：股 round in procedure',
  `last` DECIMAL(7,3) DEFAULT NULL COMMENT '昨收盘',
  `chgprice` DECIMAL(6,3) DEFAULT NULL COMMENT 'chgprice',
  `chgrate` DECIMAL(5,3) DEFAULT NULL COMMENT 'chgrate',
  `buy` DECIMAL(7,3) DEFAULT NULL COMMENT 'buy',
  `sell` DECIMAL(7,3) DEFAULT NULL COMMENT 'sell',
  `close` DECIMAL(7,3) DEFAULT NULL COMMENT 'close',
  `open` DECIMAL(7,3) DEFAULT NULL COMMENT 'open',
  `high` DECIMAL(7,3) DEFAULT NULL COMMENT 'high',
  `low` DECIMAL(7,3) DEFAULT NULL COMMENT 'low',
  `volume` INT(11) DEFAULT NULL COMMENT '单位：元（数据采集时为手，在procedure里用函数换算为股）',
  `amount` INT(11) DEFAULT NULL COMMENT '单位：元',
  `gxzs` DECIMAL(6,3) DEFAULT NULL COMMENT '贡献指数',
  `ltsz` DECIMAL(15,2) DEFAULT NULL COMMENT '单位：元',
  `TimeSys` TIME DEFAULT NULL COMMENT 'TimeSystem',
  `DateSys` DATE DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code`,`TimeSys`,`DateSys`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `numbers` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `number` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE OR REPLACE VIEW generator_16
AS SELECT 0 n UNION ALL SELECT 1  UNION ALL SELECT 2  UNION ALL 
   SELECT 3   UNION ALL SELECT 4  UNION ALL SELECT 5  UNION ALL
   SELECT 6   UNION ALL SELECT 7  UNION ALL SELECT 8  UNION ALL
   SELECT 9   UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL
   SELECT 12  UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL 
   SELECT 15;

CREATE OR REPLACE VIEW generator_256
AS SELECT ( ( hi.n << 4 ) | lo.n ) AS n
     FROM generator_16 lo, generator_16 hi;

CREATE OR REPLACE VIEW generator_4k
AS SELECT ( ( hi.n << 8 ) | lo.n ) AS n
     FROM generator_256 lo, generator_16 hi;

CREATE OR REPLACE VIEW generator_64k
AS SELECT ( ( hi.n << 8 ) | lo.n ) AS n
     FROM generator_256 lo, generator_256 hi;
     
INSERT INTO numbers(number)
SELECT n FROM generator_64k WHERE n < 64000;

update ying.numbers set number = number + 1;

DELIMITER $$
DROP TRIGGER IF EXISTS ying.hs300_s_data_BEFORE_INSERT$$
USE `ying`$$
CREATE DEFINER=`gxh`@`%` TRIGGER `ying`.`hs300_s_data_BEFORE_INSERT` BEFORE INSERT ON `hs300_s_data` FOR EACH ROW 
SET NEW.volume = NEW.volume * 100;$$
DELIMITER ;

-- 150223
CREATE TABLE `hs_mLoan_sLoan` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL COMMENT 'code',
  `date` varchar(18) DEFAULT NULL COMMENT 'date',
  `bMargin` int(11) unsigned DEFAULT NULL COMMENT '融资余额',
  `mBuy` int(11) unsigned DEFAULT NULL COMMENT '融资买入额',
  `mCover` int(11) unsigned DEFAULT NULL COMMENT '融资偿还额',
  `bStock` int(10) unsigned DEFAULT NULL COMMENT '融券余量',
  `sSell` int(10) unsigned DEFAULT NULL COMMENT '融券卖出量 short sell',
  `sCover` int(10) unsigned DEFAULT NULL COMMENT '融券偿还量',
  `DateSys` date DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `hs_s_MoneyFlow` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(6) DEFAULT NULL COMMENT 'code',
  `date` DATE DEFAULT NULL COMMENT '交易日期 opendate',
  `price` DECIMAL(8,4) DEFAULT NULL COMMENT '成交价格 trade',
  `chgrate` DECIMAL(11,9) DEFAULT NULL COMMENT '涨跌幅*100 changeratio',
  `tRatio` DECIMAL(8,4) DEFAULT NULL COMMENT '换手率*100 turnover',
  `netAmount` DECIMAL(16,4) DEFAULT NULL COMMENT '净流入(元 )netamount',
  `netRate` VARCHAR(18) DEFAULT NULL COMMENT '净流入率 ratioamount',
  `amountXL` DECIMAL(16,4) DEFAULT NULL COMMENT '特大单成交额 r0',
  `amountL` DECIMAL(15,4) DEFAULT NULL COMMENT '大单成交额 r1',
  `amountS` DECIMAL(14,4) DEFAULT NULL COMMENT '小单成交额 r2',
  `amountI` DECIMAL(13,4) DEFAULT NULL COMMENT '散户成交额(I: individual) r3',
  `netXL` DECIMAL(16,4) DEFAULT NULL COMMENT 'r0_net 特大单净流入',
  `netL` DECIMAL(15,4) DEFAULT NULL COMMENT 'r1_net 大单净流入',
  `netS` DECIMAL(14,4) DEFAULT NULL COMMENT 'r2_net 小单净流入',
  `netI` DECIMAL(13,4) DEFAULT NULL COMMENT 'r3_net 散户净流入',
  `DateSys` DATE DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`id`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

SELECT 
    *
FROM
    ying.hs_s_MoneyFlow
ORDER BY date DESC;

SET @cumulative_sum := 0;

SELECT 
    date,
    @cumulative_sum:=@cumulative_sum + netAmount AS cumulative_sum
FROM
    ying.hs_s_MoneyFlow
WHERE
    date >= '2015-01-19'
ORDER BY date ASC;

SELECT 
    date,
    netAmount,
    (SELECT 
            SUM(netAmount)
        FROM
            ying.hs_s_MoneyFlow
        WHERE
            `date` >= '2015-01-19'
                AND `code` IN ('610030')
                AND `date` <= MAX(a.`date`)) cumulative_netAmount
FROM
    ying.hs_s_MoneyFlow a
WHERE
    date >= '2015-01-19'
GROUP BY date
ORDER BY date;

SELECT 
    t1.date, SUM(t2.netAmount) AS Acumulate_netAmount
FROM
    ying.hs_s_MoneyFlow t1
        INNER JOIN
    ying.hs_s_MoneyFlow t2 ON t2.date <= t1.date
WHERE
    t1.date >= '2015-01-19'
        AND t2.date >= '2015-01-19'
GROUP BY t1.date
ORDER BY t1.date;

UPDATE `ying`.`hs_s` 
SET 
    `fW` = '9'
WHERE
    `code` IN ('600030' , '600887');

UPDATE `ying`.`hs_s` 
SET 
    `fW` = '9'
WHERE
    `code` IN ('600030' , '600887');
    
CREATE TABLE `hs300_MoneyFlow` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `date` DATE DEFAULT NULL COMMENT '交易日期 opendate',
  `ticktime` TIME DEFAULT NULL COMMENT 'ticktime',
  `price`  DECIMAL(8,4) DEFAULT NULL COMMENT 'avg_price',
  `chgrate`  DECIMAL(11,9) DEFAULT NULL COMMENT 'avg_changeratioc',
  `inAmount` DECIMAL(18,4) DEFAULT NULL COMMENT 'inAmount',
  `outAmount` DECIMAL(18,4) DEFAULT NULL COMMENT 'outAmount',
  `netAmount` DECIMAL(17,4) DEFAULT NULL COMMENT 'netAmount',
  `netRate` DECIMAL(11,9) DEFAULT NULL COMMENT 'netRate = netAmount/(inAmount+outAmount)',
  `netRatioXL` DECIMAL(11,9) DEFAULT NULL COMMENT '特大单净流入比例（r0_ratio)',
  `netRatioL` DECIMAL(11,9) DEFAULT NULL COMMENT '散单净流入比例（r_ratio)',
  `DateSys` DATE DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`date`,`ticktime`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- 150222
CREATE TABLE `hs_bkhq` (
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

CREATE TABLE `hs_s_symbol` (
  `symbol` VARCHAR(8) DEFAULT NULL COMMENT 'symbol',
  `DateSys` date DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`symbol`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

SELECT * FROM `hs_s`;
/*
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_symbol`(IN symbol VARCHAR(18), DateSys date)
BEGIN
SET symbol = IF(symbol = '', NULL, symbol);
SET DateSys = CURDATE();

WHILE symbol NOT IN (SELECT `symbol` FROM `hs_s_symbol`)
INSERT INTO `hs_s_symbol` (`symbol`, , `DateSys`) VALUES (symbol, DateSys) 
END WHILE
END
*/

/*
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_bkhq`(IN NameSegmentEN VARCHAR(8), NameSegmentCN VARCHAR(10), NoStocks VARCHAR(3), AveragePrice VARCHAR(18), ChangePrice VARCHAR(18), ChangeRate VARCHAR(18), VolumeTotal VARCHAR(12), AmountTotal VARCHAR(12), CodeLeader VARCHAR(8), ChangeRateLeader VARCHAR(18), price VARCHAR(8), AmountChangeLeader VARCHAR(8), DataAll VARCHAR(388), DateSys DATE, TimeSys TIME)
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

INSERT INTO `hs_bkhq` (`NameSegmentEN`, `NameSegmentCN`, `NoStocks`, `AveragePrice`, `ChangePrice`, `ChangeRate`, `VolumeTotal`, `AmountTotal`, `CodeLeader`, `ChangeRateLeader`, `price`, `AmountChangeLeader`, `DataAll`, `DateSys`, `TimeSys`) VALUES (NameSegmentEN, NameSegmentCN, NoStocks, AveragePrice, ChangePrice, ChangeRate, VolumeTotal, AmountTotal, CodeLeader, ChangeRateLeader, price, AmountChangeLeader, DataAll, DateSys, TimeSys)
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
END
*/
DROP TABLE `ying`.`hs_s_mktcap`;
CREATE TABLE `hs_s_mktcap` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(18) DEFAULT NULL COMMENT 'code',
  `cDate` date DEFAULT NULL COMMENT '变动日期cDate',
  `rDate` date DEFAULT NULL COMMENT '公告日期rDate',
  `cReason` varchar(18) DEFAULT NULL COMMENT '变动原因',
  `mktcap` decimal(11,2) DEFAULT NULL COMMENT '总股本mktcap',
  `nmc` decimal(11,2) DEFAULT NULL COMMENT '流通A股nmc',
  `H_mktcap` decimal(11,2) DEFAULT NULL COMMENT '流通H股H_mktcap',
  `A_mktcap_f` decimal(11,2) DEFAULT NULL COMMENT '限售A股A_mktcap_f',
  `DateSys` date DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code`,`cDate`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

SELECT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vCI_StockStructure/stockid/', code, '.phtml') AS 'url_hs_s_mktcap' FROM `hs_s`;

/*
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_mktcap`(IN code VARCHAR(6), cDate DATE, rDate DATE, mktcap VARCHAR(18), nmc VARCHAR(18), H_mktcap VARCHAR(18), A_mktcap_f VARCHAR(18), DateSys date)
BEGIN
SET code = IF(code = '', NULL, code);
SET cDate = IF(cDate = '', NULL, cDate);
SET rDate = IF(rDate = '', NULL, rDate);
SET mktcap = IF(mktcap = '', NULL, mktcap);
SET nmc = IF(nmc = '', NULL, nmc);
SET H_mktcap = IF(H_mktcap = '', NULL, H_mktcap);
SET A_mktcap_f = IF(A_mktcap_f = '', NULL, A_mktcap_f);
SET DateSys = CURDATE();

INSERT INTO `hs_s_mktcap` (`code`, `cDate`, `rDate`, `mktcap`, `nmc`, `H_mktcap`, `A_mktcap_f`, `DateSys`) VALUES (code, cDate, rDate, mktcap, nmc, H_mktcap, A_mktcap_f, DateSys) 
ON DUPLICATE KEY UPDate 
`rDate` = IF(rDate IS NULL, `rDate`, rDate),
`mktcap` = IF(mktcap IS NULL, `mktcap`, mktcap),
`nmc` = IF(nmc IS NULL, `nmc`, nmc),
`H_mktcap` = IF(H_mktcap IS NULL, `H_mktcap`, H_mktcap),
`A_mktcap_f` = IF(A_mktcap_f IS NULL, `A_mktcap_f`, A_mktcap_f),
`DateSys` = DateSys; 
END
*/

-- 150209
-- 增加一列
ALTER TABLE `securities`.`hk_xts` 
ADD COLUMN `uCode` VARCHAR(10) NULL AFTER `code`;

-- 150208

-- 查询权证信息
SELECT 
    *
FROM
    securities.hk_w_info
WHERE
    uCode = '06030' AND nature = 'call'
ORDER BY DateP DESC;

-- create table hs_300_info 
CREATE TABLE `hs_300_info` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL COMMENT '代码',
  `name` varchar(96) DEFAULT NULL COMMENT '股票汉名',
  `pb` decimal(7,3) DEFAULT NULL COMMENT '市盈率PB',
  `per` decimal(7,3) DEFAULT NULL COMMENT '市净率PE',
  `mktcap` decimal(15,6) unsigned DEFAULT NULL COMMENT '总市值',
  `nmc` decimal(15,6) unsigned DEFAULT NULL COMMENT '流通市值',
  `chgprice` decimal(6,3) DEFAULT NULL COMMENT '涨跌额',
  `chgrate` decimal(6,3) DEFAULT NULL COMMENT '涨跌幅',
  `last` decimal(7,3) unsigned DEFAULT NULL COMMENT '昨收',
  `open` decimal(7,3) unsigned DEFAULT NULL COMMENT '开盘价',
  `high` decimal(7,3) unsigned DEFAULT NULL COMMENT '最高价',
  `low` decimal(7,3) unsigned DEFAULT NULL COMMENT '最低价',
  `price` decimal(7,3) unsigned DEFAULT NULL COMMENT '股票当前价',
  `buy` decimal(7,3) unsigned DEFAULT NULL COMMENT '买一价',
  `sell` decimal(7,3) unsigned DEFAULT NULL COMMENT '卖一价',
  `volume` int(11) unsigned DEFAULT NULL COMMENT '成交量',
  `amount` int(11) unsigned DEFAULT NULL COMMENT '成交额',
  `turnoverratio` decimal(7,3) unsigned DEFAULT NULL COMMENT '换手率',
  `DateSys` date DEFAULT NULL COMMENT '日期',
  `ticktime` time DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code-DateSys-time` (`code`,`DateSys`,`ticktime`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8;

UPDATE hs_300_info 
SET 
    DateSys = CURDATE() - 1; 
    
SELECT 
    SUM(volume), SUM(amount)
FROM
    securities.hs_300_info;
    
CREATE TABLE `hk_xts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL COMMENT '代码',
  `date` date DEFAULT NULL COMMENT '日期',
  `open` decimal(7,3) unsigned DEFAULT NULL COMMENT '开盘价',
  `high` decimal(7,3) unsigned DEFAULT NULL COMMENT '最高价',
  `low` decimal(7,3) unsigned DEFAULT NULL COMMENT '最低价',
  `close` decimal(7,3) unsigned DEFAULT NULL COMMENT '收盘价',
  `volume` int(11) unsigned DEFAULT NULL COMMENT '成交量',
  `adjusted` decimal(7,3) unsigned DEFAULT NULL COMMENT '收盘价',
  `amount` int(11) unsigned DEFAULT NULL COMMENT '股票成交额',
  `turnover` int(11) unsigned DEFAULT NULL COMMENT '权证成交额',  
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_date` (`code`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `hk_rt` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(5) NOT NULL COMMENT '代码',
  `price` decimal(7,3) unsigned DEFAULT NULL COMMENT '当前价',
  `buy` decimal(7,3) unsigned DEFAULT NULL COMMENT '买一价',
  `sell` decimal(7,3) unsigned DEFAULT NULL COMMENT '卖一价',
  `amount` int(11) unsigned DEFAULT NULL COMMENT '股票成交额',
  `turnover` int(11) unsigned DEFAULT NULL COMMENT '权证成交额',
  `date` date DEFAULT NULL COMMENT '日期',
  `time` time DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_date_time` (`code`,`date`,`time`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

SELECT 
    CONCAT('http://hq.sinajs.cn/list=hk', code) AS 'url_hk_s_watch'
FROM
    `hk_w_info`
WHERE
    `WatchF` = '1';

SELECT CONCAT('http://hq.sinajs.cn/list=hk', code) AS 'url_hk_s_watch' FROM `hk_w_info` WHERE `WatchF` = '1';



-- 150207 

-- 修复 sina_rt locoy project locoy_hk_s_hgt_sina 沪港通香港股票 (See yinxiang)

-- 修复 sina_rt locoy project locoy_hs_300_sina  沪深300 数据 locoy (See yinxiang)

-- 修改日期为今天的前一天
UPDATE locoy_hs_300_sina 
SET 
    DateSys = CURDATE() - 1
WHERE
    DateSys = CURDATE(); 

-- Rename database sina_rt to securities (see evernote: How do I quickly rename a mysql database (change schema name)?)

-- 修改 sina_rt locoy project locoy_hk_w_info （以下命令不能解决编码问题，也不能导入procedure。查一下怎么使用选项来完成）
	-- mysqladmin -u gxh -p create securities
    -- mysqldump -u gxh -p -v sina_rt > sina_rt_150207_BeforeRename.sql
    -- mysql -u gxh -p securities < sina_rt_150207_BeforeRename.sql

-- create database securities
CREATE SCHEMA `securities` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

-- create table hk_w_info
CREATE TABLE `hk_w_info` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL COMMENT '代码',
  `price` decimal(7,3) unsigned DEFAULT NULL COMMENT '最近成交价 last trade',
  `premium` decimal(6,3) DEFAULT NULL COMMENT '溢价',
  `gear` decimal(6,3) DEFAULT NULL COMMENT '杠杆比率',
  `DaysLeft` smallint(5) unsigned DEFAULT NULL COMMENT '剩余天数',
  `uCode` varchar(10) DEFAULT NULL COMMENT '标的代码 uCode means underlining code or index',
  `NameEN` varchar(96) DEFAULT NULL COMMENT '股票英名',
  `NameCN` varchar(96) DEFAULT NULL COMMENT '股票汉名',
  `nature` varchar(4) DEFAULT NULL COMMENT 'call or put',
  `strike` decimal(7,3) unsigned DEFAULT NULL COMMENT '行权价',
  `DateP` date DEFAULT NULL COMMENT '开始日期',
  `DateM` date DEFAULT NULL COMMENT '截止日期',
  `publisher` VARCHAR(18) DEFAULT NULL COMMENT '发行商 publisher',
  `chgrate` VARCHAR(18) DEFAULT NULL COMMENT '增幅 chgrate means change rate',
  `volume` VARCHAR(18) DEFAULT NULL COMMENT '成交量',
  `turnover` VARCHAR(18) DEFAULT NULL COMMENT '成交金额',
  `RatioC` decimal(4,2) DEFAULT NULL COMMENT '行权比例',
  `VolumeT` int(11) DEFAULT NULL COMMENT '最新份额',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `HoldingF` tinyint(1) unsigned DEFAULT NULL COMMENT '是否持有',
  `BuyF` tinyint(1) unsigned DEFAULT NULL COMMENT '是否买入',
  `SellF` tinyint(1) unsigned DEFAULT NULL COMMENT '是否卖出',
  `IncF` tinyint(1) unsigned DEFAULT NULL COMMENT '是否增持',
  `DecF` tinyint(1) unsigned DEFAULT NULL COMMENT '是否减持',
  `WatchF` tinyint(1) unsigned DEFAULT NULL COMMENT '观察',
  `DateSys` date DEFAULT NULL COMMENT 'DateSys',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- CALL locoy_hk_w_info('[标签:symbol]','[标签:warrant_name]','[标签:stock_symbol]','[标签:callputflag]','[标签:strikeprice]','[标签:premium]','[标签:conversionratio]','[标签:maturitydate]','[标签:publish_date]','[标签:publisher]','[标签:lasttrade]','[标签:chgrate]','[标签:volume]','[标签:amount]', '')

-- PROCEDURE `locoy_hk_w_info`
/*

CREATE DEFINER=`gxh`@`%` PROCEDURE `locoy_hk_w_info`(IN code VARCHAR(18), NameCN VARCHAR(18), uCode VARCHAR(18), nature VARCHAR(18), strike VARCHAR(18), premium VARCHAR(18), RatioC VARCHAR(18), DateM VARCHAR(18), DateP VARCHAR(18), publisher VARCHAR(18), price VARCHAR(18), chgrate VARCHAR(18), volume VARCHAR(18), turnover VARCHAR(18), DateSys date)
BEGIN
SET code = IF(code = '', NULL, code);
SET NameCN = IF(NameCN = '', NULL, NameCN);
SET uCode = IF(uCode = '', NULL, uCode);
SET nature = IF(nature = '', NULL, nature);
SET strike = IF(strike = '', NULL, strike);
SET premium = IF(premium = '', NULL, premium);
SET RatioC = IF(RatioC = '', NULL, RatioC);
SET DateM = IF(DateM = '', NULL, DateM);
SET DateP = IF(DateP = '', NULL, DateP);
SET publisher = IF(publisher = '', NULL, publisher);
SET price = IF(price = '', NULL, price);
SET chgrate = IF(chgrate = '', NULL, chgrate);
SET volume = IF(volume = '', NULL, volume);
SET turnover = IF(turnover = '', NULL, turnover);
SET DateSys = CURDATE();

INSERT INTO `hk_w_info` (`code`, `NameCN`, `uCode`, `nature`, `strike`, `premium`, `RatioC`, `DateM`, `DateP`, `publisher`, `price`, `chgrate`, `volume`, `turnover`, `DateSys`) VALUES (code, NameCN, uCode, nature, strike, premium, RatioC, DateM, DateP, publisher, price, chgrate, volume, turnover, DateSys)
ON DUPLICATE KEY UPDate
`code` = IF(code IS NULL, `code`, code),
`NameCN` = IF(NameCN IS NULL, `NameCN`, NameCN),
`uCode` = IF(uCode IS NULL, `uCode`, uCode),
`nature` = IF(nature IS NULL, `nature`, nature),
`strike` = IF(strike IS NULL, `strike`, strike),
`premium` = IF(premium IS NULL, `premium`, premium),
`RatioC` = IF(RatioC IS NULL, `RatioC`, RatioC),
`DateM` = IF(DateM IS NULL, `DateM`, DateM),
`DateP` = IF(DateP IS NULL, `DateP`, DateP),
`publisher` = IF(publisher IS NULL, `publisher`, publisher),
`price` = IF(price IS NULL, `price`, price),
`chgrate` = IF(chgrate IS NULL, `chgrate`, chgrate),
`volume` = IF(volume IS NULL, `volume`, volume),
`turnover` = IF(turnover IS NULL, `turnover`, turnover),
`DateSys` = DateSys; 
END

*/


-- 150205 test

-- 在实时数据中查找当天标的证券以及其所对应的所有权证的成交量
SELECT 
    code_turnover.uCode, SUM(code_turnover.turnover_last)
FROM
    (SELECT 
        rt.code, info.uCode, MAX(rt.turnover) AS turnover_last
    FROM
        securities.hk_rt AS rt
    JOIN hk_w_info AS info ON rt.code = info.code
    WHERE
        date = CURDATE()
            AND rt.code IN (SELECT 
                code
            FROM
                hk_w_info)
    GROUP BY code) AS code_turnover
WHERE
    code_turnover.uCode IS NOT NULL
GROUP BY code_turnover.uCode;

-- 在实时数据中查找当天标的为某证券的所有权证的成交量，有标的代码。
SELECT 
    code_turnover.uCode, SUM(code_turnover.turnover_last)
FROM
    (SELECT 
    rt.code, info.uCode, MAX(rt.turnover) AS turnover_last
FROM
    securities.hk_rt AS rt
join hk_w_info AS info on rt.code = info.code
WHERE
    /*date = CURDATE()
        AND*/ rt.code IN (SELECT 
            code
        FROM
            hk_w_info
        WHERE
            uCode = '06030')
GROUP BY code) AS code_turnover;

-- 在实时数据中查找当天标的为某证券的所有权证的成交量，无标的代码。
SELECT 
    SUM(code_turnover.turnover_last)
FROM
    (SELECT 
        code, MAX(turnover) AS turnover_last
    FROM
        securities.hk_rt
    WHERE
        date = CURDATE()
            AND code IN (SELECT 
                code
            FROM
                hk_w_info
            WHERE
                uCode = '06837')
    GROUP BY code) AS code_turnover;

-- 在实时数据中查找当天标的为某证券的权证的成交量, 并且用join取得uCode的code
SELECT 
    rt.code, info.uCode, MAX(rt.turnover) AS turnover_last
FROM
    ying.hk_rt AS rt
join hk_w AS info on rt.code = info.code
WHERE
    date = CURDATE() - 2 
        AND rt.code IN (SELECT 
            code
        FROM
            hk_w
        WHERE
            uCode = '06837')
GROUP BY code;

-- 在实时数据中查找当天标的为某证券的权证的成交量
SELECT 
    code, max(turnover)
FROM
    securities.hk_rt
WHERE
    date = CURDATE()
        AND code IN (SELECT 
            code
        FROM
            hk_w_info
        WHERE
            uCode = '06837')
group by code
ORDER BY code DESC;

-- 在实时数据中查找当天标的为中信H的权证
SELECT 
    *
FROM
    securities.hk_rt
WHERE
    date = CURDATE()
        AND code IN (SELECT 
            code
        FROM
            hk_w_info
        WHERE
            uCode = '06030')
ORDER BY id DESC;


-- 150204
-- 查询中信H的权证成交量
SELECT 
    date, uCode, SUM(turnover) AS turnover
FROM
    hk_w_xts
WHERE
    date IS NOT NULL AND uCode = '06030'
GROUP BY date , uCode;

-- 150203 locoy project hs_bkhq_sina

CREATE TABLE `locoy_hs_bkhq_sina` (
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
  `DataAll` VARCHAR(18) DEFAULT NULL COMMENT 'DataAll',
  `DateSys` date DEFAULT NULL COMMENT 'DateSystem',
  `TimeSys` time DEFAULT NULL COMMENT 'TimeSystem',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`NameSegmentEN`,`DateSys`, `TimeSys`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- 150202
-- 创建hs股票的xts表
CREATE TABLE `hs_xts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL COMMENT '代码',
  `date` date DEFAULT NULL COMMENT '日期',
  `open` decimal(7,3) unsigned DEFAULT NULL COMMENT '开盘价',
  `high` decimal(7,3) unsigned DEFAULT NULL COMMENT '最高价',
  `low` decimal(7,3) unsigned DEFAULT NULL COMMENT '最低价',
  `close` decimal(7,3) unsigned DEFAULT NULL COMMENT '收盘价',
  `volume` int(11) unsigned DEFAULT NULL COMMENT '成交量',
  `adjusted` decimal(7,3) unsigned DEFAULT NULL COMMENT '收盘价',
  `amount` int(11) unsigned DEFAULT NULL COMMENT '成交额',
  `turnover` int(11) unsigned DEFAULT NULL COMMENT '权证成交额',
  `buy` decimal(7,3) unsigned DEFAULT NULL COMMENT '买一价',
  `sell` decimal(7,3) unsigned DEFAULT NULL COMMENT '卖一价',
  `uCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Code_Date` (`code`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- 因为老是报错，删除掉hk_xts表的trigger

-- CREATE DEFINER=`gxh`@`localhost` TRIGGER `securities`.`hk_xts_AFTER_INSERT` AFTER INSERT ON `hk_xts` FOR EACH ROW
--     UPDATE hk_xts AS xts
--         JOIN
--     hk_w_info AS info ON xts.code = info.code 
-- SET 
--     xts.uCode = info.uCode
-- 

-- 150131
-- 删除采集不成功的数据
DELETE FROM hk_xts 
WHERE
    date IS NULL AND open IS NULL
    AND volume = 0
    AND turnover = 0;

-- 查看股票相应的认购权证和认沽权证的每日成交总量
SELECT 
    code, uCode, turnover
FROM
    hk_xts
WHERE uCode IS NULL;
--    AND code = '06030'

-- 插入股票xts数据时,执行trigger统计该股票相应的认购权证和认沽权证的成交总量

-- 统计每只股票相应的认购权证和认沽权证的成交总量，并且写入xts表
UPDATE hk_xts AS xts
        JOIN
    (SELECT 
        date, uCode, SUM(turnover) AS turnover
    FROM
        hk_xts
    WHERE
        date IS NOT NULL
    GROUP BY date , uCode) AS dts ON xts.code = dts.uCode
        AND xts.date = dts.date 
SET 
    xts.turnover = dts.turnover;
-- WHERE
--     xts.date = '2015-01-30'
--         AND xts.code = '06030'




-- 150130

-- 更新权证的标的代码 
UPDATE hk_xts AS xts
        JOIN
    hk_w_info AS info ON xts.code = info.code 
SET 
    xts.uCode = info.uCode;

-- 在xts表中amount对应的是股票的成交金额,turnover对应的是权证的成交金额。下面的语句使权证对应的amount为控制（NULL）。 
UPDATE securitieshk.hk_xts 
SET 
    hk_xts.amount = NULL
WHERE
    hk_xts.code IN (SELECT 
            code
        FROM
            securitieshk.hk_w_info);

-- 统计所有股票相应的认购权证和认沽权证的每日成交总量
SELECT 
    date, uCode, SUM(turnover) AS turnover
FROM
    hk_xts
WHERE
     uCode in ('06030', '06837')
GROUP BY date , uCode;

-- 查询'2015-01-29'以中信证券H（06030）为标的的认购权证的总成交量 
SELECT 
    sum(turnover)
FROM
    securities.hk_xts
WHERE
    code IN (SELECT 
            code
        FROM
            securities.hk_w_info
        WHERE
            uCode = '06030' AND nature = 'call' AND date = '2015-01-29')
ORDER BY turnover DESC;

-- 查询在某日所有股票相应的认购权证和认沽权证的成交总量
SELECT 
    uCode, sum(turnover)
FROM
    hk_xts
WHERE
    date = '2015-01-30'
        AND uCode IS NOT NULL
GROUP BY uCode;

-- 查询证券在不同日期相应的认购权证和认沽权证的成交总量
SELECT
    date, uCode, SUM(turnover)
FROM
    hk_xts
WHERE
    uCode IN ('02822' , '02823')
GROUP BY date , uCode
ORDER BY date;

-- 查询在某日股票的成交量
SELECT 
    code, amount
FROM
    hk_xts
WHERE
    date = '2015-01-30'
        AND uCode IS NULL;

-- 更新xts数据
UPDATE hk_xts 
SET 
    turnover = 0
WHERE
    date = '2015-01-30' AND code = '06030';