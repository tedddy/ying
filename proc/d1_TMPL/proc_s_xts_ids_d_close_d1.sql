
-- compute d1 for given (`d`, `ids`)
-- tableTMPL to s_xts; dtTMPL to d, idTMPL to ids, fieldTMPL to close; 
SELECT 
    `d`,
    `ids`,
    close - @lag AS `chg_close`,
    @lag:=close `curr_close`
FROM
    `ying`.`s_xts` t,
    (SELECT @lag:=0) r
ORDER BY `ids` , `d`;
