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

move "Y:\url_ying\url_hs_fund_fjjj_jjjz_*.txt" "Y:\url_ying\_archive"
del "Y:\url_ying\url_hs_fund_fjjj_jjjz.txt"

REM PAUSE

"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql"  -u gxh -plocoy -h 192.168.137.172 ying -e "SELECT DISTINCT CONCAT('http://fund.eastmoney.com/f10/F10DataApi.aspx?type=lsjz&code=',a.code,'&page=1&per=20&sdate=&edate=&') AS 'url_hs_fund_fjjj_jjjz' FROM (SELECT DISTINCT code FROM ying.hs_fund_mother_son_daughter UNION SELECT DISTINCT b FROM ying.hs_fund_mother_son_daughter UNION SELECT DISTINCT a FROM ying.hs_fund_mother_son_daughter) AS a;" > "Y:\url_ying\url_hs_fund_fjjj_jjjz_%today%.txt"

REM PAUSE

MORE /E +1 "Y:\url_ying\url_hs_fund_fjjj_jjjz_%today%.txt" > "Y:\url_ying\url_hs_fund_fjjj_jjjz.txt"

REM PAUSE

ECHO.
