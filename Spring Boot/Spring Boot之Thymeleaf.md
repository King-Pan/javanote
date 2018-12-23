# Spring Boot集成Thymeleaf3

Thymeleaf: 读音: [taɪmlif]

自然语言模板

## 切换Thymeleaf的版本

自从Spring Boot2.0以后，就可以支持Thymeleaf3了，所以Thymeleaf3在Spring Boot1.x版本需要使用Thymeleaf3就需要修改Thymeleaf的版本号。

```xml
<properties>
    <thymeleaf.version>3.0.9.RELEASE</thymeleaf.version>
    <thymeleaf-layout-dialect.version>2.0.4</thymeleaf-layout-dialect.version>
</properties>
```

* Thymeleaf2 最后的版本2.1.6
* Thymeleaf3 最新版本3.0.9

```xml
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-thymeleaf</artifactId>
</dependency>
```

## Thymeleaf自动配置类 ThymeleafAutoConfiguration


org.springframework.boot.autoconfigure.thymeleaf.ThymeleafAutoConfiguration

该类中有Thymeleaf2和Thymeleaf3的相关自动配置。

## Thymeleaf自动配置属性

Thymeleaf的自动配置相关配置属性都在ThymeleafProperties中

org.springframework.boot.autoconfigure.thymeleaf.ThymeleafProperties

```java
@ConfigurationProperties(
    prefix = "spring.thymeleaf"
)
public class ThymeleafProperties {
    private static final Charset DEFAULT_ENCODING = Charset.forName("UTF-8");
    private static final MimeType DEFAULT_CONTENT_TYPE = MimeType.valueOf("text/html");
    public static final String DEFAULT_PREFIX = "classpath:/templates/";
    public static final String DEFAULT_SUFFIX = ".html";
    private boolean checkTemplate = true;
    private boolean checkTemplateLocation = true;
    private String prefix = "classpath:/templates/";
    ...
}
```

### 默认前缀

> public static final String DEFAULT_PREFIX = "classpath:/templates/";

### 默认后缀

> public static final String DEFAULT_SUFFIX = ".html";


## Thymeleaf初体验

```java
package club.javalearn.boot.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
public class HelloController {

    @GetMapping("/success")
    public ModelAndView success(Map<String,Object> map){
        map.put("msg","我是中国人");
        return new ModelAndView("success");
    }
}
```

```html
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="UTF-8">
    <title>成功</title>
</head>
<body>
    <h1>登录成功</h1>

<div th:text="${msg}">哈哈</div>
</body>
</html>
```

> <html xmlns:th="http://www.thymeleaf.org"> 引入thymeleaf命名空间，后面使用th:有提示


## Thymeleaf语法规则


```html
<footer th:fragment="copy">
&copy; 2011 The Good Thymes Virtual Grocery
</footer>
```

```html
<body>
...
<div th:insert="footer :: copy"></div>
<div th:replace="footer :: copy"></div>
<div th:include="footer :: copy"></div>
</body>
```

```html
<body>
...
<div>
<footer>
&copy; 2011 The Good Thymes Virtual Grocery
</footer>
</div>
<footer>
&copy; 2011 The Good Thymes Virtual Grocery
</footer>
<div>
&copy; 2011 The Good Thymes Virtual Grocery
</div>
</body>
```

th:insert、th:replace、th:include需要配合配合th:fragment使用


th:insert

布局标签，替换内容到引入的文件

th:replace

将声明引入的元素替换为公共片段

th:include

将被引入的片段的内容包含进这个标签中





### th:each

th:each属性用于迭代循环，语法：th:each="obj,iterStat:${objList}"

迭代对象可以是java.util.List,java.util.Map,数组等;

iterStat称作状态变量，属性有：    

*  index:当前迭代对象的index（从0开始计算）    *
*  count: 当前迭代对象的index(从1开始计算)    
*  size:被迭代对象的大小     
* current:当前迭代变量     
* even/odd:布尔值，当前循环是否是偶数/奇数（从0开始计算）     
* first:布尔值，当前循环是否是第一个     
* last:布尔值，当前循环是否是最后一个

th:if
如果if中的条件成立，才会显示该元素
th:unless
unless条件不成立，才会显示该元素，与if相反
th:switch

th:case

th:object
th:with

th:attr

设置标签属性，多个属性可以用逗号分隔

```html
<div th:attr="val="></div>
```

th:attrprepend
th:attrappend

th:value
th:href
th:src
...

th:text : 特殊字符转义,改变元素里面的文本内容
th:utext : 特殊字符不转义

th:fragment : Thymeleaf模板布局，布局标签，定义一个代码片段，方便其它地方引用

th:remove :  


