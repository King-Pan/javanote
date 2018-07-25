## Thymeleaf模板配置

>**部分属性**

```YAML
server:
  port: 9999
spring:
  thymeleaf:
    # 开启模板缓存 (默认开启)
    cache: false
    # 检查文档
    check-template: true
    # 检查文档位置
    check-template-location: true
    # context-type的值
    content-type: text/html
    # 开启MVC Thymeleaf 模板解析(默认为true)
    enabled: true
    # 字符编码
    encoding: UTF-8
    # 排除在解析器之外的视图名称列表,用逗号分隔
    excluded-view-names:
    # 模板模式
    mode: HTML5
    # 视图名称前缀
    prefix: classpath:/templates/
    # 视图名称后缀
    suffix: .html
    # 模板解析器在解析器链的顺序
    template-resolver-order:
    # 可解析的视图名称列表,用逗号隔开
    view-names:
```

>**报错**
>**默认情况下不要配置view-names,除非有必要,不然会报404**
∂
```YAML
spring:
  thymeleaf:
    # 可解析的视图名称列表,用逗号隔开
    # view-names:
```