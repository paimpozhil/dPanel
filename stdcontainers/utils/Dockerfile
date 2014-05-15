FROM phusion/baseimage:0.9.9

ENV HOME /root

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

CMD ["/sbin/my_init"]

# Nginx-PHP Installation
RUN apt-get update
RUN apt-get install -y vim curl wget build-essential python-software-properties mysql-client

ADD dpanel_ssh_key.pub /tmp/your_key
RUN cat /tmp/your_key >> /root/.ssh/authorized_keys && rm -f /tmp/your_key

EXPOSE 22

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
