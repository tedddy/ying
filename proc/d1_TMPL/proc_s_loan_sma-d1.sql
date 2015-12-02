CALL `ying_calc`.`s_loan_sma_d1_bMargin5`;
-- add a column for value of d1
ALTER TABLE `ying_calc`.`s_loan_sma` ADD COLUMN `bMargin_d1` DECIMAL(5,2) NULL COMMENT '' AFTER `ids`;
ALTER TABLE `ying_calc`.`s_loan_sma` ADD COLUMN `bMargin5_d1` DECIMAL(5,2) NULL COMMENT '' AFTER `bMargin5`;
ALTER TABLE `ying_calc`.`s_loan_sma` ADD COLUMN `bMargin10_d1` DECIMAL(5,2) NULL COMMENT '' AFTER `bMargin5`;
ALTER TABLE `ying_calc`.`s_loan_sma` ADD COLUMN `bMargin20_d1` DECIMAL(5,2) NULL COMMENT '' AFTER `bMargin5`;
ALTER TABLE `ying_calc`.`s_loan_sma` ADD COLUMN `bMargin30_d1` DECIMAL(5,2) NULL COMMENT '' AFTER `bMargin5`;
ALTER TABLE `ying_calc`.`s_loan_sma` ADD COLUMN `bMargin60_d1` DECIMAL(5,2) NULL COMMENT '' AFTER `bMargin5`;
ALTER TABLE `ying_calc`.`s_loan_sma` ADD COLUMN `bMargin120_d1` DECIMAL(5,2) NULL COMMENT '' AFTER `bMargin5`;

-- DROP PROCEDURE `ying_calc`.`s_loan_d1_bMargin`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_loan_d1_bMargin`()
BEGIN
	DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
	DECLARE cursor_fetch_tmp_ids VARCHAR(6);
	DECLARE bMargin_earlest MEDIUMINT(8);
	DECLARE cursor1 CURSOR FOR
		SELECT DISTINCT `ids` FROM `s_loan` ORDER BY `ids`;
	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET no_more_rows := TRUE;

	OPEN cursor1;
	LOOP1: LOOP

		FETCH cursor1 INTO cursor_fetch_tmp_ids;

		SELECT
		   bMargin
		INTO bMargin_earlest FROM
		   `s_loan`
		WHERE
		   `ids` = cursor_fetch_tmp_ids
		ORDER BY dt
		LIMIT 1;
			       
		SET @bMargin_lag := bMargin_earlest;
			UPDATE `ying_calc`.`s_loan_sma` t
			INNER JOIN
				(
					SELECT
						`dt`,
						`ids`,
						ROUND(100 * (cast(bMargin as signed) - cast(@bMargin_lag as signed)) / @bMargin_lag, 2) AS `bMargin_d1`,
						@bMargin_lag:=bMargin
					FROM `ying_calc`.`s_loan`
					WHERE `ids` = cursor_fetch_tmp_ids
					ORDER BY `dt`
				) d1 ON (t.ids = d1.ids AND t.dt = d1.dt)
			SET t.bMargin_d1 = d1.bMargin_d1; 

		IF no_more_rows THEN
			CLOSE cursor1;
		LEAVE LOOP1;
		END IF;
	END LOOP LOOP1;
END$$
DELIMITER ;

CALL `ying_calc`.`s_loan_d1_bMargin`;


-- DROP PROCEDURE `ying_calc`.`s_loan_sma_d1_bMargin5`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_loan_sma_d1_bMargin5`()
BEGIN
	DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
	DECLARE cursor_fetch_tmp_ids VARCHAR(6);
	DECLARE bMargin5_earlest MEDIUMINT(8);
	DECLARE cursor1 CURSOR FOR
		SELECT DISTINCT `ids` FROM `s_loan_sma` ORDER BY `ids`;
	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET no_more_rows := TRUE;

	OPEN cursor1;
	LOOP1: LOOP

		FETCH cursor1 INTO cursor_fetch_tmp_ids;

		SELECT
		   bMargin5
		INTO bMargin5_earlest FROM
		   `s_loan_sma`
		WHERE
		   `ids` = cursor_fetch_tmp_ids
		ORDER BY dt
		LIMIT 1;
			       
		SET @bMargin5_lag := bMargin5_earlest;
			UPDATE `ying_calc`.`s_loan_sma` t
			INNER JOIN
				(
					SELECT
						`dt`,
						`ids`,
						ROUND(100 * (cast(bMargin5 as signed) - cast(@bMargin5_lag as signed)) / @bMargin5_lag, 2) AS `bMargin5_d1`,
						@bMargin5_lag:=bMargin5
					FROM `ying_calc`.`s_loan_sma`
					WHERE `ids` = cursor_fetch_tmp_ids
					ORDER BY `dt`
				) d1 ON (t.ids = d1.ids AND t.dt = d1.dt)
			SET t.bMargin5_d1 = d1.bMargin5_d1; 

		IF no_more_rows THEN
			CLOSE cursor1;
		LEAVE LOOP1;
		END IF;
	END LOOP LOOP1;
