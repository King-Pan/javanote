![Mac终端配置-Iterm2](http://www.cnblogs.com/weixuqin/p/7029177.html)

expect ~/.ssh/aliyun01
ssh root@47.92.72.146

#!/usr/bin/expect -f
  set user root
  set host 47.92.72.146
  set password Psz1218psz1218**
  set timeout -1

  spawn ssh $user@$host
  expect "*assword:*"
  send "$password\r"
  interact
  expect eof

scp id_rsa.pub  root@101.200.61.251:/root/.ssh/id_rsa.pub
  101.200.61.251



pip show powerline-status





sudo pip install powerline-status

pip uninstall powerline-status --user




 update mysql.user set authentication_string=password('pwpw1218') where user='root' and Host = 'localhost';

 select host from mysql.user  where user='root'


UPDATE user SET Password = password ( 'pwpw1218' ) WHERE User = 'root' ; 
mysql> flush privileges ; 
mysql> quit
