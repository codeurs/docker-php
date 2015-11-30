FROM php:5.5-fpm
MAINTAINER Ben Merckx

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        ssmtp \
    && docker-php-ext-install iconv mcrypt mysql curl redis \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && rm -rf /var/lib/apt/lists/*

RUN chmod 640 /etc/ssmtp/ssmtp.conf && \
    chown root:mail /etc/ssmtp/ssmtp.conf
ADD ssmtp/ssmtp.sh /etc/ssmtp.sh

CMD bash /etc/ssmtp.sh && php-fpm