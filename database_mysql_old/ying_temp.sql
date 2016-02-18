    FROM
        ((`hs_s_rt_EM` `rt`
        LEFT JOIN `hs_s_rt_EM` `b` ON (((`rt`.`code` = `b`.`code`)
            AND ((`rt`.`TimeSlot` < `b`.`TimeSlot`))))
        LEFT JOIN `hs_s` ON ((`rt`.`code` = `hs_s`.`code`))))
    WHERE
        ((ISNULL(`b`.`code`)
            AND (`rt`.`chgrate` > 0)
            AND (`rt`.`close` >= ROUND((1.0382 * ((100 * `rt`.`close`) / (100 + `rt`.`chgrate`))),
                2)))
            OR (ISNULL(`b`.`code`)
            AND (`rt`.`chgrate` < 0)
            AND (`rt`.`close` <= ROUND((0.9618 * ((100 * `rt`.`close`) / (100 + `rt`.`chgrate`))),
                2))))
    ORDER BY `rt`.`code`; 

SELECT CASE

 WHEN COUNT(v.value) = 0 THEN (

  INSERT INTO tbl_v (fid, uid, VALUE)

  SELECT fid, 1 AS uid, 'xxxxxx' AS VALUE FROM tbl_f

  WHERE category = 'categoryname' AND NAME = 'somevalue'

 ) WHEN v.value <> 'test' THEN (

  'update syntax here' /* will be similar like insert statement above */

 )ELSE (

  v.value

 )END

FROM shared_tbl_f f

INNER JOIN tbl_v v ON f.fid = v.fid

WHERE v.uid = 1 AND f.category = 'categoryname' AND f.name = 'somevalue';


datetime = IF((isnull(date) or isnull(TimeSlot)), null, cast(CONCAT(date,' ',TimeSlot) as datetime));

