# 1、RabbitMQ安装

[教程地址](https://www.cnblogs.com/ericli-ericli/p/5902270.html)

# 2、RabbitMQ在window下安装

### 2.1、下载地址

> 在安装RabbitMQ之前需要下载Erlang

RabbitMQ服务端代码是使用并发式语言Erlang编写的，安装Rabbit MQ的前提是安装Erlang

[Erlang下载地址](http://erlang.org/download/otp_win64_21.1.exe)

[windo下RabbitMQ下载地址](https://dl.bintray.com/rabbitmq/all/rabbitmq-server/3.7.9/rabbitmq-server-3.7.9.exe)

## 2.2、安装步骤

### 2.2.1、安装Erlang 

直接下一步，知道安装成功，配置环境变量: ERLANG_HOME指向根目录



## 2.2.2 安装RabbitMQ

直接下一步，找到安装路径: C:\Program Files\RabbitMQ Server\

## 2.3、配置RabbitMQ

### 2.3.1、激活 RabbitMQ's Management Plugin

> 运行命令： (使用管理员打开cmd)

```powershell
"C:\Program Files\RabbitMQ Server\rabbitmq_server-3.7.9\sbin\rabbitmq-plugins.bat" enable rabbitmq_management
```

> 结果

```powershell
Microsoft Windows [版本 10.0.17134.407]
(c) 2018 Microsoft Corporation。保留所有权利。

C:\WINDOWS\system32>"C:\Program Files\RabbitMQ Server\rabbitmq_server-3.7.9\sbin\rabbitmq-plugins.bat" enable rabbitmq_management
Enabling plugins on node rabbit@DESKTOP-KVT3N4R:
rabbitmq_management
The following plugins have been configured:
  rabbitmq_management
  rabbitmq_management_agent
  rabbitmq_web_dispatch
Applying plugin configuration to rabbit@DESKTOP-KVT3N4R...
The following plugins have been enabled:
  rabbitmq_management
  rabbitmq_management_agent
  rabbitmq_web_dispatch

started 3 plugins.

C:\WINDOWS\system32>
```

### 2.3.2、重启服务

> 运行命令： (使用管理员打开cmd)

```powershell
net stop RabbitMQ && net start RabbitMQ
```

> 结果

```powershell
C:\WINDOWS\system32>net stop RabbitMQ && net start RabbitMQ
RabbitMQ 服务正在停止.......
RabbitMQ 服务已成功停止。

RabbitMQ 服务正在启动 .
RabbitMQ 服务已经启动成功。

```

### 2.3.3、使用web管理RabbitMQ

[RabbitMQ前台地址](http://localhost:15672/)

> 默认用户guest/guest



![RabbitMQ前台截图](D:\javanote\Java-Architect\jms\MQ\images\web-mg.png)

> 主页



![web前台主页](D:\javanote\Java-Architect\jms\MQ\images\web-index.png)

> Admin选项卡

主要是对用户管理，授权



# 3、RabbitMQ在Linux下安装



