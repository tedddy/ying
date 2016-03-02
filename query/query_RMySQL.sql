SELECT * FROM ying_calc.s_rt_hst where date(dt) = curdate();

SELECT count(*) FROM ying_calc.s_rt_hst where date(dt) = curdate();

SELECT * FROM ying_calc.index_rt_hst where date(dt) = curdate() and idi = '000300';

SELECT date(dt) as date, close, volume, amount FROM ying_calc.index_rt_hst where date(dt) = curdate() and idi = '000300';

SELECT dt as date, close, volume, amount FROM ying_calc.index_rt_hst where `idi` = '000300' ORDER BY `dt` desc LIMIT 500;

SELECT `date`, `open`, `high`, `low`, `close`, `volume`, `amount` FROM `ying`.`hk_s_xts` where code = '03888' and datediff(curdate(), `date`) < 88 order by date;


SELECT dt as date, close, volume, amount FROM ying_calc.index_xts where `idi` = '000300' ORDER BY `dt` DESC LIMIT 50;