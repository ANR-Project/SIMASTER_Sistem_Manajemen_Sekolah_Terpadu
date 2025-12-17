FROM php:8.1-apache

# Ekstensi PHP yang dibutuhkan Laravel
RUN docker-php-ext-install pdo pdo_mysql

# Aktifkan mod_rewrite
RUN a2enmod rewrite

# Salin semua kode aplikasi
COPY . /var/www/html/

WORKDIR /var/www/html

# Install dependency lewat Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN composer install --no-interaction

EXPOSE 80
CMD ["apache2-foreground"]
