root用户登录

创建 /opt/module   /opt/software目录
创建用户组: groupadd hadoop
创建用户: useradd hadoop -g hadoop
修改hadoop用户密码:   passwd hadoop



修改module、software目录的属主
root用户下 sudo chown -R hadoop:hadoop   /opt/module /opt/software

下载jdk和hadoop2.7.5到/opt/software下

切换到hadoop用户下

解压jdk

tar -zxvf jdk....tar.gz -C /opt/module

sudo vim /etc/profile

如果报错：
hadoop is not in the sudoers file

参考： http://blog.163.com/viewsoft@yeah/blog/static/169127244201382410483079/ 解决


在/etc/profile文件末尾添加一下内容


#JAVA_HOME
export JAVA_HOME=/opt/module/jdk1.8.0_161

export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$JAVA_HOME/sbin

:wq!保存退出

source /etc/profile   使文件立即生效

测试java安装是否成功

java -version

[hadoop@iZhp3al5so4opuwtuh5me3Z ~]$ java -version
java version "1.8.0_161"
Java(TM) SE Runtime Environment (build 1.8.0_161-b12)
Java HotSpot(TM) 64-Bit Server VM (build 25.161-b12, mixed mode)
[hadoop@iZhp3al5so4opuwtuh5me3Z ~]$ 




tar -zxvf hadoop-2.7.5.tar.gz -C /opt/module/


/opt/module/hadoop-2.7.5


#HADOOP_HOME
export HADOOP_HOME=/opt/module/hadoop-2.7.5
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin

sudo vim /etc/profile 


/opt/module/hadoop-2.7.5/etc/hadoop


修改hadoop-dev.sh

export JAVA_HOME=${JAVA_HOME}修改为

export JAVA_HOME=/opt/module/jdk1.8.0_161













https://promotion.aliyun.com/ntms/act/group/team.html?group=Y16UIQy91W

