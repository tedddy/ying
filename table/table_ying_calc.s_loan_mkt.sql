SELECT * FROM `ying_calc`.`s_loan_mkt`;

CREATE TABLE `s_loan_mkt` (
  `mkt` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'mkt',
  `dt` date NOT NULL DEFAULT '0000-00-00' COMMENT 'date',
  `sSell` int(9) unsigned DEFAULT NULL COMMENT 'sSell',
  `bStock` int(11) unsigned DEFAULT NULL COMMENT 'bStock',
  `mBuy` bigint(11) unsigned DEFAULT NULL COMMENT 'mBuy',
  `bMargin` bigint(12) unsigned DEFAULT NULL COMMENT 'bMargin',
  PRIMARY KEY (`mkt`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

update `ying_calc`.`s_loan_mkt` set `sSell` = round( (`sSell` / 100), 0 );
update `ying_calc`.`s_loan_mkt` set `bStock` = round( (`bStock` / 100), 0 );

update `ying_calc`.`s_loan_mkt` set `mBuy` = round( (`mBuy` / 10000), 0 );
update `ying_calc`.`s_loan_mkt` set `bMargin` = round( (`bMargin` / 10000), 0 );