SELECT * FROM ying.hk_w_rt;

SELECT count(*) FROM ying.hk_w_rt;

SELECT 
    *
FROM
    ying.hk_w_rt
WHERE
    code = '24975'
ORDER BY TimeSlot DESC;

INSERT INTO `ying`.`hk_w_rt`
	(`code`, `price`, `buy`, `sell`, `turnover`, `date`, `time`)
SELECT 
	`hk_rt`.`code`, `hk_rt`.`price`, `hk_rt`.`buy`, `hk_rt`.`sell`, `hk_rt`.`turnover`, `hk_rt`.`date`, `hk_rt`.`time`
FROM `securities`.`hk_rt` 
	WHERE code IN (SELECT code FROM `securities`.`hk_w`);
