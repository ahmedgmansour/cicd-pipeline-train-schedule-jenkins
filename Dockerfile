# this is our first build stage, it will not persist in the final image
FROM drupal:latest
COPY ./bin  /var/www/html/modules
COPY .  /var/www/html/themes
COPY .  /var/www/html/sites
COPY .  /var/www/html/profiles
COPY .  /var/www/html/php
CMD  ["sh", "-c", "echo $HOME" , "pwd"]
