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

move "Y:\url_ying\lhb_s_trader_*.txt" "Y:\url_ying\_archive"
del "Y:\url_ying\lhb_s_trader.txt"

REM PAUSE

"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql"  -u gxh -plocoy -h 192.168.137.172 ying -e "SELECT DISTINCT concat('http://datainterface.eastmoney.com/EM_DataCenter/JS.aspx?type=LHB&sty=YYHSIU&code=', `id_trader`,'&p=1&ps=50&js=var%20CNyxpdfD={%22data%22:[%28x%29],%22pages%22:%22%28pc%29%22,%22update%22:%22%28ud%29%22}&') AS 'lhb_s_trader' FROM `ying_calc`.`lhb_trader`;" > "Y:\url_ying\lhb_s_trader_%today%.txt"

REM PAUSE

MORE /E +1 "Y:\url_ying\lhb_s_trader_%today%.txt" > "Y:\url_ying\lhb_s_trader.txt"

REM PAUSE

ECHO.
