create database asirtriana;
CREATE USER 'asirtriana'@'%' IDENTIFIED BY '2asirtriana';
grant all on asirtriana.* to 'asirtriana'@'localhost' identified by "2asirtriana";
grant all on asirtriana.* to 'asirtriana'@'%' identified by "2asirtriana";
grant all on asirtriana.* to 'asirtriana'@'127.0.0.1' identified by "2asirtriana";
flush privileges;
exit
