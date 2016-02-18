SELECT 
    `hs_bkhq_EM`.`id`,
    `hs_bkhq_EM`.`cat`,
    `hs_bkhq_EM`.`name_bk`,
    `hs_bkhq_EM`.`chgrate_bk`,
    `hs_bkhq_EM`.`mktcap_bk`,
    `hs_bkhq_EM`.`tRatio_bk`,
    `hs_bkhq_EM`.`up_no`,
    `hs_bkhq_EM`.`down_no`,
    `hs_bkhq_EM`.`code`,
    `hs_bkhq_EM`.`chgrate`,
    `hs_bkhq_EM`.`info_bk`,
    `hs_bkhq_EM`.`TimeSys`,
    `hs_bkhq_EM`.`DateSys`
FROM
    `ying`.`hs_bkhq_EM`
ORDER BY DateSys DESC, TimeSys DESC, chgrate_bk DESC;

SELECT `bkhq`.`id`, `info`.code_bk,
    `bkhq`.`cat`,
    `bkhq`.`name_bk`,
    `bkhq`.`chgrate_bk`,
    `bkhq`.`mktcap_bk`,
    `bkhq`.`tRatio_bk`,
    `bkhq`.`up_no`,
    `bkhq`.`down_no`,
    `bkhq`.`code`,
    `bkhq`.`chgrate`,
    `bkhq`.`info_bk`,
    `bkhq`.`TimeSys`,
    `bkhq`.`DateSys`
FROM `ying`.`hs_bkhq_EM` as bkhq left join hs_bk_info_EM as info on bkhq.name_bk = info.name;