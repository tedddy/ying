
-- 当在field `aoshu`.`question`.`namecat2`输入二级分类id后，替换id为名字。
UPDATE `aoshu`.`question`
        JOIN
    `aoshu`.`cat2` ON `aoshu`.`question`.`namecat2` = `aoshu`.`cat2`.`idcat2` -- and `aoshu`.`question`.`id` = 165 
SET 
    `aoshu`.`question`.`namecat2` = `aoshu`.`cat2`.`name`;
    
-- 当在field `aoshu`.`question`.`namecat2`输入二级分类name2（第一个别名）后，替换id为名字。
UPDATE `aoshu`.`question`
        JOIN
    `aoshu`.`cat2` ON `aoshu`.`question`.`namecat2` = `aoshu`.`cat2`.`name2` -- and `aoshu`.`question`.`id` = 165 
SET 
    `aoshu`.`question`.`namecat2` = `aoshu`.`cat2`.`name`;
    

-- 当field `aoshu`.`question`.`namecat22`输入二级分类id后，替换id为名字。
UPDATE `aoshu`.`question`
        JOIN
    `aoshu`.`cat2` ON `aoshu`.`question`.`namecat22` = `aoshu`.`cat2`.`idcat2` -- and `aoshu`.`question`.`id` = 165 
SET 
    `aoshu`.`question`.`namecat22` = `aoshu`.`cat2`.`name`;
    
-- 当在field `aoshu`.`question`.`namecat2`输入二级分类名字后，补充一级分类的名字。
UPDATE `aoshu`.`question`
        JOIN
    `aoshu`.`cat2` ON `aoshu`.`question`.`namecat2` = `aoshu`.`cat2`.`name` 
SET 
    `aoshu`.`question`.`namecat` = `aoshu`.`cat2`.`namecat`;
