FROM phusion/baseimage:0.9.9

ENV HOME /root

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

CMD ["/sbin/my_init"]

# Nginx-PHP Installation
RUN apt-get update
RUN apt-get install -y vim curl wget build-essential python-software-properties mysql-client nano sshpass lftp git duplicity libssl-dev zlib1g-dev e2fslibs-dev rsync

ADD dpanel_ssh_key.pub /tmp/your_key
RUN cat /tmp/your_key >> /root/.ssh/authorized_keys && rm -f /tmp/your_key

ADD dpanel_ssh_key /root/sshkey
RUN chmod 0600 /root/sshkey

ADD scripts /scripts
RUN chmod 0755 /scripts/*

EXPOSE 22

RUN rm -rf /tmp/* /var/tmp/*
