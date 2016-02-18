-- database ying log 150831

ALTER TABLE `ying`.`hs_s`
ADD COLUMN `fMKT` TINYINT(1) NULL DEFAULT '1' COMMENT '1: sh;2: sz' AFTER `fSH`;
-- 2015-08-31 8:43 增加一列

ALTER TABLE `ying`.`hs_s_trade_EM_PageNo`
DROP INDEX `KeyName` ,
ADD UNIQUE INDEX `KeyName` (`code` ASC, `page_no` ASC, `time` ASC, `DateSys` ASC)  COMMENT ''; -- 2015-08-31 10:00 

ALTER TABLE `ying`.`hs_s_hs300_rt_EM`
ADD COLUMN `datetime` DATETIME NULL DEFAULT NULL COMMENT '' AFTER `TimeSlot`; -- 2015-08-31 22:18

-- trigger
CREATE DEFINER=`gxh`@`%` TRIGGER `ying`.`hs300_s_data_BEFORE_INSERT`
BEFORE INSERT ON `ying`.`hs300_s_data`
FOR EACH ROW
SET NEW.volume = NEW.volume * 100 -- 2015-08-31 23:03
