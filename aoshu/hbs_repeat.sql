use aoshu;

-- drop table `aoshu`.`hbs_repeat`;
CREATE TABLE `aoshu`.`hbs_repeat` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `jie` tinyint(2) NOT NULL,
  `seq1` tinyint(2) NOT NULL,
  `seq2` tinyint(2) NOT NULL,
  `idquestion1` tinyint(1) NOT NULL,
  `idquestion2` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `aoshu`.`hbs_repeat` 
CHANGE COLUMN `idquestion1` `idquestion1` TINYINT(1) NULL ,
CHANGE COLUMN `idquestion2` `idquestion2` TINYINT(1) NULL ,
ADD COLUMN `seq1` TINYINT(2) NULL AFTER `jie`,
ADD COLUMN `seq2` TINYINT(2) NULL AFTER `seq1`;


SELECT * FROM `aoshu`.`hbs_repeat` order by id;

SELECT * FROM `aoshu`.`hbs_repeat` where id > 19 order by id;

update `aoshu`.`hbs_repeat` r join `aoshu`.`question` q on (r.test2 = q.nametest and r.seq2 = q.seq) set r.idquestion2=q.id;

UPDATE `aoshu`.`hbs_repeat` r
        JOIN
    `aoshu`.`question` q ON (r.test1 = q.nametest AND r.seq1 = q.seq) 
SET 
    r.idquestion1 = q.id,
    r.namecat = q.namecat,
    r.namecat2 = q.namecat2,
    r.tag1 = q.tag1,
    r.tag2 = q.tag2,
    r.tag3 = q.tag3;


INSERT INTO `aoshu`.`hbs_repeat` (`test1`, `seq1`, `test2`, `seq2`) VALUES ('19a', '2', '19b', '2');
INSERT INTO `aoshu`.`hbs_repeat` (`test1`, `seq1`, `test2`, `seq2`) VALUES ('19a', '3', '19b', '3');
INSERT INTO `aoshu`.`hbs_repeat` (`test1`, `seq1`, `test2`, `seq2`) VALUES ('19a', '4', '19b', '4');
INSERT INTO `aoshu`.`hbs_repeat` (`test1`, `seq1`, `test2`, `seq2`) VALUES ('19a', '5', '19b', '5');
INSERT INTO `aoshu`.`hbs_repeat` (`test1`, `seq1`, `test2`, `seq2`) VALUES ('19a', '6', '19b', '6');
INSERT INTO `aoshu`.`hbs_repeat` (`test1`, `seq1`, `test2`, `seq2`) VALUES ('19a', '7', '19b', '7');
INSERT INTO `aoshu`.`hbs_repeat` (`test1`, `seq1`, `test2`, `seq2`) VALUES ('19a', '8', '19b', '8');
INSERT INTO `aoshu`.`hbs_repeat` (`test1`, `seq1`, `test2`, `seq2`) VALUES ('19a', '9', '19b', '9');
INSERT INTO `aoshu`.`hbs_repeat` (`test1`, `seq1`, `test2`, `seq2`) VALUES ('19a', '10', '19b', '10');
INSERT INTO `aoshu`.`hbs_repeat` (`test1`, `seq1`, `test2`, `seq2`) VALUES ('19a', '11', '19b', '11');
INSERT INTO `aoshu`.`hbs_repeat` (`test1`, `seq1`, `test2`, `seq2`) VALUES ('19a', '12', '19b', '12');

