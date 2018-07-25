#Thymeleaf

## Thymeleaf简介

* Java模板引擎。能够处理HTML、XML、JAVASCRIPT、CSS甚至纯文本。类似JSP、Freemarker。
* 自然模板。原型即页面
* 语法优雅易懂。OGNL,SpringEL
* 遵循Web标准。支持HTML5

## Thymeleaf标准方言

 ### 如何识别标准方言

```html
<span th:text=""></span>
<!--html5，可以不用引入命名空间 data-** -->
<span data-th-text=""></span>
```

### 标准表达式

####变量表达式

语法： ${...}

```html
<span th:text="${book.author.name}"></span>
```

#### 消息表达式

语法：#{...}

```html
<table>
    <th th:text="#{header.address.city}">..</th>
    <th th:text="#{header.address.country}"></th>
</table>
```

也称为文本外部化、国际化或i18n

#### 选择表达式

语法：*{...}

```html
<div th:object="${book}">
    <span th:text="*{title}"></span>
</div>
```

*{title}取的是${boot}的title属性值

 与变量表达式区别： 它们是在当前选择的对象而不是整个上下文变量映射上执行。

${book} 上下文变量

*{title} 当前对象book 

#### 链接表达式

语法：@{}

链接表达式可以是相对的，在这种情况下，应用程序上下文将不会作为URL的前缀，

```html
<a th:href="@{../documents/reports}">...</a>
```

也可以是服务器相对(同样，没有应用程序上下文前缀)

```html
<a th:href="@{~/contents/main}">...</a>
```

和协议相对(就像绝对URL，但浏览器将使用在显示的页面中使用的相同的HTTP或HTTPS协议)。

```html
<a th:href="@{//static.cdn.com/res/jquery.min.js}">...</a>
```

当然，Link表达式也可以是绝对的。

```html
<a th:href="@{http://static.cdn.com/res/jquery.min.js}">...</a>
```

#### 分段表达式

语法：th:insert或者th:replace

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" >
    <body>
        <div th:fragment="copy">
            &copy; 2017 <a href="www.javalearn.club">javalearn.club</a>
        </div>
    </body>
</html>
```



```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" >
    <body>
        <div th:insert="~{footer::copy}">
           
        </div>
    </body>
</html>
```

#### 字面量

##### null

```html
<div th:if="${variable.something} == null">
    ...
</div>
```

#### 算术操作

+、-、*、/、%等操作

```html
<div th:with="isEven(${prodStat.count}%2 == 0)">
    ...
</div>
```

#### 比较和等价

比较: >、<、>=、<=、(gt,lt,ge,le)

```html
<ul class="pagination" data-th-if="${page.totalPages le 7}">
    ...
</ul>
```

等价: ==、!= (eq,ne)

```html
<option data-th-each="i : ${#arrays.toIntegerArray({5,10,40,100})}"data-th-value="${i}" data-th-selected=${i eq page.size}></option>
```

#### 条件运算符

```html
<tr th:class="${row.even} ? 'even':'odd'"> ... </tr>
```

#### 无操作

_   th:text中取span标签中的值"no user authenticated"

```html
<span th:text="${user.name}?:_">no user authenticated</span>
```



 ### 设置属性值

#### 设置任意属性值

语法：th:attr

```html
<form action="subscribe.html" th:attr="action=@{/subscribe}">
    <fieldset>
        <input type="text" name="email"/>
        <input type="submit" value="Subscribe" th:attr="value=#{subscribe.submit}"/>
    </fieldset>  
</form>
```

效果:

```html
<form action="/项目名/subscribe.html">
    <fieldset>
        <input type="text" name="email"/>
        <input type="submit" value="name"/>
    </fieldset>
</form>
```

th:attr="value=#{subscribe.submit}"

th:attr="action=@{/subscribe}" 会替换原型中的值。

#### 设置值到指定的属性

```html
<form action="subscribe.html" th:action="@{/subscribe}">
    <fieldset>
        <input type="text" name="email"/>
        <input type="submit" value="Subscribe" th:value="#{subscribe.submit}"/>
    </fieldset>  
</form>
```

th:action="@{/subscribe}" 替换原型中的action属性值。

th:value="#{subscribe.submit}" 替换原型中的value属性值。

#### 固定值布尔属性

```html
<input type="checkbox" name="option1" checked>
<input type="checkbox" name="option2" checked="checked">
```

 

### 迭代器

### 添加语句

### 模板布局

### 属性优先级

### 注释

### 内联

### 基本对象

### 工具对象

### 其他





- **th:insert**   ：保留自己的主标签，保留th:fragment的主标签。



> 模板内容(header.html)

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<body>
	<div th:fragment="header" class="xxx">
    	中华人民共和国
    </div>
    </body>
</html>
```

引用模板代码

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
    <head>
        ...
    </head>
<body>
	<div class="condition">
        <div class="top" th:insert="header :: header">
            
        </div>
    </div>
    </body>
</html>
```

最终代码

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
    <head>
        ...
    </head>
<body>
	<div class="condition">
        <div class="top">
            <div  class="xxx">
            中华人民共和国
            </div>
        </div> 
    </div>
    </body>
</html>
```



- `th:replace` ：不要自己的主标签，保留th:fragment的主标签。



> 模板内容(header.html)

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<body>
	<div th:fragment="header" class="xxx">
    	中华人民共和国
    </div>
    </body>
</html>
```

引用模板代码

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
    <head>
        ...
    </head>
<body>
	<div class="condition">
        <div class="top" th:replace="header :: header">
            
        </div>
    </div>
    </body>
</html>
```

最终代码

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
    <head>
        ...
    </head>
<body>
	<div class="condition">
        <div  class="xxx">
    	中华人民共和国
    	</div>
    </div>
    </body>
</html>
```



- `th:include` ：保留自己的主标签，不要th:fragment的主标签。（官方3.0后不推荐）

> 

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<body>
	<div th:fragment="header" class="xxx">
    	中华人民共和国
    </div>
    </body>
</html>
```

引用模板代码

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
    <head>
        ...
    </head>
<body>
	<div class="condition">
        <div class="top" th:include="header :: header">
            
        </div>
    </div>
    </body>
</html>
```

最终代码

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
    <head>
        ...
    </head>
<body>
	<div class="condition">
    	中华人民共和国
    </div>
    </body>
</html>
```









