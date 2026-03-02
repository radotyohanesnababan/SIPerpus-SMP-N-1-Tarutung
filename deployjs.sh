#!/bin/bash
echo "Sedang menyelaraskan aset..."
rm -rf public/build
git pull origin main
php artisan optimize:clear
echo "SPARTA sudah sinkron!"