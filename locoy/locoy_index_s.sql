
SELECT * FROM `ying_calc`.`i_s`;		

SELECT count(*) FROM `ying_calc`.`i_s`;
		
DROP TABLE `ying_calc`.`i_s`;
CREATE TABLE `i_s` (
  `idi` VARCHAR(6) DEFAULT NULL COMMENT 'code_index',
  `ids` VARCHAR(6) DEFAULT NULL COMMENT 'code',
  `dt_start` DATE DEFAULT NULL COMMENT 'dt_start',
  `dt_end` date DEFAULT NULL COMMENT 'dt_end',
  `DateSys` DATE DEFAULT NULL COMMENT 'DateSystem',
  PRIMARY KEY (`idi`,`ids`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP PROCEDURE `ying_calc`.`i_s`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `i_s`(IN idi VARCHAR(18), ids VARCHAR(18), dt_start  DATE, dt_end DATE)
BEGIN
DECLARE DateSys DATE;
SET idi = IF(idi = '', NULL, idi);
SET ids = IF(ids = '', NULL, ids);
SET dt_start = IF(dt_start = '', NULL, dt_start);
SET dt_end = IF(dt_end = '', NULL, dt_end);
SET DateSys = CURDATE();
IF `dt_end` = '0000-00-00' THEN
INSERT INTO `i_s` (`idi`, `ids`, `dt_start`, `dt_end`, `DateSys`) VALUES (idi, ids, dt_start, dt_end, DateSys) 
ON DUPLICATE KEY UPDate 
`idi` = idi,
`ids` = ids,
`dt_start` = dt_start,
-- `dt_end` = dt_end,
`DateSys` = DateSys;
END IF;

IF `dt_end` <> '0000-00-00' THEN
INSERT IGNORE INTO `i_s_hst` (`idi`, `ids`, `dt_start`, `dt_end`, `DateSys`) VALUES (idi, ids, dt_start, dt_end, DateSys);
END IF;
END$$
DELIMITER ;


CALL i_s('[标签:idi]','[标签:ids]','[标签:dt_start]','[标签:dt_end]')

-- SELECT CONCAT('http://app.finance.china.com.cn/stock/data/sample_info.php?symbol=', idi, '&') as url_hs_index_cons FROM hs_index_info;

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

【idi】：000016 采集自网址
【code】：600018
【name】：上港集团
【dt_start】：2013-12-20
【dt_end】：

             <tr>
               <td><a href="http://finance.china.com.cn/stock/quote/(*)/" target="_blank">[参数]</a></td>
               <td><a href="http://finance.china.com.cn/stock/quote/(*)/" target="_blank"><span class="text">[参数]</span></a></td>
               <td>[参数]</td>
               <td><span style="color:red;">[参数]</span></td>
             </tr>


[参数]
[参数1]: code
[参数2]: name
[参数3]: dt_start 开始计入成分股的日期
[参数4]: dt_end 终止计入成分股的日期
[参数]:DateSys

*/