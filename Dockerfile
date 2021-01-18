FROM php:7.3.8-apache-stretch

ENV VERSION 2.02

RUN apt-get update && apt-get install -y libzip-dev libfreetype6-dev \
  && docker-php-ext-install mysqli \
  && docker-php-ext-install gd \
  && docker-php-ext-install zip

RUN curl -o /tmp/dzzoffice.tar.gz https://github.com/zyx0814/dzzoffice/archive/master.zip \
  && tar -xzvf /tmp/dzzoffice.tar.gz -C /tmp \
  && rm -rf /tmp/dzzoffice.tar.gz /tmp/dzzoffice/*.md \
  && mv /tmp/dzzoffice/* /var/www/html/

RUN chown -R www-data:www-data /var/www/html/
