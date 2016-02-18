-- 网址：http://vip.stock.finance.sina.com.cn/mkt/#hgt_hk
-- 数据：http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/Market_Center.getHKStockData?page=1&num=800&sort=code&asc=1&node=hgt_hk&_s_r_a=init
-- 参考：
-- 源码：

SELECT concat('http://stock.finance.qq.com/hk/hklist/view/daily_trading.php?p=1&c=', code,'&b=00000000&max=', round((4.9/7)*datediff(curdate(), pDate))) AS 'url_hk_w' FROM `hk_w` where eDate > curdate() and eDate > '0000-00-00' and (`uCode` IN ('03800' , '02823', '02822', '06837', 'HSCEI', '00998', '01788', '02727', '03333', '02357', '01066', '01068', '00268', '01833', '00861') or `uCode` IN (select distinct code from hk_s_hgt_info));

-- http://stock.finance.qq.com/hk/hklist/view/daily_trading.php?p=1&c=25597&b=00000000&max=50

DROP TABLE `hk_s_hgt_info`;
CREATE TABLE `hk_s_hgt_info` (
  `id` mediumint(12) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(18) NOT NULL COMMENT 'code',
  `name` varchar(18) DEFAULT NULL COMMENT 'name',
  `enName` varchar(18) DEFAULT NULL COMMENT 'enName',
  `date_sys` date NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_ticktime` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP PROCEDURE `hk_s_hgt_info`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hk_s_hgt_info`(IN code VARCHAR(18), name VARCHAR(18), enName VARCHAR(18), date_sys date)
BEGIN
SET code = IF(code = '', NULL, code);
SET name = IF(name = '', NULL, name);
SET enName = IF(enName = '', NULL, enName);
SET date_sys = date_sys;

INSERT INTO `hk_s_hgt_info` (`code`, `name`, `enName`,`date_sys`) VALUES (code, name, enName, date_sys)
ON DUPLICATE KEY UPDate
`name` = name,
`enName` = enName,
`date_sys` = date_sys;
END$$
DELIMITER ;

CALL hk_s_hgt_info('[标签:code]','[标签:name]','[标签:enName]', '[系统时间转化:yyyy-MM-dd]')