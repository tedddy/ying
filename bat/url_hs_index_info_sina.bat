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

move "Y:\url_ying\url_hs_index_info_sina_*.txt" "Y:\url_ying\_archive"
del "Y:\url_ying\url_hs_index_info_sina.txt"

REM PAUSE

rem "C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql"  -u gxh -plocoy -h 192.168.137.172 ying -e "SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN fSH = 1 THEN 'sh' ELSE 'sz' END)), code, '/ncp.shtml') as url_hs_index_info_sina FROM hs_index_code;" > "Y:\url_ying\url_hs_index_info_sina_%today%.txt"

"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql"  -u gxh -plocoy -h 192.168.137.172 ying -e "SELECT CONCAT('http://finance.sina.com.cn/realstock/company/', (SELECT (CASE WHEN a.fSH = 1 THEN 'sh' ELSE 'sz' END)), a.code_index, '/ncp.shtml') as url_hs_index_info_sina FROM (select a.code_index as code_index, a.name_index as name_index, b.fW as fW, b.fD as fD, b.fSH as fSH, b.date_start as date_start from (SELECT MAX(`hs_index_info`.`code_index`) AS code_index, `hs_index_info`.`name_index` AS name_index FROM `ying`.`hs_index_info` GROUP BY `hs_index_info`.`name_index`) as a join `ying`.`hs_index_info` as b on a.code_index = b.code_index) as a;" > "Y:\url_ying\url_hs_index_info_sina_%today%.txt"

REM PAUSE

MORE /E +1 "Y:\url_ying\url_hs_index_info_sina_%today%.txt" > "Y:\url_ying\url_hs_index_info_sina.txt"

REM PAUSE

ECHO.
