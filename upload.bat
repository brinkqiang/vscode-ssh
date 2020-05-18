

set username=%1%
set passwd=%2%
set ip=%3%
set port=%4%

if "%username%" == "" set username="root"

if "%passwd%" == "" set passwd="123456"

if "%ip%" == "" set ip="127.0.0.1"

if "%port%" == "" set port="22"

echo username="%username%" ip="%ip%" port="%port%"

echo upload .vscode-server-insiders start

pscp -batch -P %port% -pw %passwd% setup\.vscode-server-insiders.zip %username%@%ip%.:~

plink -batch -P %port% -pw %passwd% %username%@%ip% "unzip -o -d ~/ ~/.vscode-server-insiders.zip" 

echo upload .vscode-server-insiders end