#!/bin/bash

username=$1
ip=$2

scp .vscode-server-insiders.zip $username@$ip:/home/$username