UPDATE `ying`.`hs_s_hs300_rt_EM` SET `datetime`=cast(CONCAT(date,' ',TimeSlot) as datetime);
SELECT 
        `rt300`.`code` AS `code`,
        `rt300`.`datetime`,
        `hs_s`.`name` AS `name`,
        `rt300`.`close` AS `close`,
        `rt300`.`chgrate` AS `chgrate`
    FROM
        ((`hs_s_hs300_rt_EM` `rt300`
        LEFT JOIN `hs_s_hs300_rt_EM` `b` ON (((`rt300`.`code` = `b`.`code`)
            AND ((`rt300`.`datetime` < `b`.`datetime`)
            OR ((`rt300`.`datetime` = `b`.`TimeSlot`)
            AND (`rt300`.`id` < `b`.`id`))))))
        LEFT JOIN `hs_s` ON ((`rt300`.`code` = `hs_s`.`code`)))
    WHERE
        (ISNULL(`b`.`code`)
            AND (`rt300`.`date` = curdate()-2)
            AND (`rt300`.`chgrate` > 0)
            AND (`rt300`.`close` >= ROUND((1.0618 * ((100 * `rt300`.`close`) / (100 + `rt300`.`chgrate`))),
                2)))            
    ORDER BY `rt300`.`code`;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_s_hs300_z_d_Statistics` AS
    SELECT 
        `a`.`date` AS `date`,
        `a`.`TimeSlot` AS `TimeSlot`,
        `rate5`.`chgrate5_weight` AS `rate5`,
        `a`.`z` AS `z`,
        `a`.`d` AS `d`,
        (`a`.`z` - `a`.`d`) AS `z-d`,
        ifnull(`zW`.`z_weight`,0) AS `zW`,
        ifnull(`dW`.`d_weight`,0) AS `dW`,
        (ifnull(`zW`.`z_weight`,0) - ifnull(`dW`.`d_weight`,0)) AS `zW-dW`,
        `b`.`zg` AS `zg`,
        `b`.`dg` AS `dg`,
        ifnull(`zgW`.`zg_weight`,0) AS `zgW`,
        ifnull(`dgW`.`dg_weight`,0) AS `dgW`,
        (ifnull(`zgW`.`zg_weight`,0) - ifnull(`dgW`.`dg_weight`,0)) AS `zgW-dgW`,
        `c`.`zt` AS `zt`,
        `c`.`dt` AS `dt`,
        ifnull(`ztW`.`zt_weight`,0) AS `ztW`,
        ifnull(`dtW`.`dt_weight`,0) AS `dtW`,
        (ifnull(`ztW`.`zt_weight`,0) - ifnull(`dtW`.`dt_weight`,0)) AS `ztW-dtW`
    FROM
        (((((((((`hs_s_hs300_z_d_No` `a`
        LEFT JOIN `hs_s_hs300_zg_dg_No` `b` ON (((`a`.`date` = `b`.`date`)
            AND (`a`.`TimeSlot` = `b`.`TimeSlot`))))
        LEFT JOIN `hs_s_hs300_zt_dt_No` `c` ON (((`a`.`date` = `c`.`date`)
            AND (`a`.`TimeSlot` = `c`.`TimeSlot`))))
        LEFT JOIN `hs_s_hs300_z_weight` `zW` ON (((`a`.`date` = `zW`.`date`)
            AND (`a`.`TimeSlot` = `zW`.`TimeSlot`))))
        LEFT JOIN `hs_s_hs300_d_weight` `dW` ON (((`a`.`date` = `dW`.`date`)
            AND (`a`.`TimeSlot` = `dW`.`TimeSlot`))))
        LEFT JOIN `hs_s_hs300_zg_weight` `zgW` ON (((`a`.`date` = `zgW`.`date`)
            AND (`a`.`TimeSlot` = `zgW`.`TimeSlot`))))
        LEFT JOIN `hs_s_hs300_dg_weight` `dgW` ON (((`a`.`date` = `dgW`.`date`)
            AND (`a`.`TimeSlot` = `dgW`.`TimeSlot`))))
        LEFT JOIN `hs_s_hs300_zt_weight` `ztW` ON (((`a`.`date` = `ztW`.`date`)
            AND (`a`.`TimeSlot` = `ztW`.`TimeSlot`))))
        LEFT JOIN `hs_s_hs300_dt_weight` `dtW` ON (((`a`.`date` = `dtW`.`date`)
            AND (`a`.`TimeSlot` = `dtW`.`TimeSlot`))))
        LEFT JOIN `hs_s_hs300_chgrate5_weight` `rate5` ON (((`a`.`date` = `rate5`.`date`)
            AND (`a`.`TimeSlot` = `rate5`.`TimeSlot`))))
    ORDER BY `a`.`date` DESC , `a`.`TimeSlot` DESC;

insert into `ying`.`hs_s_sh50_rt_EM`(
    `hs_s_sh50_rt_EM`.`code`,
    `hs_s_sh50_rt_EM`.`close`,
    `hs_s_sh50_rt_EM`.`amount`,
    `hs_s_sh50_rt_EM`.`volume`,
    `hs_s_sh50_rt_EM`.`chgrate`,
    `hs_s_sh50_rt_EM`.`WeiBi`,
    `hs_s_sh50_rt_EM`.`chgrate5`,
    `hs_s_sh50_rt_EM`.`LiangBi`,
    `hs_s_sh50_rt_EM`.`date`,
    `hs_s_sh50_rt_EM`.`time`,
    `hs_s_sh50_rt_EM`.`TimeSlot`)
SELECT 
    `hs_s_hs300_rt_EM`.`code`,
    `hs_s_hs300_rt_EM`.`close`,
    `hs_s_hs300_rt_EM`.`amount`,
    `hs_s_hs300_rt_EM`.`volume`,
    `hs_s_hs300_rt_EM`.`chgrate`,
    `hs_s_hs300_rt_EM`.`WeiBi`,
    `hs_s_hs300_rt_EM`.`chgrate5`,
    `hs_s_hs300_rt_EM`.`LiangBi`,
    `hs_s_hs300_rt_EM`.`date`,
    `hs_s_hs300_rt_EM`.`time`,
    `hs_s_hs300_rt_EM`.`TimeSlot`
FROM
    ying.hs_s_hs300_rt_EM
WHERE
    code IN (SELECT DISTINCT
            a.`code`
        FROM
            `ying`.`hs_bk_gp_info_EM` AS a
                JOIN
            ying.hs_bk_info_EM AS b ON (a.code_bk = b.code_bk)
                JOIN
            ying.hs_bkhq_rt_EM AS c ON (b.name_bk = c.name_bk)
        WHERE
            b.name_bk = '上证50'
        ORDER BY a.`DateSys` DESC , c.`chgrate_bk` DESC)
ORDER BY id; 

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_fund_arbitrage_current` AS
    SELECT DISTINCT
        `fjjj`.`code` AS `code`,
		info.ltsz as ltsz
        `fjjj`.`b` AS `b`,
        `fjjj`.`a` AS `a`,
        `fjjj`.`ratio_BoA` AS `ratio_BoA`,
        ROUND(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),
                4) AS `zjl`,
        `mother`.`jjjz` AS `jjjz_mother`,
        `b`.`jjjz` AS `jjjz_b`,
        `b`.`price` AS `price_b`,
        `a`.`jjjz` AS `jjjz_a`,
        `a`.`price` AS `price_a`,
        (CASE
            WHEN
                (ROUND(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),
                        4) < -(0.02))
            THEN
                '申购母基金，卖出基金A和B'
            WHEN
                (ROUND(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),
                        4) > 0.02)
            THEN
                '买入基金A和B，赎回母基金'
            ELSE '耐心等待套利机会'
        END) AS `arbitrage_stratage`
    FROM
        (((`hs_fund_mother_son_daughter` `fjjj`
        JOIN `hs_fund_f10_mother_current` `mother` ON ((`fjjj`.`code` = `mother`.`code`))) join ying.hs_fund_f10_fjjj_AB_current info on fjjj.code = info.code
        JOIN `hs_fund_fjjj_list_current` `b` ON ((`fjjj`.`b` = `b`.`code`)))
        JOIN `hs_fund_fjjj_list_current` `a` ON ((`fjjj`.`a` = `a`.`code`)))
    ORDER BY ROUND(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),
            4)


CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_fund_arbitrage` AS
    SELECT DISTINCT
        `fjjj`.`code` AS `code`,
        `fjjj`.`b` AS `b`,
        `fjjj`.`a` AS `a`,
        `fjjj`.`ratio_BoA` AS `ratio_BoA`,
        ROUND(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),
                4) AS `zjl`,
        `mother`.`jjjz` AS `jjjz_mother`,
        `b`.`jjjz` AS `jjjz_b`,
        `b`.`price` AS `price_b`,
        `a`.`jjjz` AS `jjjz_a`,
        `a`.`price` AS `price_a`,
        (CASE
            WHEN
                (ROUND(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),
                        4) < -(0.02))
            THEN
                '申购母基金，卖出基金A和B'
            WHEN
                (ROUND(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),
                        4) > 0.02)
            THEN
                '买入基金A和B，赎回母基金'
            ELSE '耐心等待套利机会'
        END) AS `arbitrage_stratage`
    FROM
        (((`hs_fund_mother_son_daughter` `fjjj`
        JOIN `hs_fund_f10_mother_current` `mother` ON ((`fjjj`.`code` = `mother`.`code`)))
        JOIN `hs_fund_fjjj_list_current` `b` ON ((`fjjj`.`b` = `b`.`code`)))
        JOIN `hs_fund_fjjj_list_current` `a` ON ((`fjjj`.`a` = `a`.`code`)))
    ORDER BY ROUND(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),
            4)


CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `gxh`@`%` 
    SQL SECURITY DEFINER
VIEW `hs_fund_arbitrage` AS
    SELECT DISTINCT
        `fjjj`.`code` AS `code`,
        `a`.`date` AS `date`,
        `fjjj`.`b` AS `b`,
        `fjjj`.`a` AS `a`,
        `fjjj`.`ratio_BoA` AS `ratio_BoA`,
        ROUND(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),
                4) AS `zjl`,
        `mother`.`jjjz` AS `jjjz_mother`,
        `b`.`jjjz` AS `jjjz_b`,
        `b`.`price` AS `price_b`,
        `a`.`jjjz` AS `jjjz_a`,
        `a`.`price` AS `price_a`,
        (CASE
            WHEN
                (ROUND(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),
                        4) < -(0.02))
            THEN
                '申购母基金，卖出基金A和B'
            WHEN
                (ROUND(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),
                        4) > 0.02)
            THEN
                '买入基金A和B，赎回母基金'
            ELSE '耐心等待套利机会'
        END) AS `arbitrage_stratage`
    FROM
        (`hs_fund_fjjj_list` `a`
        LEFT JOIN (`hs_fund_fjjj_list` `b`
        LEFT JOIN (`hs_fund_mother_son_daughter` `fjjj`
        JOIN `hs_fund_f10_mother` `mother` ON ((`fjjj`.`code` = `mother`.`code`))) ON ((`fjjj`.`b` = `b`.`code`))) ON ((`fjjj`.`a` = `a`.`code`)))
    ORDER BY ROUND(((((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`) - ((`fjjj`.`ratio_BoA` * `b`.`price`) + `a`.`price`)) / ((1 + `fjjj`.`ratio_BoA`) * `mother`.`jjjz`)),
            4)

