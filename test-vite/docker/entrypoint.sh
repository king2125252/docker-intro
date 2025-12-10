#!/bin/bash

# 設定權限，讓 nginx 用戶可以訪問文件
chown -R www-data:www-data /var/www/html &
chmod -R 755 /var/www/html &
echo "test1"
# run nginx
exec nginx -g "daemon off;"
echo "test2"
