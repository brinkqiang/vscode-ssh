#!/bin/bash

if [ -f /etc/redhat-release ]; then
  sudo yum install -y sshpass unzip zsh
fi

if [ -f /etc/lsb-release ]; then
  sudo apt install -y sshpass unzip zsh
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

sshpass -p "$passwd" scp -P $port ./setup/.oh-my-zsh.zip $username@$ip:~/.oh-my-zsh.zip
sshpass -p "$passwd" ssh -p $port $username@$ip "rm -rf ~/.oh-my-zsh"
sshpass -p "$passwd" ssh -p $port $username@$ip "unzip -o -d ~/ ~/.oh-my-zsh.zip"

echo upload .vscode-server end
