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

move "Y:\url_ying\url_s_xts_adj_hst_sina_missing_*.txt" "Y:\url_ying\_archive"
del "Y:\url_ying\url_s_xts_adj_hst_sina_missing.txt"

REM PAUSE

"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql"  -u gxh -plocoy -h 192.168.137.172 ying -e "SELECT DISTINCT CONCAT('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_FuQuanMarketHistory/stockid/', s.code, '.phtml?year=', date.year,'&jidu=', date.quarter) AS 'url_s_xts_adj_hst_sina_missing_151025' FROM hs_s as s join year_quarter as date  where s.fW > 0 and s.code in (SELECT distinct ids FROM `ying`.`s_xts_adj_hst_sina` where high > 9999 ORDER BY `ids`, `d` DESC) AND year in (2013,2014,2015) and concat(year(s.pDate), quarter(s.pDate)) <= concat(date.year, date.quarter);" > "Y:\url_ying\url_s_xts_adj_hst_sina_missing_%today%.txt"

REM PAUSE

MORE /E +1 "Y:\url_ying\url_s_xts_adj_hst_sina_missing_%today%.txt" > "Y:\url_ying\url_s_xts_adj_hst_sina_missing.txt"

REM PAUSE

ECHO.
