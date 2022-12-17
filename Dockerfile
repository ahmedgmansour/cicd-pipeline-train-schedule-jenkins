# this is our first build stage, it will not persist in the final image
FROM drupal:latest
COPY .  /var/www/html/modules
CMD  ['bash', '-c', 'echo "The writer wrote this!" > /output/data.txt; while true; do sleep 5; done']
