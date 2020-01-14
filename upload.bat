
set username=%1%
set ip=%2%

scp -P 22 ./setup/.vscode-server-insiders.zip %username%@%ip%:/home/%username%

ssh -p 22 %username%@%ip% "unzip -o -d ~/ ~/.vscode-server-insiders.zip"