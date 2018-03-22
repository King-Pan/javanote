# 二、配置文件

## 1、配置文件

Spring Boot使用一个全局的配置文件，配置文件名是固定的

* application.properties(优先级高)
* application.yml

配置文件的作用:修改Spring Boot自动配置的默认值;

YAML(YAML Ain't Markup Language)

* YAML A Markup Language: YAML是一个标记语言
* YAML isn't Markup Language: YAML不是一个标记语言

标记语言:

以前的配置文件：大多数都使用的是xxx.xml文件

YAML:==是以数据为中心==，比json、xml等更适合做配置文件

YAML:配置例子

```yaml
server:
  port: 8081
```

XML:

```XML
<server>
	<port>8081</port>
</server>
```

