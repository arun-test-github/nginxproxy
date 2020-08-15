FROM ubuntu:16.04
MAINTAINER "LIONKING"
RUN apt-get update && apt-get upgrade -y
RUN apt-get install apache2 -y
RUN apt-get install libapache2-mod-php -y
RUN apt-get install php php-fpm  -y
RUN apt-get install libapache2-mod-fcgid  -y 
RUN a2enmod alias proxy proxy_fcgi
COPY ./000-default.conf /etc/apache2/sites-enabled/000-default.conf
ENV APACHE_PID_FILE=/var/run/apache2/apache2.pid
ENV APACHE_RUN_USER=www-data
ENV APACHE_RUN_GROUP=www-data
ENV APACHE_LOG_DIR=/var/log/
COPY ./info.php /var/www/html/info.php
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
EXPOSE 80
