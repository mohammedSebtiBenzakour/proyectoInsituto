FROM php:7.0-apache
WORKDIR /var/www/html
RUN apt-get update -y && apt-get install -y libmariadb-dev 
RUN docker-php-ext-install mysqli