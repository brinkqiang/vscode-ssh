

set username=%1%
set passwd=%2%
set ip=%3%
set port=%4%

if "%username%" == "" set username="root"

if "%passwd%" == "" set passwd="123456"

if "%ip%" == "" set ip="127.0.0.1"

if "%port%" == "" set port="22"

echo username="%username%" ip="%ip%" port="%port%"

echo upload .oh-my-zsh start

pscp -P %port% -pw %passwd% %~dp0setup\.oh-my-zsh.zip %username%@%ip%:.oh-my-zsh.zip
plink -P %port% -pw %passwd% %username%@%ip% "rm -rf ~/.oh-my-zsh" 
plink -P %port% -pw %passwd% %username%@%ip% "unzip -o -d ~/ ~/.oh-my-zsh.zip" 

echo upload .oh-my-zsh end