ARG PHP_IMAGE
FROM ${PHP_IMAGE}

WORKDIR /var/www/html

ARG LIBRARIES_LIST
RUN apt update && \
    apt update && \
    apt install -y ${LIBRARIES_LIST}

ARG PHP_EXTENSIONS_LIST
RUN docker-php-ext-install ${PHP_EXTENSIONS_LIST}

RUN curl -OL https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar &&\
    chmod +x drush.phar && \
    mv drush.phar /usr/local/bin/drush

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer