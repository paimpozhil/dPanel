docker-magento
==============

A Docker image for Magento.



Features
--------

* Based on [Phusion's base Docker image]
* Ubuntu 12.04 LTS
* nginx 1.1.19
* PHP-FPM 5.3.10-1ubuntu3.11
* PHP command-line interface
* All Magento's prerequisite PHP extensions:
    * curl
    * gd
    * mcrypt
    * mhash
    * mysql

[Phusion's base Docker image]: <http://phusion.github.io/baseimage-docker/>

nginx is listening on port 80. By default, the document root is at
`/app`. By mounting your application there, it'll get served on port
80.



Usage
-----

```
FROM bradfeehan/magento

# Regenerate SSH host keys. This image does not contain any, so you
# have to do that yourself. You may also comment out this instruction;
# the init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# ...put your own build instructions here...

# Clean up APT when done to save space
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
```
