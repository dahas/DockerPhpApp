FROM php:8.2.3-apache

# Copy vhost configuration:
COPY apache.conf /etc/apache2/sites-enabled/000-default.conf

# Copy App source files to Apaches Document Root:
COPY src/ /var/www

WORKDIR /var/www

# Open port:
EXPOSE 8000