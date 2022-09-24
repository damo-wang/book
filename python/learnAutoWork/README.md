# learnAutoWork

# 《让繁琐工作自动化》

## 第一部分 Python编程基础

- 1. python基础
    - 数学操作符 全部
        - ** 指数
        - % 取模、取余
        - //  整除
        - /  除
        - * 乘
        - - 减
        - + 加
    - 数据类型
        - 整形
        - 浮点型
        - 字符串
    - 字符串复制连接
        - + 为链接
        - * n 表示字符串复制n倍（n整型）
    - 变量
        - 在第一次存入值之后，初始化
        - 命名同C
    - # 表示注释
    - print()和input()  input得到字符串
    - len()
    - str() int() float()
- 2. 控制流

    2.1. 布尔值 

    True False

    0  0.0 ‘’ 被认为是False，其他是True

    比较操作符

    ==

    ! =

    <

    >

    ≤

    ≥

    and or not

    2.2 控制语句

    - if语句

    ```python
    if 条件:
    	语句块1
    elif 条件2:
    	语句块2
    else:
    	语句块3
    ```

    - while

    ```python
    while 条件:
    	语句块1
    ```

    - break continue
    - for

    ```python
    for 变量 in 范围:
    	语句块1
    ```

    - range()函数，确定一个范围，包括开始，不包括结束，默认步长1

    2.3 import from as

    2.4 sys.exit() 结束程序 

- 3. 函数

    ```python
    # 参数仅在函数体有效
    def FuncName(参数):
    	函数体
    	return 返回值
    ```

    None

    表示没有值

    唯一的Noneype类型

    关键字参数

    print的关键字参数 end sep

    可以自己设置关键字参数

    局部和全局作用域

    global语句

    使用global表示强制访问全局变量

    在函数体中使用global可以创建全局变量

    异常：

- 4. 列表
    - 列表

        [ ]

        用下标访问

        下标可以负数，从尾部算起

        可以使用切片

        len()获取长度

        用下标可以访问赋值

         + 可进行列表链接

         * 可进行列表重复

         del 列表名[n] 删除第n个

        列表可以作为for循环的循环集合

        in & not in

        in 在列表中

        not in 不在列表中

        多重赋值

        list=[1,2,3]

        a,b,c=list

        符合运算符 + - * / % 

        - 方法
            - index() 传入值，返回下标
            - append(值) 追加值
            - insert(下标，值) 插入值
            - remove(值) 删除值
            - sort() 排序 reverse=True 逆序
            - 
    - 元祖

        元祖与列表两个不同，其他都一样。

        - 元祖用()  列表用[ ]
        - 元祖不可修改，列表可修改

        使用list()和tuple()可以进行元祖和列表的切换

    列表和字典，都是传递引用

    可以使用copy模块的copy()和deepcopy()进行拷贝，（deepcopy()可以遍历复制列表中包含的引用）

- 5. 字典和结构化数据

    键-值队

    { }

    字典不排序，顺序不重要。

    - 所以不能切片

    方法：

    - keys() 键元组
    - values() 值元组
    - items() 键值对元组（）
    - get(键，默认值)
    - setdefault(键，默认值)
    - pprint
- 6. 字符串操作

## 第二部分 自动化任务

### 7. 正则

### 8. 读写文件

### 9. 组织文件

### 10. 调试

- 11. 从web抓取信息
    - headless [http://einverne.github.io/post/2018/03/chrome-devtools-protocal-using-python.html](http://einverne.github.io/post/2018/03/chrome-devtools-protocal-using-python.html)

### 12. 处理Excel

### 13. 处理PDF和word

### 14. 处理CSV和Json

### 15. 时间、计划任务、启动程序

### 16. email和短信

### 17. 操作图像

### 18. 用GUI控制键盘和鼠标

## 附件

### 1. 安装第三方模块

```bash
pip3 install ModuleName
pip3 install -U ModuleName //更新到最新版本
```

```bash
pip3 install send2trash
pip3 install requests
pip3 install beautifulsoup4
pip3 install selenium
pip3 install openpyxl
pip3 install PyPDF2
pip3 install python-docx
pip3 install imapclient
pip3 install pyzmail
pip3 install twilio
pip3 install pyobjc-core
pip3 install pyobjc
pip3 install python3-xlib
pip3 install pyautogui
```

导入模块

import ModuleName

可以一次导入多个模块，逗号区分

from

as

异常处理：

try except语句

```python
try:
	可能异常的语句
except 错误类型:
	处理方法
except 异常类型2:
	处理方法
```

### 2. 运行程序

vscode 安装python for vscode

bash 安装python3

### 3. 习题答案

- 1.8 操作符
    - 1
        - * - /  +
        - 值 ‘hello’ -88.8 5
    - 2 spam 变量 'spam' 字符串
    - 3 整型 字符串 浮点型
    - 4 操作符 运算符构成表达式 运算
    - 5 一样
    - 6 20
    - 7 'spamspamspam'  都一样
    - 8 变量名不能以数字开头
    - 9 int() float() str()
    - 10 'I have eaten ' + str(99) + ' burritos.'
    - 附加：round(n[,ndigits]) 四舍五入返回ndigits位小数，ndigits默认为0
- 2.11
    1. True False
    2. and or not
    3. 略
    4. False False True False False True
    5. == ! = > < ≥ ≤
    6. 比较 赋值
    7. 布尔表达式就是条件，可用在控制语句中
    8. 略
    9. 

    ```python
    if spam ==1:
    	print(Hello)
    elif spam == 2:
    	print(Howdy)
    else:
    	print(Greetings!)
    ```

    10. Ctrl+C

    11. 跳出循环、跳出当前一次循环

    12. 一样

    13. 

    ```python
    for i in range(1,11):
    	print(i)

    i=1
    while i<=10:
    	print(i) 
    ```

    14. 

    ```python
    spam.bacon()
    ```

    附加：

- 3.10

    ```python
    #!/usr/bin/python3

    def collatz(_number):
        if _number%2==0:
            return _number//2
        else:
            #print(3 * _number + 1)
            return 3*_number+1

    while True:
        try:
            n=int(input("Enter number(int)"))
            break
        except ValueError:
            print("Please input int")
            continue

    while n!=1:
        n=collatz(n)
        print(n)
    ```

- 4.9
    1. 列表
    2. spam[3]='hello'
    3. 'd'
    4. 'd'
    5. 'c'
    6. 1
    7. [3.14,'cat',11,'cat',True,99]
    8. [3.14,'cat',11,True,99]
    9.  + copy.copy()
    10. 最后，指定位置
    11. remove()
    12. 下标访问，len，in not in 切片等，只要不影响原值
    13. 列表可变，元祖不可变
    14. (42)
    15. tuple() list()
    16. 引用
    17. 拷贝，递归拷贝

    4.10.1

    ```python
    #!/usr/bin/python3

    spam=['apples','bananas','tofu','cats']

    def list2str(spam):
        str=''
        for s in spam:
            if spam.index(s)<len(spam)-1:
                str=str+s+', '
            else:
                str=str + 'and '+s
        return str

    print(list2str(spam))
    ```

    4.10.2

    ```python
    #!/usr/bin/python3

    grid=[
        ['.','.','.','.','.','.'],
        ['.','0','0','.','.','.'],
        ['0','0','0','0','.','.'],
        ['0','0','0','0','0','.'],
        ['.','0','0','0','0','0'],
        ['0','0','0','0','0','.'],
        ['0','0','0','0','.','.'],
        ['.','0','0','.','.','.'],
        ['.','.','.','.','.','.']
        ]

    for i in range(len(grid[0])):
        for j in range(len(grid)):
            print(grid[j][i],end=' ')
        print()
    ```

- 5.5
    1. { }
    2. {'foo':42}
    3. 字典无序，可以用任何值做key
    4. KeyError
    5. 一样
    6. 在keys中找，在values中找
    7. spam.setdefault('color','black')
    8. pprint  pprint.pprint()
- 5.6