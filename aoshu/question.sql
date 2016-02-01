-- drop table `aoshu`.`question`;
CREATE TABLE `aoshu`.`question` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `seq` tinyint(2) NOT NULL,
  `rank` tinyint(1) DEFAULT NULL,
  `nametest` varchar(18) NOT NULL,
  `namecat` varchar(28) NOT NULL,
  `namecat2` varchar(28) NOT NULL,
  `tag1` varchar(28) DEFAULT NULL,
  `tag2` varchar(28) DEFAULT NULL,
  `tag3` varchar(28) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_test_seq` (`seq`,`nametest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


SELECT * FROM `aoshu`.`question` order by id;
SELECT * FROM `aoshu`.`question` order by id desc;
SELECT * FROM `aoshu`.`question` order by id desc limit 1;


SELECT * FROM `aoshu`.`question` where namecat = '' order by id desc;


update `aoshu`.`question` join `aoshu`.`cat2` on `aoshu`.`question`.`namecat2` = `aoshu`.`cat2`.`name` set `aoshu`.`question`.`namecat` = `aoshu`.`cat2`.`namecat`;

UPDATE `aoshu`.`question` q
        JOIN
    `aoshu`.`hbs_repeat` r ON (r.test2 = q.nametest AND r.seq2 = q.seq) 
SET 
    q.namecat = r.namecat,
    q.namecat2 = r.namecat2,
    q.tag1 = r.tag1,
    q.tag2 = r.tag2,
    q.tag3 = r.tag3;

SELECT * FROM aoshu.cat order by id;

SELECT * FROM `aoshu`.`question` where namecat = '数论' order by id;

select namecat2, count(id) from `aoshu`.`question` group by namecat2;

select namecat, count(id) from `aoshu`.`question` group by namecat order by count(id) desc;

select namecat, namecat2, count(id) from `aoshu`.`question` group by namecat, namecat2 order by count(id) desc;

-- templat
        -- insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20a',1,2,'计算问题','数学计算公式','tag1','','') ON DUPLICATE KEY UPDATE `tag1` = 'tag1' ;
        update `aoshu`.`question` set `tag1` = NULL where `tag1` = '';
        INSERT INTO `aoshu`.`hbs_repeat` (`jie`,`idquestion1`, `idquestion2`) VALUES (20,'5', '20');

insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5116',1,0,'73','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5116',2,0,'20','24','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5116',3,0,'77','17','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5116',4,0,'60','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5116',5,0,'33','99','扫过的面积','','','5','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5116',6,0,'57','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5116',7,0,'最值问题','通项归纳','','','','5','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5116',8,0,'61','','平方和公式','','','3','9') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5116',9,0,'27','99','','','','5','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5116',10,0,'60','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5116',11,0,'余数问题','23','','','','5','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5116',12,0,'位值原理','约数倍数','书写','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5116',13,0,'多次相遇','','最小公倍数','','','5','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5116',14,0,'抽屉原理','','书写','','','3','6') ;
        
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5115',1,0,'找规律','','平方差公式','','','5','7') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5115',2,0,'逻辑推理','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5115',3,0,'通项归纳','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5115',4,0,'巧求周长','','正六边形','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5115',5,0,'通项归纳','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5115',6,0,'五大模型','平面图形面积','比例模型','','','5','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5115',7,0,'二次相遇','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5115',8,0,'年龄问题','日期计算','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5115',9,0,'不定方程','奇偶分析','质数','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5115',10,0,'枚举法','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5115',11,0,'定义新运算','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5115',12,0,'不定方程','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5115',13,0,'多人行程','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5115',14,0,'走走停停','','','','','5','7') ;

        
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5114',1,0,'','几何图形计数','格点与面积','理解题意','不重不漏','','5','7') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5114',2,0,'','几何图形计数','操作与策略','长方体','','','3','9') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5114',3,0,'','位置原理','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5114',4,0,'','工程问题','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5114',5,0,'','枚举法','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5114',6,0,'','余数问题','约数倍数','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5114',7,0,'','数的整除','','不重不漏','','','5','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5114',8,0,'','列方程解应用题','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5114',9,0,'','列方程解应用题','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5114',10,0,'','染色问题','正方体','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5114',11,0,'','牛吃草问题','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5114',12,0,'','不定方程','约数倍数','','','','5','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5114',13,0,'','列方程解应用题','','','','','3','6') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`namecat22`,`tag1`,`tag2`,`tag3`,`ft`,`fp`) values ('c5114',14,0,'','二次相遇','三倍','','','','3','6') ;

insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18c',1,0,'','找规律','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18c',2,0,'奥数杂题','日期计算','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18c',3,0,'','最值问题','分类讨论','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18c',4,0,'','平面图形的面积','辅助线','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18c',5,0,'','位置原理','方程','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18c',6,0,'','立体图形的表面积和体积','正方体','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18c',7,0,'','枚举法','循环小数化分数','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18c',8,0,'','数字谜','汉字短语','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18c',9,0,'','几何图形面积','正方形','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18c',10,0,'','列方程解应用题','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18c',11,0,'','约数倍数','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18c',12,0,'','枚举法','竞赛','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18c',13,0,'','最值问题','平面图形面积','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18c',14,0,'','排列组合','','','') ;


insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18b',1,0,'','找规律','凑整','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18b',2,0,'奥数杂题','日期计算','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18b',3,0,'','数的整除','分数计算','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18b',4,0,'','平面图形的面积','辅助线','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18b',5,0,'','余数问题','暴力枚举','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18b',6,0,'','立体图形的表面积和体积','正方体','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18b',7,0,'','二次相遇','变速问题','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18b',8,0,'','数字谜','汉字短语','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18b',9,0,'','几何图形计数','长方形','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18b',10,0,'','平面图形面积','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18b',11,0,'','植树问题','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18b',12,0,'','几何图形计数','正方体','理解题意','骰子') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18b',13,0,'','几何图形计数','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18b',14,0,'','排列组合','','','') ;


insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18a',1,0,'','找规律','凑整','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18a',2,0,'奥数杂题','日期计算','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18a',3,0,'','数的整除','分数计算','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18a',4,0,'','勾股定理与弦图','平面图形的面积','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18a',5,0,'','余数问题','暴力枚举','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18a',6,0,'','立体图形的表面积和体积','正方体','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18a',7,0,'','约数倍数','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18a',8,0,'','几何图形计数','正方体','理解题意','骰子') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18a',9,0,'','找规律','算24','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18a',10,0,'','年龄问题','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18a',11,0,'','流水行船','走走停停','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18a',12,0,'','数阵图与数字谜','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18a',13,0,'','几何图形计数','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('18a',14,0,'','约数倍数','方程','','') ;

