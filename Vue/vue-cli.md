# 使用Vue-cli创建vue项目

## 1、安装vue-cli

```shell
$ npm install -g vue-cli
$ vue -V 测试vue-cli是否安装成功
```







![vue-cli创建Vue项目](/Users/king-pan/javanote/Vue/imgs/vue-cli.png)



启动vue项目: $ npm run dev

npm run dev 命令配置在package.json中

```json
 { "scripts": {
    "dev": "webpack-dev-server --inline --progress --config build/webpack.dev.conf.js",
    "start": "npm run dev",
    "lint": "eslint --ext .js,.vue src",
    "build": "node build/build.js"
  }
 }
```



build/ config/目录是一些配置文件。

.babelrc 是babe的配置文件，描述了ES6转换成ES5的规则。

.eslintrc.js eslint的配置文件

.eslintignore eslint检查忽略的文件和文件夹

```shell
/build/    --根目录下的build目录
/config/   --根目录下的config目录
/dist/     --根目录下的dist目录(发布目录)
/*.js      --根目录下的js文件
```

## 1.2、发布项目

> 发布到serve

* npm run build 打包项目
* serve dist
* 访问: http://localhost:8080(在config/index.js文件中的dev: port属性修改端口)

> 发布到动态服务器(tomcat)

* 修改配置webpack.prod.config.js

```json
output{
    publicPath: '/xxx/' //打包文件夹的名称
}
```



* 重新打包项目: npm run build
* 修改dist文件夹名为项目名称(与第一步的publicPath一致)
* 将项目文件夹拷贝到tomcat的webapps目录下
* 启动tomcat访问路径: http://localhost:8080(tomcat默认端口为8080)



## 1.3、ESLint代码规范检查工具的使用



> Strings must use singlequote  

```
字符串必须使用单引号
```





# 3、组件化编码

## 3.1、组件化编码流程

### 3.1.1、拆分组件

### 3.1.2、静态组件

### 3.1.3、动态组件

动态组件主要包括2部分： 初始化显示，动态交互



初始化数据放置的位置： 依据是某个还是某些组件用到，如果某个使用到了组件，那么放在该组件内部就行

如果多个组件用到，放置到他们的父组件中即可。



组件件通信：

1. 通过标签属性





使用``可以在中间使用vue表达式

```vue
if(window.confirm(`确定删除${comment.name} 的评论吗？`)){//vue可以替换表达式${comment.name}
	deleteComment(index)//执行删除操作
}
```





```
1. Uncaught RangeError: Maximum call stack size exceeded
2. 未捕获RangeError：超出最大调用堆栈大小
3. 解决办法，vue组件中自己引用自己导致无限循环引用
```





## 2、Vue基础

## 2.1、Vue入门案例



## 2.2、模板方法

## 2.3、计算属性和侦听器

## 2.4、Class与Style绑定

## 2.5、列表渲染



