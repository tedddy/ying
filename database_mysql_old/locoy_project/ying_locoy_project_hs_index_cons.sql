SELECT CONCAT('http://app.finance.china.com.cn/stock/data/sample_info.php?symbol=', code_index, '&') as url_hs_index_cons FROM hs_index_info;

SELECT * FROM `ying`.`hs_index_cons`;		
DROP TABLE `ying`.`hs_index_cons`;
CREATE TABLE `hs_index_cons` (
  `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `code_index` VARCHAR(6) DEFAULT NULL COMMENT 'code_index',
  `code` VARCHAR(6) DEFAULT NULL COMMENT 'code',
  `name` VARCHAR(18) DEFAULT NULL COMMENT 'name',
  `date_start` DATE DEFAULT NULL COMMENT 'date_start',
  `date_end` date DEFAULT NULL COMMENT 'date_end',
  `DateSys` DATE DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`id`),
  UNIQUE KEY `KeyName` (`code_index`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP PROCEDURE `ying`.`hs_index_cons`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_index_cons`(IN code_index VARCHAR(18), code VARCHAR(18), name VARCHAR(18), date_start  DATE, date_end DATE, DateSys DATE)
BEGIN
SET code_index = IF(code_index = '', NULL, code_index);
SET code = IF(code = '', NULL, code);
SET name = IF(name = '', NULL, name);
SET date_start = IF(date_start = '', NULL, date_start);
SET date_end = IF(date_end = '', NULL, date_end);
SET DateSys = CURDATE();

INSERT INTO `hs_index_cons` (`code_index`, `code`, `name`, `date_start`, `date_end`, `DateSys`) VALUES (code_index, code, name, date_start, date_end, DateSys) 
ON DUPLICATE KEY UPDate 
`code_index` = code_index,
`code` = code,
`name` = name,
`date_start` = date_start,
-- `date_end` = date_end,
`DateSys` = DateSys;
END$$
DELIMITER ;

CALL hs_index_cons('[标签:code_index]','[标签:code]','[标签:name]','[标签:date_start]','[标签:date_end]','')

-- archive SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN fSH = 1 THEN 'sh' ELSE 'sz' END)), code, '/ncp.shtml') as url_hs_index_info_sina FROM hs_index_code;

/*
ying locoy project hs_index_cons

Steps:
1. change hs_index_cons
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
	
网址：http://app.finance.china.com.cn/stock/data/sample_info.php?symbol=000016
数据：
参考：

【code_index】：000016 采集自网址
【code】：600018
【name】：上港集团
【date_start】：2013-12-20
【date_end】：

             <tr>
               <td><a href="http://finance.china.com.cn/stock/quote/(*)/" target="_blank">[参数]</a></td>
               <td><a href="http://finance.china.com.cn/stock/quote/(*)/" target="_blank"><span class="text">[参数]</span></a></td>
               <td>[参数]</td>
               <td><span style="color:red;">[参数]</span></td>
             </tr>


[参数]
[参数1]: code
[参数2]: name
[参数3]: date_start 开始计入成分股的日期
[参数4]: date_end 终止计入成分股的日期
[参数]:DateSys

*/