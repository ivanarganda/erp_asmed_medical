#!/bin/bash

# Ejecutar composer install
composer install --ignore-platform-reqs

# Ejecutar php artisan package:discover
php artisan package:discover --ansi

# Iniciar Apache en primer plano
apache2-foreground
