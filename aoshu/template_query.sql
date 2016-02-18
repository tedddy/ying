SELECT * FROM `aoshu`.`question` order by id;
SELECT * FROM `aoshu`.`question` order by id desc;
SELECT * FROM `aoshu`.`question` order by id desc limit 1;


insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('nte',1,0,'','','','','','','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('nte',2,0,'','','','','','','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('nte',3,0,'','','','','','','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('nte',4,0,'','','','','','','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('nte',5,0,'','','','','','','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('nte',6,0,'','','','','','','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('nte',7,0,'','','','','','','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('nte',8,0,'','','','','','','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('nte',9,0,'','','','','','','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('nte',10,0,'','','','','','','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('nte',11,0,'','','','','','','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('nte',12,0,'','','','','','','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('nte',13,0,'','','','','','','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('nte',14,0,'','','','','','','6') ;


-- update `aoshu`.`cat2` join `aoshu`.`cat` on `aoshu`.`cat2`.`idcat` = `aoshu`.`cat`.`id` set `aoshu`.`cat2`.`namecat` = `cat`.`name`;

-- UPDATE `aoshu`.`hbs_repeat` r
--         JOIN
--     `aoshu`.`question` q ON (r.test1 = q.nametest AND r.seq1 = q.seq) 
-- SET 
--     r.idquestion1 = q.id,
--     r.namecat = q.namecat,
--     r.namecat2 = q.namecat2,
--     r.tag1 = q.tag1,
--     r.tag2 = q.tag2,
--     r.tag3 = q.tag3;
-- 
