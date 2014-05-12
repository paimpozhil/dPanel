#dPanel 

We are creating  a very light weight simple control panel for our own use to migrate 100s of websites hosted on cPanel into Docker based environment.

Docker gets many things right where the cPanel fails.. 

Create a simple web control panel where you can manage websites on multiple docker hosts.

Create a tool that will allow you to migrate out of cPanel / Plesk to our Docker container environment easily.

### WHY?

cPanel/Plesk is not free or Open!.

They cause single point of failure, one site can bring down entire servers, one virus can easily kill 100s of sites.  

Migrating sites between servers are a huge pain.

They do not allow different websites/users to have different versions of softwares ex PHP/Mysql easily.

They take up lot of resources.


### Tools about to be used:

#### Frontend: PHP/Mysql over Laravel.

#### Reverse Proxy: Nginx (for Multiple sites )

#### WebServer Container ( Apache / Nginx )
 **** Must accept data over /var/www/html

#### DB Container (  MySql & co )
**** Must accept data over /var/lib/mysql 

#### Backup :
s3fs-fuse :  https://github.com/s3fs-fuse/s3fs-fuse



## Shut up where is the code?

Im coding that as we speak and I am still finalizing the technologies to be used.. Please join me if you'd like to help ( paimpozhil @ gmail dot com )
