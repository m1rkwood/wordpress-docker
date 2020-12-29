# Your Wordpress site inside a Docker Container

Docker setup to install your Wordpress site locally as a development environment.

## Prepare you database & files

Export your database from your production site.
Open the .sql file with an editor and change your production url (i.e `https://example.com` && `https://www.example.com`) to `http://127.0.0.1:8080` using search and replace.

Export the `wp-content` folder of your Wordpress site.

## Setup folder structure & .env

Create an `import` folder.  
Import your `wp-content` folder to the root of your project.  
You should have the following folder structure:

```
import/
wp-content/
.env
docker-compose.yml
disable_plugins.sh
```

Add an export of your database to `import` (.sql format or other)

Duplicate the `.env.template` file and fill all the necessary information (for username and passwords, no need to use the same values as your production site).  
You might want to use `DISABLED_PLUGINS` to disable some plugins like the SEO plugins or the ones that could force SSL.

## Modify docker-compose.yml

Current `docker-compose.yml` file is used for Wordpress 5.6 & Mysql 5.7.  
Change these versions if needed.

If you want to make the database persistent, uncomment the following lines:

```
# - mysql:/var/lib/mysql
```

```
# volumes:
#   mysql:
```

## Start the container

```
docker-compose up -d
```

Your site should be available at `http://127.0.0.1:8080`.

## Disable your plugins

```
docker-compose exec wordpress disable_plugins.sh
```
