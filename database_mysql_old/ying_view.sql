CREATE ALGORITHM=UNDEFINED DEFINER=`gxh`@`%` SQL SECURITY DEFINER VIEW `hk_w_put` AS select `hk_w_xts`.`date` AS `date`,`info`.`uCode` AS `uCode`,sum(`hk_w_xts`.`turnover`) AS `sum_put` from (`hk_w_xts` join `hk_w` `info` on((`hk_w_xts`.`code` = `info`.`code`))) where ((`info`.`uCode` is not null) and (`info`.`nature` = 0)) group by `info`.`uCode`,`hk_w_xts`.`date`,`info`.`nature`;

CREATE ALGORITHM=UNDEFINED DEFINER=`gxh`@`%` SQL SECURITY DEFINER VIEW `hk_w_statistics` AS select `hk_w_xts`.`date` AS `date`,`info`.`uCode` AS `uCode`,sum(`hk_w_xts`.`turnover`) AS `SUM(turnover)` from (`hk_w_xts` join `hk_w` `info` on((`hk_w_xts`.`code` = `info`.`code`))) where ((`hk_w_xts`.`date` in ('2015-04-14','2015-04-13','2015-04-10','2015-04-09','2015-04-08')) and (`info`.`uCode` is not null) and (`info`.`uCode` in ('00998','06818','01988','00939','01288','06837','HSCEI'))) group by `info`.`uCode`,`hk_w_xts`.`date`;

CREATE ALGORITHM=UNDEFINED DEFINER=`gxh`@`%` SQL SECURITY DEFINER VIEW `hs_fund_arbitrage_cn` AS select distinct `fjjj`.`code` AS `母基金`,`fjjj`.`b` AS `B基金`,`fjjj`.`a` AS `A基金`,`fjjj`.`ratio_BoA` AS `BA比例`,round(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),4) AS `折价率`,`mother`.`jjjz` AS `母净值`,`b`.`jjjz` AS `b净值`,`b`.`price` AS `b价格`,`a`.`jjjz` AS `a净值`,`a`.`price` AS `a价格`,(case when (round(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),4) < -(0.02)) then '申购母基金，卖出基金A和B' when (round(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),4) > 0.02) then '买入基金A和B，赎回母基金' else '耐心等待套利机会' end) AS `套利策略` from (((`hs_fund_mother_son_daughter` `fjjj` join `hs_fund_f10_mother` `mother` on((`fjjj`.`code` = `mother`.`code`))) join `hs_fund_fjjj_list_current` `b` on((`fjjj`.`b` = `b`.`code`))) join `hs_fund_fjjj_list_current` `a` on((`fjjj`.`a` = `a`.`code`))) order by round(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),4);

CREATE ALGORITHM=UNDEFINED DEFINER=`gxh`@`%` SQL SECURITY DEFINER VIEW `hs_fund_arbitrage_current` AS select distinct `fjjj`.`code` AS `code`,round(`info`.`ltsz`,1) AS `ltsz`,`fjjj`.`b` AS `b`,`fjjj`.`a` AS `a`,`fjjj`.`ratio_BoA` AS `ratio_BoA`,round(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),4) AS `zjl`,`mother`.`jjjz` AS `jjjz_mother`,`b`.`jjjz` AS `jjjz_b`,`b`.`price` AS `price_b`,`a`.`jjjz` AS `jjjz_a`,`a`.`price` AS `price_a`,(case when (round(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),4) < -(0.02)) then '申购母基金，卖出基金A和B' when (round(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),4) > 0.02) then '买入基金A和B，赎回母基金' else '耐心等待套利机会' end) AS `arbitrage_stratage` from ((((`hs_fund_mother_son_daughter` `fjjj` join `hs_fund_f10_mother_current` `mother` on((`fjjj`.`code` = `mother`.`code`))) join `hs_fund_f10_fjjj_AB_current` `info` on((`fjjj`.`b` = `info`.`code`))) join `hs_fund_fjjj_list_current` `b` on((`fjjj`.`b` = `b`.`code`))) join `hs_fund_fjjj_list_current` `a` on((`fjjj`.`a` = `a`.`code`))) order by round(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),4);

