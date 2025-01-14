# this is our first build stage, it will not persist in the final image
FROM drupal:latest
RUN  apt-get update
RUN  apt-get install -y git
#RUN git clone https://github.com/ahmedgmansour/cicd-pipeline-train-schedule-jenkins.git
#WORKDIR cicd-pipeline-train-schedule-jenkins
WORKDIR /var/www/html/modules
RUN chmod -R 777 /var/www/html/modules
COPY volume.yml  /var/www/html/modules
RUN touch data.txt
CMD  sh, -c, echo "The writer wrote this!" > data.txt; while true; do sleep 5; done

