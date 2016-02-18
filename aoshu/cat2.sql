CREATE TABLE `aoshu`.`cat2` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(28) NOT NULL,
  `idcat` tinyint(1) NOT NULL,
  `namecat` varchar(28) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- update `aoshu`.`cat2` set faoshu = 1 where;

-- update `aoshu`.`cat2` set idcat2 = id;

SELECT * FROM `aoshu`.`cat2` order by id;
SELECT * FROM `aoshu`.`cat2` order by idcat, id;
SELECT count(id) FROM `aoshu`.`cat2`;

-- update `aoshu`.`cat2` set `aoshu`.`cat2`.`idcat2` = `aoshu`.`cat2`.`id`;
-- update `aoshu`.`cat2` set `aoshu`.`cat2`.`idcat2` = `aoshu`.`cat2`.`idcat2` - 4 where `aoshu`.`cat2`.`idcat2`>31;

-- update `aoshu`.`cat2` join `aoshu`.`cat` on `aoshu`.`cat2`.`idcat` = `aoshu`.`cat`.`id` set `aoshu`.`cat2`.`namecat` = `cat`.`name`;

select * from cat2 where idcat = 1;

SELECT * FROM `aoshu`.`cat2` order by idcat, id;

SELECT * FROM `aoshu`.`cat2` where idcat = '3' order by id;

insert into `aoshu`.`cat2` (name, idcat) values ('多人行程',1);
insert into `aoshu`.`cat2` (name, idcat) values ('二次相遇',1);
insert into `aoshu`.`cat2` (name, idcat) values ('多次相遇',1);
insert into `aoshu`.`cat2` (name, idcat) values ('火车过桥',1);
insert into `aoshu`.`cat2` (name, idcat) values ('流水行船',1);
insert into `aoshu`.`cat2` (name, idcat) values ('环形跑道',1);
insert into `aoshu`.`cat2` (name, idcat) values ('简单相遇',1);
insert into `aoshu`.`cat2` (name, idcat) values ('基本行程问题',1);
insert into `aoshu`.`cat2` (name, idcat) values ('钟面行程',1);
insert into `aoshu`.`cat2` (name, idcat) values ('走走停停',1);
insert into `aoshu`.`cat2` (name, idcat) values ('接送问题',1);
insert into `aoshu`.`cat2` (name, idcat) values ('发车问题',1);
insert into `aoshu`.`cat2` (name, idcat) values ('电梯行程',1);
insert into `aoshu`.`cat2` (name, idcat) values ('猎狗追兔',1);
insert into `aoshu`.`cat2` (name, idcat) values ('平均速度',1);


insert into `aoshu`.`cat2` (name, idcat) values ('数的整除',2);
insert into `aoshu`.`cat2` (name, idcat) values ('约数倍数',2);
insert into `aoshu`.`cat2` (name, idcat) values ('余数问题',2);
insert into `aoshu`.`cat2` (name, idcat) values ('质数合数',2);
insert into `aoshu`.`cat2` (name, idcat) values ('奇偶分析',2);
insert into `aoshu`.`cat2` (name, idcat) values ('中国剩余定理',2);
insert into `aoshu`.`cat2` (name, idcat) values ('位值原理',2);
insert into `aoshu`.`cat2` (name, idcat) values ('完全平方数',2);
insert into `aoshu`.`cat2` (name, idcat) values ('整数拆分',2);
insert into `aoshu`.`cat2` (name, idcat) values ('进位制',2);

insert into `aoshu`.`cat2` (name, idcat) values ('巧求周长',3);
insert into `aoshu`.`cat2` (name, idcat) values ('五大模型-等积变换',3);
insert into `aoshu`.`cat2` (name, idcat) values ('五大模型-共角定理',3);
insert into `aoshu`.`cat2` (name, idcat) values ('五大模型-蝴蝶定理',3);
insert into `aoshu`.`cat2` (name, idcat) values ('五大模型-相似三角形',3);
insert into `aoshu`.`cat2` (name, idcat) values ('五大模型-燕尾定理',3);
insert into `aoshu`.`cat2` (name, idcat) values ('勾股定理与弦图',3);
insert into `aoshu`.`cat2` (name, idcat) values ('圆与扇形',3);
insert into `aoshu`.`cat2` (name, idcat) values ('立体图形的表面积和体积',3);
insert into `aoshu`.`cat2` (name, idcat) values ('立体图形染色计数',3);
insert into `aoshu`.`cat2` (name, idcat) values ('其它直线型几何问题',3);
insert into `aoshu`.`cat2` (name, idcat) values ('格点与面积',3);
insert into `aoshu`.`cat2` (name, idcat) values ('平面图形面积',3);

