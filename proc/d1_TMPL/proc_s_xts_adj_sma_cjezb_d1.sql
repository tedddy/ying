
-- E:\user_tony\Documents\GitHub\ying\proc\d1_TMPL\proc_s_xts_adj_sma_cjezb_d1.sql

-- add a column for value of d1
ALTER TABLE `ying_calc`.`s_xts_adj_sma` ADD COLUMN `cjezb5_d1` DECIMAL(5,2) NULL COMMENT '' AFTER `cjezb5`;

-- UPDATE value of d1 into s_xts_adj_sma

DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_cjezb5_d1`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_xts_adj_sma_cjezb5_d1`()
BEGIN
     DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
     DECLARE cursor_fetch_tmp_ids VARCHAR(6);
        DECLARE dt_latest DATE; -- variable for the latest date
        DECLARE cjezb5_earlest DECIMAL(5,2); -- variable for the earlest cjezb5
     DECLARE cursor1 CURSOR FOR
     SELECT DISTINCT `ids` FROM `s_xts_adj_sma` ORDER BY `ids`;
     DECLARE CONTINUE HANDLER FOR NOT FOUND
     SET no_more_rows := TRUE;

     OPEN cursor1;
     LOOP1: LOOP
       
          FETCH cursor1 INTO cursor_fetch_tmp_ids;
               
               SELECT
                   cjezb5
               INTO cjezb5_earlest FROM
                   `s_xts_adj_sma`
               WHERE
                   `ids` = cursor_fetch_tmp_ids
               ORDER BY dt
               LIMIT 1;
                               
               SET @cjezb5_lag := cjezb5_earlest;
               UPDATE `ying_calc`.`s_xts_adj_sma` t
                    INNER JOIN
                   (SELECT
                    `dt`,
                        `ids`,
                        ROUND(100 * (cjezb5 - @cjezb5_lag) / @cjezb5_lag, 2) AS `cjezb5_d1`,
                        @cjezb5_lag:=cjezb5
                   FROM
                    `ying_calc`.`s_xts_adj_sma`
                   WHERE
                    `ids` = cursor_fetch_tmp_ids
                   ORDER BY `dt`) d1 ON (t.ids = d1.ids AND t.dt = d1.dt)
               SET
                   t.cjezb5_d1 = d1.cjezb5_d1; 
   
          IF no_more_rows THEN
               CLOSE cursor1;
               LEAVE LOOP1;
          END IF;
     END LOOP LOOP1;
END$$
DELIMITER ;

CALL `ying_calc`.`s_xts_adj_sma_cjezb5_d1`;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` ORDER BY ids, dt DESC;

-- `cjezb10`

ALTER TABLE `ying_calc`.`s_xts_adj_sma` ADD COLUMN `cjezb10_d1` DECIMAL(5,2) NULL COMMENT '' AFTER `cjezb10`;

-- UPDATE value of d1 into s_xts_adj_sma

DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_cjezb10_d1`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_xts_adj_sma_cjezb10_d1`()
BEGIN
     DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
     DECLARE cursor_fetch_tmp_ids VARCHAR(6);
        DECLARE dt_latest DATE; -- variable for the latest date
        DECLARE cjezb10_earlest DECIMAL(5,2); -- variable for the earlest cjezb10
     DECLARE cursor1 CURSOR FOR
     SELECT DISTINCT `ids` FROM `s_xts_adj_sma` ORDER BY `ids`;
     DECLARE CONTINUE HANDLER FOR NOT FOUND
     SET no_more_rows := TRUE;

     OPEN cursor1;
     LOOP1: LOOP
       
          FETCH cursor1 INTO cursor_fetch_tmp_ids;
               
               SELECT
                   cjezb10
               INTO cjezb10_earlest FROM
                   `s_xts_adj_sma`
               WHERE
                   `ids` = cursor_fetch_tmp_ids
               ORDER BY dt
               LIMIT 1;
                               
               SET @cjezb10_lag := cjezb10_earlest;
               UPDATE `ying_calc`.`s_xts_adj_sma` t
                    INNER JOIN
                   (SELECT
                    `dt`,
                        `ids`,
                        ROUND(100 * (cjezb10 - @cjezb10_lag) / @cjezb10_lag, 2) AS `cjezb10_d1`,
                        @cjezb10_lag:=cjezb10
                   FROM
                    `ying_calc`.`s_xts_adj_sma`
                   WHERE
                    `ids` = cursor_fetch_tmp_ids
                   ORDER BY `dt`) d1 ON (t.ids = d1.ids AND t.dt = d1.dt)
               SET
                   t.cjezb10_d1 = d1.cjezb10_d1; 
   
          IF no_more_rows THEN
               CLOSE cursor1;
               LEAVE LOOP1;
          END IF;
     END LOOP LOOP1;
END$$
DELIMITER ;

CALL `ying_calc`.`s_xts_adj_sma_cjezb10_d1`;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` ORDER BY ids, dt DESC;

