#!/bin/bash

username=$1
ip=$2
port=$3

if [ "$username" == "" ]
then
    username="root"
fi

if [ "$ip" == "" ]
then
    ip="127.0.0.1"
fi

if [ "$port" == "" ]
then
    port="22"
fi

echo username="$username" ip="$ip" port="$port"

echo begin scp

scp -P $port ./setup/.vscode-server.zip $username@$ip:

ssh -P $port $username@$ip "unzip -o -d ~/ ~/.vscode-server.zip"

ssh -P $port %passwd% %username%@%ip% "chmod +x ~/.vscode-server/bin/cd9ea6488829f560dc949a8b2fb789f3cdc05f5d/node"

ssh -P $port %passwd% %username%@%ip% "chmod +x ~/.vscode-server/bin/cd9ea6488829f560dc949a8b2fb789f3cdc05f5d/server.sh"

sshpass -p "$passwd" ssh -p $port $username@$ip "chmod +x ~/.vscode-server/bin/cd9ea6488829f560dc949a8b2fb789f3cdc05f5d/node"
sshpass -p "$passwd" ssh -p $port $username@$ip "chmod +x ~/.vscode-server/bin/cd9ea6488829f560dc949a8b2fb789f3cdc05f5d/server.sh"

echo end scp
