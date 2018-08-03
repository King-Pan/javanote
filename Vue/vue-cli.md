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
/dist/     --根目录下的dist目录
/*.js      --根目录下的js文件
```



## 2、Vue基础

## 2.1、Vue入门案例



## 2.2、模板方法

## 2.3、计算属性和侦听器

## 2.4、Class与Style绑定

## 2.5、列表渲染



