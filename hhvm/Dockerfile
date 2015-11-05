FROM phusion/baseimage:0.9.17
MAINTAINER Ben Merckx

RUN curl http://dl.hhvm.com/conf/hhvm.gpg.key | sudo apt-key add -
RUN echo deb http://dl.hhvm.com/ubuntu trusty main | sudo tee /etc/apt/sources.list.d/hhvm.list

RUN apt-get update && apt-get -y install \
    php5-mysql php5-curl php5-redis php5-gd php5-xmlrpc php5-tidy \
    php5-mcrypt php5-cli php5-ldap php5-intl php-pear php5-memcache php5-xsl \
    ssmtp \
    hhvm \
    && rm -rf /var/lib/apt/lists/*

COPY php.ini /etc/hhvm/php.ini

RUN chmod 640 /etc/ssmtp/ssmtp.conf && \
    chown root:mail /etc/ssmtp/ssmtp.conf
ADD ssmtp/ssmtp.sh /etc/ssmtp.sh

EXPOSE 9000

CMD bash /etc/ssmtp.sh && hhvm --mode=server