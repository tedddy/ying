SELECT * FROM ying.s_xts where ids in ('000001') order by `ids`, `dt` desc;

SELECT * FROM ying.s_xts;

SELECT count(*) FROM ying.s_xts;

SELECT * FROM ying.s_xts where ids in ('601318') order by `ids`, `dt` desc;

SELECT * FROM ying.hs_s_xts where code in ('601318') order by `ids`, `date` desc;

-- import data from hs_s_xts_history_sina to s_xts;

-- INSERT INTO `ying`.`s_xts`
-- 	(`ids`,
-- 	`dt`,
-- 	`open`,
-- 	`high`,
-- 	`low`,
-- 	`close`,
-- 	`volume`,
-- 	`amount`,
-- 	`clo`)
-- SELECT 
--     `hs_s_xts_history_sina`.`code`,
--     `hs_s_xts_history_sina`.`date`,
--     `hs_s_xts_history_sina`.`open`,
--     `hs_s_xts_history_sina`.`high`,
--     `hs_s_xts_history_sina`.`low`,
--     `hs_s_xts_history_sina`.`close`,
--     `hs_s_xts_history_sina`.`volume`,
--     `hs_s_xts_history_sina`.`amount`,
--     `hs_s_xts_history_sina`.`close`
-- FROM `ying`.`hs_s_xts_history_sina` 
-- WHERE 
-- 	`hs_s_xts_history_sina`.`date` < '2015-10-22' and `hs_s_xts_history_sina`.`date` > '2011-12-30'
-- ON DUPLICATE KEY UPDATE
-- 	`ids` = `hs_s_xts_history_sina`.`code`, 
--         `dt` = `hs_s_xts_history_sina`.`date`,
-- 	`open` = `hs_s_xts_history_sina`.`open`,
-- 	`high` = `hs_s_xts_history_sina`.`high`,
-- 	`low` = `hs_s_xts_history_sina`.`low`,
-- 	`close` = `hs_s_xts_history_sina`.`close`,
-- 	`volume` = `hs_s_xts_history_sina`.`volume`,
-- 	`amount` = `hs_s_xts_history_sina`.`amount`;
--         
-- -- 2163606 row(s) affected, 1 warning(s): 1292 Truncated incorrect DOUBLE value: '2015-10-22' Records: 1681606  Duplicates: 1081716  Warnings: 1
-- -- 0 row(s) affected, 2 warning(s): 1292 Truncated incorrect DOUBLE value: '2015-10-22' 1292 Truncated incorrect DOUBLE value: '2011-12-30' Records: 1681606  Duplicates: 0  Warnings: 2
-- 
-- 