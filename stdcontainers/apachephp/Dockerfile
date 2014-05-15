FROM ubuntu:14.04
MAINTAINER Darren Worrall, darren@iweb.co.uk

RUN apt-get update
RUN apt-get install -qy apache2 php5-fpm supervisor libapache2-mod-rpaf
# Common PHP modules
RUN apt-get install -qy php5-cgi php5-mysql php5-gd php5-curl php5-cli php5-xsl php5-memcache php5-mcrypt php5-redis

RUN a2enmod expires rewrite headers proxy_fcgi
RUN rm -r /var/www/*

RUN mkdir -p /var/log/supervisor
# Default timezone
RUN sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/fpm/php.ini
RUN sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/cli/php.ini

RUN php5enmod mcrypt

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD apache_extra.conf /etc/apache2/conf-enabled/apache_extra.conf
ADD www.conf /etc/php5/fpm/pool.d/www.conf

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd 

RUN mkdir -p /root/.ssh
RUN sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

RUN sed -i 's/www\/html/www\//g' /etc/apache2/sites-enabled/000-default.conf

ADD dpanel_ssh_key.pub /tmp/your_key
RUN cat /tmp/your_key >> /root/.ssh/authorized_keys && rm -f /tmp/your_key

EXPOSE 80 
CMD ["/usr/bin/supervisord"]
