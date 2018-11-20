## 软件准备
1. VM15
2. Centos7.5
3. JDK1.8
4. Hadoop 2.7.2
## 规划

| 主机名 | ip              | 用户 | 其他 |
| ------ | --------------- | ---- | ---- |
| master | 192.168.126.128 | root |      |
| slave1 | 192.168.126.129 | root |      |
| slave2 | 192.168.126.130 | root |      |

## 配置hosts文件

分别配置master、slave1、slave2主机的/etc/hosts

```shell
192.168.126.128   master
192.168.126.129   slave1
192.168.126.130   slave2
```



## 免密登陆设置

```shell
--分别在master、slave1、slave2主机上执行下列命令
ssh-keygen -t rsa    # 一路回车即可


# 在master执行下面命令:
ssh-copy-id -i ~/.ssh/id_rsa.pub root@slave1
ssh-copy-id -i ~/.ssh/id_rsa.pub root@slave2

# 在slave1上执行下面命令：
ssh-copy-id -i ~/.ssh/id_rsa.pub root@master
ssh-copy-id -i ~/.ssh/id_rsa.pub root@slave2

# 在slave2上执行下面命令:

ssh-copy-id -i ~/.ssh/id_rsa.pub root@master
ssh-copy-id -i ~/.ssh/id_rsa.pub root@slave1


# 然后可以直接使用 ssh master免密登陆master主机
```



## 测试hadoop是否安装成功

请求web页面

hadoop web管理页面:    http://master:50070/dfshealth.html#tab-overview

yarn 管理页面: http://master:8088/cluster/



![img](file:///C:\Users\pansf\AppData\Roaming\Tencent\Users\467449165\QQ\WinTemp\RichOle\@H21QPNG6$F7Y614JFY}Q(M.png) 







![]()