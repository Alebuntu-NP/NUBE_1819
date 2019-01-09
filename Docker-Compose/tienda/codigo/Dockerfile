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
RUN apt-get install -y libapache2-mod-php php-mcrypt php-mysql php-zip php7.0-mbstring php7.0-xml php7.0-gd

#Instacion prestashop
WORKDIR /var/www/html/
COPY  prestashop /var/www/html/
RUN chown -R www-data:www-data /var/www/html/
RUN apt-get -y install php-intl
EXPOSE 80/udp
EXPOSE 80/tcp

