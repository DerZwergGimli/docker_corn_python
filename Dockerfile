# Cretae a telegraf container containing pyhton and later install own application
FROM ubuntu
#ARG DEBIAN_FRONTEND=noninteractive
ENV TZ Europe/Berlin
RUN apt-get update 
#RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get upgrade -y && apt-get install -y python3 python3-pip cron nano

RUN python3 -V
RUN pip3 -V

# SETUP CRON
RUN touch /home/log.log
RUN mkdir /home/pyhton
ADD python/Viessmann_API_InfluxDB_Logger/python_viessmannapi.py /home/Viessmann_API_InfluxDB_Logger
ADD pyhton/ /home/pyhton
COPY cronjob /etc/cron.d/cronjob
RUN chmod 0644 /etc/cron.d/cronjob
RUN crontab /etc/cron.d/cronjob
CMD cron && tail -f /home/log.log
#&& tail -f /var/log/cron.log

#CMD service cron restart
#CMD /bin/sh