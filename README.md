
vscode-ssh
-----------------
Copyright (c) 2013-2018 brinkqiang (brink.qiang@gmail.com)

-----------------
vscode ssh 远程调试开发环境搭建
-----------------
-----------------
<!-- TOC -->

- [安装VSCode-insider版本](#安装vscode-insider版本)
- [在linux端 解压.vscode-server-insiders.zip到账号根目录](#在linux端-解压vscode-server-insiderszip到账号根目录)
- [安装remote相关插件](#安装remote相关插件)
- [打开远程资源管理器](#打开远程资源管理器)
    - [选择ssh targets 点+号创建一个新的链接](#选择ssh-targets-点号创建一个新的链接)
    - [输入 ssh 账号@IP地址 -A](#输入-ssh-账号ip地址--a)
    - [右键IP地址](#右键ip地址)
    - [输入密码](#输入密码)
    - [打开工作区](#打开工作区)
    - [安装cpptools-linux.vsix插件](#安装cpptools-linuxvsix插件)
    - [编译调试](#编译调试)
        - [注意: 例子工程使用了cmake3.2+](#注意-例子工程使用了cmake32)
        - [先编译项目](#先编译项目)
        - [F9设置断点](#f9设置断点)
        - [F5调试, 选择C++ (GDB/LLDB), 后面默认即可](#f5调试-选择c-gdblldb-后面默认即可)
        - [得到默认启动json配置文件](#得到默认启动json配置文件)
        - [设置为合理的值, 下图为sample例子调试设置](#设置为合理的值-下图为sample例子调试设置)
        - [F5开始调试](#f5开始调试)
    - [END](#end)

<!-- /TOC -->

# 1. 安装VSCode-insider版本

安装setup目录VSCodeUserSetup-x64-1.42.0-insider.exe

# 2. 在linux端 解压.vscode-server-insiders.zip到账号根目录
```
unzip -o -d ~/ .vscode-server-insiders.zip
```

可用upload脚本上传
windows
```
upload.bat test 10.246.34.79
```
linux
```
upload.sh test 10.246.34.79
```

# 3. 安装remote相关插件
打开插件页面 选择从VSIX安装插件 或 Ctrl+Shift+P 输入VSIX安装插件
![](images/installvsix.png)
(setup目录ms-vscode-remote开头的插件全部安装)
其他插件看自己需求

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

### 4.7.4. F5调试, 选择C++ (GDB/LLDB), 后面默认即可
![](images/debugsetup.png)

### 4.7.5. 得到默认启动json配置文件
![](images/defaultlaunch.png)

### 4.7.6. 设置为合理的值, 下图为sample例子调试设置
![](images/samplelaunch.png)

### 4.7.7. F5开始调试
![](images/sampledebug.png)

## 4.8. END
