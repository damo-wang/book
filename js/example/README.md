## example webApp训练
### 准备
1. 完成github仓库
2. clone github仓库到本地
3. 将本地仓库创建express应用
***
### client端
4. 增加静态首页：登录页面
5. 将登录页面数据和vue绑定
6. 通过vue给按钮绑定方法：实现ajax提交。
***
### server端
7. 通过app.js处理ajax发过来的请求，析取出user和password，通过console显示。
8. 在server侧创建JSON数组，实现用户名和密码的比较，将验证结果发挥给AJAX
    AJAX侧，
        * 用户名密码匹配，跳转到主页面。
        * 用户名存在，密码错误，提示
        * 用户不存在，提示
9. 改为通过mysql数据库存储用户信息
10. 设置response header，是的client能够根据header信息区分如何处理。
11. 使用node的crypto模块，实现密码加密
12. 使用cookie实现用户登录的保持（登录成功后，指定时间内可以只接访问，不需要再次登录）