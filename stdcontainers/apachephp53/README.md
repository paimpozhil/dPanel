Docker image for PHP 5.3 with Apache 2 based on Ubuntu OS (with SSH included)
=================


Usage
-----

To create the image  'imgapache53`, execute the following command on the dPanel/stdcontainers/apachephp53 folder:


#Disabe the Docker SSH key 
```
	ssh-keygen -f dpanel_ssh_key
	
	#you should have this file dpanel_ssh_key.pub created on the disk.. 
	# copy the dpanel_ssh_key to some safe place if/you ever need to access this container 
	
	docker build -t imgapache53 .
	
	# image built
```	

Running your LAMP docker image
------------------------------

Start your image binding the external ports 80 in all interfaces to your container:

	docker run -d -p 80:80 imgapache53

Test your deployment:

	open  http://[dockerhost]/

This image allows you to SSH in with the KEY.

List your containers using 
```
 docker ps
```


Loading your custom PHP application
-----------------------------------

	curl http://localhost/

That's it!


Disabling .htaccess
--------------------

`.htacess` is enabled by default. To disable `.htacess`, you can remove the following contents from `Dockerfile`

	# config to enable .htaccess
    ADD apache_default /etc/apache2/sites-available/000-default.conf
    RUN a2enmod rewrite

