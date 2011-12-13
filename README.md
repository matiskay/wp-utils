# WP Utils

A set of script to make your life easy.

If you are looking for a good wp-cli utils you should check out [wp-cli](https://github.com/andreascreten/wp-cli).

## The scripts

### wp-install.sh

You can save it in a file and then use as wp-install.sh

```bash
$ bash wp-install.sh myawesomeprojectname
```

The script will create a the project in `$HOME/projects/myawesomeprojectname`
and create a symbolic link to `/var/www/wordpress/myawsomeprojectname`.

### wp-dbmigration.sh

Currently `wp-dbmigration.sh` only provides the queries to migrate wordpress from one domain to the other one.

If you are interested in more sql you should check [wordpress sql queries](http://www.onextrapixel.com/2010/01/30/13-useful-wordpress-sql-queries-you-wish-you-knew-earlier/)
