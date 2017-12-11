FROM php:7-apache

MAINTAINER Michon van Dooren <michon1992@gmail.com>

# Install dependencies
RUN apt-get update && apt-get install -y apt-transport-https gnupg
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/8/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update && ACCEPT_EULA=Y apt-get install -y libpq-dev msodbcsql unixodbc-dev
RUN pecl install sqlsrv pdo_sqlsrv
RUN docker-php-ext-install -j$(nproc) pdo_mysql pdo_pgsql
RUN docker-php-ext-enable sqlsrv pdo_sqlsrv

# Add + compile adminer
COPY adminer/ /var/www/html/adminer/
WORKDIR /var/www/html/adminer
RUN php compile.php

# Add the index page
COPY index.php /var/www/html
COPY load.php /plugins/load.php

# The volume for plugins
VOLUME /plugins
