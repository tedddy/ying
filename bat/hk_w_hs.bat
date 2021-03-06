@ECHO OFF

REM 在Win7（非正宗中文版）上写bat文件的时候，如果有中文，并且要让github可读的话，要用windows自带的Notepad，并保存为ANSI编码。 注意：在github的GUI（windows for git）上中文显示有点问题。
REM 存为ANSI编码

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

REM !!! today = %YY%%MM%%DD% today和=之间如果有空格的话，是不行的。

SET today=%YY%%MM%%DD%

REM PAUSE

ECHO.

move "Y:\url_ying\hk_w_hs*.txt" "Y:\url_ying\_archive"
del "Y:\url_ying\hk_w_hs.txt"

REM PAUSE

"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql"  -u gxh -plocoy -h 192.168.137.172 ying -e "SELECT DISTINCT concat('http://bank.hangseng.com/1/PA_1_1_P1/ComSvlet_MiniSite_schi_gif?app=EinvcWarrantTechSearRes&Sortby=&Sortdir=&Start=&End=&WarrCode=&Searchby=2&UStockCode=', `uCode`,'&') AS 'hk_w_hs' FROM `ying`.`hk_w` where `uCode` IN ('03800' , '02823', '02822', '06837', 'HSCEI', 'HSI', '00998', '01788', '02727', '03333', '02357', '01066', '01068', '00268', '01833', '00861') or `uCode` IN (select distinct code from `ying`.`hk_w`) or `uCode` IN (select distinct code from `ying`.`hk_s_hgt_info`) ORDER BY `uCode`;" > "Y:\url_ying\hk_w_hs%today%.txt"

REM PAUSE

MORE /E +1 "Y:\url_ying\hk_w_hs%today%.txt" > "Y:\url_ying\hk_w_hs.txt"

REM PAUSE

ECHO.
