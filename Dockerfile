FROM php:5.6-apache

RUN a2enmod rewrite
RUN a2enmod expires
RUN a2enmod mime
RUN a2enmod filter
RUN a2enmod deflate

RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev && rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd
RUN docker-php-ext-install mysqli

CMD ["apache2-foreground"]