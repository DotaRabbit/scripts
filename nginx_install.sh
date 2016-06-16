#!/bin/bash
# Check if user is root
if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script, please use root to install this shell script"
    exit 1
fi
yum -y install gcc openssl-devel zlib-devel pcre-devel ncurses-devel make wget
useradd -M -s /sbin/nologin nginx
wget http://nginx.org/download/nginx-1.9.15.tar.gz
tar zxvf nginx-1.9.15.tar.gz
cd nginx-1.9.15/
./configure --user=nginx --group=nginx --prefix=/data/nginx --with-http_ssl_module --with-http_flv_module --with-http_stub_status_module --with-http_gzip_static_module --with-pcre
make && make install
