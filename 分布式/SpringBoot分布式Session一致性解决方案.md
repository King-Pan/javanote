# SpringBoot分布式Session一致性解决方案

## Maven依赖

```xml
<!-- springboot - Redis -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-redis</artifactId>
</dependency>
<!--spring session 与redis应用基本环境配置,需要开启redis后才可以使用，不然启动Spring boot会报错 -->
<dependency>
    <groupId>org.springframework.session</groupId>
    <artifactId>spring-session-data-redis</artifactId>
</dependency>
```

## application.properties

pplication.properties  特别注意此处需要spring.session.store-type

```properties
########################  Redis ###################################
spring.redis.database=0
spring.redis.host=127.0.0.1
spring.redis.port=6379
spring.redis.password=
# 连接池最大连接数
spring.redis.pool.max-active=8
spring.redis.pool.max-wait=-1
# 连接池中的最大空闲连接
spring.redis.pool.max-idle=8
# 连接池中的最小空闲连接
spring.redis.pool.min-idle=0
# 连接超时时间（毫秒）
spring.redis.timeout=0

spring.session.store-type=redis
```

## Config

```java
/**
 * @author Nick
 * @version V1.0.0
 * @Date 2017/12/2 22:06
 * @description 分布式Session，使用spring.session.store-type=redis自动配置
 */
@EnableRedisHttpSession(maxInactiveIntervalInSeconds= 1800)
public class SessionConfig {

    @Bean
    public HttpSessionStrategy httpSessionStrategy() {
        return new HeaderHttpSessionStrategy();
    }

}
```



在Controller中直接编写平常的代码即可  `request.getSession().setAttribute("xxx", "xxxxx");`



 