#dPanel 

We are creating  a very light weight simple control panel for our own use to migrate 100s of websites hosted on cPanel into Docker based environment.

Docker gets many things right where the cPanel fails.. 

Idea is to :

#### Create a simple tool and then a web control panel where you can manage websites on multiple docker hosts.

#### Create a tool that will allow you to migrate out of cPanel / Plesk to our Docker container environment easily.


### Status for now -- we do not have any web panel yet. just Bash Scripts which will in future serve for API calls/base for this system.

These scripts will let you already to create a proper setup for hosting any PHP/HTML website with Mysql backend with a Data Container for storing the persistent / Utils container for ssh / backup / any tools you would like to have. The containers are hardcoded to map the ports to the Host so right now the way it works , you can host only 1 website per server. This will change in future . You can change mapping inside the ./stdcontainers/startall.sh scripts very easily

### We have many standard Docker containers which do work independently as well and would help someone setting up apache/nginx/mysql/etc from start.


Standard Containers Available : 
##### https://github.com/paimpozhil/dPanel/tree/master/stdcontainers
Mysql , Apache PHP , Nginx PHP , Utils


You can also use dPanel already if you are comfortable with Docker and commandline.

All you need to do is 

```
git clone https://github.com/paimpozhil/dPanel.git 
cd dPanel/stdcontainers
chmod a+x *.sh
./buildall.sh [name] # name can be your sitename or anything 
## Keys folder now will contain a new key called dpanel-key-[name] which you have to copy to a safe place and you will require this to # ssh to the containers
./startall.sh [name]
```

This will start all 5 containers. 
right now it has Nginx at port 80 and apache on 81 by default you can swap or stop one of them this if you want

This starts a Data container on your [name] which holds all your important persistent data.

This also starts a Utils container which has SSH facility on port 2222 and works ONLY via KEY and it is linked to ALL the containers so you can easily inspect every container/issue commands,etc and use this a general Proxy.


Once you get access to this Utils container you can find the SSH key to connect all other Apache/Nginx/Mysql containers on /root/sshkey if you d like to.



### WHY?

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
