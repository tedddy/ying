mysqldump --routines=true -u gxh -plocoy ying_calc  > ying_calc_151028.sql;

mysql -u gxh -plocoy ying_calc < /root/ying_calc_151028.sql