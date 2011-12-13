#! /bin/bash

# I hate wordpress </3
# http://www.oldsiteurl.com
# http://www.newsiteurl.com

if [[ $# -lt 2 ]]; then
  echo 'Please, provide the following parameters: [old_url] [new_url]'
  echo ''
  echo 'For example: '
  echo ''
  echo "    $ bash $0 http://www.oldsiteurl.com http://www.newsiteurl.com"
  echo ""
  exit 1 
fi

OLD=$1
NEW=$2
PROJECT_NAME='Your_awesome_project_name'

replace_guid=$(printf "UPDATE wp_posts SET guid = REPLACE (guid, '%s', '%s');" "$OLD" "$NEW")
replace_siteurl=$(printf "UPDATE wp_options SET option_value = replace(option_value, '%s', '%s') WHERE option_name = 'home' OR option_name = 'siteurl';" "$OLD" "$NEW")
replace_url_in_content=$(printf "UPDATE wp_posts SET post_content = REPLACE (post_content, '%s', '%s');" "$OLD" "$NEW");
replace_postmeta=$(printf "UPDATE wp_postmeta SET meta_value = REPLACE (meta_value, '%s','%s');" "$OLD" "$NEW");

sql="USE $PROJECT_NAME;"

echo $replace_guid
echo $replace_siteurl
echo $replace_url_in_content
echo $replace_postmeta
