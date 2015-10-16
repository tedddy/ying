-- Insert ids dt from `ying`.`hs_s_rt_EM` to `ying`.`s_rt_sma`
	INSERT INTO `ying`.`s_rt_sma` (`ids`, `dt`) SELECT `ids`, dt FROM `ying`.`s_rt` 
				WHERE DATE(dt) = CURDATE();
	SELECT `ids`, dt FROM `ying`.`s_rt` WHERE DATE(dt) = CURDATE();

-- DROP TABLE `ying`.`s_rt_sma`;
CREATE TABLE `s_rt_sma` (
  `dt` DATETIME NOT NULL,
  `ids` VARCHAR(6) NOT NULL COMMENT 'ids',
  `sma5c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 5 periods均线',
  `sma10c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 10 periods均线',
  `sma20c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 20 periods均线',
  `sma30c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 30 periods均线',
  `sma60c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 60 periods均线',
  `sma120c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 120 periods均线',
  `sma5v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 5 periods均线',
  `sma10v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 10 periods均线',
  `sma20v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 20 periods均线',
  `sma30v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 30 periods均线',
  `sma60v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 60 periods均线',
  `sma120v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 120 periods均线',
  `sma5a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 5 periods均线',
  `sma10a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 10 periods均线',
  `sma20a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 20 periods均线',
  `sma30a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 30 periods均线',
  `sma60a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 60 periods均线',
  `sma120a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 120 periods均线',
  `sma5wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 5 periods均线',
  `sma10wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 10 periods均线',
  `sma20wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 20 periods均线',
  `sma30wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 30 periods均线',
  `sma60wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 60 periods均线',
  `sma120wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 120 periods均线',
  `sma5lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 5 periods均线',
  `sma10lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 10 periods均线',
  `sma20lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 20 periods均线',
  `sma30lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 30 periods均线',
  `sma60lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 60 periods均线',
  `sma120lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 120 periods均线',
  PRIMARY KEY (`ids`,`dt`),
  INDEX `dt` (`dt` DESC)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;