SELECT 
    *
FROM
    ying.hs_s_xts
WHERE
    code = 002424;  

SELECT 
    *
FROM
    ying.hs_s_xts
ORDER BY id DESC;

SELECT 
    *
FROM
    ying.hs_s_xts
WHERE
    code = 601318
ORDER BY id DESC;

-- !!! 删除前一天的数据
DELETE FROM hs_s_xts 
WHERE
    date = '2015-07-14';


-- !!! 删除前一天的数据
-- DELETE FROM hs_s_xts 
-- WHERE
--     date = CURDATE()-1;
-- 

CREATE TABLE `hs_s_xts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL COMMENT '代码id; code id in table hk_s and in table hk_s',
  `date` date DEFAULT NULL COMMENT '交易日期; trade date',
  `open` decimal(7,3) unsigned DEFAULT NULL COMMENT '开盘价',
  `high` decimal(7,3) unsigned DEFAULT NULL COMMENT '最高价',
  `low` decimal(7,3) unsigned DEFAULT NULL COMMENT '最低价',
  `close` decimal(7,3) unsigned DEFAULT NULL COMMENT '收盘价',
  `volume` int(11) unsigned DEFAULT NULL COMMENT '成交量',
  `amount` int(11) unsigned DEFAULT NULL COMMENT '股票成交额',
  `time` time DEFAULT NULL,
  `adjusted` decimal(7,3) unsigned DEFAULT NULL COMMENT '收盘价',
  `fR` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Result of data collection\n0: fail; 1: success',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stock_date` (`code`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

