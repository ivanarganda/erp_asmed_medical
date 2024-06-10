FROM php:8.1-apache

# Instalar extensiones y dependencias necesarias
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo pdo_mysql

# Copiar archivos de la aplicación
COPY . /var/www/html/erp_asmed_medical/backend/

# Configurar permisos y habilitar mod_rewrite
RUN chown -R www-data:www-data /var/www/html \
    && a2enmod rewrite

# Establecer directorio de trabajo
WORKDIR /var/www/html/erp_asmed_medical/backend/

# Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Establecer variable de entorno para permitir superusuario en Composer
ENV COMPOSER_ALLOW_SUPERUSER=1

# Instalar dependencias de Composer
RUN composer install --ignore-platform-reqs

# Ejecutar comandos de optimización de Laravel
RUN php artisan config:cache || true
RUN php artisan route:cache || true
RUN php artisan view:cache || true

# Agregar un script de inicio para depurar el problema
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Exponer puerto
EXPOSE 80

ENTRYPOINT ["docker-entrypoint.sh"]
