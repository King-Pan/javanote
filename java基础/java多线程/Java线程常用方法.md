#线程的常用方法

##start方法

Thread类的start()方法启动一个新线程，然后虚拟机调用新线程的run方法

##run方法

run方法包括线程运行时执行的代码，通常在子类中重写它

## 获取当前线程信息

```java
Thread thread=Thread.currentThread();
```

获取当前线程名称

```java
//第一种
Thread.currentThread().getName()
    
//第二种
Thread thread=Thread.currentThread();
String threadName = thread.getName();
```

## join方法

处在"执行状态"的线程如果调用了其他线程的join方法，将被挂起进入"阻塞状态"。

目标线程执行完毕后才会结束阻塞，回到"可执行状态"。

* join方法是Thread类的实例方法
* join方法需要捕获InterruptException异常
* 调用该方法后，需要调用该方法的线程执行完后，当前线程才能继续执行。

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



## yield方法

yield方法暂停当前正在执行的代码让出CPU时间片段，

* yield方法是Thread类的静态方法
* yield释放CPU，让出CPU时间片段
* yield不释放锁资源

## sleep方法

```java
public void sleep(long millis)
```

Thread类的sleep方法用于让当前线程暂时休眠一端时间

参数millis的单位是毫秒

* sleep必须捕获InterruptException异常
* sleep不释放锁资源，也就是说如果有synchronized同步代码块，其他线程仍然不能访问共享数据。
* sleep是Thread类的静态方法

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



## wait()和notify()、notifyAll()

> 这三个方法用于协调多个线程对共享数据的存取，所以必须在synchronized语句块内使用。

synchronized关键字用于保护共享数据，阻止其他线程对共享数据的存取，但是这样程序的流程就很不灵活了，如何才能在当前线程还没退出synchronized数据块时让其他线程也有机会访问共享数据呢？此时就用这三个方法来灵活控制。

* wait()方法使当前线程暂停执行并释放对象锁标示，让其他线程可以进入synchronized数据块，当前线程被放入对象等待池中。
* 当调用notify()方法后，将从对象的等待池中移走一个任意的线程并放到锁标志等待池中，只有锁标志等待池中线程能够获取锁标志；
* 如果锁标志等待池中没有线程，则notify()不起作用。
* notifyAll()则从对象等待池中移走所有等待那个对象的线程并放到锁标志等待池中。
* 注意 这三个方法都是java.lang.Object的方法。

## setPriority方法、getPriority方法

* getPriority: 获取当前线程的优先级
* setPriority: 设置当前线程的优先级

> Java为线程设置了10个优先级，分别使用1~10内的整数表示，整数值越大优先级越高。每个线程都有一个默认的优先级，主线程的默认优先级是5

#### Thread类定义了三个常量分别代表了几个常用的优先级:

- MAX_PRIORITY: 代表了最高优先级10
- MIN_PRIORITY:代表了最低优先级别1
- NORM_PRIORITY:代表了正常优先级别5

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



## 获取线程的信息

#### 获取当前线程

```java
Thread thread=Thread.currentThread();
```

获取当前线程名称

```java
Thread.currentThread().getName()
    
//第二种
Thread thread=Thread.currentThread();
String threadName = thread.getName();
```

