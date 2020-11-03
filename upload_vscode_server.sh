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
sshpass -p "$passwd" ssh -p $port $username@$ip "chmod +x $(find  ~/.vscode-server/bin -maxdepth 3 -name node)"
sshpass -p "$passwd" ssh -p $port $username@$ip "chmod +x $(find  ~/.vscode-server/bin -maxdepth 3 -name server.sh)"
sshpass -p "$passwd" ssh -p $port $username@$ip "chmod +x $(find  ~/.vscode-server/bin -maxdepth 5 -name semver)"
sshpass -p "$passwd" ssh -p $port $username@$ip "chmod +x $(find  ~/.vscode-server/bin -maxdepth 5 -name rg)"

echo upload .vscode-server end
