CREATE TABLE `aoshu`.`cat` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(28) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT * FROM aoshu.cat order by id;

insert into `aoshu`.`cat` (name) values ('行程问题');
insert into `aoshu`.`cat` (name) values ('数论问题');
insert into `aoshu`.`cat` (name) values ('几何问题');
insert into `aoshu`.`cat` (name) values ('计数问题');
insert into `aoshu`.`cat` (name) values ('应用题');
insert into `aoshu`.`cat` (name) values ('计算问题');
insert into `aoshu`.`cat` (name) values ('奥数杂题');

insert into `aoshu`.`cat` (name) values ('');
