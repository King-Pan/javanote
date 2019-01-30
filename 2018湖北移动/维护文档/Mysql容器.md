## Mysql容器



```shell
mysql -uroot -h10.29.31.244 -pplle373medlzzvwo7vme -P32111
mysql -uroot -h10.29.31.244 -p -P32111
plle373medlzzvwo7vme 
mysql -udacp_smart -h10.29.31.244 -p'dacp_smart_!@#$' -P32111  # 密码有特殊字符需要加''

mysql -udacp_smart -h10.29.31.244 -p -P32111
```





### 创建数据库



```mysql
create database smart default charset utf8;

show smart;

create user dacp_smart@'%' identified by 'dacp_smart_!@#$';

grant all privileges on smart.* to dacp_smart@'%' identified by 'dacp_smart_!@#$';
```



1、创建用户：CREATE USER 'username'@'host' IDENTIFIED BY 'password';

username:用户名；host：指定在哪个主机上可以登录，本机可用localhost，%通配所有远程主机；password：用户登录密码；

2、授权：GRANT ALL PRIVILEGES ON  *.* TO ‘username’@‘%’ IDENTIFIED BY 'password’；

刷新权限：FLUSH PRIVILEGES;

格式：grant 权限 on [数据库](http://lib.csdn.net/base/mysql)名.表名 to 用户@登录主机 identified by "用户密码"；*.*代表所有权；

@ 后面是访问[MySQL](http://lib.csdn.net/base/mysql)的客户端IP地址（或是 主机名） % 代表任意的客户端，如果填写 localhost 为本地访问（那此用户就不能远程访问该mysql数据库了）。



### 创建表



```mysql
-- auto-generated definition
create table st_smart_webchat_unbundl_hm
(
  chg_sn         varchar(255) not null
  comment '变更流水号'
    primary key,
  chg_org_id     varchar(255) null
  comment '变更组织机构标识',
  phone_no       varchar(255) null
  comment '电话号码',
  send_flag      varchar(255) null
  comment '发送标记',
  stat_date      varchar(255) null
  comment '统计日',
  stat_hour      varchar(255) null
  comment '统计小时',
  stat_month     varchar(255) null
  comment '统计月',
  state_chg_time varchar(255) null
  comment '用户状态变更时间',
  user_id        varchar(255) null
  comment '用户标识',
  user_state     varchar(255) null
  comment '用户变更状态:1：销户:2：过户:3：携出'
)
  comment '灵镜微信解绑用户小时表';


-- auto-generated definition
create table st_smart_webchat_unbundl_send
(
  chg_sn         varchar(255) not null
  comment '变更流水号'
    primary key,
  chg_org_id     varchar(255) null
  comment '变更组织机构标识',
  phone_no       varchar(255) null
  comment '电话号码',
  send_flag      varchar(255) null
  comment '发送标记',
  stat_date      varchar(255) null
  comment '统计日',
  stat_hour      varchar(255) null
  comment '统计小时',
  stat_month     varchar(255) null
  comment '统计月',
  state_chg_time varchar(255) null
  comment '用户状态变更时间',
  user_id        varchar(255) null
  comment '用户标识',
  user_state     varchar(255) null
  comment '用户变更状态:1：销户:2：过户:3：携出'
)
  comment '灵镜微信解绑用户小时表发送表';
```

