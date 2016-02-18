SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/', idi.code_index, '/type/S.phtml?year=', dt.year,'&jidu=', dt.quarter) AS 'hs_index_xts_history_sina_current' FROM (SELECT MIN(`code_index`) AS code_index FROM `ying`.`hs_index_info` GROUP BY `name_index`) as idi join year_quarter as dt  where dt.year = year(curdate()) and dt.quarter = quarter(curdate()) ;

-- url_hs_index_xts_history_sina_2012_2015
SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/', idi.code_index, '/type/S.phtml?year=', date.year,'&jidu=', date.quarter) AS 'hs_index_xts_history_sina_2012_2015' FROM (SELECT MIN(`code_index`) AS code_index FROM `ying`.`hs_index_info` GROUP BY `name_index`) as idi join year_quarter as date  where year > 2011 and year <= '2015';

-- the above is base on the following three
	SELECT DISTINCT
    CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/',
            s.code,
            '.phtml?year=',
            date.year,
            '&jidu=',
            date.quarter) AS 'hs_index_xts_history_sina_3'
FROM
    hs_s AS s
        JOIN
    year_quarter AS date
WHERE
    year > 2011 AND year <= '2015'
        AND CONCAT(YEAR(s.pDate), QUARTER(s.pDate)) <= CONCAT(date.year, date.quarter);

	SELECT 
    MIN(`code_index`) AS code_index
FROM
    `ying`.`hs_index_info`
GROUP BY `name_index`;

	-- the urls for data collectoin of `hs_index_xts_history_sina`
	SELECT DISTINCT
    CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/000001/type/S.phtml?year=',
            year,
            '&jidu=',
            quarter) AS 'hs_index_xts_history_sina'
	FROM
		`ying`.`year_quarter`
	WHERE
		year >= '2007' AND year <= '2015';


	SELECT DISTINCT
    CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/',
            idi.code_index,
            '/type/S.phtml?year=',
            date.year,
            '&jidu=',
            date.quarter) AS 'hs_index_xts_history_sina_2012_2015'
	FROM
		(SELECT 
			MIN(`code_index`) AS code_index
		FROM
			`ying`.`hs_index_info`
		GROUP BY `name_index`) AS idi
			JOIN
		year_quarter AS date
	WHERE
		year > 2011 AND year <= '2015';

SELECT * FROM `ying`.`hs_index_xts_history_sina`;		
DROP TABLE `ying`.`hs_index_xts_history_sina`;
CREATE TABLE `hs_index_xts_history_sina` (
  `date` date NOT NULL COMMENT 'date',
  `open_index` decimal(8,3) unsigned DEFAULT NULL COMMENT 'open_index',
  `high_index` decimal(8,3) unsigned DEFAULT NULL COMMENT 'high_index',
  `low_index` decimal(8,3) unsigned DEFAULT NULL COMMENT 'low_index',
  `close_index` decimal(8,3) unsigned DEFAULT NULL COMMENT 'close_index',
  `volume_index` int(10) unsigned DEFAULT NULL COMMENT 'volume_index',
  `amount_index` int(10) unsigned DEFAULT NULL COMMENT 'amount_index',
  `test_EMV` decimal(8,3) NOT NULL COMMENT 'test exponential moving average',
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `code_index` varchar(6) NOT NULL COMMENT 'code_index',
  `m5` decimal(8,3) unsigned DEFAULT NULL,
  `m10` decimal(8,3) unsigned DEFAULT NULL,
  `m20` decimal(8,3) unsigned DEFAULT NULL,
  `m30` decimal(8,3) unsigned DEFAULT NULL,
  `m60` decimal(8,3) unsigned DEFAULT NULL,
  `m120` decimal(8,3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code_index`,`date`),
  UNIQUE KEY `date_UNIQUE` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


ALTER TABLE `ying`.`hs_index_xts_history_sina` 
CHANGE COLUMN `code` `code` VARCHAR(6) NOT NULL COMMENT 'code' ,
CHANGE COLUMN `date` `date` DATE NOT NULL COMMENT 'date' ;



DROP PROCEDURE `ying`.`hs_index_xts_history_sina`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_index_xts_history_sina`(IN code_index VARCHAR(18), date VARCHAR(18), open_index VARCHAR(18), high_index VARCHAR(18), low_index VARCHAR(18), close_index VARCHAR(18), volume_index bigint(15), amount_index bigint(15))
BEGIN
SET code_index = IF(code_index = '', NULL, code_index);
SET date = IF(date = '', NULL, date);
SET open_index = IF(open_index = '', NULL, open_index);
SET high_index = IF(high_index = '', NULL, high_index);
SET low_index = IF(low_index = '', NULL, low_index);
SET close_index = IF(close_index = '', NULL, close_index);
SET volume_index = IF(volume_index = '', NULL, round(volume_index * 0.00001));
SET amount_index = IF(amount_index = '', NULL, round(amount_index * 0.00001));

INSERT INTO `hs_index_xts_history_sina` (`code_index`, `date`, `open_index`, `high_index`, `low_index`, `close_index`, `volume_index`, `amount_index`) VALUES (code_index, date, open_index, high_index, low_index, close_index, volume_index, amount_index) 
ON DUPLICATE KEY UPDate 
`id` = id;
END$$
DELIMITER ;


CALL hs_index_xts_history_sina('[标签:code_index]','[标签:date]','[标签:open_index]','[标签:high_index]','[标签:low_index]','[标签:close_index]','[标签:volume_index]','[标签:amount_index]');

/*
ying locoy project hs_index_xts_history_sina

Steps:
1. change hs_index_xts_history_sina
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
	
网址： http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/600000.phtml?year=2015&jidu=1
数据：
参考：
源码：

<td><div align="center">
					<a target='_blank' href='http://vip.stock.finance.sina.com.cn/quotes_service/view/vMS_tradehistory.php?symbol=(*)&date=2015-03-27'>
			2015-03-27			</a>
						</div></td>
			<td><div align="center">15.320</div></td>
			<td><div align="center">15.550</div></td>
			<td><div align="center">15.360</div></td>
			<td class="tdr"><div align="center">15.170</div></td>
			<td class="tdr"><div align="center">218174976</div></td>
			<td class="tdr"><div align="center">3350088448</div></td>
		  
<td><div align="center">
					<a target='_blank' href='http://vip.stock.finance.sina.com.cn/quotes_service/view/vMS_tradehistory.php?symbol=sh600000&date=2015-03-27'>
			2015-03-27			</a>
						</div></td>
			<td><div align="center">15.320</div></td>
			<td><div align="center">15.550</div></td>
			<td><div align="center">15.360</div></td>
			<td class="tdr"><div align="center">15.170</div></td>
			<td class="tdr"><div align="center">218174976</div></td>
			<td class="tdr"><div align="center">3350088448</div></td>

[参数]
[参数1]: date
[参数2]: open
[参数3]: high
[参数4]: close
[参数5]: low
[参数6]: volume
[参数7]: amount

【code_index】：
【date】：2015-03-31
【open_index】：16.480
【high_index】：16.580
【low_index】：15.740
【close_index】：15.790
【volume_index】：494049248
【amount_index】：7990395392


*/
