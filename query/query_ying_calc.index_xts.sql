SELECT * FROM ying_calc.index_xts ORDER BY `idi`, `dt` DESC;

SELECT * FROM ying_calc.index_xts WHERE `idi` = '000902' ORDER BY `dt` DESC;

SELECT * FROM ying_calc.index_xts WHERE `dt` = '2015-12-04';

UPDATE `ying_calc`.`index_xts` a
JOIN `ying_calc`.`index_xts` b ON (b.`idi` = '000902' AND a.`dt` = b.`dt`) 
SET a.`cjezb` = IF(b.amount > 0, ROUND(100 * a.amount / b.amount, 2), 0);

CALL `ying_calc`.`index_xts_cjezb_d1`();
