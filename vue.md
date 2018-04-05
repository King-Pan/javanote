# 项目初始化

1. 安装vue-cli 

   npm install -g vue-cli

2. 初始化项目

3. 进入项目

4. 安装依赖

5. 启动项目

# 项目目录结构

index.html:项目根视图

.postcssrc.js: postcss配置文件

static: 静态文件目录



# 模板语法

Vue组件： 包含三个部分

template: 视图

script：逻辑

style: 样式

 Mustache:模板

表现形式{{语法}}

```
{{msg}} 
{{1*1000}}
{{"哈哈"}}
{{ 0>10 ? "对的" : "0==10" }}
{{ '注意: 只能存在单行语句'}} 
```

vue指令

```html
<template>
  <div class="hello">
    {{msg}}
    <br>
    {{1*1000}}
    <br>
    {{"哈哈"}}
    <br>
    {{ 0>10 ? "对的" : "0==10" }}
    <br>
    {{ '注意: 只能存在单行语句'}}

    <p>{{flag}}</p>
    <p v-html="hello">

    </p>
    <p v-text="hello">

    </p>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      flag: '我是flag',
      hello: 'Hello Vue指令'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
```





```html
<!--可以解析html标签-->
<p v-html="hello"></p>
<!--定义变量-->
hello: '<span>Hello Vue</span>'

```



v-bind:绑定,    不能作用在id上



v-if: 条件渲染标签



span嵌套变成兄弟标签



v-if与v-show有什么区别  v-if=false不渲染

v-show不管取值是什么都渲染，如果为true display：none



如果条件频繁改变使用v-show比较好

如果条件不变或者很少变使用v-if比较好