insert into `aoshu`.`question` (`nameTest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19c',1,0,'计算问题','繁分数的计算','','','') ;
insert into `aoshu`.`question` (`nameTest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19c',2,0,'','数字谜','','','') ;
insert into `aoshu`.`question` (`nameTest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19c',3,0,'','五大模型','比例模型','辅助线','平面图形的面积') ;
insert into `aoshu`.`question` (`nameTest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19c',4,0,'','其它直线型几何问题','理解题意','','') ;
insert into `aoshu`.`question` (`nameTest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19c',5,0,'最值问题','比较与估算','构造','','') ;
insert into `aoshu`.`question` (`nameTest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19c',6,0,'','工程问题','方程','理解题意','') ;
insert into `aoshu`.`question` (`nameTest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19c',7,0,'','几何图形计数','立体图形','俯视图','') ;
insert into `aoshu`.`question` (`nameTest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19c',8,0,'','五大模型','比例模型','平面图形的面积','') ;
insert into `aoshu`.`question` (`nameTest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19c',9,0,'','最值问题','分类讨论','','') ;
insert into `aoshu`.`question` (`nameTest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19c',10,0,'','找规律','最简分数','通项归纳','') ;
insert into `aoshu`.`question` (`nameTest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19c',11,0,'','几何图形计数','','','') ;
insert into `aoshu`.`question` (`nameTest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19c',12,0,'','完全平方数','','','') ;
insert into `aoshu`.`question` (`nameTest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19c',13,0,'','最值问题','排列组合','','') ;
insert into `aoshu`.`question` (`nameTest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19c',14,0,'','染色问题','','','') ;


insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19b',1,0,'几何问题','圆与扇形','题意理解','活动范围','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19b',2,0,'数论','约数倍数','等差数列','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19b',3,0,'计数问题','枚举法','分类讨论','排除法','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19b',4,0,'几何问题','格点与面积','一半模型','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19b',5,0,'数论','约数倍数','积定和最大','不等书','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19b',6,0,'计数问题','容斥原理','不等式','比较与估算','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19b',7,0,'奥数杂题','不定方程','奇偶分析','位值原理','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19b',8,0,'几何问题','勾股定理与弦图','画图','三点共线','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19b',9,0,'计数问题','几何图形计数','操作类问题','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19b',10,0,'应用题','浓度问题','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19b',11,0,'行程问题','变速问题','理解题意','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19b',12,0,'几何问题','五大模型','风筝模型','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19b',13,0,'奥数杂题','最值问题','构造','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19b',14,0,'奥数杂题','数字谜','加法算式','数字和','') ;


insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19a',1,0,'几何问题','圆与扇形','题意理解','活动范围','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19a',2,0,'数论','约数倍数','等差数列','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19a',3,0,'计数问题','枚举法','分类讨论','排除法','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19a',4,0,'几何问题','格点与面积','一半模型','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19a',5,0,'数论','约数倍数','积定和最大','不等书','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19a',6,0,'计数问题','容斥原理','不等式','比较与估算','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19a',7,0,'奥数杂题','不定方程','奇偶分析','位值原理','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19a',8,0,'几何问题','勾股定理与弦图','画图','三点共线','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19a',9,0,'计数问题','几何图形计数','操作类问题','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19a',10,0,'应用题','浓度问题','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19a',11,0,'行程问题','变速问题','理解题意','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19a',12,0,'几何问题','五大模型','风筝模型','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19a',13,0,'奥数杂题','最值问题','构造','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('19a',14,0,'奥数杂题','数字谜','加法算式','数字和','') ;


insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20c',1,0,'计算问题','繁分数的计算','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20c',2,0,'计数','枚举法','方程','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20c',3,0,'数论','位置原理','周期','理解题意','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20c',4,0,'几何问题','五大模型','等积变换','辅助线','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20c',5,0,'几何问题','格点与面积','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20c',6,0,'几何问题','立体图形的表面积体积','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20c',7,0,'计算问题','方程','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20c',8,0,'奥数杂题','数阵图与数字谜','','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20c',9,0,'行程问题','多人行程','相遇','理解题意','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20c',10,0,'计算问题','循环小数化分数','枚举法','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20c',11,0,'计算问题','比较与估算','不定方程','','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20c',12,0,'数论','位值原理','最值问题','比较与估算','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20c',13,0,'几何问题','平面图形面积','一半模型','方程','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20c',14,0,'奥数杂题','最值问题','','','') ;



insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20b',1,1,'计算问题','数学计算公式','分数','提取公因数','') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20b',2,2,'应用题','分数百分数应用题','','','');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20b',3,2,'行程问题','钟面行程','时针与分针角度','','');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20b',4,3,'数论','余数问题','约数倍数','左右对称','上下对称');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20b',5,4,'计数','排列组合','连线','','');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20b',6,3,'数论','位置原理','排列组合','方程','');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20b',7,4,'几何','五大模型-等积变形','方程','比例模型','');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20b',8,5,'计数问题','排列组合','方程','枚举法','分类讨论');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20b',9,4,'数论','完全平方数','数的整除','','');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20b',10,3,'几何','立体图形的表面积和体积','挖','长方体','');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20b',11,4,'行程问题','环形跑道','多次追追及','理解题意','');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20b',12,4,'计数问题','枚举法','体育比赛','乒乓球','');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20b',13,4,'几何','五大模型','蝴蝶模型','比例模型','');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20b',14,5,'数阵图与数字谜','汉字短语','最值问题','','');


        
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20a',1,2,'计算问题','数学计算公式','分数','分配率','结合律') ;
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20a',2,2,'几何问题','巧求周长','六边形','十二边形','图形组合');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20a',3,2,'应用题','工程问题','工作效率','','');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20a',4,4,'行程问题','钟面行程','相遇','左右对称','上下对称');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20a',5,3,'数论','位值原理','排列组合','方程','');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20a',6,2,'几何','立体图形的表面积和体积','挖','长方体','');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20a',7,4,'计数问题','容斥原理','排列组合','最值问题','学科竞赛');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20a',8,3,'计数问题','枚举法','体育比赛','乒乓球','');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20a',9,3,'数论','约数倍数','方程','公倍数','');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20a',10,3,'应用题','经济利润问题','最值问题','','');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20a',11,3,'几何','五大模型-等积变形','一半模型','辅助线','平行线');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20a',12,3,'数论','余数问题','周期','列表','总周期');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20a',13,3,'几何','平面图形面积','风筝模型','鸟头模型','比例模型');
insert into `aoshu`.`question` (`nametest`,`seq`,`rank`,`namecat`,`namecat2`,`tag1`,`tag2`,`tag3`) values ('20a',14,4,'数阵图与数字谜','汉字短语','最值问题','','');

