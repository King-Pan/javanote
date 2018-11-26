# Maven常用命令



## 导入本地jar到Maven仓库



```shell
mvn install:install-file -Dfile=D:\javanote\2018湖北移动\hq_xml_json\target\hq-0.0.1-SNAPSHOT\WEB-INF\lib\sdk-1.0.jar -DgroupId=sdk -DartifactId=sdk -Dversion=1.0 -Dpackaging=jar
```

> 命令解释

* -Dfile 本地jar包所在路径
* -DgroupId 组织名
* -DartifactId 项目名
* -Dversion 版本号 
* -Dpackaging 打包方式

![Maven导入本地jar包](D:\javanote\Java-Architect\tools\Maven\images\maven-install.png)