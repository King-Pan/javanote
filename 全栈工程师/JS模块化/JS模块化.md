# JS模块化

## JS模块化演化过程

### 1、全局function模式

* module1.js

```js
//数据
let data = 'atguigu.com' 
//操作数据的函数
function foo() {
  console.log(`foo() ${data}`)
}
function bar() {
  console.log(`bar() ${data}`)
}
```

* module2.js

```js
let data2 = 'other data';
    
function foo() {  //与另一个模块中的函数冲突了
  console.log(`foo() ${data2}`)
}
```

* test.html

```js
<script type="text/javascript" src="module1.js"></script>
<script type="text/javascript" src="module2.js"></script>
<script type="text/javascript">
    let data = "修改后的数据"
	foo()
	bar()
</script>
```

* 说明:
   * 全局函数模式: 将不同的功能封装成不同的全局函数
   * 问题: Global被污染了, 很容易引起命名冲突

###2、namespace模式

* module21.js

```js
let myModule = {
  data: 'atguigu.com',
  foo() {
    console.log(`foo() ${this.data}`)
  },
  bar() {
    console.log(`bar() ${this.data}`)
  }
}
```

* module22.js

```js
  let myModule2 = {
    data: 'atguigu.com2222',
    foo() {
      console.log(`foo() ${this.data}`)
    },
    bar() {
      console.log(`bar() ${this.data}`)
    }
  }
```
* test2.html

```js
<script type="text/javascript" src="module21.js"></script>
<script type="text/javascript" src="module22.js"></script>
<script type="text/javascript">
  myModule.foo()
  myModule.bar()

  myModule2.foo()
  myModule2.bar()

  myModule.data = 'other data' //能直接修改模块内部的数据
  myModule.foo()

</script>
```
* 说明
  * namespace模式: 简单对象封装
  * 作用: 减少了全局变量
  * 问题: 不安全

### 3、IIFE模式

* module3.js

```javascript
(function (window) {
      //数据
      let data = 'atguigu.com'
    
      //操作数据的函数
      function foo() { //用于暴露有函数
        console.log(`foo() ${data}`)
      }
    
      function bar() {//用于暴露有函数
        console.log(`bar() ${data}`)
        otherFun() //内部调用
      }
    
      function otherFun() { //内部私有的函数
        console.log('otherFun()')
      }
    
      //暴露行为
      window.myModule = {foo, bar}
    })(window);
```

* test3.html

```
<script type="text/javascript" src="module3.js"></script>
<script type="text/javascript">
    myModule.foo()
    myModule.bar()
    //myModule.otherFun()  //myModule.otherFun is not a function
    console.log(myModule.data) //undefined 不能访问模块内部数据
    myModule.data = 'xxxx' //不是修改的模块内部的data
    myModule.foo() //没有改变
</script>
```

* 说明:
  * IIFE模式: 匿名函数自调用(闭包)
  * IIFE : immediately-invoked function expression(立即调用函数表达式)
  * 作用: 数据是私有的, 外部只能通过暴露的方法操作
  * 问题: 如果当前这个模块依赖另一个模块怎么办?

### 4、IIFE模式增强

* module4.js

```
(function (window, $) {
      //数据
      let data = 'atguigu.com'
    
      //操作数据的函数
      function foo() { //用于暴露有函数
        console.log(`foo() ${data}`)
        $('body').css('background', 'red')
      }
    
      function bar() {//用于暴露有函数
        console.log(`bar() ${data}`)
        otherFun() //内部调用
      }
    
      function otherFun() { //内部私有的函数
        console.log('otherFun()')
      }
    
      //暴露行为
      window.myModule = {foo, bar}
    })(window, jQuery);
```

* test4.html

```
<script type="text/javascript" src="jquery-1.10.1.js"></script>
<script type="text/javascript" src="module4.js"></script>
<script type="text/javascript">
	myModule.foo()
</script>
```

* 说明
  * IIFE模式增强 : 引入依赖
  * 这就是现代模块实现的基石

###5、页面加载多个js的问题

* 页面

```
<script type="text/javascript" src="module1.js"></script>
<script type="text/javascript" src="module2.js"></script>
<script type="text/javascript" src="module3.js"></script>
<script type="text/javascript" src="module4.js"></script>
```

* 说明
  * 一个页面需要引入多个js文件
  * 问题:
      * 请求过多
      * 依赖模糊
      * 难以维护
  * 这些问题可以通过现代模块化编码和项目构建来解决

