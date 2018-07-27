# JVM内存结构

JVM运行时内存区域主要分为: 程序计数器，jvm栈，本地方法栈，堆，方法区

共享内存区域: 方法区和堆内存是所有的线程共享的

线程隔离内存区域:  Java栈、本地方法栈、程序计数器



![JVM内存结构图](./imgs/JVM内存图.jpg) 



## 方法区

>  方法区中主要存储了以下信息:

* 类的各种加载信息
* 常量
* 静态变量

方法区会被垃圾回收，但是条件比较苛刻，几乎不会被回收.

### JDK1.6/1.7(永久代)

方法区在jdk1.6、1.7中被称为==永久区PermGen==

jdk1.7的Hotspot中就把存放在永久区的字符串常量池移除，放到本地内存（物理内存）

> 可以 通过参数调节方法区大小

* -XX:PermSize            初始化方法区大小
* -XX:MaxPermSize     方法区最大内存

永久代发生内存溢出报错: ==java.lang.OutOfMemoryError PermGen space==

### jdk1.8(元数据区)

> 可以通过参数条件元数据大小(MetaSpace)

* -XX:MetaspaceSize              初始化元数据大小
* -XX:MaxMetaspaceSize       最大元数据空间大小

元数据区发生内存溢出报错: ==java.lang.OutOfMemoryError Metaspace==

## 堆内存区域

​	对于大多数应用来说，Java堆(Java Heap)是java虚拟机所管理的内存中最大的一块。Java堆是被所有线程共享的一块内存区域，在虚拟机启动时创建。此内存区域的唯一目的就是存放对象实例，几乎所有的对象实例都是在这里分配内存。这一点在Java虚拟机规范中的描述是: 所有的对象实例以及数组都要在堆上分配。

​	Java堆是垃圾收集器管理的主要区域，因此很多时候也被称为"GC堆"。

	>Java堆中还可以细分为:

* 新生代

  > Eden空间

  > From Survivor空间

  > ToSurivivor空间

* 老年代;有Eden空间