END$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_loan_sma_d1_bMargin10`()
BEGIN
     DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
     DECLARE cursor_fetch_tmp_ids VARCHAR(6);
     DECLARE bMargin10_earlest MEDIUMINT(8); -- variable for the earlest bMargin10
     DECLARE cursor1 CURSOR FOR
     SELECT DISTINCT `ids` FROM `s_loan_sma` ORDER BY `ids`;
     DECLARE CONTINUE HANDLER FOR NOT FOUND
     SET no_more_rows := TRUE;

     OPEN cursor1;
     LOOP1: LOOP
       
          FETCH cursor1 INTO cursor_fetch_tmp_ids;
               
               SELECT
                   bMargin10
               INTO bMargin10_earlest FROM
                   `s_loan_sma`
               WHERE
                   `ids` = cursor_fetch_tmp_ids
               ORDER BY dt
               LIMIT 1;
                               
               SET @bMargin10_lag := bMargin10_earlest;
               UPDATE `ying_calc`.`s_loan_sma` t
                    INNER JOIN
                   (SELECT
                    `dt`,
                        `ids`,
                        ROUND(100 * (cast(bMargin10 as signed) - cast(@bMargin10_lag as signed)) / @bMargin10_lag, 2) AS `bMargin10_d1`,
                        @bMargin10_lag:=bMargin10
                   FROM
                    `ying_calc`.`s_loan_sma`
                   WHERE
                    `ids` = cursor_fetch_tmp_ids
                   ORDER BY `dt`) d1 ON (t.ids = d1.ids AND t.dt = d1.dt)
               SET
                   t.bMargin10_d1 = d1.bMargin10_d1; 
   
          IF no_more_rows THEN
               CLOSE cursor1;
               LEAVE LOOP1;
          END IF;
     END LOOP LOOP1;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_loan_sma_d1_bMargin20`()
BEGIN
     DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
     DECLARE cursor_fetch_tmp_ids VARCHAR(6);
     DECLARE bMargin20_earlest MEDIUMINT(8); -- variable for the earlest bMargin20
     DECLARE cursor1 CURSOR FOR
     SELECT DISTINCT `ids` FROM `s_loan_sma` ORDER BY `ids`;
     DECLARE CONTINUE HANDLER FOR NOT FOUND
     SET no_more_rows := TRUE;

     OPEN cursor1;
     LOOP1: LOOP
       
          FETCH cursor1 INTO cursor_fetch_tmp_ids;
               
               SELECT
                   bMargin20
               INTO bMargin20_earlest FROM
                   `s_loan_sma`
               WHERE
                   `ids` = cursor_fetch_tmp_ids
               ORDER BY dt
               LIMIT 1;
                               
               SET @bMargin20_lag := bMargin20_earlest;
               UPDATE `ying_calc`.`s_loan_sma` t
                    INNER JOIN
                   (SELECT
                    `dt`,
                        `ids`,
                        ROUND(100 * (cast(bMargin20 as signed) - cast(@bMargin20_lag as signed)) / @bMargin20_lag, 2) AS `bMargin20_d1`,
                        @bMargin20_lag:=bMargin20
                   FROM
                    `ying_calc`.`s_loan_sma`
                   WHERE
                    `ids` = cursor_fetch_tmp_ids
                   ORDER BY `dt`) d1 ON (t.ids = d1.ids AND t.dt = d1.dt)
               SET
                   t.bMargin20_d1 = d1.bMargin20_d1; 
   
          IF no_more_rows THEN
               CLOSE cursor1;
               LEAVE LOOP1;
          END IF;
     END LOOP LOOP1;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_loan_sma_d1_bMargin30`()
BEGIN
     DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
     DECLARE cursor_fetch_tmp_ids VARCHAR(6);
     DECLARE bMargin30_earlest MEDIUMINT(8); -- variable for the earlest bMargin30
     DECLARE cursor1 CURSOR FOR
     SELECT DISTINCT `ids` FROM `s_loan_sma` ORDER BY `ids`;
     DECLARE CONTINUE HANDLER FOR NOT FOUND
     SET no_more_rows := TRUE;

     OPEN cursor1;
     LOOP1: LOOP
       
          FETCH cursor1 INTO cursor_fetch_tmp_ids;
               
               SELECT
                   bMargin30
               INTO bMargin30_earlest FROM
                   `s_loan_sma`
               WHERE
                   `ids` = cursor_fetch_tmp_ids
               ORDER BY dt
               LIMIT 1;
                               
               SET @bMargin30_lag := bMargin30_earlest;
               UPDATE `ying_calc`.`s_loan_sma` t
                    INNER JOIN
                   (SELECT
                    `dt`,
                        `ids`,
                        ROUND(100 * (cast(bMargin30 as signed) - cast(@bMargin30_lag as signed)) / @bMargin30_lag, 2) AS `bMargin30_d1`,
                        @bMargin30_lag:=bMargin30
                   FROM
                    `ying_calc`.`s_loan_sma`
                   WHERE
                    `ids` = cursor_fetch_tmp_ids
                   ORDER BY `dt`) d1 ON (t.ids = d1.ids AND t.dt = d1.dt)
               SET
                   t.bMargin30_d1 = d1.bMargin30_d1; 
   
          IF no_more_rows THEN
               CLOSE cursor1;
               LEAVE LOOP1;
          END IF;
     END LOOP LOOP1;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_loan_sma_d1_bMargin60`()
