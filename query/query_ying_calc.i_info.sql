SELECT * FROM ying.i_info;

UPDATE `ying`.`i_info` SET `fFJ`='1' WHERE `idi` IN (SELECT `idi` FROM ying.fund_m_info);

SELECT `idi`, `name_i` FROM ying.i_info WHERE `fFJ`='1';

SELECT * FROM ying.fund_m_info;

-- update value of nmc `ying`.`i_info` 流通市值 2016-02-14。
TRUNCATE table `ying`.`i_nmc`;
INSERT INTO `ying`.`i_nmc`
(`idi`,
`i_nmc`)
SELECT
`ying`.`i_s`.`idi` AS `idi`,
SUM(`ying`.`s_info`.`nmc`) AS `i_nmc`
FROM
(`ying`.`s_info`
LEFT JOIN `ying`.`i_s` ON ((`ying`.`s_info`.`ids` = `ying`.`i_s`.`ids`)))
WHERE
(`ying`.`i_s`.`idi` IS NOT NULL)
GROUP BY `ying`.`i_s`.`idi`;
