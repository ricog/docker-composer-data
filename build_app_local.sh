#!/bin/bash

TARGET=/var/www/site

# Run build steps
composer install -d $TARGET --no-interaction

# Set permissions
find $TARGET/tmp -type d -print0 | xargs -0 chmod 777
find $TARGET/logs -type d -print0 | xargs -0 chmod 777
