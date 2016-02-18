
DROP PROCEDURE `hs_s_CorpInfo`;
DELIMITER $$
CREATE DEFINER=`gxh`@`%` PROCEDURE `hs_s_CorpInfo`(IN code VARCHAR(18), pDate date)
BEGIN
SET code = IF(code = '', NULL, code);
SET pDate = pDate;

INSERT INTO `hs_s` (`code`, `pDate`) VALUES (code, pDate)
ON DUPLICATE KEY UPDate
`pDate` = pDate;
END$$
DELIMITER ;

CALL hs_s_CorpInfo('[标签:code]','[标签:pDate]')