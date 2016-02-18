SELECT * FROM ying.hk_w_rt_lag;

SELECT count(*) FROM ying.hk_w_rt_lag;

SELECT 
    *
FROM
    ying.hk_w_rt_lag
WHERE
    code = '24975'
ORDER BY TimeSlot DESC;

INSERT INTO `ying`.`hk_w_rt_lag`
	(`code`, `price`, `buy`, `sell`, `turnover`, `date`, `time`)
SELECT 
	`hk_rt`.`code`, `hk_rt`.`price`, `hk_rt`.`buy`, `hk_rt`.`sell`, `hk_rt`.`turnover`, `hk_rt`.`date`, `hk_rt`.`time`
FROM `securities`.`hk_rt` 
	WHERE code IN (SELECT code FROM `securities`.`hk_w`);
