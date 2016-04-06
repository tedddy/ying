-- DROP TABLE `ying_calc`.`s_loan`;
CREATE TABLE `ying_calc`.`s_loan` (
  `ids` varchar(6) NOT NULL COMMENT 'code',
  `mkt` tinyint(1) unsigned NOT NULL COMMENT 'fMKT: 1 means SH; 2 means sz',
  `name` varchar(18) DEFAULT NULL COMMENT 'name',
  `dt` date NOT NULL COMMENT 'date',
  `sCover` int(8) unsigned DEFAULT NULL COMMENT 'sCover',
  `sSell` int(8) unsigned DEFAULT NULL COMMENT 'sSell',
  `bStock` int(9) unsigned DEFAULT NULL COMMENT 'bStock',
  `mCover` bigint(11) unsigned DEFAULT NULL COMMENT 'mCover',
  `mBuy` bigint(11) unsigned DEFAULT NULL COMMENT 'mBuy',
  `bMargin` bigint(12) unsigned DEFAULT NULL COMMENT 'bMargin',
  PRIMARY KEY (`ids`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- update `ying_calc`.`s_loan` set `sCover` = round( (`sCover` / 100), 0 );
-- update `ying_calc`.`s_loan` set `sSell` = round( (`sSell` / 100), 0 );
-- update `ying_calc`.`s_loan` set `bStock` = round( (`bStock` / 100), 0 );
-- 
-- update `ying_calc`.`s_loan` set `mCover` = round( (`mCover` / 10000), 0 );
-- update `ying_calc`.`s_loan` set `mBuy` = round( (`mBuy` / 10000), 0 );
-- update `ying_calc`.`s_loan` set `bMargin` = round( (`bMargin` / 10000), 0 );
-- 