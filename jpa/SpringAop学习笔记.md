


![springaop学习项目依赖](http://upload-images.jianshu.io/upload_images/6331401-4a9ee575aecb7852.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


```
<dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-aop</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-thymeleaf</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>

        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <scope>runtime</scope>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>
```


### 最原始暴力的性能检测

![性能检测与日志记录](http://upload-images.jianshu.io/upload_images/6331401-fdbf8682650bcd51.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 优雅一点的性能检测

>**特点**

* 需要编码
* 对代码有侵入性
* 不能解耦

>**性能检测的方法执行信息**

```
package club.javalearn.springaop.basic.proxy;

/**
 * springaop
 *    性能检测的方法执行信息
 * @author king-pan
 * @create 2017-09-12
 **/
public class MethodPerformance {
    //开始时间
    private long begin;
    //结束时间
    private long end;

    //执行方法名
    private String serviceMethod;

    public MethodPerformance(String serviceMethod){
        //记录方法名称
        this.serviceMethod = serviceMethod;
        //记录开始时间
        this.begin = System.currentTimeMillis();
    }

    public void printPerfromance(){
        //记录结束时间
        end = System.currentTimeMillis();
        long elapse = end - begin;
        //打印性能检测信息
        System.out.println(serviceMethod+": 共花费了 ["+elapse+"]毫秒.");
    }
}
```

>**性能检测器**

```
package club.javalearn.springaop.basic.proxy;

/**
 * springaop
 * 性能检测器
 * @author king-pan
 * @create 2017-09-12
 **/
public class PerformanceMonitor {

    //1. 通过一个ThreadLocal保存与调用线程相关的性能检测器
    private static ThreadLocal<MethodPerformance> performanceThreadLocal = new ThreadLocal<>();

    //2. 启动对某一目标方法的性能检测
    public static void begin(String method){
        System.out.println("开始性能检测.");
        MethodPerformance methodPerformance = new MethodPerformance(method);
        performanceThreadLocal.set(methodPerformance);
    }

    public static void end(){
        System.out.println("结束性能检测.");
        MethodPerformance methodPerformance = performanceThreadLocal.get();
        //3. 打印性能检测信息
        methodPerformance.printPerfromance();
    }

}
```


>**改动前的业务代码**

```
@Override
public boolean login(String userName, String password) {
    //现在有一个需求： 对登录进行日志记录，然后系统监控，最后优化登录
    long start = System.currentTimeMillis();
    //1.记录日志
    //2.记录开始时间
    boolean flag = false;
    User user = getUserByUserName(userName);
    if(user!=null){
        if(user.getPassword().equals(password)){
            flag = true;
            logger.info("用户{}登录成功",userName);
        }
    }
    //3. 记录结束时间
    long end = System.currentTimeMillis();
    //4. 统计耗时
    logger.info("用户{}登录共耗时{}秒",userName,(end-start));

    return flag;
}
```

>**改动后的业务代码**

对比改动前的业务代码，发现改动后的代码优雅一点，但是还是不能满足我们的要求:
要求: **对登录进行日志记录，然后系统监控，最后优化登录**

我们检测性能，找到原因后，就可以不用要性能检测的代码了，难道还要让我修改业务代码吗？

有没有一种方法可以让性能检测的代码对我们的业务代码无侵入性呢？

想想设计模式中有一种动态代理模式,或者它能帮助我们解决问题。

```
@Override
public boolean login(String userName, String password) {
    //1. 开始性能检测
    PerformanceMonitor.begin("club.javalearn.springaop.basic.service.impl.UserServiceImpl.login");
    boolean flag = false;
    User user = getUserByUserName(userName);
    if(user!=null){
        if(user.getPassword().equals(password)){
            flag = true;
            logger.info("用户{}登录成功",userName);
        }
    }
    //2. 结束性能检测
    PerformanceMonitor.end();
    return flag;
}
```
