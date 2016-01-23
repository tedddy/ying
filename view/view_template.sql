CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `name_view` AS
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
    ORDER BY `a`.`code`