CREATE ALGORITHM=UNDEFINED DEFINER=`gxh`@`%` SQL SECURITY DEFINER VIEW `hs_fund_fjjj_index` AS select distinct `f10`.`mother` AS `code_fjjj_mother`,`f10`.`index_target` AS `name_index`,`info`.`code` AS `code_index` from (`hs_fund_f10_fjjj_AB_current` `f10` join `hs_index_info_sina` `info` on((`f10`.`index_target` = `info`.`name`))) union select distinct `f10`.`mother` AS `code_fjjj_mother`,`f10`.`index_target` AS `name_index`,`info`.`code` AS `code_index` from (`hs_fund_f10_fjjj_AB_current` `f10` join `hs_index_info_sina` `info` on((`f10`.`index_target` = `info`.`name_full`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`gxh`@`%` SQL SECURITY DEFINER VIEW `hs_fund_mother_son_daughter` AS select `mother`.`code` AS `code`,`son`.`code` AS `b`,`son`.`mktcap` AS `mktcap_b`,`daughter`.`code` AS `a`,`daughter`.`mktcap` AS `mktcap_a`,round((`son`.`mktcap` / `daughter`.`mktcap`),4) AS `ratio_BoA` from ((`hs_fund_f10_mother` `mother` join `hs_fund_f10_fjjj_AB_current` `son` on(((`son`.`mother` = `mother`.`code`) and (`son`.`cat` = '分级杠杆')))) join `hs_fund_f10_fjjj_AB_current` `daughter` on(((`daughter`.`mother` = `mother`.`code`) and (`daughter`.`cat` = '固定收益'))));

CREATE ALGORITHM=UNDEFINED DEFINER=`gxh`@`%` SQL SECURITY DEFINER VIEW `hs_s_bk_gp_info_EM_JoinName` AS select `a`.`code_bk` AS `code_bk`,`b`.`name_bk` AS `name_bk`,`a`.`code` AS `code`,`c`.`DateSys` AS `DateSys`,`c`.`TimeSys` AS `TimeSys`,`c`.`chgrate_bk` AS `chgrate_bk` from ((`hs_bk_gp_info_EM` `a` join `hs_bk_info_EM` `b` on((`a`.`code_bk` = `b`.`code_bk`))) join `hs_bkhq_rt_EM` `c` on((`b`.`name_bk` = `c`.`name_bk`))) order by `c`.`DateSys` desc,`c`.`TimeSys` desc,`c`.`chgrate_bk` desc;

CREATE ALGORITHM=UNDEFINED DEFINER=`gxh`@`%` SQL SECURITY DEFINER VIEW `hs_s_hs300_chgrate5_weight` AS select `a`.`date` AS `date`,`a`.`TimeSlot` AS `TimeSlot`,sum((`a`.`chgrate5` * `c`.`weight`)) AS `chgrate5_weight` from (`hs_s_hs300_rt_EM` `a` join `hs300_s_data_c` `c` on((`a`.`code` = `c`.`code`))) group by `a`.`TimeSlot` order by `a`.`date` desc,`a`.`TimeSlot` desc,sum((`a`.`chgrate5` * `c`.`weight`)) desc;

CREATE ALGORITHM=UNDEFINED DEFINER=`gxh`@`%` SQL SECURITY DEFINER VIEW `hs_s_hs300_dt_weight` AS select `a`.`date` AS `date`,`a`.`TimeSlot` AS `TimeSlot`,sum(`c`.`weight`) AS `dt_weight` from (`hs_s_hs300_rt_EM` `a` join `hs300_s_data_c` `c` on((`a`.`code` = `c`.`code`))) where ((`a`.`chgrate` < 0) and (`a`.`close` <= round((0.9 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),2))) group by `a`.`TimeSlot` order by date desc, TimeSlot desc;

-- CREATE ALGORITHM=UNDEFINED DEFINER=`gxh`@`%` SQL SECURITY DEFINER VIEW `hs_s_hs300_dt_weighted` AS select `a`.`date` AS `date`,`a`.`TimeSlot` AS `TimeSlot`,sum(`c`.`weight`) AS `dt_weighted` from (`hs_s_hs300_rt_EM` `a` join `hs300_s_data_c` `c` on((`a`.`code` = `c`.`code`))) where ((`a`.`chgrate` < 0) and (`a`.`close` <= round((0.9 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),2))) group by `a`.`TimeSlot` order by date desc, TimeSlot desc; -- drop on 150827 DROP VIEW `ying`.`hs_s_hs300_dt_weighted`;

CREATE ALGORITHM=UNDEFINED DEFINER=`gxh`@`%` SQL SECURITY DEFINER VIEW `hs_s_hs300_zt_dt_No` AS select `hs_s_hs300_rt_EM`.`date` AS `date`,`hs_s_hs300_rt_EM`.`TimeSlot` AS `TimeSlot`,sum(if(((`hs_s_hs300_rt_EM`.`chgrate` > 0) and (`hs_s_hs300_rt_EM`.`close` >= round((1.1 * ((100 * `hs_s_hs300_rt_EM`.`close`) / (100 + `hs_s_hs300_rt_EM`.`chgrate`))),2))),1,0)) AS `zt`,sum(if(((`hs_s_hs300_rt_EM`.`chgrate` < 0) and (`hs_s_hs300_rt_EM`.`close` <= round((0.9 * ((100 * `hs_s_hs300_rt_EM`.`close`) / (100 + `hs_s_hs300_rt_EM`.`chgrate`))),2))),1,0)) AS `dt` from `hs_s_hs300_rt_EM` group by `hs_s_hs300_rt_EM`.`TimeSlot` order by `hs_s_hs300_rt_EM`.`date` desc,`hs_s_hs300_rt_EM`.`TimeSlot` desc;

CREATE ALGORITHM=UNDEFINED DEFINER=`gxh`@`%` SQL SECURITY DEFINER VIEW `hs_s_hs300_zt_weight` AS select `a`.`date` AS `date`,`a`.`TimeSlot` AS `TimeSlot`,sum(`c`.`weight`) AS `zt_weight` from (`hs_s_hs300_rt_EM` `a` join `hs300_s_data_c` `c` on((`a`.`code` = `c`.`code`))) where ((`a`.`chgrate` > 0) and (`a`.`close` >= round((1.1 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),2))) group by `a`.`TimeSlot` order by date desc, TimeSlot desc;

-- CREATE ALGORITHM=UNDEFINED DEFINER=`gxh`@`%` SQL SECURITY DEFINER VIEW `hs_s_hs300_zt_weighted` AS select `a`.`date` AS `date`,`a`.`TimeSlot` AS `TimeSlot`,sum(`c`.`weight`) AS `zt_weighted` from (`hs_s_hs300_rt_EM` `a` join `hs300_s_data_c` `c` on((`a`.`code` = `c`.`code`))) where ((`a`.`chgrate` > 0) and (`a`.`close` >= round((1.1 * ((100 * `a`.`close`) / (100 + `a`.`chgrate`))),2))) group by `a`.`TimeSlot`; -- drop on 150827 

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_mktcap_c` AS
    SELECT 
        `a`.`code` AS `code`,
        `a`.`cDate` AS `cDate`,
        `a`.`mktcap` AS `mktcap`,
        `a`.`nmc` AS `nmc`
    FROM
        (`hs_s_mktcap` `a`
        LEFT JOIN `hs_s_mktcap` `b` ON (((`a`.`code` = `b`.`code`)
            AND ((`a`.`cDate` < `b`.`cDate`)
            OR ((`a`.`cDate` = `b`.`cDate`)
            AND (`a`.`id` < `b`.`id`))))))
    WHERE
        ISNULL(`b`.`code`)
    ORDER BY `a`.`code`;
    
CREATE ALGORITHM=UNDEFINED DEFINER=`gxh`@`%` SQL SECURITY DEFINER VIEW `hs_s_mktcap_c_2` AS select `max`.`code` AS `code`,`max`.`cDate_max` AS `cDate_max`,`mktcap`.`mktcap` AS `mktcap`,`mktcap`.`nmc` AS `nmc` from (`z_hs_s_mktcap_c` `max` join `hs_s_mktcap` `mktcap` on(((`max`.`code` = `mktcap`.`code`) and (`max`.`cDate_max` = `mktcap`.`cDate`))));

CREATE ALGORITHM=UNDEFINED DEFINER=`gxh`@`%` SQL SECURITY DEFINER VIEW `z_hs_s_mktcap_c_2` AS select `hs_s_mktcap`.`code` AS `code`,max(`hs_s_mktcap`.`cDate`) AS `cDate_max` from `hs_s_mktcap` group by `hs_s_mktcap`.`code`; -- z_前缀表明是临时view，功用是为了写前缀后的view，因为view里面不能有subquery


