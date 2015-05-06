#!/bin/bash

# Set the branch name
if [ $2 ]; then
	BRANCH=$2
else
	BRANCH=master
fi

# Set the repository name
#TODO - Detect various incarnations of a repo name/path
# - user/repository
# - github.com/user/repository
# - https://github.com/user/repository
# - https://github.com/user/repository.git
# - git@github.com:user/repository
# - git@github.com:user/repository.git
REPO=$1

TARGET=/var/www/repo

# Clone the repository
git clone -b $BRANCH git@github.com:$REPO.git $TARGET

# Run build steps
composer install -d $TARGET --no-dev --no-interaction

# Set permissions
find $TARGET/tmp -type d -print0 | xargs -0 chmod 777
find $TARGET/logs -type d -print0 | xargs -0 chmod 777

# Move site into place
mv /var/www/site /var/www/old
mv $TARGET /var/www/site
rm -r /var/www/old
