SELECT * FROM ying.hs_index_rt_EM;

SELECT * FROM ying.hs_index_rt_EM order by id desc;

SELECT 
    `idi`, `close`, `amount`, `cjezb`, `dt`
FROM
    `ying_calc`.`index_rt_hst`
WHERE
    TIME(dt) = '11:30:00'
ORDER BY dt DESC;
