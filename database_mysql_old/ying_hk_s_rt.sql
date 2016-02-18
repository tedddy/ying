SELECT 
    *
FROM
    ying.hk_s_rt;

SELECT 
    *
FROM
    ying.hk_s_rt
ORDER BY date DESC , time;

-- import data from database securities to database ying
INSERT INTO `ying`.`hk_s_rt`
	(`code`, `price`, `buy`, `sell`, `amount`, `date`, `time`)
SELECT 
	`hk_rt`.`code`, `hk_rt`.`price`, `hk_rt`.`buy`, `hk_rt`.`sell`, `hk_rt`.`amount`, `hk_rt`.`date`, `hk_rt`.`time`
FROM `securities`.`hk_rt` 
	WHERE code NOT IN (SELECT code FROM `securities`.`hk_w`);

/* stored procedure
CREATE DEFINER=`gxh`@`%` PROCEDURE `hk_s_rt`(IN code CHAR(5), price DECIMAL(7,3), buy DECIMAL(7,3), sell DECIMAL(7,3), amount BIGINT(12) UNSIGNED, date DATE, time TIME)
BEGIN
SET code = IF(code = '', NULL, code);
SET price = IF(price = '', NULL, price);
SET buy = IF(buy = '', NULL, buy);
SET sell = IF(sell = '', NULL, sell);
SET amount = IF(amount = '', NULL, amount);
SET date = IF(date = '', NULL, date);
SET time = IF(time = '', NULL, time);

INSERT INTO `hk_s_rt` (`code`, `price`, `buy`, `sell`, `amount`, `date`, `time`) VALUES (code, price, buy, sell, amount, date, time) 
ON DUPLICATE KEY UPDATE 
	`code` = IF(code IS NULL, `code`, code),
	`price` = IF(price IS NULL, `price`, price),
	`buy` = IF(buy IS NULL, `buy`, buy),
	`sell` = IF(sell IS NULL, `sell`, sell),
	`amount` = IF(amount IS NULL, `amount`, amount);
END
 */
 
CALL hk_s_rt('[标签:code]', '[标签:price]', '[标签:buy]', '[标签:sell]', '[标签:amount]', '[标签:date]', '[标签:time]') 