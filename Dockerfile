FROM php:7.3.8-apache-stretch

ENV VERSION 2.02

RUN apt-get update && apt-get install -y libzip-dev libfreetype6-dev \
  && docker-php-ext-install mysqli \
  && docker-php-ext-install gd \
  && docker-php-ext-install zip

RUN apt-get install -y zip

RUN curl -o /tmp/dzzoffice.zip https://codeload.github.com/zyx0814/dzzoffice/zip/master \
  && unzip -o -d  /tmp /tmp/dzzoffice.zip \
  && rm -rf /tmp/dzzoffice.zip /tmp/dzzoffice/*.md \
  && mv /tmp/dzzoffice-master/* /var/www/html/

RUN chown -R www-data:www-data /var/www/html/
