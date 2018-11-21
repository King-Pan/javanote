# Gradle安装和配置

## 1、下载Gradle

[Gradle4.10.2版本下载地址](https://downloads.gradle.org/distributions/gradle-4.10.2-bin.zip)

## 2、安装

### 2.1、Window安装



> 新建一个c:\gradle目录，把解压的gradle-4.10.2目录拷贝到c:\gradle目录下



> 配置环境变量在path里追加c:\gradle\gradle-4.10.2\bin



### 2.2 、Linux或Mac安装



>  解压二进制程序包安装

* 解压文件到/opt/gradle目录下

```
$ mkdir /opt/gradle
$ unzip -d /opt/gradle gradle-4.10.2-bin.zip
$ ls /opt/gradle/gradle-4.10.2
LICENSE  NOTICE  bin  getting-started.html  init.d  lib  media
```

* 把/opt/gradle/gradle-4.10.2/bin 加入到环境变量path里



Mac使用HomeBrew命令安装

```shell
$ brew install gradle
```



### 2.3、测试

>  不同的操作系统信息不同，仅供参考.

```shell
$ gradle -v


------------------------------------------------------------
Gradle 4.10.2
------------------------------------------------------------

Build time:   2018-09-19 18:10:15 UTC
Revision:     b4d8d5d170bb4ba516e88d7fe5647e2323d791dd

Kotlin DSL:   1.0-rc-6
Kotlin:       1.2.61
Groovy:       2.4.15
Ant:          Apache Ant(TM) version 1.9.11 compiled on March 23 2018
JVM:          1.8.0_91 (Oracle Corporation 25.91-b15)
OS:           Windows 10 10.0 amd64
```

