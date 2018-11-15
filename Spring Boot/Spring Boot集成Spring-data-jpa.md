# Spring Boot集成Spring-Data-Jpa









## 常见问题



### @DynamicUpdate 在Spring-Boot中失效

> DynamicUpdate的作用不是更新指定字段，而是更新变化的字段；



> 解决方法1

```java
T t = repository.findOne(ID);
t.setA(v1); //把需要更新的字段值设置到从数据库查询的对象中
t.setB(v2);
repository.save(t);//更新到数据库中
```



> 解决方法2

```java
# 自定义update方法
```

> 解决方法3

```java

```

