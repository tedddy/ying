SELECT * FROM ying_calc.lhb_s_trader;

SELECT 
    (CASE WHEN `lhb_s_trader`.`type` = '7' THEN '涨7' WHEN `lhb_s_trader`.`type` = '-7' THEN '跌7' WHEN `lhb_s_trader`.`type` = '-7' THEN '跌7' WHEN `lhb_s_trader`.`type` = '20' THEN '涨20' WHEN `lhb_s_trader`.`type` = '-20' THEN '跌20' WHEN `lhb_s_trader`.`type` = 't20' THEN '换20' WHEN `lhb_s_trader`.`type` = 'r15' THEN '震15' WHEN `lhb_s_trader`.`type` = 's15' THEN 'S跌15'END)  as '类型',
    `lhb_s_trader`.`dt` as '日期',
    `lhb_s_trader`.`amount_sell` as '卖出成交额',
    `lhb_s_trader`.`ids` as '股票代码',
    `lhb_s_trader`.`amount_buy` as '买入额',
    `lhb_s_trader`.`name_s` as '股票名称',
    `lhb_trader`.`name_trader` as '营业部'
FROM `ying_calc`.`lhb_s_trader` join `ying_calc`.`lhb_trader` on (`lhb_s_trader`.`id_trader` = `lhb_trader`.`id_trader`);

-- 连续三个交易日内收盘价格涨幅偏离值累计20% -> 20
-- 当日涨幅偏离值达7%的证券 -> 7
-- 当日跌幅偏离值达7%的证券 -> -7
-- 当日换手率达到20%的证券 -> t20 (t: turnover)
-- 当日价格振幅达到15%的证券 r15 (r: range)
-- S、ST、*ST连续三个交易日内跌幅偏离值累计达到15% ->  s15
-- 连续三个交易日内收盘价跌幅偏离值累计20% -> -20
-- 日均换手率与前五个交易日的日均换手率的比值达到30倍，且换手率累计达20%的证券 ta3020(t: turnover; a: acumulated);