FROM debian:latest

MAINTAINER lvzhaobo <lvzhaobopku@163.com>

RUN apt-get install apache2 -y && \
    apt-get install php5 -y && \
    apt-get install php5-mysql -y

EXPOSE 80
