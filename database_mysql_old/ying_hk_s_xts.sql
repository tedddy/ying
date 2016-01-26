DELETE FROM ying.hk_s 
WHERE
    code > '10000';

SELECT 
    *
FROM
    ying.hk_s_xts
WHERE
    code = '03888'
ORDER BY id DESC;

SELECT 
    *
FROM
    ying.hk_s_xts
WHERE
    code = '00861'
ORDER BY id DESC;

SELECT 
    *
FROM
    ying.hk_s_xts
ORDER BY id DESC;

SELECT 
    *
FROM
    ying.hk_s_xts;

SELECT 
    COUNT(*)
FROM
    ying.hk_s_xts;
    

INSERT INTO `ying`.`hk_s_xts`
(`code`,
`date`,
`open`,
`high`,
`low`,
`close`,
`volume`,
`amount`)
SELECT `hk_xts`.`code`,
    `hk_xts`.`date`,
    `hk_xts`.`open`,
    `hk_xts`.`high`,
    `hk_xts`.`low`,
    `hk_xts`.`close`,
    `hk_xts`.`volume`,
    `hk_xts`.`amount`
FROM `securities`.`hk_xts`
WHERE code NOT IN (SELECT code FROM `securities`.`hk_w`);

/*
CREATE DEFINER=`gxh`@`%` PROCEDURE `hk_s_xts`(IN code VARCHAR(255), date DATE, open DECIMAL(7,3), high DECIMAL(7,3), low DECIMAL(7,3), close DECIMAL(7,3), volume BIGINT(11) UNSIGNED, amount BIGINT(12) UNSIGNED)
BEGIN
SET code = IF(code = '', NULL, code);
SET date = IF(date = '', NULL, Date);
SET open = IF(open = '', NULL, open);
SET high = IF(high = '', NULL, high);
SET low = IF(low = '', NULL, low);
SET close = IF(close = '', NULL, close);
SET volume = IF(volume = '', NULL, volume);
SET amount = IF(amount = '', NULL, amount);

INSERT INTO `hk_s_xts` (`code`, `date`, `open`, `high`, `low`, `close`, `volume`, `amount`) VALUES (code, date, open, high, low, close, volume, amount) 
ON DUPLICATE KEY UPDate 
	`code` = IF(code IS NULL, `code`, code),
	`date` = IF(date IS NULL, `date`, date),
	`open` = IF(open IS NULL, `open`, open),
	`high` = IF(high IS NULL, `high`, high),
	`low` = IF(low IS NULL, `low`, low),
	`close` = IF(close IS NULL, `close`, close),
	`volume` = IF(volume IS NULL, `volume`, volume),
	`turnover` = IF(amount IS NULL, `amount`, amount);
END
*/

