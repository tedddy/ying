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

move "Y:\stock\url_hs_s_MoneyFlow_fW5_*.txt" "Y:\url_ying\_archive"
del "Y:\stock\url_hs_s_MoneyFlow_fW5.txt"

REM PAUSE

"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql"  -u gxh -plocoy -h 192.168.137.172 ying -e "SELECT CONCAT('http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/MoneyFlow.ssl_qsfx_lscjfb?daima=', (SELECT (CASE WHEN fW = 5 THEN 'sh' ELSE 'sz' END)), code, '&page=1&num=1&sort=opendate&asc=0') as url_hs_s_MoneyFlow_fW5 FROM hs_s WHERE fW = 5;" > "Y:\stock\url_hs_s_MoneyFlow_fW5_%today%.txt"

REM PAUSE

MORE /E +1 "Y:\stock\url_hs_s_MoneyFlow_fW5_%today%.txt" > "Y:\stock\url_hs_s_MoneyFlow_fW5.txt"

REM PAUSE

ECHO.
