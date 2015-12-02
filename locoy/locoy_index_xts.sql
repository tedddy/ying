SELECT * FROM `index_xts` ORDER BY `dt` DESC, idi;
-- DROP TABLE `index_xts`;	
CREATE TABLE `index_xts` (
  `idi` varchar(6) NOT NULL COMMENT 'index id',
  `dt` date NOT NULL COMMENT '交易日期 trade date',
  `open` decimal(7,2) unsigned DEFAULT NULL COMMENT '开盘价',
  `high` decimal(7,2) unsigned DEFAULT NULL COMMENT '最高',
  `low` decimal(7,2) unsigned DEFAULT NULL COMMENT '最低价',
  `close` decimal(7,2) unsigned DEFAULT NULL COMMENT '收盘价',
  `volume` int(9) unsigned DEFAULT NULL COMMENT '股票成交额',
  `amount` int(9) unsigned DEFAULT NULL COMMENT '成交量',
  PRIMARY KEY (`idi`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


SELECT idi, DATE(`dt`), amount, volume FROM index_rt WHERE TIME(`dt`) = '15:05:00' ORDER BY `dt` DESC;
SELECT idi, DATE(`dt`), close FROM index_rt WHERE DATE(`dt`) = '2015-10-30' AND TIME(`dt`) = '09:35:00' ORDER BY `dt` DESC;
SELECT * FROM index_rt WHERE amount IS NULL;
SELECT idi, DATE(`dt`), MIN(close), MAX(close) FROM index_rt GROUP BY idi, DATE(`dt`) ORDER BY DATE(`dt`) DESC, idi;

-- extract data from index_rt
SELECT
    t1505.idi,
    t1505.`dt`,
    t0935.close AS open,
    tMinMax.max AS high,
    tMinMax.min AS low,
    t1505.close AS close,
    t1505.volume AS volume,
    t1505.amount AS amount
FROM
    (SELECT 
        idi AS idi, DATE(`dt`) AS `dt`, close, amount, volume
    FROM
        index_rt
    WHERE
        TIME(`dt`) = '15:05:00') t1505
        LEFT JOIN
    (SELECT 
        idi AS idi, DATE(`dt`) AS `dt`, close
    FROM
        index_rt
    WHERE
        TIME(`dt`) = '09:35:00') t0935 ON (t1505.idi = t0935.idi
        AND t1505.`dt` = t0935.`dt`)
        LEFT JOIN
    (SELECT 
        idi, DATE(`dt`) AS `dt`, MIN(close) AS min, MAX(close) AS max
    FROM
        index_rt
    GROUP BY idi , DATE(`dt`)) tMinMax ON (t1505.idi = tMinMax.idi
        AND t1505.`dt` = tMinMax.`dt`)
ORDER BY t1505.`dt` DESC;  

-- insert into `ying`.`index_xts` from index_xts_hst_sina
INSERT INTO `ying`.`index_xts`
	(`idi`,
	`dt`,
	`open`,
	`high`,
	`low`,
	`close`,
	`amount`,
	`volume`)
SELECT 
	`index_xts_hst_sina`.`idi`,
	`index_xts_hst_sina`.`dt`,
	`index_xts_hst_sina`.`open`,
	`index_xts_hst_sina`.`high`,
	`index_xts_hst_sina`.`low`,
	`index_xts_hst_sina`.`close`,
	`index_xts_hst_sina`.`volume`,
	`index_xts_hst_sina`.`amount`
FROM `ying`.`index_xts_hst_sina`
ON DUPLICATE KEY UPDATE
	`open` = `index_xts_hst_sina`.`open`,
	`high` = `index_xts_hst_sina`.`high`,
	`low` = `index_xts_hst_sina`.`low`,
	`close` = `index_xts_hst_sina`.`close`,
	`amount` = `index_xts_hst_sina`.`volume`,
	`volume` = `index_xts_hst_sina`.`amount`;

-- DROP PROCEDURE `ying_calc`.`index_xts`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`index_xts`(IN idi VARCHAR(6), `dt` DATE, open DECIMAL(9,2), high DECIMAL(9,2), low DECIMAL(9,2), close DECIMAL(9,2), volume BIGINT(11) UNSIGNED, amount BIGINT(12) UNSIGNED)
BEGIN
SET idi = IF(idi = '', NULL, idi);
SET `dt` = IF(`dt` = '', NULL, `dt`);
SET open = IF(open = '', NULL, open);
SET high = IF(high = '', NULL, high);
SET low = IF(low = '', NULL, low);
SET close = IF(close = '', NULL, close);
SET volume = IF(volume = '', NULL, volume);
SET amount = IF(amount = '', NULL, amount);

INSERT INTO `ying_calc`.`index_xts` (`idi`, `dt`, `open`, `high`, `low`, `close`, `volume`, `amount`) VALUES (idi, `dt`, open, high, low, close, volume, amount) 
ON DUPLICATE KEY UPDate
	`open` = open,
	`high` = high,
	`low` = low,
	`close` = close,
	`volume` = volume,
	`amount` = amount;

END$$
DELIMITER ;





CALL index_xts('[标签:idi]', '[标签:`dt`]', '[标签:open]', '[标签:high]', '[标签:low]', '[标签:close]', '[标签:volume]', '[标签:amount]');

-- history
CALL hs_index_xts_EM('[标签:code]', '[标签:`dt`]', '[标签:open]', '[标签:high]', '[标签:low]', '[标签:close]', '[标签:volume]', '[标签:amount]', '[标签:time]');

-- history

-- DELIMITER $$
-- CREATE DEFINER=`gxh`@`%` PROCEDURE `index_xts`(IN idi VARCHAR(6), `dt` DATE, open DECIMAL(9,2), high DECIMAL(9,2), low DECIMAL(9,2), close DECIMAL(9,2), volume BIGINT(11) UNSIGNED, amount BIGINT(12) UNSIGNED)
-- BEGIN
-- SET idi = IF(idi = '', NULL, idi);
-- SET `dt` = IF(`dt` = '', NULL, `dt`);
-- SET open = IF(open = '', NULL, open);
-- SET high = IF(high = '', NULL, high);
-- SET low = IF(low = '', NULL, low);
-- SET close = IF(close = '', NULL, close);
-- SET volume = IF(volume = '', NULL, volume);
-- SET amount = IF(amount = '', NULL, amount);
-- 
-- INSERT INTO `index_xts` (`idi`, `dt`, `open`, `high`, `low`, `close`, `volume`, `amount`) VALUES (idi, `dt`, open, high, low, close, volume, amount) 
-- ON DUPLICATE KEY UPDATE
-- 	`open` = open,
-- 	`high` = high,
-- 	`low` = low,
-- 	`close` = close,
-- 	`volume` = volume,
-- 	`amount` = amount;
-- 
-- END$$
-- DELIMITER ;

-- in `hs_index_xts_EM`, volume and amount are mis-named
-- INSERT IGNORE INTO `ying`.`index_xts`
-- 	(`idi`,
-- 	`dt`,
-- 	`open`,
-- 	`high`,
-- 	`low`,
-- 	`close`,
-- 	`amount`,
-- 	`volume`)
-- SELECT 
-- 	`hs_index_xts_EM`.`code`,
-- 	`hs_index_xts_EM`.`date`,
-- 	`hs_index_xts_EM`.`open`,
-- 	`hs_index_xts_EM`.`high`,
-- 	`hs_index_xts_EM`.`low`,
-- 	`hs_index_xts_EM`.`close`,
-- 	`hs_index_xts_EM`.`volume`,
-- 	`hs_index_xts_EM`.`amount`
-- FROM `ying`.`hs_index_xts_EM`;