# 1、类文件结构

​	代码编译的结果从本地机器码转变成字节码，是存储格式发展的一小步，却是变成语言发展的一大步。

## 1.1、概述

​	计算机只认识0和1，所以我们写的程序需要经编译器编译成由0和1够成的二进制格式才能由计算机执行。

​	Java是跨平台的，实现了与操作系统和机器指令集无关的、平台中立的格式作为程序编译后的存储格式。

​	Java虚拟机通过实现在各种不同的平台上(操作系统)的虚拟机，从而实现了程序的“一次编写，到处运行”。

​	实现语言无关性的基础任然是虚拟机和字节码存储格式。Java虚拟机不和包括Java在内的任何语言绑定，它只与"Class文件"这种特定的二进制文件格式所关联，Class文件中包含了Java虚拟机指令集和符号表以及若干其他辅助信息。基于安全方面的考虑，Java虚拟机规范要求在Class文件中使用许多强制性的语法和结构化约束，单任一门功能性语言都可以表示为一个能被Java虚拟机所接受的有效的Class文件。作为一个通用的、机器无关的执行平台，任何其他语言的实现者都可以讲Java虚拟机作为语言的产品交付媒介。例如，使用Java编译器可以把Java代码编译成存储字节码的Class文件，使用JRuby等其他语言的编译器一样可以把程序代码编译成Class文件，虚拟机并不关心Class的来源是何种语言。

​	Java语言中的各种变量、关键字和运算符好的语义最终都是由多条字节码命令组合而成的，因此字节码命令所提供的语义描述能力肯定比Java语言本身更加强大。一次有一些Java语言本身无法有效支持的语言特效不代表字节码本身无法有效支持，这也为其他语言实现一些有别于Java语言的特性特供了基础。

![jvm语言无关性](/Users/king-pan/javanote/jvm/imgs/JVM-类结构.jpg)



## 1.2、Class类文件结构

​	我们都知道Java实现跨平台靠的是虚拟机技术，将源文件编译成与操作系统无关的，只有虚拟机能识别并执行的字节码文件，由各个操作系统上的jvm来负责执行，屏蔽了底层的具体操作系统。

​	为了节省空间，类文件中没有任何分隔符，各个数据项都是一个挨着一个紧凑排列的，所以其中无论是顺序还是数量等都是严格规定的，哪个字节代表什么含义，长度是多少，先后顺序如何，都不允许改变。下图是类文件的整体结构



![Class类文件结构](/Users/king-pan/javanote/jvm/imgs/jvm-comp.png)

### 1.2.1、魔数

​	魔数是用来确定文件的类型是否是class文件，因为只靠文件扩展名来确定文件类型并不可靠。

​	这个魔数占文件的开始4个字节，为CA FE BA BE。（注意：这里的字面代表的是十六进制数，而不是ASCII码）

### 1.2.2、版本号

​	接下来的4个字节为class文件版本号，其中前两个字节表示的是次版本号，后两个字节表示的是主版本号（从45开始）。

​	虚拟机可以向下兼容运行class文件，但不能运行高于其版本的class文件。

### 1.2.3、常量池

​	由于常量池中的常量数量是不确定的，所以在常量池的入口需要有两个字节用来代表常量池容量计数值（常量池索引从1开始）。

​	一共有14种常量类型，有着各自对应的结构，但开始的一个字节同样都是表示标志位，用来区分不同的类型。

​	下面为14种常量的具体类型和对应的标志位：

![常量详情](/Users/king-pan/javanote/jvm/imgs/jvm-class常量类型.png)

  每种类型的结构如下（其中u1表示1个字节，u2表示2个字节，其他同理）：

 ![类型长度](/Users/king-pan/javanote/jvm/imgs/jvm-class常量类型长度.png)

​	读取常量池的时候首先读取标志位，判断常量类型，就可以知道对应的结构，获取对应的信息了。

###1.2.4、访问标志

 	常量池之后的两个字节代表访问标志，即这个class是类还是接口，是否为public等的信息。不同的含义有不同的标志值（没有用到的标志位一律为0。），具体信息如下：

![访问修饰符](/Users/king-pan/javanote/jvm/imgs/jvm-访问修饰符.png)

### 1.2.5、类索引

​	类索引占两个字节，分别指向常量池中的CONSTANT_Class_info类型的常量，这个类型的常量结构见常量池中的图表，其中包含一个指向全限定名常量项的索引。

### 1.2.6、父类索引

​	因为java只允许单继承，所以只有一个父类，具体内容同上-类索引。

### 1.2.7、接口索引

​	接口索引开始两个字节用来表示接口的数量，之后的每两个字节表示一个接口索引，用法同类索引与父类索引。

### 1.2.8、 字段

​	字段用于描述接口或者类中声明的变量，包括类级变量以及实例变量，但不包括局部变量。

​	字段域的开始两个字节表示字段数量，之后为紧密排列的字段结构体数据，其结构如下：

![字段](/Users/king-pan/javanote/jvm/imgs/jvm-field.png)

​	其中的字段和方法的描述符，对于字段来说用来描述**字段的数据类型**；而对于方法来说，描述的就是**方法的参数列表（包括数量、类型以及顺序）和返回值**，这个描述顺序也是固定的，必须是参数列表在前，返回值在后，参数列表必须放在一组小括号内。同时为了节省空间，各种数据类型都使用规定的一个字母来表示，具体如下：

 ![字段含义](/Users/king-pan/javanote/jvm/imgs/jvm-field2.png)

​	对象使用L加上对象的全限定名来表示，而数组则是在每一个维度前添加一个"["来描述。

### 1.2.9、方法

​	class文件中对方法的描述与以前对字段的描述几乎采用了完全一致的方式，唯一的区别就是访问类型不完全一致。

 

### 1.2.10、属性

​	java7中预定义了21项属性，具体内容限于篇幅不再列出。

对于每个属性的结构，没有特别严格的要求，并且可以自定义属性信息，jvm运行时会忽略不认识的属性。

符合规范的属性表基本结构如下：

 ![属性](/Users/king-pan/javanote/jvm/imgs/jvm-sx.png)

其中前两个字节为指向常量池中的CONSTANT_Utf8_info类型的属性名称，之后4个字节表示属性值所占用的位数，最后就是具体属性了。

 其中有一个比较重要的名称为「Code」的属性为方法的代码，即字节码指令。

Code属性表结构如下：

![Code属性表结构](/Users/king-pan/javanote/jvm/imgs/jvm-sx2.png)