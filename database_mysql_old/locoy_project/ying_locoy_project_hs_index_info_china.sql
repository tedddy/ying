/*
ying locoy project hs_index_info_china

Steps:
1. change hs_index_info_china
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
[参数7]: 开盘点位 name_index
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


SELECT * FROM `ying`.`hs_index_info_china`;		
-- DROP TABLE `ying`.`hs_index_info_china`;
CREATE TABLE `hs_index_info_china` (
  `code_index` varchar(6) NOT NULL COMMENT 'index code',
  `name_index` varchar(18) DEFAULT NULL COMMENT 'index name',
  `nmc_index` int(10) DEFAULT NULL,
  `flag_hs_s` varchar(10) DEFAULT NULL COMMENT 'flag in table hs_s',
  `fW` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: never watch; 1: watch daily; 2: watch hourly; 3: watch every 20 min; 4: watch every 10 min; 5: watch every 5 min; 8: hold for mid or short term; 9: hold for long term',
  `fD` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Delete 0: Delete from database; 1: don''t collect data anymore; ',
  `fSH` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: sh; 0: sz',
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  PRIMARY KEY (`code_index`),
  UNIQUE KEY `code_UNIQUE` (`code_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DROP PROCEDURE `ying`.`hs_index_info_china`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_index_info_china`(IN code_index VARCHAR(18), name_index VARCHAR(18), date_start VARCHAR(18))
BEGIN
SET code_index = IF(code_index = '', NULL, code_index);
SET name_index = IF(name_index = '', NULL, name_index);
SET date_start =  CURDATE();

INSERT INTO `hs_index_info_china` (`code_index`, `name_index`, `date_start`) VALUES (code_index, name_index, date_start) 
ON DUPLICATE KEY UPDate 
`name_index` = name_index;
END$$
DELIMITER ;

CALL hs_index_info_china('[标签:code_index]','[标签:name_index]','')