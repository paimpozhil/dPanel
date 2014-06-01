FROM ubuntu:12.04
MAINTAINER Fernando Mayo <fernando@tutum.co>

# Install packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install supervisor git apache2 libapache2-mod-php5 mysql-client pwgen \
    php5 \
    php5-cli \
    php5-curl \
    php5-gd \
    php5-mcrypt \
    php5-mhash \
    php5-mysql \
    nano


# Add image configuration and scripts
ADD start-apache2.sh /start-apache2.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh

ADD supervisord-apache2.conf /etc/supervisor/conf.d/supervisord-apache2.conf


# config to enable .htaccess
ADD apache_default /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod expires

RUN sed -i 's/www\/html/www\//g' /etc/apache2/sites-available/000-default.conf


RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd 

RUN mkdir -p /root/.ssh
RUN sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

ADD dpanel_ssh_key.pub /tmp/your_key
RUN cat /tmp/your_key >> /root/.ssh/authorized_keys && rm -f /tmp/your_key

EXPOSE 3306 80
CMD ["/run.sh"]
