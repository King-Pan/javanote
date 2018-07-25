#### spring security

#### spring security牛刀小试

在spring boot项目中添加spring security依赖后，默认开启spring security功能，如果需要关闭，需要手动配置

```
security:
  basic:
    enabled: true # true开启，false关闭,默认开启
```

```
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-security</artifactId>
</dependency>
```

开启spring security默认功能后，会在项目启动时内置了一个user用户admin，密码在控制台找
2d0bd144-a093-4ead-a2d6-6ea0c2d98bf7

```
2017-12-28 14:17:04.411  INFO 9961 --- [  restartedMain] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/**] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
2017-12-28 14:17:04.556  INFO 9961 --- [  restartedMain] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/**/favicon.ico] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
2017-12-28 14:17:05.698  INFO 9961 --- [  restartedMain] b.a.s.AuthenticationManagerConfiguration : 

Using default security password: 2d0bd144-a093-4ead-a2d6-6ea0c2d98bf7

2017-12-28 14:17:05.830  INFO 9961 --- [  restartedMain] o.s.s.web.DefaultSecurityFilterChain     : Creating filter chain: OrRequestMatcher [requestMatchers=[Ant [pattern='/css/**'], Ant [pattern='/js/**'], Ant [pattern='/images/**'], Ant [pattern='/webjars/**'], Ant [pattern='/**/favicon.ico'], Ant [pattern='/error']]], []
```

默认的登录窗口为:

默认的登录窗口为:

![默认登录窗口](http://upload-images.jianshu.io/upload_images/6331401-e4d5b17f29aa8477.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


#### 问题

> 用户密码都是系统内置的，不符合生成需求

> 登录界面太丑，不忍直视
 
> 其他问题后续慢慢发现

### 表单登录

Spring Security 默认的登录窗口默认
现在我们需要表单登录那么我们就需要修改Spring Security的默认配置

```
package club.javalearn.crm.security.browser;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * crm-parent
 *
 * @author king-pan
 * @date 2017-12-28
 **/
@Configuration
public class BrowserSecurityConfig extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //http.httpBasic()
        http.formLogin() //表单登录
            .and().authorizeRequests().anyRequest().authenticated(); //任何请求都需要身份认证
    }
}
```

### 个性化用户认证流程

#### 自定义登录界面

#### 自定义登录成功处理

#### 自定义登录失败处理


### Spring Security开发基于表单的认证

#### 自定义用户认证逻辑

> 处理用户信息获取逻辑

```
package org.springframework.security.core.userdetails;

public interface UserDetailsService {
    UserDetails loadUserByUsername(String username) 
        throws UsernameNotFoundException;
}
```

> 处理用户校验逻辑

```
public interface UserDetails extends Serializable {
    //获取权限
    Collection<? extends GrantedAuthority> getAuthorities();
    //获取密码
    String getPassword();
    //获取用户名 
    String getUsername();
    //用户没有过期
    boolean isAccountNonExpired();
    //账号是否锁定
    boolean isAccountNonLocked();
    //密码是否过期
    boolean isCredentialsNonExpired();
    //账户是否可用
    boolean isEnabled();
}
```

> 处理密码加密解密逻辑

```
public interface PasswordEncoder {
    //加密是开发人员调用
    String encode(CharSequence rawPassword);
    //Spring Security框架调用,匹配成功返回true，匹配失败返回false
    boolean matches(CharSequence rawPassword, String encodedPassword);
}
```

在Spring Security配置类中添加一个配置

```
@Bean
public PasswordEncoder passwordEncoder(){
    return new BCryptPasswordEncoder();
}
```










#### 处理
org.springframework.security.core.userdetails.UserDetailsService
