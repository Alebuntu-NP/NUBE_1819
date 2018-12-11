FROM ubuntu:16.04
MAINTAINER Alejandro Román Caballero
RUN apt update && apt -y install apache2 && apt -y install net-tools
ADD index.html /var/www/html
EXPOSE 80/udp
EXPOSE 80/tcp
