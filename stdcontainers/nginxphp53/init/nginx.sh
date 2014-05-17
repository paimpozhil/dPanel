#!/bin/bash

# Configure nginx for Magento
rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
cp /docker-build/config/nginx/sites-available/magento /etc/nginx/sites-available/magento
ln -s ../sites-available/magento /etc/nginx/sites-enabled/magento
