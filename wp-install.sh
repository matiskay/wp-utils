#!/bin/bash


if [[ ! -n $1 ]]; then
  echo "Please insert a project name"
  exit 1
fi

# Mysql Config
MYSQL_USER=""
MYSQL_PASSWORD=""

# Variables
WORDPRESS="http://wordpress.org/latest.tar.gz"
LOCAL_PATH="$HOME/projects"


PROJECT_NAME=$1

PROJECT_PATH=$LOCAL_PATH/$PROJECT_NAME/web

WORDPRESS_PATH=$PROJECT_PATH/wordpress

SERVER_PATH="/var/www/wordpress/$PROJECT_NAME"


TEMP_FILE="/tmp/wordpress$RANDOM"
if [[ -d $PROJECT_NAME ]]; then
  exit 1
fi

# Download the last version of wordpress
mkdir -p $PROJECT_PATH
cd $PROJECT_PATH

wget $WORDPRESS 
tar xvfz latest.tar.gz

cd $WORDPRESS_PATH

# mv wordpress $PROJECT_NAME

# Wordpress Policy
cp wp-config-sample.php wp-config.php

# Create Database 
echo "CREATE DATABASE $PROJECT_NAME" | mysql -u $MYSQL_USER -p$MYSQL_PASSWORD

# Setting up the configuration file 
sed -e "s/database_name_here/$PROJECT_NAME/" \
  -e "s/username_here/$MYSQL_USER/" \
  -e "s/password_here/$MYSQL_PASSWORD/" \
  wp-config.php > $TEMP_FILE 

mv $TEMP_FILE wp-config.php

cd wp-content

mkdir uploads
chmod 777 -R uploads

# Link it to localhost
# Check this magic string
sudo ln -s $WORDPRESS_PATH $SERVER_PATH 

# Housekeeping
# Remove tar.gz file
# Remove temp file
