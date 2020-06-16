FROM drupal:8.9.0-apache
COPY drupal-8.9.0.zh-hans.po /var/www/html/sites/default/files/translations/
RUN chmod -fR go-x /var/www/html/sites
RUN chown -fR www-data:www-data /var/www/html/sites
RUN pecl install uploadprogress-1.1.3 && docker-php-ext-enable uploadprogress
RUN pecl install apcu-5.1.18 && docker-php-ext-enable apcu