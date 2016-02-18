/*
ying locoy project hs_index_xts_china

Steps:
1. change hs_index_xts_china
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
	
网址： http://app.finance.china.com.cn/stock/list.php?type=zs&field=symbol&order=asc&page=1
数据：
参考：
源码：

          <tr>
						<td><a href="http://finance.china.com.cn/stock/quote/sh000001/" target="_blank">000001</a></td>
			<td><a href="http://finance.china.com.cn/stock/quote/sh000001/" target="_blank">上证指数</a></td>
						<td><span class="red1">3097.29</span></td>
			<td><span class="red1">0.16%</span></td>
			<td><span class="red1">4.94</span></td>
			<td>1365816手</td>
			<td>14480296万</td>
			<td><span class="green1">3085.57</span></td>
			<td>3092.35</td>
			<td><span class="green1">3042.31</span></td>
			<td><span class="red1">3103.07</span></td>
			<td><a href="list_slide.php?type=zs&field=symbol&order=asc&code=sh000001" target="_blank">查看</a></td>
          </tr>

		  
		            <tr>
						<td><a href="http://finance.china.com.cn/stock/quote/sh000006/" target="_blank">000006</a></td>
			<td><a href="http://finance.china.com.cn/stock/quote/sh000006/" target="_blank">地产指数</a></td>
						<td><span class="green1">5657.89</span></td>
			<td><span class="green1">-1.03%</span></td>
			<td><span class="green1">-58.71</span></td>
			<td>22986手</td>
			<td>249295万</td>
			<td><span class="green1">5709.45</span></td>
			<td>5716.60</td>
			<td><span class="green1">5549.56</span></td>
			<td><span class="red1">5721.43</span></td>
			<td><a href="list_slide.php?type=zs&field=symbol&order=asc&code=sh000006" target="_blank">查看</a></td>
          </tr>
		  
          <tr>
						<td><a href="http://finance.china.com.cn/stock/quote/(*)/" target="_blank">[参数]</a></td>
			<td><a href="http://finance.china.com.cn/stock/quote/(*)/" target="_blank">[参数]</a></td>
						<td><span class="(*)">[参数]</span></td>
			<td><span class="(*)">[参数]</span></td>
			<td><span class="(*)">(*)</span></td>
			<td>[参数]</td>
			<td>[参数]</td>
			<td><span class="(*)">[参数]</span></td>
			<td>[参数]</td>
			<td><span class="(*)">[参数]</span></td>
			<td><span class="(*)">[参数]</span></td>
			<td><a href="list_slide.php?type=zs&field=symbol&order=asc&code=(*)" target="_blank">查看</a></td>
          </tr>
	  

[参数]
[参数1]: 指数代码 code_index
[参数2]: 指数名称 name_index
[参数3]: 指数当前点位 close_index
[参数4]: 指数涨跌幅 chgrate_index 
[参数5]: 成交量 volume_index
[参数6]: 成交额 amount_index
[参数7]: 开盘点位 open_index
[参数8]: 昨收盘 settlement_index
[参数9]: 最低点位 low_index
[参数10]: 最高点位 hight_index
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

-- 【code_index】：000001
-- 【date】：2015-10-02 (Now: using system date；history: <div class="tody">[参数]年[参数]月[参数]日(*)</div>; [参数1]-[参数2]-[参数3])
-- 【open_index】：3052.84
-- 【high_index】：3073.30
-- 【low_index】：3039.74
-- 【close_index】：3052.78
-- 【volume_index】：1466424 (万股）
-- 【amount_index】：15656919 （万）

SELECT * FROM `ying`.`hs_index_xts_china`;		
-- DROP TABLE `ying`.`hs_index_xts_china`;
CREATE TABLE `hs_index_xts_china` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code_index` VARCHAR(6) DEFAULT NULL COMMENT 'code_index',
  `date` date DEFAULT NULL COMMENT 'date',
  `open_index` decimal(8,2) unsigned DEFAULT NULL COMMENT 'open_index',
  `high_index` decimal(8,2) unsigned DEFAULT NULL COMMENT 'high_index',
  `low_index` decimal(8,2) unsigned DEFAULT NULL COMMENT 'low_index',
  `close_index` decimal(8,2) unsigned DEFAULT NULL COMMENT 'close_index',
  `volume_index` int(10)  unsigned DEFAULT NULL COMMENT 'volume_index',
  `amount_index` int(10)  unsigned DEFAULT NULL COMMENT 'amount_index',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code_index`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- DROP PROCEDURE `ying`.`hs_index_xts_china`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_index_xts_china`(IN code_index VARCHAR(18), date VARCHAR(18), open_index VARCHAR(18), high_index VARCHAR(18), low_index VARCHAR(18), close_index VARCHAR(18), volume_index VARCHAR(18), amount_index VARCHAR(18))
BEGIN
SET code_index = IF(code_index = '', NULL, code_index);
SET date =  CURDATE();
SET open_index = IF(open_index = '', NULL, open_index);
SET high_index = IF(high_index = '', NULL, high_index);
SET low_index = IF(low_index = '', NULL, low_index);
SET close_index = IF(close_index = '', NULL, close_index);
SET volume_index = IF(volume_index = '', NULL, volume_index);
SET amount_index = IF(amount_index = '', NULL, amount_index);

INSERT INTO `hs_index_xts_china` (`code_index`, `date`, `open_index`, `high_index`, `low_index`, `close_index`, `volume_index`, `amount_index`) VALUES (code_index, date, open_index, high_index, low_index, close_index, volume_index, amount_index) 
ON DUPLICATE KEY UPDate 
`code_index` = code_index,
`date` = date,
`open_index` = open_index,
`high_index` = high_index,
`low_index` = low_index,
`close_index` = close_index,
`volume_index` = volume_index,
`amount_index` = amount_index;
END$$
DELIMITER ;

CALL hs_index_xts_china('[标签:code_index]','','[标签:open_index]','[标签:high_index]','[标签:low_index]','[标签:close_index]','[标签:volume_index]','[标签:amount_index]')