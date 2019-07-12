# nginx

## nginx 安装

### ubuntu安装

```bash
sudo apt install curl gnupg2 ca-certificates lsb-release
sudo apt update
sudo apt install nginx
```

### CentOS安装

> yum install yum-utils

To set up the yum repository, create the file named /etc/yum.repos.d/nginx.repo with the following contents:

```
[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key

[nginx-mainline]
name=nginx mainline repo
baseurl=http://nginx.org/packages/mainline/centos/$releasever/$basearch/
gpgcheck=1
enabled=0
gpgkey=https://nginx.org/keys/nginx_signing.key
```

By default, the repository for stable nginx packages is used. If you would like to use mainline nginx packages, run the following command:

>sudo yum-config-manager --enable nginx-mainline

To install nginx, run the following command:

> sudo yum install nginx

When prompted to accept the GPG key, verify that the fingerprint matches 573B FD6B 3D8F BC64 1079 A6AB ABF5 BD82 7BD9 BF62, and if so, accept it.

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
