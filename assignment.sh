#!/bin/bash

file="$PWD/assignment/laravel-realworld-example-app"
file2=$file



# Update the software
#sudo apt update

# Download the repo
#if [ ! -d $file ]; then
#     mkdir assignment
#     cd assignment
#     git clone https://github.com/f1amy/laravel-realworld-example-app.git
#fi

# Install all packages needed for LEMP stack
#sudo apt install nginx mariadb-client mariadb-server unzip curl -y

# Install PHP
#sudo apt -y install software-properties-common
#sudo add-apt-repository ppa:ondrej/php
#sudo apt install php8.0
#sudo apt install php8.0-cli php8.0-json php8.0-common php8.0-mysql php8.0-zip php8.0-gd php8.0-mbstring php8.0-curl php8.0-xml php8.0-bcmath php8.0-fpm -y

# Install Composer
#curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
#HASH=`curl -sS https://composer.github.io/installer.sig`
#php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
#sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Secure Mariadb
#sudo mysql_secure_installation

# Composer Install
#cd $file2
#if [ ! -f .env ]; then
#	cp .env.example .env
#fi
#php artisan key:generate
#composer install
## Check if the path $APP/routes/web.php is commented out and uncomment if it is. 


# Create user and password and other SQl commands
#sudo mysql < ./script.sql

# Nginx Config for Laravel App
#sudo cp ./laravel.conf /etc/nginx/sites-available/
#sudo ln -s /etc/nginx/sites-available/laravel.conf /etc/nginx/sites-enabled/
#sudo nginx -t
#sudo nginx -s reload

# Give Nginx permissions to file without changing existing permissions
sudo apt update && sudo apt install acl -y
sudo setfacl -Rm g:www-data:rwx $file2/storage/logs/laravel.log
sudo setfacl -Rm d:g:www-data:rwx $file2/storage/framework/sessions/
sudo setfacl -Rm d:g:www-data:rwx $file2/storage/framework/
