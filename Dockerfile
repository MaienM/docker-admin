FROM php:5-apache

MAINTAINER Michon van Dooren <michon1992@gmail.com>

# Add + compile adminer
COPY adminer/ /var/www/html/adminer/
WORKDIR /var/www/html/adminer
RUN php compile.php

# Install dependencies
RUN docker-php-ext-install -j$(nproc) pdo_mysql
