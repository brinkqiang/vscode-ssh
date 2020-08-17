
vscode-ssh
-----------------
Copyright (c) 2013-2018 brinkqiang (brink.qiang@gmail.com)

-----------------
vscode ssh 远程调试开发环境搭建
-----------------
-----------------
<!-- TOC -->

- [1. 安装VSCode版本](#1-安装vscode版本)
- [2. 在linux端 解压.vscode-server.zip到账号根目录](#2-在linux端-解压vscode-serverzip到账号根目录)
- [3. 安装remote相关插件](#3-安装remote相关插件)
- [4. 打开远程资源管理器](#4-打开远程资源管理器)
  - [4.1. 选择ssh targets 点+号创建一个新的链接](#41-选择ssh-targets-点号创建一个新的链接)
  - [4.2. 输入 ssh 账号@IP地址 -A](#42-输入-ssh-账号ip地址--a)
  - [4.3. 右键IP地址](#43-右键ip地址)
  - [4.4. 输入密码](#44-输入密码)
  - [4.5. 打开工作区](#45-打开工作区)
  - [4.6. 安装cpptools-linux.vsix插件](#46-安装cpptools-linuxvsix插件)
  - [4.7. 编译调试](#47-编译调试)
    - [4.7.1. 注意: 例子工程使用了cmake3.2+](#471-注意-例子工程使用了cmake32)
    - [4.7.2. 先编译项目](#472-先编译项目)
    - [4.7.3. F9设置断点](#473-f9设置断点)
    - [4.7.4. F5调试, 选择C++ (GDB/LLDB), 后面默认即可(选gcc/g++后续会报错 别选错了)](#474-f5调试-选择c-gdblldb-后面默认即可选gccg后续会报错-别选错了)
    - [4.7.5. 得到默认启动json配置文件](#475-得到默认启动json配置文件)
    - [4.7.6. 设置为合理的值, 下图为sample例子调试设置](#476-设置为合理的值-下图为sample例子调试设置)
    - [4.7.7. F5开始调试](#477-f5开始调试)
  - [4.8. END](#48-end)

<!-- /TOC -->

# 1. 安装VSCode版本

安装setup目录VSCodeUserSetup-x64-1.46.1.exe

# 2. 在linux端 解压.vscode-server.zip到账号根目录
```
unzip -o -d ~/ .vscode-server.zip
```

可用upload脚本上传

命令格式如下upload.(bat || sh) 账号名(默认值:root) IP(默认值:127.0.0.1) 端口(默认值:22)

windows
```
upload.bat test 10.246.34.79 22
```
linux
```
bash upload.sh test 10.246.34.79 22
```

# 3. 安装remote相关插件
打开插件页面 选择从VSIX安装插件 或 Ctrl+Shift+P 输入VSIX安装插件
![](images/installvsix.png)
(setup目录ms-vscode-remote开头的插件全部安装)
其他插件看自己需求
可用install_extension_dev脚本安装

install_extension_dev.(bat || sh)

windows
```
install_extension_dev.bat
```
linux
```
bash install_extension_dev.sh
```

# 4. 打开远程资源管理器


## 4.1. 选择ssh targets 点+号创建一个新的链接
![](images/openremote.png)

## 4.2. 输入 ssh 账号@IP地址 -A
![](images/connectssh.png)

例:
```
ssh test@10.246.34.79 -A
```

## 4.3. 右键IP地址

![](images/connecthost.png)

例:
```
右键 10.246.34.79 -> connect to host
```

## 4.4. 输入密码
![](images/enterpasswd.png)
链接成功会显示绿色图标
![](images/connectok.png)

## 4.5. 打开工作区
注意: 这个工作区是指远端工作区 非本地
![](images/openwork.png)
成功的情况 会显示 [SSH: 10.246.34.79]

这里我们打开sample工程 便于测试调试功能

## 4.6. 安装cpptools-linux.vsix插件

## 4.7. 编译调试

### 4.7.1. 注意: 例子工程使用了cmake3.2+
安装之后需要ln一下.
```
sudo rm -rf /usr/bin/cmake
sudo ln /usr/bin/cmake3 /usr/bin/cmake
```

### 4.7.2. 先编译项目
![](images/buildsample.png)

### 4.7.3. F9设置断点
![](images/enterbreak.png)

### 4.7.4. F5调试, 选择C++ (GDB/LLDB), 后面默认即可(选gcc/g++后续会报错 别选错了)
![](images/debugsetup.png)

### 4.7.5. 得到默认启动json配置文件
![](images/defaultlaunch.png)

### 4.7.6. 设置为合理的值, 下图为sample例子调试设置
![](images/samplelaunch.png)

### 4.7.7. F5开始调试
![](images/sampledebug.png)

## 4.8. END
注意事项: 在外网使用如果本身没有FQ, 请关闭更新, 原因是.vscode-server-insiders.zip的版本与客户端的版本必须保持完全一致.
![](images/disableupdate.png)

