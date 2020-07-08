

set username=%1%
set passwd=%2%
set ip=%3%
set port=%4%

if "%username%" == "" set username="root"

if "%passwd%" == "" set passwd="123456"

if "%ip%" == "" set ip="127.0.0.1"

if "%port%" == "" set port="22"

echo username="%username%" ip="%ip%" port="%port%"

echo upload .vscode-server start

pscp -P %port% -pw %passwd% setup\.vscode-server.zip %username%@%ip%:~

plink -P %port% -pw %passwd% %username%@%ip% "unzip -o -d ~/ ~/.vscode-server.zip" 

echo upload .vscode-server end