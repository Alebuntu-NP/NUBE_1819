FROM ubuntu:16.04
MAINTAINER Alejandro
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt -y install net-tools
#Instalacion de apache
RUN apt -y install apache2 
#Instalacion php
RUN apt-get install -y php
RUN apt-get install -y wget zip
RUN apt-get install -y php-pgsql
RUN apt-get install -y php7.0-bcmath
RUN apt-get install -y php7.0-gmp
RUN apt-get install -y php-curl
RUN apt-get install -y libapache2-mod-php php-mcrypt php-mysql

#Instacion prestashop
RUN apt-get install -y git
WORKDIR /var/www/html/
ADD  prestashop_1.7.5.0 /var/www/html
RUN chown -R www-data:www-data /var/www/html/prestashop_1.7.5.0/
EXPOSE 80/udp
EXPOSE 80/tcp
EXPOSE 3306/tcp
