-- 前复权表

SELECT * FROM `s_xts_adj` ORDER BY d DESC, ids;

CREATE TABLE `s_xts_adj` (
  `ids` VARCHAR(6) NOT NULL COMMENT 'stock id 股票代码',
  `d` DATE DEFAULT NULL COMMENT 'trade date 交易日期',
  `open` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'open 开盘价',
  `high` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'high 最高价',
  `low` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'low 最低价',
  `close` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT 'close 收盘价',
  `volume` INT(11) UNSIGNED NOT NULL COMMENT 'volume 成交量',
  `amount` BIGINT(12) UNSIGNED NOT NULL COMMENT 'amount 股票成交额',
  PRIMARY KEY (`ids`,`d`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

-- insert data into `s_xts_adj` from `s_xts_adj_hst_sina`

INSERT INTO `s_xts_adj`
	(
	    `ids`,
	    `d`,
	    `open`,
	    `high`,
	    `low`,
	    `close`,
	    `volume`,
	    `amount`
        )
SELECT 
    `s_xts_adj_hst_sina`.`ids`,
    `s_xts_adj_hst_sina`.`d`,
    ROUND(`s_xts_adj_hst_sina`.`open` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`high` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`low` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`close` / faL.fa, 2),
    ROUND(`s_xts_adj_hst_sina`.`volume`, 2),
    ROUND(`s_xts_adj_hst_sina`.`amount`, 2)
FROM
    `s_xts_adj_hst_sina` 
        JOIN
    s_xts_adj_hst_sina_faL faL ON `s_xts_adj_hst_sina`.`ids` = faL.ids
ON DUPLICATE KEY UPDATE 
    `open` = ROUND(`s_xts_adj_hst_sina`.`open`/faL.fa,2),
    `high` = ROUND(`s_xts_adj_hst_sina`.`high`/faL.fa,2),
    `low`  = ROUND(`s_xts_adj_hst_sina`.`low`/faL.fa,2),
    `close` = ROUND(`s_xts_adj_hst_sina`.`close`/faL.fa,2),
    `volume` = ROUND(`s_xts_adj_hst_sina`.`volume`,2),
    `amount` = ROUND(`s_xts_adj_hst_sina`.`amount`,2);

-- 5:39 2015-10-28 revise data type of volume and amount    
ALTER TABLE `ying_calc`.`s_xts_adj` 
CHANGE COLUMN `volume` `volume` MEDIUMINT(9) UNSIGNED NOT NULL COMMENT 'volume 成交量 手' ,
CHANGE COLUMN `amount` `amount` MEDIUMINT(8) UNSIGNED NOT NULL COMMENT 'amount 股票成交额 万' ;
