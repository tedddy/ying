

SELECT concat('http://stock.finance.qq.com/hk/hklist/view/daily_trading.php?p=1&c=', code,'&b=00000000&max=', round((5/7)*datediff(curdate(), pDate))) AS 'url_hk_w_MarketMaker' FROM `hk_w` where eDate > curdate() and eDate > '0000-00-00' and (`uCode` IN ('03800' , '02823', '02822', '06837', 'HSCEI', '00998', '01788', '02727', '03333', '02357', '01066', '01068', '00268', '01833', '00861') or `uCode` IN (select distinct code from hk_s_hgt_info));

SELECT * FROM `ying`.`hk_w_MarketMaker`;
		
DROP TABLE `ying`.`hk_w_MarketMaker`;

CREATE TABLE `hk_w_MarketMaker` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL COMMENT 'code',
  `date` date NOT NULL COMMENT 'date',
  `volume` int(7) unsigned DEFAULT NULL COMMENT 'volume（万）',
  `buy_MM` int(7) unsigned DEFAULT NULL COMMENT 'buy_MM',
  `sell_MM` int(7) unsigned DEFAULT NULL COMMENT 'sell_MM',
  `outstanding` int(7) unsigned DEFAULT NULL COMMENT 'outstanding',
  `percentage_o` decimal(5,2) unsigned DEFAULT NULL COMMENT 'percentage_o',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP PROCEDURE `ying`.`hk_w_MarketMaker`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hk_w_MarketMaker`(IN code VARCHAR(18), date VARCHAR(18), volume VARCHAR(18), buy_MM VARCHAR(18), sell_MM VARCHAR(18), outstanding VARCHAR(18), percentage_o VARCHAR(18))
BEGIN
SET code = IF(code = '', NULL, code);
SET date = IF(date = '', NULL, date);
SET volume = IF(volume = '', NULL, volume * 100);
SET buy_MM = IF(buy_MM = '', NULL, buy_MM * 100);
SET sell_MM = IF(sell_MM = '', NULL, sell_MM * 100);
SET outstanding = IF(outstanding = '', NULL, outstanding * 100);
SET percentage_o = IF(percentage_o = '', NULL, percentage_o);

INSERT INTO `hk_w_MarketMaker` (`code`, `date`, `volume`, `buy_MM`, `sell_MM`, `outstanding`, `percentage_o`) VALUES (code, date, volume, buy_MM, sell_MM, outstanding, percentage_o) 
ON DUPLICATE KEY UPDate 
`code` = code,
`date` = date,
`volume` = volume,
`buy_MM` = buy_MM,
`sell_MM` = sell_MM,
`outstanding` = outstanding,
`percentage_o` = percentage_o;
END$$
DELIMITER ;

CALL hk_w_MarketMaker('[标签:code]','[标签:date]','[标签:volume]','[标签:buy_MM]','[标签:sell_MM]','[标签:outstanding]','[标签:percentage_o]')

/*
ying locoy project hk_w_MarketMaker

Steps:
1. change hk_w_MarketMaker
2. change labels by replacing one by one.
	2.1 note: step 2 and step 3 can be done at the same time to save time
3. create table and setup mysql procedure
	3.1 note: add unique statement: UNIQUE KEY `UniqueKeyName` (``,``,``)
	3.2 note: change the data type of each field & change the length of VARCHAR
	3.3 note: for each field of the table, make a good comment including a standardized and consistant field, and the original label in the datasource. 
4. setup locoy project: 192.168.137.172 gxh locoy ying
	4.1 数据库地址：C:\火车采集器V8\Data\(*)\SpiderResult.db3
5. test
	5.1 note: test with a few records
	
网址： http://stock.finance.qq.com/hk/hklist/view/daily_trading.php?p=1&c=25597&b=00000000&max=1000
数据：
参考：
源码：

<td style="text-align:left;padding:0 0 0 10px;">2015-09-30</td>
      <td>220.17</td>
      <td>108.26</td>
      <td>105.91</td>
      <td>12.61</td>
      <td style="padding-right:60px;">6.30</td>
	  
<td style="text-align:left;padding:0 0 0 10px;">[参数]</td>
      <td>[参数]</td>
      <td>[参数]</td>
      <td>[参数]</td>
      <td>[参数]</td>
      <td style="padding-right:60px;">[参数]</td>
[参数]
[参数1]: date
[参数2]: volume
[参数3]: buy_MM (MM means MarketMaker)
[参数4]: sell_MM
[参数5]: outstanding （街货量）
[参数6]: percentage_o（街货量比例）
[参数7]: 
[参数8]: 
[参数9]: 
[参数10]: 
[参数11]: 
[参数12]: 
[参数13]: 
[参数14]: 
[参数15]: 
[参数16]: 
[参数17]: 
[参数18]: 
[参数19]: 
[参数]:DateSys
[参数]:TimeSys;
*/