FROM ubuntu:16.04
MAINTAINER Alejandro
RUN apt-get -y update
RUN apt-get -y install varnish
ADD default.vcl /etc/varnish/
