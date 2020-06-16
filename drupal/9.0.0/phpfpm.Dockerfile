FROM php:fpm
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/
RUN sed -i "s@http://deb.debian.org@https://mirrors.163.com@g" /etc/apt/sources.list
RUN install-php-extensions amqp redis opcache apcu memcached mysqli pdo_mysql gd grpc
RUN pecl install uploadprogress-1.1.3 && docker-php-ext-enable uploadprogress
RUN rm -rf /tmp/pear
COPY ./code /var/www/html
RUN chown -fR www-data:www-data /var/www/html/modules \
    && chown -fR www-data:www-data /var/www/html/sites \
    && chown -fR www-data:www-data /var/www/html/themes 