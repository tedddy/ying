-- start: 10:00 2015-10-26          task: migrate project hk_w_MarketMaker            end:
/*      
	save as locoy_w_MM.sql
	delete id field and remove "AUTO_INCREMENT=1"
	delete `ying`.
	change primary key to (`code`,`date`)
	replace `hk_w_MarketMaker` with `w_MM`
	replace `code` with `idw`
	replace `date` with `d` where `date` is a field
	change project settings in locoy
			prject name
			field (标签名)
			修改数据库发布模块
				delete procedure `hk_w_MarketMaker`; create procedure `w_MM`
			修改产生url的bat文件
				file name
				replace hk_w_MarketMaker with w_MM
				run the bat file
				修改project的采集网址设定
			设定运行project的调度计划
	Test the project
    change the file with queries related to the prject. (E:\user_tony\Documents\GitHub\ying\locoy\locoy_w_MM.sql)
*/
	
SELECT concat('http://stock.finance.qq.com/hk/hklist/view/daily_trading.php?p=1&c=', code,'&b=00000000&max=', round((5/7)*datediff(curdate(), pDate))) AS 'url_w_MM' FROM `hk_w` where eDate > curdate() and eDate > '0000-00-00' and (`uCode` IN ('03800' , '02823', '02822', '06837', 'HSCEI', '00998', '01788', '02727', '03333', '02357', '01066', '01068', '00268', '01833', '00861') or `uCode` IN (select distinct code from hk_s_hgt_info));

SELECT * FROM `w_MM`;
		
DROP TABLE `w_MM`;

CREATE TABLE `w_MM` (
  `idw` char(5) NOT NULL COMMENT 'id warrant',
  `d` date NOT NULL COMMENT 'date',
  `volume` int(7) unsigned DEFAULT NULL COMMENT 'volume（万）',
  `buy_MM` int(7) unsigned DEFAULT NULL COMMENT 'buy_MM',
  `sell_MM` int(7) unsigned DEFAULT NULL COMMENT 'sell_MM',
  `outstanding` int(7) unsigned DEFAULT NULL COMMENT 'outstanding',
  `percentage_o` decimal(5,2) unsigned DEFAULT NULL COMMENT 'percentage_o',
  UNIQUE KEY `KeyName` (`idw`,`d`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP PROCEDURE `w_MM`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `w_MM`(IN idw VARCHAR(18), d VARCHAR(18), volume VARCHAR(18), buy_MM VARCHAR(18), sell_MM VARCHAR(18), outstanding VARCHAR(18), percentage_o VARCHAR(18))
BEGIN
SET `idw` = IF(idw = '', NULL, idw);
SET `d` = IF(d = '', NULL, d);
SET `volume` = IF(volume = '', NULL, volume * 100);
SET `buy_MM` = IF(buy_MM = '', NULL, buy_MM * 100);
SET `sell_MM` = IF(sell_MM = '', NULL, sell_MM * 100);
SET `outstanding` = IF(outstanding = '', NULL, outstanding * 100);
SET `percentage_o` = IF(percentage_o = '', NULL, percentage_o);

INSERT INTO `w_MM` (`idw`, `d`, `volume`, `buy_MM`, `sell_MM`, `outstanding`, `percentage_o`) VALUES (idw, d, volume, buy_MM, sell_MM, outstanding, percentage_o) 
ON DUPLICATE KEY UPDate 
`idw` = idw,
`d` = d,
`volume` = volume,
`buy_MM` = buy_MM,
`sell_MM` = sell_MM,
`outstanding` = outstanding,
`percentage_o` = percentage_o;
END$$
DELIMITER ;

CALL w_MM('[标签:idw]','[标签:d]','[标签:volume]','[标签:buy_MM]','[标签:sell_MM]','[标签:outstanding]','[标签:percentage_o]')

/*
ying locoy project w_MM

Steps:
1. change w_MM
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
[参数1]: d
[参数2]: volume
[参数3]: buy_MM (MM means MarketMaker)
[参数4]: sell_MM
[参数5]: outstanding （街货量）
[参数6]: percentage_o（街货量比例）
*/