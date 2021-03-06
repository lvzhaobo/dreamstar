FROM debian:latest

MAINTAINER lvzhaobo <lvzhaobopku@163.com>

RUN apt-get update && \
    apt-get install apache2 -y && \
    # apt-get install php5 -y && \
    # apt-get install php5-mysql -y && \
    apt-get install git -y && \
    mkdir -p /var/www/html && \
    cd /var/www/html && \
    git clone https://github.com/lvzhaobo/dreamstar.git
    # mkdir -p /var/www/dreamstar && \
    # cp /root/dreamstar /var/www/dreamstar

RUN mv /var/www/html/index.html /var/www/html/index2.html

RUN echo "#ServerName" >> /etc/apache2/apache2.conf
RUN echo "\r\nServerName dreamstar" >> /etc/apache2/apache2.conf
RUN echo "\r\n<Directory />\r\nOptions FollowSymLinks\r\nAllowOverride None\r\nOrder allow,deny\r\nAllow from all\r\n</Directory>\r\n" >> /etc/apache2/apache2.conf

ADD run.sh /run.sh
RUN chmod 755 /*.sh

RUN mkdir -p /var/lock/apache2

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

CMD ["/run.sh"]
