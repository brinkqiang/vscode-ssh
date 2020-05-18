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

scp -P $port ./setup/.vscode-server-insiders.zip $username@$ip:~/

ssh -p $port $username@$ip "unzip -o -d ~/ ~/.vscode-server-insiders.zip"

echo end scp
