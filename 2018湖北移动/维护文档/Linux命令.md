# Linux 常用命令

## ls

>统计当前文件夹下文件的个数，包括子文件夹里的
```shell
ls -lR|grep "^-"|wc -l
```

统计文件夹下目录的个数，包括子文件夹里的



```shell
ls -lR|grep "^d"|wc -l
```

> 统计当前文件夹下文件的个数

```shell
ls -l |grep "^-"|wc -l
```

> 统计当前文件夹下目录的个数

```shell
ls -l |grep "^d"|wc -l
```

