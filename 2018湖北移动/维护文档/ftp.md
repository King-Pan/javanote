# Linux安装ftp服务





## 安装ftp



## 





## 常见问题



> 553错误

```shell
ftp> put C:\Users\pansf\Desktop\20190113.zip
200 PORT command successful. Consider using PASV.
553 Could not create file.
```

解决方法，给ftp的根目录赋值权限

```shell
chmod -R 777 /var/ftp
```



