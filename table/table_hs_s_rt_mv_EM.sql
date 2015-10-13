-- Insert code TimeSlot from `ying`.`hs_s_rt_EM` to `ying`.`hs_s_rt_mv_EM`
	INSERT INTO `ying`.`hs_s_rt_mv_EM` (`code`, `TimeSlot`) SELECT `code`, TimeSlot FROM `ying`.`hs_s_rt_EM` 
				WHERE DATE(TimeSlot) = CURDATE();
	SELECT `code`, TimeSlot FROM `ying`.`hs_s_rt_EM` WHERE DATE(TimeSlot) = CURDATE();

-- DROP TABLE `ying`.`hs_s_rt_mv_EM`;
CREATE TABLE `hs_s_rt_mv_EM` (
  `code` VARCHAR(6) NOT NULL COMMENT 'code',
  `TimeSlot` DATETIME NOT NULL,
  `m5c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 5 periods均线',
  `m10c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 10 periods均线',
  `m20c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 20 periods均线',
  `m30c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 30 periods均线',
  `m60c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 60 periods均线',
  `m120c` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'close 120 periods均线',
  `m5v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 5 periods均线',
  `m10v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 10 periods均线',
  `m20v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 20 periods均线',
  `m30v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 30 periods均线',
  `m60v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 60 periods均线',
  `m120v` INT(10) UNSIGNED DEFAULT NULL COMMENT 'volume 120 periods均线',
  `m5a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 5 periods均线',
  `m10a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 10 periods均线',
  `m20a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 20 periods均线',
  `m30a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 30 periods均线',
  `m60a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 60 periods均线',
  `m120a` INT(10) UNSIGNED DEFAULT NULL COMMENT 'amount 120 periods均线',
  `m5wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 5 periods均线',
  `m10wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 10 periods均线',
  `m20wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 20 periods均线',
  `m30wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 30 periods均线',
  `m60wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 60 periods均线',
  `m120wb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'WeiBi 120 periods均线',
  `m5lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 5 periods均线',
  `m10lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 10 periods均线',
  `m20lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 20 periods均线',
  `m30lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 30 periods均线',
  `m60lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 60 periods均线',
  `m120lb` DECIMAL(6,2) UNSIGNED DEFAULT NULL COMMENT 'LiangBi 120 periods均线',
  PRIMARY KEY (`code`,`TimeSlot`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;
