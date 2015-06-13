FROM debian:latest

MAINTAINER lvzhaobo <lvzhaobopku@163.com>

RUN apt-get update && \
    apt-get install apache2 -y && \
    # apt-get install php5 -y && \
    # apt-get install php5-mysql -y && \
    apt-get install git -y && \
    mkdir -p /var/www/dreamstar && \
    cd /var/www/dreamstar && \
    git clone https://github.com/lvzhaobo/dreamstar.git
    # mkdir -p /var/www/dreamstar && \
    # cp /root/dreamstar /var/www/dreamstar

RUN echo "#ServerName" >> /etc/apache2/apache2.conf
RUN echo "\r\nServerName dreamstar" >> /etc/apache2/apache2.conf

RUN "mkdir /var/lock/apache2"

#ENV APACHE_SERVERNAME localhost:80
#ENV SERVERNAME localhost:80
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_DOCUMENTROOT /var/www/dreamstar

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
