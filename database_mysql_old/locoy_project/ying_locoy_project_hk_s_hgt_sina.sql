网址：http://vip.stock.finance.sina.com.cn/mkt/#hgt_hk
数据：http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/Market_Center.getHKStockData?page=1&num=800&sort=symbol&asc=1&node=hgt_hk&_s_r_a=init
参考：
源码：

DROP TABLE `hk_s_hgt_sina`;
CREATE TABLE `hk_s_hgt_sina` (
  `id` mediumint(12) unsigned NOT NULL AUTO_INCREMENT,
  `symbol` varchar(18) NOT NULL COMMENT 'symbol',
  `name` varchar(18) DEFAULT NULL COMMENT 'name',
  `engname` varchar(18) DEFAULT NULL COMMENT 'engname',
  `tradetype` varchar(18) DEFAULT NULL COMMENT 'tradetype',
  `lasttrade` varchar(18) DEFAULT NULL COMMENT 'lasttrade',
  `prevclose` varchar(18) DEFAULT NULL COMMENT 'prevclose',
  `open` varchar(18) DEFAULT NULL COMMENT 'open',
  `high` varchar(18) DEFAULT NULL COMMENT 'high',
  `low` varchar(18) DEFAULT NULL COMMENT 'low',
  `volume` varchar(18) DEFAULT NULL COMMENT 'volume',
  `currentvolume` varchar(18) DEFAULT NULL COMMENT 'currentvolume',
  `amount` varchar(18) DEFAULT NULL COMMENT 'amount',
  `ticktime` varchar(28) DEFAULT NULL COMMENT 'ticktime',
  `buy` varchar(18) DEFAULT NULL COMMENT 'buy',
  `sell` varchar(18) DEFAULT NULL COMMENT 'sell',
  `high_52week` varchar(18) DEFAULT NULL COMMENT 'high_52week',
  `low_52week` varchar(18) DEFAULT NULL COMMENT 'low_52week',
  `eps` varchar(18) DEFAULT NULL COMMENT 'eps',
  `dividend` varchar(18) DEFAULT NULL COMMENT 'dividend',
  `stocks_sum` varchar(18) DEFAULT NULL COMMENT 'stocks_sum',
  `pricechange` varchar(18) DEFAULT NULL COMMENT 'pricechange',
  `changepercent` varchar(18) DEFAULT NULL COMMENT 'changepercent',
  `date_sys` date NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `symbol_ticktime` (`symbol`,`ticktime`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hk_s_hgt_sina`(IN symbol VARCHAR(18), name VARCHAR(18), engname VARCHAR(18), tradetype VARCHAR(18), lasttrade VARCHAR(18), prevclose VARCHAR(18), open VARCHAR(18), high VARCHAR(18), low VARCHAR(18), volume VARCHAR(18), currentvolume VARCHAR(18), amount VARCHAR(18), ticktime VARCHAR(18), buy VARCHAR(18), sell VARCHAR(18), high_52week VARCHAR(18), low_52week VARCHAR(18), eps VARCHAR(18), dividend VARCHAR(18), stocks_sum VARCHAR(18), pricechange VARCHAR(18), changepercent VARCHAR(18), date_sys date)
BEGIN
SET symbol = IF(symbol = '', NULL, symbol);
SET name = IF(name = '', NULL, name);
SET engname = IF(engname = '', NULL, engname);
SET tradetype = IF(tradetype = '', NULL, tradetype);
SET lasttrade = IF(lasttrade = '', NULL, lasttrade);
SET prevclose = IF(prevclose = '', NULL, prevclose);
SET open = IF(open = '', NULL, open);
SET high = IF(high = '', NULL, high);
SET low = IF(low = '', NULL, low);
SET volume = IF(volume = '', NULL, volume);
SET currentvolume = IF(currentvolume = '', NULL, currentvolume);
SET amount = IF(amount = '', NULL, amount);
SET ticktime = IF(ticktime = '', NULL, ticktime);
SET buy = IF(buy = '', NULL, buy);
SET sell = IF(sell = '', NULL, sell);
SET high_52week = IF(high_52week = '', NULL, high_52week);
SET low_52week = IF(low_52week = '', NULL, low_52week);
SET eps = IF(eps = '', NULL, eps);
SET dividend = IF(dividend = '', NULL, dividend);
SET stocks_sum = IF(stocks_sum = '', NULL, stocks_sum);
SET pricechange = IF(pricechange = '', NULL, pricechange);
SET changepercent = IF(changepercent = '', NULL, changepercent);
SET date_sys = date_sys;

INSERT INTO `hk_s_hgt_sina` (`symbol`, `name`, `engname`, `tradetype`, `lasttrade`, `prevclose`, `open`, `high`, `low`, `volume`, `currentvolume`, `amount`, `ticktime`, `buy`, `sell`, `high_52week`, `low_52week`, `eps`, `dividend`, `stocks_sum`, `pricechange`, `changepercent`, `date_sys`) VALUES (symbol, name, engname, tradetype, lasttrade, prevclose, open, high, low, volume, currentvolume, amount, ticktime, buy, sell, high_52week, low_52week, eps, dividend, stocks_sum, pricechange, changepercent, date_sys)
ON DUPLICATE KEY UPDate
`symbol` = IF(symbol IS NULL, `symbol`, symbol),
`name` = IF(name IS NULL, `name`, name),
`engname` = IF(engname IS NULL, `engname`, engname),
`tradetype` = IF(tradetype IS NULL, `tradetype`, tradetype),
`lasttrade` = IF(lasttrade IS NULL, `lasttrade`, lasttrade),
`prevclose` = IF(prevclose IS NULL, `prevclose`, prevclose),
`open` = IF(open IS NULL, `open`, open),
`high` = IF(high IS NULL, `high`, high),
`low` = IF(low IS NULL, `low`, low),
`volume` = IF(volume IS NULL, `volume`, volume),
`currentvolume` = IF(currentvolume IS NULL, `currentvolume`, currentvolume),
`amount` = IF(amount IS NULL, `amount`, amount),
`ticktime` = IF(ticktime IS NULL, `ticktime`, ticktime),
`buy` = IF(buy IS NULL, `buy`, buy),
`sell` = IF(sell IS NULL, `sell`, sell),
`high_52week` = IF(high_52week IS NULL, `high_52week`, high_52week),
`low_52week` = IF(low_52week IS NULL, `low_52week`, low_52week),
`eps` = IF(eps IS NULL, `eps`, eps),
`dividend` = IF(dividend IS NULL, `dividend`, dividend),
`stocks_sum` = IF(stocks_sum IS NULL, `stocks_sum`, stocks_sum),
`pricechange` = IF(pricechange IS NULL, `pricechange`, pricechange),
`changepercent` = IF(changepercent IS NULL, `changepercent`, changepercent),
`date_sys` = date_sys;
END$$
DELIMITER ;

CALL hk_s_hgt_sina('[标签:symbol]','[标签:name]','[标签:engname]','[标签:tradetype]','[标签:lasttrade]','[标签:prevclose]','[标签:open]','[标签:high]','[标签:low]','[标签:volume]','[标签:currentvolume]','[标签:amount]','[标签:ticktime]','[标签:buy]','[标签:sell]','[标签:high_52week]','[标签:low_52week]','[标签:eps]','[标签:dividend]','[标签:stocks_sum]','[标签:pricechange]','[标签:changepercent]', '[系统时间转化:yyyy-MM-dd]')