#!/bin/bash

/etc/init.d/apache2 start
/etc/init.d/mysql start

mysql -u root -p2asirtriana < /usr/bin/carga.sql

/bin/bash