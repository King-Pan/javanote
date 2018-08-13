# Spring Boot与Swagger2集成

## 常见错误



###错误原因guava版本低

> Caused by: java.lang.NoSuchMethodError: com.google.common.collect.FluentIterable.toList()Lcom/google/common/collect/ImmutableList;

### 解决方法

配置兼容版本的guava

```xml
<dependency>
            <groupId>io.springfox</groupId>
            <artifactId>springfox-swagger2</artifactId>
            <version>2.8.0</version>
        </dependency>
        <dependency>
            <groupId>io.springfox</groupId>
            <artifactId>springfox-swagger-ui</artifactId>
            <version>2.8.0</version>
        </dependency>
        <dependency>
            <groupId>com.google.guava</groupId>
            <artifactId>guava</artifactId>
            <version>25.1-jre</version>
        </dependency>
```



###异常详情 

```java
com.asiainfo.cmcperson.CmcPersonApplication
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/Users/king-pan/.m2/repository/ch/qos/logback/logback-classic/1.2.3/logback-classic-1.2.3.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/Users/king-pan/.m2/repository/org/slf4j/slf4j-log4j12/1.7.25/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [ch.qos.logback.classic.util.ContextSelectorStaticBinder]

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.0.4.RELEASE)

2018-08-10 15:50:17.737  INFO 1224 --- [           main] c.a.cmcperson.CmcPersonApplication       : Starting CmcPersonApplication on King-Pan-PC with PID 1224 (/Users/king-pan/git_repository/cmc-person/target/classes started by king-pan in /Users/king-pan/git_repository/cmc-person)
2018-08-10 15:50:17.745  INFO 1224 --- [           main] c.a.cmcperson.CmcPersonApplication       : No active profile set, falling back to default profiles: default
2018-08-10 15:50:17.924  INFO 1224 --- [           main] ConfigServletWebServerApplicationContext : Refreshing org.springframework.boot.web.servlet.context.AnnotationConfigServletWebServerApplicationContext@40ef3420: startup date [Fri Aug 10 15:50:17 CST 2018]; root of context hierarchy
2018-08-10 15:50:20.739  INFO 1224 --- [           main] f.a.AutowiredAnnotationBeanPostProcessor : JSR-330 'javax.inject.Inject' annotation found and supported for autowiring
2018-08-10 15:50:21.614  INFO 1224 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
2018-08-10 15:50:21.655  INFO 1224 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2018-08-10 15:50:21.655  INFO 1224 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet Engine: Apache Tomcat/8.5.32
2018-08-10 15:50:21.663  INFO 1224 --- [ost-startStop-1] o.a.catalina.core.AprLifecycleListener   : The APR based Apache Tomcat Native library which allows optimal performance in production environments was not found on the java.library.path: [/Users/king-pan/Library/Java/Extensions:/Library/Java/Extensions:/Network/Library/Java/Extensions:/System/Library/Java/Extensions:/usr/lib/java:.]
2018-08-10 15:50:21.844  INFO 1224 --- [ost-startStop-1] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2018-08-10 15:50:21.844  INFO 1224 --- [ost-startStop-1] o.s.web.context.ContextLoader            : Root WebApplicationContext: initialization completed in 3956 ms
2018-08-10 15:50:21.984  INFO 1224 --- [ost-startStop-1] o.s.b.w.servlet.ServletRegistrationBean  : Servlet dispatcherServlet mapped to [/]
2018-08-10 15:50:21.991  INFO 1224 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'characterEncodingFilter' to: [/*]
2018-08-10 15:50:21.991  INFO 1224 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'hiddenHttpMethodFilter' to: [/*]
2018-08-10 15:50:21.991  INFO 1224 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'httpPutFormContentFilter' to: [/*]
2018-08-10 15:50:21.991  INFO 1224 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'requestContextFilter' to: [/*]
2018-08-10 15:50:22.646  INFO 1224 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/key]}" onto public java.lang.Object com.asiainfo.cmcperson.web.CustomerFlagController.getKey()
2018-08-10 15:50:22.649  INFO 1224 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/checkInNetFlag]}" onto public java.lang.Object com.asiainfo.cmcperson.web.CustomerFlagController.checkFlag(java.lang.String,java.lang.String)
2018-08-10 15:50:22.651  INFO 1224 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/list]}" onto public java.lang.Object com.asiainfo.cmcperson.web.HomeController.list()
2018-08-10 15:50:22.651  INFO 1224 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/query]}" onto public java.lang.Object com.asiainfo.cmcperson.web.HomeController.query()
2018-08-10 15:50:22.652  INFO 1224 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/all]}" onto public java.lang.Object com.asiainfo.cmcperson.web.HomeController.all()
2018-08-10 15:50:22.652  INFO 1224 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/]}" onto public org.springframework.web.servlet.ModelAndView com.asiainfo.cmcperson.web.HomeController.home()
2018-08-10 15:50:22.652  INFO 1224 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/tables]}" onto public java.lang.Object com.asiainfo.cmcperson.web.HomeController.tables()
2018-08-10 15:50:22.653  INFO 1224 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/find]}" onto public java.lang.Object com.asiainfo.cmcperson.web.HomeController.findByIdCard(java.lang.String,java.lang.String)
2018-08-10 15:50:22.664  INFO 1224 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/swagger-resources/configuration/ui]}" onto public org.springframework.http.ResponseEntity<springfox.documentation.swagger.web.UiConfiguration> springfox.documentation.swagger.web.ApiResourceController.uiConfiguration()
2018-08-10 15:50:22.665  INFO 1224 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/swagger-resources/configuration/security]}" onto public org.springframework.http.ResponseEntity<springfox.documentation.swagger.web.SecurityConfiguration> springfox.documentation.swagger.web.ApiResourceController.securityConfiguration()
2018-08-10 15:50:22.667  INFO 1224 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/swagger-resources]}" onto public org.springframework.http.ResponseEntity<java.util.List<springfox.documentation.swagger.web.SwaggerResource>> springfox.documentation.swagger.web.ApiResourceController.swaggerResources()
2018-08-10 15:50:22.674  INFO 1224 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/error]}" onto public org.springframework.http.ResponseEntity<java.util.Map<java.lang.String, java.lang.Object>> org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController.error(javax.servlet.http.HttpServletRequest)
2018-08-10 15:50:22.675  INFO 1224 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/error],produces=[text/html]}" onto public org.springframework.web.servlet.ModelAndView org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController.errorHtml(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse)
2018-08-10 15:50:22.876  INFO 1224 --- [           main] pertySourcedRequestMappingHandlerMapping : Mapped URL path [/v2/api-docs] onto method [public org.springframework.http.ResponseEntity<springfox.documentation.spring.web.json.Json> springfox.documentation.swagger2.web.Swagger2Controller.getDocumentation(java.lang.String,javax.servlet.http.HttpServletRequest)]
2018-08-10 15:50:23.024  INFO 1224 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/**/favicon.ico] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
2018-08-10 15:50:23.277  WARN 1224 --- [           main] ConfigServletWebServerApplicationContext : Exception encountered during context initialization - cancelling refresh attempt: org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'requestMappingHandlerAdapter' defined in class path resource [org/springframework/boot/autoconfigure/web/servlet/WebMvcAutoConfiguration$EnableWebMvcConfiguration.class]: Initialization of bean failed; nested exception is java.lang.NoSuchMethodError: com.google.common.collect.FluentIterable.toList()Lcom/google/common/collect/ImmutableList;
2018-08-10 15:50:23.283  INFO 1224 --- [           main] o.apache.catalina.core.StandardService   : Stopping service [Tomcat]
2018-08-10 15:50:23.448  WARN 1224 --- [ost-startStop-1] o.a.h.hbase.io.util.HeapMemorySizeUtil   : hbase.regionserver.global.memstore.upperLimit is deprecated by hbase.regionserver.global.memstore.size
2018-08-10 15:50:23.475  WARN 1224 --- [ost-startStop-1] o.a.h.hbase.io.util.HeapMemorySizeUtil   : hbase.regionserver.global.memstore.upperLimit is deprecated by hbase.regionserver.global.memstore.size
2018-08-10 15:50:23.494  INFO 1224 --- [           main] ConditionEvaluationReportLoggingListener : 

Error starting ApplicationContext. To display the conditions report re-run your application with 'debug' enabled.
2018-08-10 15:50:23.524 ERROR 1224 --- [           main] o.s.boot.SpringApplication               : Application run failed

org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'requestMappingHandlerAdapter' defined in class path resource [org/springframework/boot/autoconfigure/web/servlet/WebMvcAutoConfiguration$EnableWebMvcConfiguration.class]: Initialization of bean failed; nested exception is java.lang.NoSuchMethodError: com.google.common.collect.FluentIterable.toList()Lcom/google/common/collect/ImmutableList;
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:581) ~[spring-beans-5.0.8.RELEASE.jar:5.0.8.RELEASE]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:495) ~[spring-beans-5.0.8.RELEASE.jar:5.0.8.RELEASE]
	at org.springframework.beans.factory.support.AbstractBeanFactory.lambda$doGetBean$0(AbstractBeanFactory.java:317) ~[spring-beans-5.0.8.RELEASE.jar:5.0.8.RELEASE]
	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:222) ~[spring-beans-5.0.8.RELEASE.jar:5.0.8.RELEASE]
	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:315) ~[spring-beans-5.0.8.RELEASE.jar:5.0.8.RELEASE]
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:199) ~[spring-beans-5.0.8.RELEASE.jar:5.0.8.RELEASE]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.preInstantiateSingletons(DefaultListableBeanFactory.java:759) ~[spring-beans-5.0.8.RELEASE.jar:5.0.8.RELEASE]
	at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:869) ~[spring-context-5.0.8.RELEASE.jar:5.0.8.RELEASE]
	at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:550) ~[spring-context-5.0.8.RELEASE.jar:5.0.8.RELEASE]
	at org.springframework.boot.web.servlet.context.ServletWebServerApplicationContext.refresh(ServletWebServerApplicationContext.java:140) ~[spring-boot-2.0.4.RELEASE.jar:2.0.4.RELEASE]
	at org.springframework.boot.SpringApplication.refresh(SpringApplication.java:762) [spring-boot-2.0.4.RELEASE.jar:2.0.4.RELEASE]
	at org.springframework.boot.SpringApplication.refreshContext(SpringApplication.java:398) [spring-boot-2.0.4.RELEASE.jar:2.0.4.RELEASE]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:330) [spring-boot-2.0.4.RELEASE.jar:2.0.4.RELEASE]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1258) [spring-boot-2.0.4.RELEASE.jar:2.0.4.RELEASE]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1246) [spring-boot-2.0.4.RELEASE.jar:2.0.4.RELEASE]
	at com.asiainfo.cmcperson.CmcPersonApplication.main(CmcPersonApplication.java:12) [classes/:na]
Caused by: java.lang.NoSuchMethodError: com.google.common.collect.FluentIterable.toList()Lcom/google/common/collect/ImmutableList;
	at springfox.documentation.spring.web.ObjectMapperConfigurer.jackson2Converters(ObjectMapperConfigurer.java:76) ~[springfox-spring-web-2.8.0.jar:2.8.0]
	at springfox.documentation.spring.web.ObjectMapperConfigurer.configureMessageConverters(ObjectMapperConfigurer.java:63) ~[springfox-spring-web-2.8.0.jar:2.8.0]
	at springfox.documentation.spring.web.ObjectMapperConfigurer.postProcessBeforeInitialization(ObjectMapperConfigurer.java:47) ~[springfox-spring-web-2.8.0.jar:2.8.0]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.applyBeanPostProcessorsBeforeInitialization(AbstractAutowireCapableBeanFactory.java:416) ~[spring-beans-5.0.8.RELEASE.jar:5.0.8.RELEASE]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1691) ~[spring-beans-5.0.8.RELEASE.jar:5.0.8.RELEASE]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:573) ~[spring-beans-5.0.8.RELEASE.jar:5.0.8.RELEASE]
	... 15 common frames omitted

2018-08-10 15:50:23.610  WARN 1224 --- [       Thread-2] o.a.h.hbase.io.util.HeapMemorySizeUtil   : hbase.regionserver.global.memstore.upperLimit is deprecated by hbase.regionserver.global.memstore.size

Process finished with exit code 1

```

