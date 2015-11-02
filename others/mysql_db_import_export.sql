

-- unzip 7z file with parts, ".001" should be added.
7z x /root/dump/Dump20151029_ying.7z.001

mysql -u gxh -plocoy ying < Dump20151029_ying.sql

mysqldump --routines=true -u gxh -plocoy ying_calc  > ying_calc_151028.sql

mysql -u gxh -plocoy ying_calc < /root/ying_calc_151028.sql

mysqldump -u gxh -plocoy ying hs_index_xts_EM > dump_table_hs_index_xts_EM_151101.sql

