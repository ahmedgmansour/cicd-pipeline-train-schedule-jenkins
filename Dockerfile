# this is our first build stage, it will not persist in the final image
FROM drupal:latest
COPY /var/jenkins_home/workspace/test_master/bin  /var/www/html/modules
CMD  ['bash', '-c', 'echo "The writer wrote this!" > /output/data.txt; while true; do sleep 5; done']
