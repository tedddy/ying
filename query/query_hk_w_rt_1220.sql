SELECT sum(turnover) FROM ying.hk_w_rt_0945 where date = curdate() - 1 order by id desc;

SELECT * FROM ying.hk_w_rt_0945 where date = curdate() - 1 order by id desc;

SELECT * FROM ying.hk_w_rt_0945 where date = curdate() - 1 order by id desc;

select a.code, a.turnover, b.`Turnover($K)` from ying.hk_w_rt_0945 a join `ying_calc`.`hk_w_sg` b on a.code = b.`Code`;