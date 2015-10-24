@ECHO OFF

REM ��Win7�����������İ棩��дbat�ļ���ʱ����������ģ�����Ҫ��github�ɶ��Ļ���Ҫ��windows�Դ���Notepad��������ΪANSI���롣 ע�⣺��github��GUI��windows for git����������ʾ�е����⡣
REM ��ΪANSI����

for /f "delims=" %%a in ('wmic OS Get localdatetime  ^| find "."') do set "dt=%%a"
set "YYYY=%dt:~0,4%"
set "YY=%dt:~2,2%"
set "MM=%dt:~4,2%"
set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%"
set "Min=%dt:~10,2%"
set "Sec=%dt:~12,2%"

set datestamp=%YYYY%%MM%%DD%
set timestamp=%HH%%Min%%Sec%
set fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%
echo datestamp: "%datestamp%"
echo timestamp: "%timestamp%"
echo fullstamp: "%fullstamp%"

REM !!! today = %YY%%MM%%DD% today��=֮������пո�Ļ����ǲ��еġ�

SET today=%YY%%MM%%DD%

REM PAUSE

ECHO.

move "Y:\url_ying\url_hs_index_rt_sina_*.txt" "Y:\url_ying\_archive"
del "Y:\url_ying\url_hs_index_rt_sina.txt"

REM PAUSE

rem "C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql"  -u gxh -plocoy -h 192.168.137.172 ying -e "SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN fSH = 1 THEN 'sh' ELSE 'sz' END)), code, '/ncp.shtml') as url_hs_index_rt_sina FROM hs_index_code;" > "Y:\url_ying\url_hs_index_rt_sina_%today%.txt"

"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql"  -u gxh -plocoy -h 192.168.137.172 ying -e "SELECT CONCAT('http://hq.sinajs.cn/list=', (SELECT (CASE WHEN a.fSH = 1 THEN 'sh' ELSE 'sz' END)), a.code) as url_hs_index_rt_sina FROM (select a.code as code, a.name as name, b.fW as fW, b.fD as fD, b.fSH as fSH, b.date as date from (SELECT MAX(`hs_index_code`.`code`) AS code, `hs_index_code`.`name` AS name FROM     `ying`.`hs_index_code` GROUP BY `hs_index_code`.`name`) as a join `ying`.`hs_index_code` as b on a.code = b.code) as a" > "Y:\url_ying\url_hs_index_rt_sina_%today%.txt"

REM PAUSE

MORE /E +1 "Y:\url_ying\url_hs_index_rt_sina_%today%.txt" > "Y:\url_ying\url_hs_index_rt_sina.txt"

REM PAUSE

ECHO.
