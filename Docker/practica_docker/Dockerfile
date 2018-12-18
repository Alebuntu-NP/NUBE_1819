FROM ubuntu:16.04
MAINTAINER Alejandro
ARG contrasena=2asirtriana
ENV HOME=/
RUN apt-get -y update
RUN apt-get -y upgrade
ADD inicioservicio.sh /usr/bin/
ADD carga.sql /usr/bin
RUN apt -y install net-tools
#Instalacion de apache
RUN apt -y install apache2 
ADD index.html /var/www/html
#Instalacion php
RUN apt-get install -y php
RUN apt-get install -y wget zip
RUN apt-get install -y php-pgsql
RUN apt-get install -y php7.0-bcmath
RUN apt-get install -y php7.0-gmp
RUN apt-get install -y php-curl
RUN apt-get install -y libapache2-mod-php php-mcrypt php-mysql
#Instacion mysql
RUN echo "mysql-server-5.7 mysql-server/root_password password $contrasena" | debconf-set-selections
RUN echo "mysql-server-5.7 mysql-server/root_password_again password $contrasena" | debconf-set-selections
RUN apt-get -y install mysql-server-5.7
#Instacion wordpress
RUN apt-get install -y git
WORKDIR /var/www/html/
RUN git clone https://github.com/WordPress/WordPress.git
RUN chown -R www-data:www-data /var/www/html/WordPress/
EXPOSE 80/udp
EXPOSE 80/tcp
EXPOSE 3306/tcp
#Iniciar sevicios
RUN chmod 755 /usr/bin/inicioservicio.sh
CMD /usr/bin/inicioservicio.sh


