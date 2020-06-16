FROM drupal:8.9.0-apache
RUN rm -rf /var/www/html/*
COPY ./code /var/www/html
#RUN chmod -fR a-x /var/www/html
RUN chown -fR www-data:www-data /var/www/html/modules \
    && chown -fR www-data:www-data /var/www/html/sites \
    && chown -fR www-data:www-data /var/www/html/themes 
RUN pecl install uploadprogress-1.1.3 && docker-php-ext-enable uploadprogress \
    && pecl install apcu-5.1.18 && docker-php-ext-enable apcu
ENV DRUPAL_VERSION=9.0.0 DRUPAL_MD5=0