-- `cjezb20`

ALTER TABLE `ying_calc`.`s_xts_adj_sma` ADD COLUMN `cjezb20_d1` DECIMAL(5,2) NULL COMMENT '' AFTER `cjezb20`;

-- UPDATE value of d1 into s_xts_adj_sma

DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_cjezb20_d1`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_xts_adj_sma_cjezb20_d1`()
BEGIN
     DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
     DECLARE cursor_fetch_tmp_ids VARCHAR(6);
        DECLARE dt_latest DATE; -- variable for the latest date
        DECLARE cjezb20_earlest DECIMAL(5,2); -- variable for the earlest cjezb20
     DECLARE cursor1 CURSOR FOR
     SELECT DISTINCT `ids` FROM `s_xts_adj_sma` ORDER BY `ids`;
     DECLARE CONTINUE HANDLER FOR NOT FOUND
     SET no_more_rows := TRUE;

     OPEN cursor1;
     LOOP1: LOOP
       
          FETCH cursor1 INTO cursor_fetch_tmp_ids;
               
               SELECT
                   cjezb20
               INTO cjezb20_earlest FROM
                   `s_xts_adj_sma`
               WHERE
                   `ids` = cursor_fetch_tmp_ids
               ORDER BY dt
               LIMIT 1;
                               
               SET @cjezb20_lag := cjezb20_earlest;
               UPDATE `ying_calc`.`s_xts_adj_sma` t
                    INNER JOIN
                   (SELECT
                    `dt`,
                        `ids`,
                        ROUND(100 * (cjezb20 - @cjezb20_lag) / @cjezb20_lag, 2) AS `cjezb20_d1`,
                        @cjezb20_lag:=cjezb20
                   FROM
                    `ying_calc`.`s_xts_adj_sma`
                   WHERE
                    `ids` = cursor_fetch_tmp_ids
                   ORDER BY `dt`) d1 ON (t.ids = d1.ids AND t.dt = d1.dt)
               SET
                   t.cjezb20_d1 = d1.cjezb20_d1; 
   
          IF no_more_rows THEN
               CLOSE cursor1;
               LEAVE LOOP1;
          END IF;
     END LOOP LOOP1;
END$$
DELIMITER ;

CALL `ying_calc`.`s_xts_adj_sma_cjezb20_d1`;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` ORDER BY ids, dt DESC;

-- `cjezb30`

ALTER TABLE `ying_calc`.`s_xts_adj_sma` ADD COLUMN `cjezb30_d1` DECIMAL(5,2) NULL COMMENT '' AFTER `cjezb30`;

-- UPDATE value of d1 into s_xts_adj_sma

DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_cjezb30_d1`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_xts_adj_sma_cjezb30_d1`()
BEGIN
     DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
     DECLARE cursor_fetch_tmp_ids VARCHAR(6);
        DECLARE dt_latest DATE; -- variable for the latest date
        DECLARE cjezb30_earlest DECIMAL(5,2); -- variable for the earlest cjezb30
     DECLARE cursor1 CURSOR FOR
     SELECT DISTINCT `ids` FROM `s_xts_adj_sma` ORDER BY `ids`;
     DECLARE CONTINUE HANDLER FOR NOT FOUND
     SET no_more_rows := TRUE;

     OPEN cursor1;
     LOOP1: LOOP
       
          FETCH cursor1 INTO cursor_fetch_tmp_ids;
               
               SELECT
                   cjezb30
               INTO cjezb30_earlest FROM
                   `s_xts_adj_sma`
               WHERE
                   `ids` = cursor_fetch_tmp_ids
               ORDER BY dt
               LIMIT 1;
                               
               SET @cjezb30_lag := cjezb30_earlest;
               UPDATE `ying_calc`.`s_xts_adj_sma` t
                    INNER JOIN
                   (SELECT
                    `dt`,
                        `ids`,
                        ROUND(100 * (cjezb30 - @cjezb30_lag) / @cjezb30_lag, 2) AS `cjezb30_d1`,
                        @cjezb30_lag:=cjezb30
                   FROM
                    `ying_calc`.`s_xts_adj_sma`
                   WHERE
                    `ids` = cursor_fetch_tmp_ids
                   ORDER BY `dt`) d1 ON (t.ids = d1.ids AND t.dt = d1.dt)
               SET
                   t.cjezb30_d1 = d1.cjezb30_d1; 
   
          IF no_more_rows THEN
               CLOSE cursor1;
               LEAVE LOOP1;
          END IF;
     END LOOP LOOP1;
END$$
DELIMITER ;

CALL `ying_calc`.`s_xts_adj_sma_cjezb30_d1`;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` ORDER BY ids, dt DESC;

-- `cjezb60`

ALTER TABLE `ying_calc`.`s_xts_adj_sma` ADD COLUMN `cjezb60_d1` DECIMAL(5,2) NULL COMMENT '' AFTER `cjezb60`;

