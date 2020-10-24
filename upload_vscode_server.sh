#!/bin/bash

if [ -f /etc/redhat-release ]; then
  sudo yum install -y sshpass
fi

if [ -f /etc/lsb-release ]; then
  sudo apt install -y sshpass
fi

echo -n "Please input your username: "
read username

echo -n "Please input your passwd: "
read passwd

echo -n "Please input your ip: "
read ip

echo -n "Please input your port: "
read port

if [ "$username" == "" ]; then
    username="root"
fi

if [ "$passwd" == "" ]; then
    passwd="123456"
fi

if [ "$ip" == "" ]; then
    ip="127.0.0.1"
fi

if [ "$port" == "" ]; then
    port="22"
fi

echo username="$username" ip="$ip" port="$port"

echo upload .vscode-server start

sshpass -p "$passwd" scp -P $port ./setup/.vscode-server.zip $username@$ip:~/.vscode-server.zip

sshpass -p "$passwd" ssh -p $port $username@$ip "unzip -o -d ~/ ~/.vscode-server.zip"
sshpass -p "$passwd" ssh -p $port $username@$ip "chmod +x ~/.vscode-server/bin/cd9ea6488829f560dc949a8b2fb789f3cdc05f5d/node"
sshpass -p "$passwd" ssh -p $port $username@$ip "chmod +x ~/.vscode-server/bin/cd9ea6488829f560dc949a8b2fb789f3cdc05f5d/server.sh"

echo upload .vscode-server end
