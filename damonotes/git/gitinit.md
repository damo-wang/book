## 使用git创建远程仓库

```bash
echo "# damonotes" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:damo-wang/damonotes.git
git push -u origin main

```

## github ssh-key

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```
