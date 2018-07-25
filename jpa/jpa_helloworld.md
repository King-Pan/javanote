



JPA持久化对象的步骤:
>**创建 persistence.xml, 在这个文件中配置持久化单元**

* 需要指定跟哪个数据库进行交互;
* 需要指定 JPA 使用哪个持久化的框架以及配置该框架的基本属性

>**创建实体类, 使用 annotation 来描述实体类跟数据库表之间的映射关系**

>**使用 JPA API 完成数据增加、删除、修改和查询操作**

* 创建 EntityManagerFactory (对应 Hibernate 中的 SessionFactory);
* 创建 EntityManager (对应 Hibernate 中的Session);

@Entity

@Table()

@Id
@Id 标注用于声明一个实体类的属性映射为数据库的主键列。该属性通常置于属性声明语句之前，可与声明语句同行，也可写在单独行上。
@Id标注也可置于属性的getter方法之前。

@GeneratedValue  用于标注主键的生成策略，通过 strategy 属性指定。默认情况下，JPA 自动选择一个最适合底层数据库的主键生成策略：SqlServer 对应 identity，MySQL 对应 auto increment。
在 javax.persistence.GenerationType 中定义了以下几种可供选择的策略：
IDENTITY：采用数据库 ID自增长的方式来自增主键字段，Oracle 不支持这种方式；
AUTO： JPA自动选择合适的策略，是默认选项；
SEQUENCE：通过序列产生主键，通过 @SequenceGenerator 注解指定序列名，MySql 不支持这种方式
TABLE：通过表产生主键，框架借由表模拟序列产生主键，使用该策略可以使应用更易于数据库移植。


@Basic

在JPA持久化类中的列,如果没有添加@Column注解,name默认添加@Basic注解

@Column

name: 指定数据库列明
length: 指定列长度,只对字符串类型有效
unique: 是否为唯一标识,默认为false。 
nullable: 是否可为空,默认为true
insertable: 表示在使用”INSERT”语句插入数据时，是否需要插入该字段的值
updateable:属性表示在使用”UPDATE”语句插入数据时，是否需要更新该字段的值
insertable和updateable属性一般多用于只读的属性，例如主键和外键等，这些字段通常是自动生成的
JPA自动选择合适的策略，是默认选项
采用数据库 ID自增长的方式来自增主键字段，Oracle 不支持这种方式
通过序列产生主键，通过 @SequenceGenerator 注解指定序列名，MySql 不支持这种方式
TABLE：通过表产生主键，框架借由表模拟序列产生主键，使用该策略可以使应用更易于数据库移植。
columnDefinition属性： 
columnDefinition属性表示创建表时，该字段创建的SQL语句，一般用于通过Entity生成表定义时使用 
如果数据库中表已经建好，该属性没有必要使用

table属性： 
table属性定义了包含当前字段的表名

length属性： 
length属性表示字段的长度，当字段的类型为varchar时，该属性才有效，默认为255个字符

precision属性和scale属性： 
precision属性和scale属性一起表示精度，当字段类型为double时，precision表示数值的总长度，scale表示小数点所占的位数

@Entity   实体类(默认表名与类名一致,可以通过@Table来指定表名)

@Entity 标注用于实体类声明语句之前，指出该Java 类为实体类，将映射到指定的数据库表。如声明一个实体类 Customer，它将映射到数据库中的 customer 表上。

当实体类与其映射的数据库表名不同名时需要使用 @Table 标注说明，该标注与 @Entity 标注并列使用，置于实体类声明语句之前，可写于单独语句行，也可与声明语句同行。
@Table 标注的常用选项是 name，用于指明数据库的表名
@Table标注还有一个两个选项 catalog 和 schema 用于设置表所属的数据库目录或模式，通常为数据库名。uniqueConstraints 选项用于设置约束条件，通常不须设置。


fetch: 表示该属性的读取策略,有 EAGER 和 LAZY 两种,分别表示主支抓取和延迟加载,默认为 EAGER.
optional:表示该属性是否允许为null, 默认为true



