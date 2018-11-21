# Idea-SpringBoot热部署

## Idea设置



> 设置项目自动编译(Build project automatically)

设置路径:  settings-->Build,Execution,Deployment-->Compiler

![设置自动编译](https://raw.githubusercontent.com/King-Pan/javanote/master/Idea/images/idea-compiler.png)



> 设置Spring Boot Application

![Spring Boot项目设置](https://raw.githubusercontent.com/King-Pan/javanote/master/Idea/images/application-cfg.png)



> 勾选 compiler.automake.allow.when.app.running

   快捷键: 

- Linux： `CTRL+SHIFT+A`
- 苹果系统 ： `SHIFT+COMMAND+A`
- Windows： `CTRL+ALT+SHIFT+/`

![running](https://raw.githubusercontent.com/King-Pan/javanote/master/Idea/images/idea-running.png)





## Maven项目设置



### 添加devtools依赖

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-devtools</artifactId>
    <scope>runtime</scope>
    <optional>true</optional>
</dependency>
```



### 添加spring-boot-maven-plugin插件

```xml
<plugin>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-maven-plugin</artifactId>
    <configuration>
        <!--fork:设置True，否则可能devtools不会起作用-->
        <fork>true</fork>
    </configuration>
</plugin>
```