insert into `aoshu`.`cat2` (name, idcat) values ('加法原理',4);
insert into `aoshu`.`cat2` (name, idcat) values ('乘法原理',4);
insert into `aoshu`.`cat2` (name, idcat) values ('排列组合',4);
insert into `aoshu`.`cat2` (name, idcat) values ('枚举法',4);
insert into `aoshu`.`cat2` (name, idcat) values ('标数法',4);
insert into `aoshu`.`cat2` (name, idcat) values ('捆绑法',4);
insert into `aoshu`.`cat2` (name, idcat) values ('插板法',4);
insert into `aoshu`.`cat2` (name, idcat) values ('排除法',4);
insert into `aoshu`.`cat2` (name, idcat) values ('对应法',4);
insert into `aoshu`.`cat2` (name, idcat) values ('树形图法',4);
insert into `aoshu`.`cat2` (name, idcat) values ('归纳法',4);
insert into `aoshu`.`cat2` (name, idcat) values ('整体法',4);
insert into `aoshu`.`cat2` (name, idcat) values ('递推法',4);
insert into `aoshu`.`cat2` (name, idcat) values ('容斥原理',4);
insert into `aoshu`.`cat2` (name, idcat) values ('几何图形计数',4);

insert into `aoshu`.`cat2` (name, idcat) values ('分数百分数应用题',5);
insert into `aoshu`.`cat2` (name, idcat) values ('工程问题',5);
insert into `aoshu`.`cat2` (name, idcat) values ('鸡兔同笼问题',5);
insert into `aoshu`.`cat2` (name, idcat) values ('盈亏问题',5);
insert into `aoshu`.`cat2` (name, idcat) values ('年龄问题',5);
insert into `aoshu`.`cat2` (name, idcat) values ('植树问题',5);
insert into `aoshu`.`cat2` (name, idcat) values ('牛吃草问题',5);
insert into `aoshu`.`cat2` (name, idcat) values ('经济利润问题',5);
insert into `aoshu`.`cat2` (name, idcat) values ('浓度问题',5);
insert into `aoshu`.`cat2` (name, idcat) values ('比例问题',5);
insert into `aoshu`.`cat2` (name, idcat) values ('还原问题',5);
insert into `aoshu`.`cat2` (name, idcat) values ('列方程解应用题',5);

insert into `aoshu`.`cat2` (name, idcat) values ('数学计算公式',6);
insert into `aoshu`.`cat2` (name, idcat) values ('繁分数的计算',6);
insert into `aoshu`.`cat2` (name, idcat) values ('分数裂项与整数裂项',6);
insert into `aoshu`.`cat2` (name, idcat) values ('换元法',6);
insert into `aoshu`.`cat2` (name, idcat) values ('凑整',6);
insert into `aoshu`.`cat2` (name, idcat) values ('找规律',6);
insert into `aoshu`.`cat2` (name, idcat) values ('比较与估算',6);
insert into `aoshu`.`cat2` (name, idcat) values ('循环小数化分数',6);
insert into `aoshu`.`cat2` (name, idcat) values ('拆分',6);
insert into `aoshu`.`cat2` (name, idcat) values ('通项归纳',6);
insert into `aoshu`.`cat2` (name, idcat) values ('定义新运算',6);

insert into `aoshu`.`cat2` (name, idcat) values ('逻辑推理',7);
insert into `aoshu`.`cat2` (name, idcat) values ('数阵图与数字谜',7);
insert into `aoshu`.`cat2` (name, idcat) values ('抽屉原理',7);
insert into `aoshu`.`cat2` (name, idcat) values ('操作与策略',7);
insert into `aoshu`.`cat2` (name, idcat) values ('不定方程',7);
insert into `aoshu`.`cat2` (name, idcat) values ('最值问题',7);
insert into `aoshu`.`cat2` (name, idcat) values ('染色问题',7);
