# nginx

## nginx 安装

### ubuntu安装

```bash
sudo apt install curl gnupg2 ca-certificates lsb-release
sudo apt update
sudo apt install nginx
```

## Beginner's Guide

### Starting, Stopping, and Reloading Configuration

```sh
nginx #启动nginx
ps -aux | grep 'nginx' # 查询nginx进程
nginx -s signal
# signal may be one of the following:
# stop — fast shutdown
# quit — graceful shutdown
# reload — reloading the configuration file
# reopen — reopening the log files
```

## config file

```sh
/etc/nginx/
```

## log file

```sh
# vim /etc/nginx/nginx.conf
# access_log /var/log/nginx/access.log;
# error_log /var/log/nginx/error.log;

```
