FROM debian:latest

MAINTAINER lvzhaobo <lvzhaobopku@163.com>

RUN apt-get update && \
    apt-get install apache2 -y && \
    apt-get install php5 -y && \
    apt-get install php5-mysql -y && \
    apt-get install git -y && \
    mkdir -p /var/www/dreamstar && \
    cd /var/www/dreamstar && \
    git clone https://github.com/lvzhaobo/dreamstar.git
    # mkdir -p /var/www/dreamstar && \
    # cp /root/dreamstar /var/www/dreamstar
RUN echo "ServerName burning-dreamstar.daoapp.io">>/etc/apache2/apache2.conf
# ENV APACHE_SERVERNAME localhost

EXPOSE 80

CMD ["/etc/init.d/apache2 restart"]
