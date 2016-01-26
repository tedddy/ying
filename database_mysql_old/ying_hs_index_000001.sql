SELECT * FROM ying.hs_index_000001;

SELECT * FROM ying.hs_index_000001 order by date;

SELECT * FROM ying.hs_index_000001 order by date desc;

-- drop id, add auto_increment id
ALTER TABLE `ying`.`hs_index_000001` DROP COLUMN `id`, DROP PRIMARY KEY;

ALTER TABLE `ying`.`hs_index_000001` ADD COLUMN `id` MEDIUMINT(8) NOT NULL AUTO_INCREMENT COMMENT '' AFTER `amount_index`, ADD PRIMARY KEY (`id`);
