FROM bradfeehan/php-nginx

MAINTAINER Brad Feehan "docker-magento@bradfeehan.com"

# Install APT dependencies for Magento
RUN apt-get update --assume-yes --quiet
RUN apt-get install --assume-yes --quiet \
    nginx \
    php5 \
    php5-cli \
    php5-curl \
    php5-gd \
    php5-mcrypt \
    php5-mhash \
    php5-mysql \
    nano

ADD . /docker-build

RUN /docker-build/init/nginx.sh

# Clean up when done
RUN apt-get clean && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* \
    /docker-build

EXPOSE 80

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