-- UPDATE value of d1 into s_xts_adj_sma

DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_cjezb60_d1`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_xts_adj_sma_cjezb60_d1`()
BEGIN
     DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
     DECLARE cursor_fetch_tmp_ids VARCHAR(6);
        DECLARE dt_latest DATE; -- variable for the latest date
        DECLARE cjezb60_earlest DECIMAL(5,2); -- variable for the earlest cjezb60
     DECLARE cursor1 CURSOR FOR
     SELECT DISTINCT `ids` FROM `s_xts_adj_sma` ORDER BY `ids`;
     DECLARE CONTINUE HANDLER FOR NOT FOUND
     SET no_more_rows := TRUE;

     OPEN cursor1;
     LOOP1: LOOP
       
          FETCH cursor1 INTO cursor_fetch_tmp_ids;
               
               SELECT
                   cjezb60
               INTO cjezb60_earlest FROM
                   `s_xts_adj_sma`
               WHERE
                   `ids` = cursor_fetch_tmp_ids
               ORDER BY dt
               LIMIT 1;
                               
               SET @cjezb60_lag := cjezb60_earlest;
               UPDATE `ying_calc`.`s_xts_adj_sma` t
                    INNER JOIN
                   (SELECT
                    `dt`,
                        `ids`,
                        ROUND(100 * (cjezb60 - @cjezb60_lag) / @cjezb60_lag, 2) AS `cjezb60_d1`,
                        @cjezb60_lag:=cjezb60
                   FROM
                    `ying_calc`.`s_xts_adj_sma`
                   WHERE
                    `ids` = cursor_fetch_tmp_ids
                   ORDER BY `dt`) d1 ON (t.ids = d1.ids AND t.dt = d1.dt)
               SET
                   t.cjezb60_d1 = d1.cjezb60_d1; 
   
          IF no_more_rows THEN
               CLOSE cursor1;
               LEAVE LOOP1;
          END IF;
     END LOOP LOOP1;
END$$
DELIMITER ;

CALL `ying_calc`.`s_xts_adj_sma_cjezb60_d1`;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` ORDER BY ids, dt DESC;

-- `cjezb120`

ALTER TABLE `ying_calc`.`s_xts_adj_sma` ADD COLUMN `cjezb120_d1` DECIMAL(5,2) NULL COMMENT '' AFTER `cjezb120`;

-- UPDATE value of d1 into s_xts_adj_sma

DROP PROCEDURE IF EXISTS `ying_calc`.`s_xts_adj_sma_cjezb120_d1`;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_xts_adj_sma_cjezb120_d1`()
BEGIN
     DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
     DECLARE cursor_fetch_tmp_ids VARCHAR(6);
        DECLARE dt_latest DATE; -- variable for the latest date
        DECLARE cjezb120_earlest DECIMAL(5,2); -- variable for the earlest cjezb120
     DECLARE cursor1 CURSOR FOR
     SELECT DISTINCT `ids` FROM `s_xts_adj_sma` ORDER BY `ids`;
     DECLARE CONTINUE HANDLER FOR NOT FOUND
     SET no_more_rows := TRUE;

     OPEN cursor1;
     LOOP1: LOOP
       
          FETCH cursor1 INTO cursor_fetch_tmp_ids;
               
               SELECT
                   cjezb120
               INTO cjezb120_earlest FROM
                   `s_xts_adj_sma`
               WHERE
                   `ids` = cursor_fetch_tmp_ids
               ORDER BY dt
               LIMIT 1;
                               
               SET @cjezb120_lag := cjezb120_earlest;
               UPDATE `ying_calc`.`s_xts_adj_sma` t
                    INNER JOIN
                   (SELECT
                    `dt`,
                        `ids`,
                        ROUND(100 * (cjezb120 - @cjezb120_lag) / @cjezb120_lag, 2) AS `cjezb120_d1`,
                        @cjezb120_lag:=cjezb120
                   FROM
                    `ying_calc`.`s_xts_adj_sma`
                   WHERE
                    `ids` = cursor_fetch_tmp_ids
                   ORDER BY `dt`) d1 ON (t.ids = d1.ids AND t.dt = d1.dt)
               SET
                   t.cjezb120_d1 = d1.cjezb120_d1; 
   
          IF no_more_rows THEN
               CLOSE cursor1;
               LEAVE LOOP1;
          END IF;
     END LOOP LOOP1;
END$$
DELIMITER ;

CALL `ying_calc`.`s_xts_adj_sma_cjezb120_d1`;

SELECT * FROM `ying_calc`.`s_xts_adj_sma` ORDER BY ids, dt DESC;

-- Reference: file E:\bYun\securities\ying\learning\learning.sql; search key words: learning and researching E:\bYun\securities\ying\proc\d1_TMPL\proc_s_xts_adj_sma_cjezb_d1.sql 

