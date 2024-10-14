create database `laravel-realworld`;
use `laravel-realworld`;
CREATE USER 'sail'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON `laravel-realworld.*` TO 'sail'@'localhost';
flush privileges;
exit;
