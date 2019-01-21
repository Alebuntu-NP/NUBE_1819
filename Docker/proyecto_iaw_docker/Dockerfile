FROM iestriana/lamp
MAINTAINER Alejandro
RUN echo "START"
RUN apt-get -y update
ADD inicioservicio.sh /usr/bin/
RUN apt-get install -y git
WORKDIR /var/www/html/
RUN rm -rf index.html
RUN echo "<?php header('Location: ./PROYECTO_IAW_ROMAN_CABALLERO/index.php')?>" > index.php
RUN echo "Clonacion de repositorio";
RUN git clone https://github.com/Alejandro314/PROYECTO_IAW_ROMAN_CABALLERO.git
RUN chown -R www-data:www-data /var/www/html/PROYECTO_IAW_ROMAN_CABALLERO/
EXPOSE 80/udp
EXPOSE 80/tcp
EXPOSE 3306/tcp
RUN sh -c 'echo Europe/Madrid >/etc/timezone && dpkg-reconfigure -f noninteractive tzdata'
#Iniciar sevicios
RUN chmod 755 /usr/bin/inicioservicio.sh
ADD carga.sql /usr/bin
CMD /usr/bin/inicioservicio.sh


