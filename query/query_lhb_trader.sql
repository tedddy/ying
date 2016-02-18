SELECT * FROM ying_calc.lhb_trader;

SELECT count(*) FROM ying_calc.lhb_trader;

SELECT `lhb_trader`.`id`,
    `lhb_trader`.`id_trader`,
    `lhb_trader`.`lhb`,
    `lhb_trader`.`lhb_buy`,
    `lhb_trader`.`name_s`,
    `lhb_trader`.`amount_sell`,
    `lhb_trader`.`lhb_sell`,
    `lhb_trader`.`area`,
    `lhb_trader`.`id_unknown`,
    `lhb_trader`.`amount_unknown`,
    `lhb_trader`.`amount`,
    `lhb_trader`.`amount_buy`,
    `lhb_trader`.`name_trader`,
    `lhb_trader`.`ids_group`
FROM `ying_calc`.`lhb_trader`;
