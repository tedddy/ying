SELECT * FROM ying.index_info;

UPDATE `ying`.`index_info` SET `fW`='1' WHERE `idi` in (SELECT distinct idi FROM ying.index_stock_info);
