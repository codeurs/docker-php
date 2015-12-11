FROM php:5.5-fpm
MAINTAINER Ben Merckx

RUN apt-get update && apt-get install -y \
        libfreetype6-dev libcurl4-gnutls-dev libxml2-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        ssmtp \
    && docker-php-ext-install iconv mcrypt mysql mysqli curl json mbstring pdo pdo_mysql xml zip dom \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/2.2.7.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mv phpredis-2.2.7 /usr/src/php/ext/redis \
    && docker-php-ext-install redis

RUN curl -L -o /tmp/lz4.tar.gz https://github.com/kjdev/php-ext-lz4/archive/0.2.3.tar.gz \
    && tar xfz /tmp/lz4.tar.gz \
    && rm -r /tmp/lz4.tar.gz \
    && mv php-ext-lz4-0.2.3 /usr/src/php/ext/lz4 \
    && docker-php-ext-install lz4

RUN chmod 640 /etc/ssmtp/ssmtp.conf && \
    chown root:mail /etc/ssmtp/ssmtp.conf
ADD ssmtp/ssmtp.sh /etc/ssmtp.sh

COPY php.ini /usr/local/etc/php/

CMD bash /etc/ssmtp.sh && php-fpm