* 1.all:删除包含标签和所有的孩子。
* 2.body:不包含标记删除,但删除其所有的孩子。
* 3.tag:包含标记的删除,但不删除它的孩子。
* 4.all-but-first:删除所有包含标签的孩子,除了第一个。
* 5.none:什么也不做。这个值是有用的动态评估。





th:任意html属性,来替换原生的属性值

th:id th:class th:value 等等...



## 变量优先级

![image](https://note.youdao.com/favicon.ico)



Simple expression: 表达式语法      

> 1.Message expression : #{}：国际化表达式

>  2.Variable expression : ${}： 变量表达式  

>    3.Link URL expression: @{}：URL链接表达式

>    4.Selection Variable expression: *{}：选择变量表达式

结合th:object使用，在某个范围内进行变量的查找，而不是在context中查找，缩小了查询的范围，效率如何呢？         如何没有与th:object结合使用，*{}与${}效果一样，因为其范围自动扩展到context。

```html

```





### Thymeleaf取值

> 普通变量

```java
@GetMapping("/success")
    public ModelAndView success(HttpServletRequest request, HttpSession session){
        ModelAndView view = new ModelAndView("success");
        view.addObject("msg","我是中国人");    //request
        view.addObject("userName","king-pan"); //request
        view.addObject("age",100);             //request
        List<String> nameList = Arrays.asList("king","pan","maly","jack");
        view.addObject("names",nameList);       //request,list
        request.setAttribute("key","请求参数"); //request
        session.setAttribute("user", Arrays.asList("12","av","sd"));
        return view;
    }
```

```html
<p th:text="${userName}"></p>
<p th:text="${msg}"></p>
<p th:text="${key}">aaa</p>
```


### Thymeleaf 标签



| 关键字      | 功能介绍                             | 案例                                                         |
| ----------- | ------------------------------------ | ------------------------------------------------------------ |
| th:id       | 替换id                               | `<input th:id="'xxx' + ${collect.id}"/>`                     |
| th:text     | 文本替换                             | `<p th:text="${collect.description}">description</p>`        |
| th:utext    | 支持html的文本替换                   | `<p th:utext="${htmlcontent}">content</p>`                   |
| th:object   | 替换对象                             | `<div th:object="${session.user}">,与*{}配合使用`            |
| th:value    | 属性赋值                             | `<input th:value = "${user.name}" />`                        |
| th:with     | 变量赋值运算                         | `<div th:with="isEvens = ${prodStat.count}%2 == 0"></div>`   |
| th:style    | 设置样式                             | `<div th:style="'display:' + @{(${sitrue} ? 'none' : 'inline-block')} + ''"></div>` |
| th:onclick  | 点击事件                             | `<td th:onclick = "'getCollect()'"></td>`                    |
| th:each     | 属性赋值                             | `<tr th:each = "user,userStat:${users}">`                    |
| th:if       | 判断条件                             | `<a th:if = "${userId == collect.userId}">`                  |
| th:unless   | 和th:if判断相反                      | `<a th:href="@{/login} th:unless=${session.user != null}">Login</a>` |
| th:href     | 链接地址                             | `<a th:href="@{/login}" th:unless=${session.user != null}>Login</a>` |
| th:switch   | 多路选择配合th:case使用              | `<div th:switch="${user.role}">`                             |
| th:fragment | th:switch的一个分支                  | `<p th:case = "'admin'">User is an administrator</p>`        |
| th:includ   | 布局标签，替换内容到引入的文件       | `<head th:include="layout :: htmlhead" th:with="title='xx'"></head>` |
| th:replace  | 布局标签，替换整个标签到引入的文件   | `<div th:replace="fragments/header :: title"></div>`         |
| th:selectd  | selected选择框选中                   | `th:selected="(${xxx.id} == ${configObj.dd})"`               |
| th:src      | 图片类地址引入                       | `<img class="img-responsive" alt="App Logo" th:src="@{/img/logo.png}" />` |
| th:inline   | 定义js脚本可以使用变量               | `<script type="text/javascript" th:inline="javascript">`     |
| th:action   | 表单提交的地址                       | `<form action="subscribe.html" th:action="@{/subscribe}">`   |
| th:remove   | 删除某个属性                         | `<tr th:remove="all"> 1.all:删除包含标签和所有的孩子。2.body:不包含标记删除,但删除其所有的孩子。3.tag:包含标记的删除,但不删除它的孩子。4.all-but-first:删除所有包含标签的孩子,除了第一个。5.none:什么也不做。这个值是有用的动态评估。` |
| th:attr     | 设置标签属性，多个属性可以用逗号分隔 | `比如 th:attr="src=@{/image/aa.jpg},title=#{logo}"，此标签不太优雅，一般用的比较少。` |

 

 

 

 

 