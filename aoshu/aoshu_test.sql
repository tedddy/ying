use aoshu;

-- DROP TABLE `aoshu`.`test`;

CREATE TABLE `aoshu`.`test` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `jie` tinyint(2) unsigned NOT NULL,
  `juan` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jie_juan_unique` (`jie`,`juan`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

SELECT * FROM aoshu.test order by id;

INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (20, 'a');
INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (20, 'b');
INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (20, 'c');
INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (20, 'd');

INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (19, 'a');
INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (19, 'b');
INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (19, 'c');
INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (19, 'd');

INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (18, 'a');
INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (18, 'b');
INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (18, 'c');

INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (17, 'a');
INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (17, 'b');
INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (17, 'c');
INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (17, 'd');

INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (16, 'a');
INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (16, 'b');
INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (16, 'c');
INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (16, 'd');
INSERT INTO `aoshu`.`test` (`jie`,`juan`) VALUES (16, 'e');