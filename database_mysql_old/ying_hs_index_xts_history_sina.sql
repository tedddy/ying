SELECT DISTINCT code_index FROM ying.hs_index_xts_history_sina;

SELECT * FROM ying.hs_index_xts_history_sina order by date desc, amount_index;

SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/', idi.code_index, '/type/S.phtml?year=', date.year,'&jidu=', date.quarter) AS 'hs_index_xts_history_sina_2012_2015' FROM (SELECT MIN(`code_index`) AS code_index FROM `ying`.`hs_index_info` GROUP BY `name_index`) as idi join year_quarter as date  where year > 2011 and year <= '2015';