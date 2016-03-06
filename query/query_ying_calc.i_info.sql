SELECT * FROM ying_calc.i_info;

UPDATE `ying_calc`.`i_info` SET `fFJ`='1' WHERE `idi` IN (SELECT `idi` FROM ying.fund_m_info);

SELECT `idi`, `name_i` FROM ying_calc.i_info WHERE `fFJ`='1';