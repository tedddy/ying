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

move "Y:\url_ying\url_hk_w_hs_*.txt" "Y:\url_ying\_archive"
del "Y:\url_ying\url_hk_w_hs.txt"

REM PAUSE

"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql"  -u gxh -plocoy -h 192.168.137.172 ying -e "SELECT DISTINCT concat('http://bank.hangseng.com/1/PA_1_1_P1/ComSvlet_MiniSite_schi_gif?app=EinvcWarrantTechSearRes&Sortby=&Sortdir=&Start=&End=&WarrCode=&Searchby=2&UStockCode=', `uCode`,'&') AS 'hk_w_hs_hs' FROM `ying`.`hk_w_hs` where `uCode` IN ('03800' , '02823', '02822', '06837', 'HSCEI', 'HSI', '00998', '01788', '02727', '03333', '02357', '01066', '01068', '00268', '01833', '00861') or `uCode` IN (select distinct code from `ying`.`hk_w_hs`) or `uCode` IN (select distinct code from `ying`.`hk_s_hgt_info`) ORDER BY `uCode`;" > "Y:\url_ying\url_hk_w_hs_%today%.txt"

REM PAUSE

MORE /E +1 "Y:\url_ying\url_hk_w_hs_%today%.txt" > "Y:\url_ying\url_hk_w_hs.txt"

REM PAUSE

ECHO.
