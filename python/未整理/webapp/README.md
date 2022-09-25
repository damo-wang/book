## webApp
1. pip3 install aiohttp //异步框架aiohttp
2. pip3 install jinja2  //jinja2模板引擎，python的模板引擎
3. pip3 install aiomysql //mysql的异步驱动程序
4. 创建目录结构
    mkdir -p backup conf dist www www/static www/templates ios LICENSE

    webapp/  <-- 根目录
    |
    +- backup/               <-- 备份目录
    |
    +- conf/                 <-- 配置文件
    |
    +- dist/                 <-- 打包目录
    |
    +- www/                  <-- Web目录，存放.py文件
    |  |
    |  +- static/            <-- 存放静态文件
    |  |
    |  +- templates/         <-- 存放模板文件
    |
    +- ios/                  <-- 存放iOS App工程
    |
    +- LICENSE               <-- 代码LICENSE
5. 建立和github的同步
6. 