FROM ubuntu:16.04
MAINTAINER Alejandro
ARG contrasena=2asirtriana
RUN apt-get -y update
RUN apt-get -y upgrade
RUN  apt -y install net-tools
RUN echo "mysql-server-5.7 mysql-server/root_password password $contrasena" | debconf-set-selections
RUN echo "mysql-server-5.7 mysql-server/root_password_again password $contrasena" | debconf-set-selections
RUN apt-get -y install mysql-server-5.7
RUN apt-get install mysql-client-5.7 

EXPOSE 80/udp
EXPOSE 80/tcp
EXPOSE 3306/tcp

