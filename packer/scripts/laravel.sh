#!/usr/bin/env bash
# Setup Variables
USER="root"
PASSWORD="homestead"
set -e

yum -y install httpd mariadb-server mariadb unzip
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
    yum -y update
    yum clean all
yum -y install php70w php70w-mysql php70w-mcrypt php70w-dom php70w-mbstring

systemctl start httpd
systemctl enable httpd

systemctl start mariadb
systemctl enable mariadb

mysqladmin -u root password "$PASSWORD"
mysql -u root -p"$PASSWORD" -e "UPDATE mysql.user SET Password=PASSWORD('$PASSWORD') WHERE User='root'"
mysql -u root -p"$PASSWORD" -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"
mysql -u root -p"$PASSWORD" -e "DELETE FROM mysql.user WHERE User=''"
mysql -u root -p"$PASSWORD" -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'"
mysql -u root -p"$PASSWORD" -e "FLUSH PRIVILEGES"

# Setup Mysql
mysql -u $USER -p$PASSWORD -Bse "CREATE DATABASE canoe;"

curl -sS https://getcomposer.org/installer | php

mkdir /var/www/laravel
chown -R apache:apache /var/www/laravel
chmod -R 755 /var/www/laravel
mv /home/vagrant/canoe-app-master.zip /var/www/laravel/

echo "ServerName test.myproject.com\nDocumentRoot /var/www/laravel/public\nAllowOverride All" >> /etc/httpd/conf/httpd.conf

cd /var/www/laravel


# Setup Project
/usr/bin/unzip /var/www/laravel/canoe-app-master.zip
mv /var/www/laravel/canoe-app-master/* /var/www/laravel/
rm -rf /var/www/laravel/canoe-app-master.zip
rm -rf /var/www/laravel/canope-app-master


# Do Composer Stuff
/usr/local/bin/composer update --no-scripts
/usr/bin/php artisan key:generate
/usr/bin/php artisan migrate

systemctl restart httpd



exit 0