CREATE TABLE `hk_w_rt_1220` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(5) NOT NULL COMMENT '代码',
  `price` decimal(7,3) unsigned DEFAULT NULL COMMENT '当前价',
  `buy` decimal(7,3) unsigned DEFAULT NULL COMMENT '买一价',
  `sell` decimal(7,3) unsigned DEFAULT NULL COMMENT '卖一价',
  `turnover` int(11) unsigned DEFAULT NULL COMMENT '权证成交额',
  `date` date DEFAULT NULL COMMENT '日期',
  `time` time DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_date_time` (`code`,`date`,`time`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hk_w_rt`(IN code CHAR(5), price DECIMAL(7,3), buy DECIMAL(7,3), sell DECIMAL(7,3), turnover BIGINT(12) UNSIGNED, date DATE, time TIME)
BEGIN
SET code = IF(code = '', NULL, code);
SET price = IF(price = '', NULL, price);
SET buy = IF(buy = '', NULL, buy);
SET sell = IF(sell = '', NULL, sell);
SET turnover = IF(turnover = '', NULL, turnover);
SET date = IF(date = '', NULL, date);
SET time = IF(time = '', NULL, time);

INSERT INTO `hk_s_rt` (`code`, `price`, `buy`, `sell`, `amount`, `date`, `time`) VALUES (code, price, buy, sell, amount, date, time) 
ON DUPLICATE KEY UPDATE 
	`code` = IF(code IS NULL, `code`, code),
	`price` = IF(price IS NULL, `price`, price),
	`buy` = IF(buy IS NULL, `buy`, buy),
	`sell` = IF(sell IS NULL, `sell`, sell),
	`amount` = IF(amount IS NULL, `amount`, amount);
END$$
DELIMITER ;

SELECT CONCAT('http://hq.sinajs.cn/list=hk', code) as url_hk_w_rt FROM hk_w;
SELECT CONCAT('http://hq.sinajs.cn/list=hk', code) AS 'url_hk_w_watch' FROM `hk_w` WHERE `fW` = '5';
