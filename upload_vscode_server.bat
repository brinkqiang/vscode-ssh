

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

pscp -P %port% -pw %passwd% %~dp0setup\.vscode-server.zip %username%@%ip%:

plink -P %port% -pw %passwd% %username%@%ip% "unzip -o -d ~/ ~/.vscode-server.zip" 

plink -P %port% -pw %passwd% %username%@%ip% "chmod +x ~/.vscode-server/bin/cd9ea6488829f560dc949a8b2fb789f3cdc05f5d/node"

plink -P %port% -pw %passwd% %username%@%ip% "chmod +x ~/.vscode-server/bin/cd9ea6488829f560dc949a8b2fb789f3cdc05f5d/server.sh"

echo upload .vscode-server end