#!/bin/bash

if [ -f /etc/redhat-release ]; then
  curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
  sudo yum install -y nodejs
  npm install -g yo generator-code
  echo please exec yo code.
fi

if [ -f /etc/lsb-release ]; then
  curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
  sudo apt install -y nodejs
  npm install -g yo generator-code
  echo please exec yo code.
fi

pushd setup

for i in `ls -al *.vsix | awk '{print $9}'`
do
   echo installing ${i%.vsix}.vsix
   code --install-extension ${i%.vsix}.vsix
done

popd
