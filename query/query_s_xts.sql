-- import data from hs_s_xts_history_sina to s_xts;

INSERT INTO `ying`.`s_xts`
	(`ids`,
	`d`,
	`open`,
	`high`,
	`low`,
	`close`,
	`volume`,
	`amount`,
	`clo`)
SELECT 
    `hs_s_xts_history_sina`.`code`,
    `hs_s_xts_history_sina`.`date`,
    `hs_s_xts_history_sina`.`open`,
    `hs_s_xts_history_sina`.`high`,
    `hs_s_xts_history_sina`.`low`,
    `hs_s_xts_history_sina`.`close`,
    `hs_s_xts_history_sina`.`volume`,
    `hs_s_xts_history_sina`.`amount`,
    `hs_s_xts_history_sina`.`close`
FROM `ying`.`hs_s_xts_history_sina` 
WHERE 
	year(`hs_s_xts_history_sina`.`date`) < '2015' and year(`hs_s_xts_history_sina`.`date`) > '2006'
ON DUPLICATE KEY UPDATE
	`ids` = `hs_s_xts_history_sina`.`code`, `d` = `hs_s_xts_history_sina`.`date`;



SELECT * FROM ying.s_xts;

SELECT count(*) FROM ying.s_xts;

SELECT * FROM ying.s_xts where ids in ('601318') order by `ids`, `d` desc;