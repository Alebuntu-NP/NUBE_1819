FROM ubuntu:16.04
MAINTAINER Alejandro
ARG contraseña=2asirtriana
RUN apt-get -y update
RUN apt-get -y upgrade
RUN echo "mysql-server-5.7 mysql-server/root_password password $contraseña" | debconf-set-selections
RUN echo "mysql-server-5.7 mysql-server/root_password_again password $contraseña" | debconf-set-selections
RUN apt-get -y install mysql-server-5.7
RUN apt-get install mysql-client-5.7 