BEGIN
     DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
     DECLARE cursor_fetch_tmp_ids VARCHAR(6);
     DECLARE bMargin60_earlest MEDIUMINT(8); -- variable for the earlest bMargin60
     DECLARE cursor1 CURSOR FOR
     SELECT DISTINCT `ids` FROM `s_loan_sma` ORDER BY `ids`;
     DECLARE CONTINUE HANDLER FOR NOT FOUND
     SET no_more_rows := TRUE;

     OPEN cursor1;
     LOOP1: LOOP
       
          FETCH cursor1 INTO cursor_fetch_tmp_ids;
               
               SELECT
                   bMargin60
               INTO bMargin60_earlest FROM
                   `s_loan_sma`
               WHERE
                   `ids` = cursor_fetch_tmp_ids
               ORDER BY dt
               LIMIT 1;
                               
               SET @bMargin60_lag := bMargin60_earlest;
               UPDATE `ying_calc`.`s_loan_sma` t
                    INNER JOIN
                   (SELECT
                    `dt`,
                        `ids`,
                        ROUND(100 * (cast(bMargin60 as signed) - cast(@bMargin60_lag as signed)) / @bMargin60_lag, 2) AS `bMargin60_d1`,
                        @bMargin60_lag:=bMargin60
                   FROM
                    `ying_calc`.`s_loan_sma`
                   WHERE
                    `ids` = cursor_fetch_tmp_ids
                   ORDER BY `dt`) d1 ON (t.ids = d1.ids AND t.dt = d1.dt)
               SET
                   t.bMargin60_d1 = d1.bMargin60_d1; 
   
          IF no_more_rows THEN
               CLOSE cursor1;
               LEAVE LOOP1;
          END IF;
     END LOOP LOOP1;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `ying_calc`.`s_loan_sma_d1_bMargin120`()
BEGIN
	DECLARE no_more_rows BOOLEAN DEFAULT FALSE;
	DECLARE cursor_fetch_tmp_ids VARCHAR(6);
	DECLARE bMargin120_earlest MEDIUMINT(8); -- variable for the earlest bMargin120
	DECLARE cursor1 CURSOR FOR
	SELECT DISTINCT `ids` FROM `s_loan_sma` ORDER BY `ids`;
	DECLARE CONTINUE HANDLER FOR NOT FOUND
	SET no_more_rows := TRUE;

	OPEN cursor1;
	LOOP1: LOOP
       
		FETCH cursor1 INTO cursor_fetch_tmp_ids;
               
		SELECT
                   bMargin120
		INTO bMargin120_earlest FROM
                   `s_loan_sma`
		WHERE
                   `ids` = cursor_fetch_tmp_ids
		ORDER BY dt
		LIMIT 1;
			       
		SET @bMargin120_lag := bMargin120_earlest;
		UPDATE `ying_calc`.`s_loan_sma` t
		    INNER JOIN
		   (SELECT
		    `dt`,
			`ids`,
			ROUND(100 * (cast(bMargin120 as signed) - cast(@bMargin120_lag as signed)) / @bMargin120_lag, 2) AS `bMargin120_d1`,
			@bMargin120_lag:=bMargin120
		   FROM
		    `ying_calc`.`s_loan_sma`
		   WHERE
		    `ids` = cursor_fetch_tmp_ids
		   ORDER BY `dt`) d1 ON (t.ids = d1.ids AND t.dt = d1.dt)
		SET
		   t.bMargin120_d1 = d1.bMargin120_d1; 

		IF no_more_rows THEN
			CLOSE cursor1;
			LEAVE LOOP1;
		END IF;
	END LOOP LOOP1;
END$$
DELIMITER ;
