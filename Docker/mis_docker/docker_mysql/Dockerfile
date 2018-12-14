FROM ubuntu:16.04
MAINTAINER Alejandro
ARG MYSQL_ROOT_PASSWORD=2asirtriana
RUN echo "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD" | debconf-set-selections
RUN apt-get -y update 
RUN apt-get -y install mysql-server
RUN apt-get install mysql-client 

