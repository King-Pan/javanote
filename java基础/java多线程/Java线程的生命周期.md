# 线程的生命周期

> 线程的生命周期:

- 指线程从创建到启动，知道运行结束
- 可以通过调用Thread类的相关方法影响线程的运行状况

> 线程的运行状态

- 新建(New)
- 可执行(Runnable)
- 运行(Running)
- 阻塞(Blocking)
- 死亡(Dead)

![线程状态转换图](/Users/king-pan/javanote/java基础/java多线程/images/thread_state.png)

## 新建状态(New)

> 当创建了一个Thread对象时，该对象就处于“新建状态”，
>
> 没有启动，因此无法运行

## 可执行状态(Runnable)

> 其他线程调用了处于新建状态线程的start方法，该 线程对象将装换到"可执行状态"
>
> 线程拥有获取CPU控制权的机会，出在等待调度阶段

## 运行状态(Running)

> 出在"可执行状态"的线程对象一旦获得了CPU控制权，就会装换到"可执行状态"
>
> 在"执行状态下"，线程状态占用CPU时间片段，执行run方法中的代码
>
> 出在"执行状态"下的线程可以调用yield方法，该方法用于主动让出CPU控制权。线程对象出让控制权后回到"可执行状态"，重新等待调度。

## 阻塞状态(Blocking)

> 线程在"执行状态"下由于某种条件的影响会被迫出让CPU控制权，进入"阻塞状态"。

### 进入阻塞状态的三种情况

* 调用sleep方法
* 调用join方法
* 执行I/O操作

#### 调用sleep方法

```java
public void sleep(long millis)
```

> Thread类的sleep方法用于让当前线程暂时休眠一端时间
>
> 参数millis的单位是毫秒

```java
public class SleepThread extends Thread {
    @Override
    public void run() {
        while (true){
            try {
                Thread.sleep(5000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("心跳测试");
        }
    }
}
```

没5秒测试一下心跳。

#### 调用join方法(合并某个线程)

> 出在"执行状态"的线程如果调用了其他线程的join方法，将被挂起进入"阻塞状态"。
>
> 目标线程执行完毕后才会解除阻塞，回到"可执行状态"。

```java
public class JoinThread extends Thread {
    @Override
    public void run() {
        for(int i=1;i<51;i++){
            System.out.println(i);
        }
        System.out.println("JoinThread 结束");
    }

    public static void main(String[] args) {
        JoinThread joinThread = new JoinThread();
        joinThread.start();
        try {
            joinThread.join();
        }catch (InterruptedException e){
            e.printStackTrace();
        }
        System.out.println("主线程结束");
    }
}
```



#### 执行I/O操作

> 线程在执行过程中如果因为访问外部资源(等待用户键盘输入，访问网络)时发生了阻塞，也会导致当前线程进入"阻塞状态"。



#### 接触阻塞

* 睡眠状态超时
* 调用了join后等待其他线程执行完毕
* I/O操作执行完毕
* 调用了阻塞线程的interrupt方法(线程睡眠时，调用该线程的interrupt方法会抛出InterruptedException异常)

```java
public class InterruptThread extends Thread {
    @Override
    public void run() {
        try {
            sleep(10000000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        for (int i=0;i<=5;i++){
            System.out.println(i);
        }
    }


    public static void main(String[] args) {
        InterruptThread thread = new InterruptThread();
        thread.start();
        thread.interrupt();
    }
}
```

##死亡状态(Dead)

> 处于"执行状态"的线程一旦从run方法返回(无论是正常退出还是抛出异常)，就会进入"死亡状态"。
>
> 已经"死亡"的线程不能重新运行，否则会抛出IllegalThreadStateException
>
> 可以使用Thread类的isAlive方法判断线程是否或者。

```java
public class DeadThread extends Thread {
    @Override
    public void run() {
        for (int i=0;i<=3;i++){
            System.out.println("正在执行线程");
        }
        try {
            sleep(10000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        DeadThread deadThread = new DeadThread();
        System.out.println("未启动的线程"+(deadThread.isAlive()?"正在活动":"没有活动"));
        deadThread.start();
        System.out.println("已启动的线程"+(deadThread.isAlive()?"正在活动":"没有活动"));
        try {
            deadThread.join();
        }catch (InterruptedException e){
            e.printStackTrace();
        }
        System.out.println("已终止的线程"+(deadThread.isAlive()?"正在活动":"没有活动"));
    }
}
```

## 线程调度

> 按照特定机制为线程分配CPU时间片段的行为
>
> Java程序运行时，由Java虚拟机负责线程的调度

### 线程调度的实现方式

> 分时调度模型: 让所有线程轮流获得CPU的控制器，并且为每个线程平均分配CPU时间片端

> 抢占式调度模型: 选择优先级相对较高的线程执行，如果所有线程的优先级相同，则随机选择一个线程执行。Java虚拟机采用此种调度模型。

### 线程的优先级

#### Thread类提供了获取和设置线程优先级的方法

* getPriority: 获取当前线程的优先级
* setPriority: 设置当前线程的优先级

> Java为线程设置了10个优先级，分别使用1~10内的整数表示，整数值越大优先级越高。每个线程都有一个默认的优先级，主线程的默认优先级是5

#### Thread类定义了三个常量分别代表了几个常用的优先级:

* MAX_PRIORITY: 代表了最高优先级10
* MIN_PRIORITY:代表了最低优先级别1
* NORM_PRIORITY:代表了正常优先级别5

> setPriority方法不一定起作用，在不同的操作系统、不同的JVM上，效果也可能不同。操作系统也不能保证设置了优先级的线程就一定会先运行或得到更多的CPU时间。

```java
public class ScheduleThread extends Thread {
    private String name;

    public ScheduleThread(String name) {
        this.name = name;
    }

    @Override
    public void run() {
        for (int i = 1; i <= 5; i++) {
            System.out.println("线程" + Thread.currentThread().getName() + " 输出:" + i);
        }
    }

    @Override
    public String toString() {
        return name;
    }

    public static void main(String[] args) {
        System.out.println("============主线程优先级============");
        System.out.println("主线程优先级:"+Thread.currentThread().getPriority());
        ScheduleThread scheduleThread1 = new ScheduleThread("job1");
        ScheduleThread scheduleThread2 = new ScheduleThread("job2");
        System.out.println("线程" + scheduleThread1.name + scheduleThread1.getPriority());
        System.out.println("线程" + scheduleThread2.name + scheduleThread2.getPriority());

        System.out.println("设置job1为最高级别");
        scheduleThread1.setPriority(MAX_PRIORITY);
        System.out.println("设置job2为最低级别");
        scheduleThread2.setPriority(MIN_PRIORITY);

        System.out.println("线程" + scheduleThread1.name + scheduleThread1.getPriority());
        System.out.println("线程" + scheduleThread2.name + scheduleThread2.getPriority());

        System.out.println("启动线程");
        scheduleThread1.start();
        scheduleThread2.start();
    }
}
```