## JS模块化的好处



### JS非模块化的缺点

> 恼人的命名冲突

> 烦琐的文件依赖-依赖模糊

>加载多个js文件-请求过多

>难以维护

###  JS模块化的优点

> 可维护性 

* 1.灵活架构，焦点分离 
* 2.方便模块间组合、分解 
* 3.方便单个模块功能调试、升级 
* 4.多人协作互不干扰 

> 可测试性

* 1.可分单元测试

> 高内聚低耦合

### JS模块化的缺点

> 性能损耗 

* 1.系统分层，调用链会很长 
* 2.模块间通信,模块间发送消息会很耗性能 

## JS模块化的实现

JS模块化的实现目前有以下几种：

* CommonJS
* AMD
* CMD - 阿里员工开发，应用范围小，目前已经买给外国人了。略
* ES6

### CommonJS实现JS模块化

#### 项目目录

```
|--01_commonjs_browserify
	|--js
		|--src
			|--app.js
			|--module1.js
			|--module2.js
			|--module3.js
	|--index.html
	|--package.json
```

### 安装browserify插件

```shell
npm install -g browserify   #全局安装
npm install browserify --save-dev   #browserify是编译js的插件，所以不是运行依赖，用--save-dev
```

### 项目代码

* module1.js

```
​```
module.exports = {
  foo() {
    console.log('moudle1 foo()')
  }
}
​```
```

* module2.js

```
​```
module.exports = function () {
  console.log('module2()')
}
​```
```

* module3.js

```
​```
exports.foo = function () {
  console.log('module3 foo()')
}

exports.bar = function () {
  console.log('module3 bar()')
}
​```
```

* app.js(引用的主js)

```
​```
//引用模块
let module1 = require('./module1')
let module2 = require('./module2')
let module3 = require('./module3')

let uniq = require('uniq')

//使用模块
module1.foo()
module2()
module3.foo()
module3.bar()

console.log(uniq([1, 3, 1, 4, 3]))
​```
```

* index.html

js中引入应用主js文件不能引用原始的app.js文件，需要使用browserify插件编译app.js文件，引入编译后的文件

* 打包编译js命令:

  ```shell
  browserify js/src/app.js -o js/dist/bundle.js  # -o 是output的缩写,输出文件
  ```

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CommonJs_Browserify</title>
</head>
<body>
<script src="js/dist/bundle.js"></script>
</body>
</html>
```

* package.json

```json
{
  "name": "commmonjs_browserify",
  "version": "1.0.0",
  "devDependencies": {
    "browserify": "^16.2.0"
  }
}
```

### AMD实现JS模块化

### 下载requirejs

> * 下载require.js, 并引入
> * 官网: http://www.requirejs.cn/
> * github : https://github.com/requirejs/requirejs
> * 将require.js导入项目: js/libs/require.js 

#### 项目目录

```js
|--02_AMD_RequireJS
	|--js
		|--main.js
		|--modules
			|--alerter.js
			|--dataService.js
		|--libs
			|--angular.js
			|--jquery.min.js
			|--require.js
	|--index.html
```

#### 项目代码

* dataService.js

```
define(function () {
  let msg = 'atguigu.com'

  function getMsg() {
    return msg.toUpperCase()
  }

  return {getMsg}
});
```

* alerter.js

```
define(['dataService', 'jquery'], function (dataService, $) {
  let name = 'Tom2'

  function showMsg() {
    $('body').css('background', 'gray')
    alert(dataService.getMsg() + ', ' + name)
  }

  return {showMsg}
});
```

* main.js(应用主入口)



```
(function () {
  //配置
  requirejs.config({
    //基本路径
    baseUrl: "js/",
    //模块标识名与模块路径映射
    paths: {
      "alerter": "modules/alerter",
      "dataService": "modules/dataService",
    }
  })
  
  //引入使用模块
  requirejs( ['alerter'], function(alerter) {
    alerter.showMsg()
  })
})();
```

* index.html

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AMD_RequireJS</title>
</head>
<body>
    <!--引入require.js文件并制定js主文件的入口-->
    <script src="js/libs/require.js" data-main="js/main.js"></script>
</body>
</html>
```

### 优点

> AMD实现JS模块化不需要依赖其他工具，在传统的前端项目中就可以使用，不用编译代码

### ES6实现JS模块化

#### 项目目录

```

```





## JS模块化总结