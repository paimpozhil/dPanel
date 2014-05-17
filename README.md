#dPanel 

We are creating  a very light weight simple control panel for our own use to migrate 100s of websites hosted on cPanel into Docker based environment. We are tired of sites in cPanel / Plesk environment getting out of control and bringing down 50 sites with it.

Idea is to :

1.  Create a simple tool and then a web control panel where you can manage websites on multiple docker hosts.

2.  Create a tool that will allow you to migrate out of cPanel / Plesk to our Docker container environment easily.

3.  Make it easy to setup multiple development environments for our dev teams to try new stuff .

### Status for now -- 

we do not have any web panel yet. just Bash Scripts which will in future serve for API calls/base for this system.

These scripts will let you to create a proper docker setup for hosting any PHP/HTML/Mysql site with 

a) Data Container for storing the persistent 
b) Utils container for ssh / backup / any tools you would like to have. 

You can run many website within the same server under different containers with our setup.

#### We have many standard Docker containers which do work independently as well and would help someone setting up apache/nginx/mysql/etc from start.

Standard Containers Available : 
##### https://github.com/paimpozhil/dPanel/tree/master/stdcontainers
Mysql , Apache PHP , Nginx PHP , Utils


You can also use dPanel already if you are comfortable with Docker and commandline.

All you need to do is 

```
Install DOCKER :)

docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock -t jwilder/nginx-proxy

## This will give you an awesome reverse nginx proxy that auto routes to your docker containers 


git clone https://github.com/paimpozhil/dPanel.git 
cd dPanel/stdcontainers
chmod a+x *.sh
./buildall.sh [name] # name can be your sitename or anything .the auto generated key will be on this name
## Keys folder now will contain a new key called dpanel-key-[name] which you have to copy to a safe place and you will require this to # ssh to the containers
./startall.sh -a [name] -d -p -u

## to know about the options

./startall.sh -h

```

This will start all 4 containers. (Nginx or Apache / Mysql / Data / Utilities )

This starts a Data container on your [name] which holds all your important persistent data.

This also starts a Utils container which has SSH facility on port random host port ( you can find with Docker ps ) and works ONLY via KEY and it is linked to ALL the containers so you can easily inspect every container/issue commands,etc and use this a general Proxy.


Once you get access to this Utils container you can find the SSH key to connect all other Apache/Nginx/Mysql containers on /root/sshkey if you d like to.



### WHY we need this ?

cPanel/Plesk is not free or Open!.
They cause single point of failure, one site can bring down entire servers, one virus can easily kill 100s of sites.  
Migrating sites between servers are a huge pain.
They do not allow different websites/users to have different versions of softwares ex PHP/Mysql easily.
They take up lot of resources to provide you features you do not require.


#### Tools about to be used:

##### Frontend: PHP/Mysql over Laravel.

##### Reverse Proxy: Nginx (for Multiple sites )

##### Backup :
s3fs-fuse :  https://github.com/s3fs-fuse/s3fs-fuse


### Shut up where is the code?

Im coding that as we speak and I Have some scripts that I already use :).

Please join me if you'd like to help ( paimpozhil @ gmail dot com )
