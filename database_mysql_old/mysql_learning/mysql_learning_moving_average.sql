
-- 
DROP TABLE  IF EXISTS  tt ;
CREATE TABLE tt(tid  INT  PRIMARY KEY  NOT NULL ,tnum INT ,dt DATE) ;

DROP PROCEDURE  IF EXISTS  sp_tt ;

delimiter $$
CREATE PROCEDURE sp_tt()
BEGIN
SET @1=0 ;

WHILE  @1<100 DO

INSERT INTO tt VALUES(@1,@1+100 ,DATE_ADD(NOW(),INTERVAL @1 DAY)) ;
SET @1=@1+1 ;
END  WHILE;
END  ;
$$ delimiter  ;


CALL  sp_tt() ;

SELECT tid ,
(SELECT AVG(tnum) FROM  tt a WHERE a.dt > DATE_ADD(b.dt,INTERVAL -5 DAY) AND  a.dt<= b.dt) dd,
dt
FROM  tt b