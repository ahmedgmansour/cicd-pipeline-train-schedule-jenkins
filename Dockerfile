# this is our first build stage, it will not persist in the final image
FROM drupal:latest
RUN  apt-get update
RUN  apt-get install -y git
RUN git clone https://github.com/ahmedgmansour/cicd-pipeline-train-schedule-jenkins.git
COPY .  /var/www/html/modules
RUN  ['/bin/sh', '-c', 'echo "The writer wrote this!" > /output/data.txt; while true; do sleep 5; done']
