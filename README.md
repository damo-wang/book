# damowang的日常

> 序言一 第一次创建时.

一直使用linux，一直在学习。

一方面，学习中有很多的体会想去分享。

一方面，年龄越来越大经常记不住事情。

所以将所有学习中的体会和收获记录这里。

便于自己查阅

便于日后整理总结

> 序言二：20190710

学的东西很多，总是在抓紧时间学。使劲往进塞。

前半生可以这样。

现在进入后半程。

需要更多时间整理、消化、沉淀出自己。

---

## 目录

### 基本工具

[github](github/README.md)

[gitbook](gitbook/README.md)

[markdown](markdown/README.md)

### 工作技能

[nginx](nginx/README.md)

[python](python/README.md)

[java](java/README.md)

[arduino](arduino/README.md)

# 邱健推荐

## 开发相关

1. [前端练习: https://codepen.io](https://codepen.io)
2. [其他练习:https://repl.it](https://repl.it/)
3. [正则练习:https://regex101.com/](https://regex101.com/)
4. [sql练习:https://sqlfiddle.com](https://sqlfiddle.com/)
5. [REST练习:https://webhook.site](https://webhook.site)
6. [FakeAPI:https://mockaroo.com](https://mockaroo.com)
7. [REST Client:https://getpostman.com](https://getpostman.com)

## 图片占位
8. [颜色和文字占位:https://place-hold.it/100&text=hello](https://place-hold.it/100&text=hello)
9. [用户头像占位:http://pravatar.cc](http://pravatar.cc)
10. [分类图片占位:https://placeimg.com/600/480/animals](https://placeimg.com/600/480/animals)

# NPM

管理本地安装的npm包最佳方法是创建一个package.json

一个package.json文件要求:
- 列出项目所依赖的包
- 允许使用语义版本控制规则指定项目可以使用的包的版本
- 使您的构建可重现,因此更容易分享

一个package.json包必须具备:
- "name"
    - 全小写
    - 没有空格
    - 允许使用连字符和下划线
- "version"
    - 以X.X.X的形式
    - 遵循semver规范 #一种描述版本的规则

### 初始化package.json
```sh
npm init #根据想到创建package.json
npm init --yes #创建默认值的package.json
```

- name：当前目录名称
- version：永远 1.0.0
- description：来自自述文件的信息或空字符串 ""
- main：永远 index.js
- scripts：默认情况下会创建一个空test脚本
- keywords：空的
- author：空的
- license： ISC
- bugs：来自当前目录的信息（如果存在）
- homepage：来自当前目录的信息（如果存在）

- "dependencies"：您的应用程序在生产中需要这些包。
- "devDependencies"：这些包仅用于开发和测试。

```sh
npm install <package_name> [--save-prod]  # 安装包同时,添加信息到dependencies中.
npm install <package_name> --save-dev # 安装包同事,添加信息到devDependencies中
```

npm install/uddate/uninstall -g 包名称 #安装/更新/卸载全局包

## 制作\发布\使用包

1. 制作
在js文件中, 添加一个函数作为exports对象的属性.
```javascript
exports.printMsg = function() {
  console.log("This is a message from the demo package");
}
```
2. 在readme.md中对文件进行描述

3. npm init生成package.json文件

4. 登录npm
```
npm login  #提示中,输入用户名密码
```

5. 发布包
```sh
npm publish
```

6. 使用包
`npm install 包名` 安装模块
在js文件中,使用`require('模块名')`导入包

## node教程

node函数非阻塞执行.

## node事件循环

node.js是单进程单线程应用程序, 但是它的每一个API都是异步的,独立线程,并发处理.
node.js所有事件机制都是观察者模式.
node.js单线程类似进入一个while(true)的事件循环,直到没有事件观察者,才退出. 每个异步事件都生成一个事件观察者.等待事件发生调用回调.

```javascript
var events=require('events');

var eventEmitter=new events.EventEmitter();

eventEmitter.on('singal',handler);

eventEmitter.emit('singal');
```

node.js的异步操作, 就是基于事件机制.
所有的异步函数,执行结束后,都会发送event到events队列.

- on:将信号和函数句柄绑定, 同addListener
- emit:发射信号.
- once:只执行一次
- removeListener:移除信号和函数关系.
- removeAllListeners(event):移除指定事件所有监听器, 省略event则表示移除所有事件的所有监听器.

##　Buffer类

JavaScript中只有字符串类型.
所以,为了处理其他类型,特别是二进制类型,创造了buffer类,让nodejs具有了处理二进制数据的能力.
一个buffer类,类似于一个整数数组.对应一块原始内存.

```
var buf = new Buffer(len);  # 创建buffer
var buf = new Buffer([array]); # 创建buffer
var buf = new Buffer("string",'encode'); # 创建buffer 默认utf-8编码,也可指定为"ascii",'utf8','utf16le','base64','hex'

buf.write(string[,offset[,length][,encoding]); #write buffer

buf.toString([encoding[,start[,end]]]); # read from buffer

buf.toJSON();  # trans to json.

Buffer.concat(list[,totalLength]); # concat buffer that in list. list is array.

buf.compare(otherBuffer); # compare buf and otherBuffer

buf.copy(target[,targetStart[,sourceStart[,sourceEnd]]]); # copy buf to target

buf.slice([start[,end]]);

buf.length  # buffer length
```

## stream

all stream is EventEmitter's object. 

- data - 当有数据可读时触发。
- end - 没有更多的数据可读时触发。读到文件尾时.
- error - 在接收和写入过程中发生错误时触发。写缓冲遇到结束符. 写结束时.
- finish - 所有数据已被写入到底层系统时触发。

- input stream
- output stream
- pipe stream
- 链式流

## 模块系统

> 一个文件就是一个模块.
> 可以使JavaScript代码, JSON或者编译过的C/C++扩展

两个对象:
- exports: 公开模块的接口
- require: 从外部获取一个模块的接口,即所获取模块的exports对象.

> 此部分需要再加强

模块加载过程: 原生模块, 文件模块 

require接受几种参数的传递:
- http\fs\path等,原生模块
- 相对路径文件模块
- 绝对路径文件模块
- 非原生的文件模块. mod

##　http & route

http接收到request和require.
url解析request
对于解析出的path,调用route区分处理.

## 全局对象

JS中全局对象及其所有属性, 可以在程序任何地方访问.
JavaScript中, window是全局对象
Node.js中,global是全局, 所有全局变量,都是global的属性.

ECMAScript规定,一下属于全局变量:
- 最外层定义的变量
- 全局对象的属性
- 隐式定义(未定义直接赋值)的变量

### process
> 全局变量, global的属性之一

描述当前进程的状态, 提供了一些与操作系统的简单接口.

- process.argv: 命令行参数
- process.stdout
- process.stdin
- process.nextTick(callback),下次事件调用

```javascript
functiondoSomething(args, callback) { 
  somethingComplicated(args); 
  callback(); 
} 

doSomething(functiononEnd() { 
  compute(); 
}); 

# use nextTick
functiondoSomething(args, callback) { 
   somethingComplicated(args); 
  process.nextTick(callback); 
} 
doSomething(functiononEnd() { 
  compute(); 
}); 
```

### console
向stdout和stderr输出字符
以换行符结束
若只有一个参数,则输出字符串格式.
若多个参数,则类似C语言的printf
console.error(): 输出到stderr

### util

- util.inherits
> util.inherits(sub,base); # 给sub指定base为基类.

Sub仅仅继承了Base在原型中定义的函数，而构造函数内部创造的base属性和sayHello函数都没有被Sub继承。

- util.inspect(object,showHidden,depth,colors)方法可以将任意对象转换为字符串，通常用于调试和错误输出。它至少接受一个object参数，即要转换的对象。

### 文件系统 fs模块

### 常用工具模块

- OS: 系统操作函数
- Path: 路径相关函数
- Net: 底层网络通信
- DNS: 解析域名
- Domain: 简化异步代码的异常处理

### web模块

- http
  - server
  - client

#### Request 对象 

> request对象表示HTTP请求，包含了请求查询字符串，参数，内容，HTTP头部等属性。常见属性有：

  req.app：当callback为外部文件时，用req.app访问express的实例
  req.baseUrl：获取路由当前安装的URL路径
  req.body / req.cookies：获得「请求主体」/ Cookies
  req.fresh / req.stale：判断请求是否还「新鲜」
  req.hostname / req.ip：获取主机名和IP地址
  req.originalUrl：获取原始请求URL
  req.params：获取路由的parameters
  req.path：获取请求路径
  req.protocol：获取协议类型
  req.query：获取URL的查询参数串
  req.route：获取当前匹配的路由
  req.subdomains：获取子域名
  req.accpets（）：检查请求的Accept头的请求类型
  req.acceptsCharsets / req.acceptsEncodings / req.acceptsLanguages
  req.get（）：获取指定的HTTP请求头
  req.is（）：判断请求头Content-Type的MIME类型

#### Response 对象 - response对象表示HTTP响应，即在接收到请求时向客户端发送的HTTP响应数据。常见属性有：

  res.app：同req.app一样
  res.append（）：追加指定HTTP头
  res.set（）在res.append（）后将重置之前设置的头
  res.cookie（name，value ，option）：设置Cookie
  opition: domain / expires / httpOnly / maxAge / path / secure / signed
  res.clearCookie（）：清除Cookie
  res.download（）：传送指定路径的文件
  res.get（）：返回指定的HTTP头
  res.json（）：传送JSON响应
  res.jsonp（）：传送JSONP响应
  res.location（）：只设置响应的Location HTTP头，不设置状态码或者close response
  res.redirect（）：设置响应的Location HTTP头，并且设置状态码302
  res.send（）：传送HTTP响应
  res.sendFile（path ，options）：传送指定路径的文件 -会自动根据文件extension设定Content-Type
  res.set（）：设置HTTP头，传入object可以一次设置多个头
  res.status（）：设置HTTP状态码
  res.type（）：设置Content-Type的MIME类型

  ### 测试

  - 通过页面发送get/post请求


## RESTful

> Representational State Transfer. 表述性状态传递.

### RESTful四个基本方法

- GET 用于获取数据
- PUT 用于添加数据
- DELETE 用于删除数据
- POST 用于更新或添加数据

## KOA

> 核心是一个包含一组中间件函数的对象, 它是按照堆栈方式组织和执行的.

apikey=0df993c66c0c636e29ecbb5344252a4a

record   www  103.3.63.89
txt 