Spring Data : Spring 的一个子项目。用于简化数据库访问，支持NoSQL 和 关系数据存储。其主要目标是使数据库的访问变得方便快捷。
SpringData 项目所支持 NoSQL 存储：
MongoDB （文档数据库）
Neo4j（图形数据库）
Redis（键/值存储）
Hbase（列族数据库）
SpringData 项目所支持的关系数据存储技术：
JDBC
JPA(Java Persistence API java持久层API)

## JPA Spring Data 概述

JPA Spring Data : 致力于减少数据访问层 (DAO) 的开发量. 开发者唯一要做的，就只是声明持久层的接口，其他都交给 Spring Data JPA 来帮你完成！
框架怎么可能代替开发者实现业务逻辑呢？比如：当有一个 UserDao.findUserById()  这样一个方法声明，大致应该能判断出这是根据给定条件的 ID 查询出满足条件的 User  对象。Spring Data JPA 做的便是规范方法的名字，根据符合规范的名字来确定方法需要实现什么样的逻辑。


## Jpa开发步骤


使用 Spring Data JPA 进行持久层开发需要的四个步骤：
- 配置 Spring 整合 JPA
- 在 Spring 配置文件中配置 Spring Data，让 Spring 为声明的接口创建代理对象。配置了 <jpa:repositories> 后，Spring 初始化容器时将会扫描 base-package  指定的包目录及其子目录，为继承 Repository 或其子接口的接口创建代理对象，并将代理对象注册为 Spring Bean，业务层便可以通过 Spring 自动封装的特性来直接使用该对象。
- 声明持久层的接口，该接口继承  Repository，Repository 是一个标记型接口，它不包含任何方法，如必要，Spring Data 可实现 Repository 其他子接口，其中定义了一些常用的增删改查，以及分页相关的方法。
- 在接口中声明需要的方法。Spring Data 将根据给定的策略（具体策略稍后讲解）来为其生成实现代码。

## Repository接口







Spring 