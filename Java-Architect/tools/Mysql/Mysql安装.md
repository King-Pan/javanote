# Mysql安装



## 下载mysql

```shell
wget https://cdn.mysql.com//Downloads/MySQL-8.0/mysql-8.0.12-linux-glibc2.12-x86_64.tar.xz
```





## 参考文档

[mysql安装教程](https://blog.csdn.net/vkingnew/article/details/81267223)





```shell
[root@HBBDC-DN-118 mysql]# rpm -ivh mysql-community-common-5.7.23-1.el7.x86_64.rpm 
warning: mysql-community-common-5.7.23-1.el7.x86_64.rpm: Header V3 DSA/SHA1 Signature, key ID 5072e1f5: NOKEY
Preparing...                ########################################### [100%]
        file /usr/share/mysql/czech/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/danish/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/dutch/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/english/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/estonian/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/french/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/german/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/greek/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/hungarian/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/italian/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/japanese/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/korean/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/norwegian-ny/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/norwegian/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/polish/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/portuguese/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/romanian/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/russian/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/serbian/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/slovak/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/spanish/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/swedish/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/ukrainian/errmsg.sys from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/Index.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/armscii8.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/ascii.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/cp1250.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/cp1256.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/cp1257.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/cp850.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/cp852.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/cp866.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/dec8.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/geostd8.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/greek.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/hebrew.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/hp8.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/keybcs2.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/koi8r.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/koi8u.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/latin1.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/latin2.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/latin5.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/latin7.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/macce.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/macroman.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
        file /usr/share/mysql/charsets/swe7.xml from install of mysql-community-common-5.7.23-1.el7.x86_64 conflicts with file from package mysql-libs-5.1.66-2.el6_3.x86_64
[root@HBBDC-DN-118 mysql]# rpm -ivh mysql-community-libs-
mysql-community-libs-5.7.23-1.el7.x86_64.rpm         mysql-community-libs-compat-5.7.23-1.el7.x86_64.rpm  
[root@HBBDC-DN-118 mysql]# rpm -ivh mysql-community-libs-5.7.23-1.el7.x86_64.rpm 
warning: mysql-community-libs-5.7.23-1.el7.x86_64.rpm: Header V3 DSA/SHA1 Signature, key ID 5072e1f5: NOKEY
error: Failed dependencies:
        libc.so.6(GLIBC_2.14)(64bit) is needed by mysql-community-libs-5.7.23-1.el7.x86_64
        mysql-community-common(x86-64) >= 5.7.9 is needed by mysql-community-libs-5.7.23-1.el7.x86_64
```



解决办法：后面加上

```
`--force --nodeps`
```