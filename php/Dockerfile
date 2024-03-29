FROM php:8.1.2-apache

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

RUN a2enmod rewrite

# Copy vhost configuration:
COPY ./apache.conf /etc/apache2/sites-enabled/000-default.conf

RUN apt-get update && \
    apt-get install \
    libzip-dev \
    wget \
    git \
    unzip \
    -y --no-install-recommends

# Install PHP Extensions
RUN docker-php-ext-install zip pdo_mysql
RUN pecl install -o -f xdebug-3.2.0 \
    && docker-php-ext-enable xdebug
RUN docker-php-ext-install mysqli \
    && docker-php-ext-enable mysqli

COPY ./install-composer.sh ./
COPY ./php.ini /usr/local/etc/php/

# Cleanup and install composer
RUN apt-get purge -y g++ \
    && apt-get autoremove -y \
    && rm -r /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && sh ./install-composer.sh \
    && rm ./install-composer.sh

WORKDIR /var/www

RUN addgroup --gid ${GID} groupcontainer
RUN adduser -u ${UID} -G groupcontainer -h /home/containeruser -D containeruser

USER ${UID}

CMD ["apache2-foreground"]
