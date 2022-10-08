# 关于gosuncn使用git的思路
1. 将每个项目根目录的gitignore文件加入git仓库，并在gitignore中设置忽略子目录中的gitignore，便于子目录中操作者自己设置ignore
2. 每次init下新的代码后，首先建立自己的操作分支。
  - 在自己操作分支中编译，编译后commit一次
  - 日常工作，都在自己的branch上，每次操作，commit一次。
  - 在自己branch上完成开发验证
3. 在自己branch上完成开发验证后，如下操作将代码合入项目分支
  - 切换到项目分支
  - 在项目分支上pull，拉取最新更新
  - 将self分支的对应修改合入，注意这一步，有下述两种办法：
    - 1 只合入self分支的某个commit
        git cherry-pick [要合入的commitID]
        合入完成后，直接push
    - 2 将单独文件更新
        git checkout self [file]
        合入后，需要add & commit & push
  - 在项目分支上push
  - push完成后，再切换到self分支

