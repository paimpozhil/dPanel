#dPanel 

We are creating  a very light weight simple control panel for our own use to migrate 100s of websites hosted on cPanel into Docker based environment. 

Idea is to :

1.  Create a simple system with a web control panel where you can manage websites on multiple docker hosts.
2.  Create a tool that will allow you to migrate out of cPanel / Plesk to our Docker container environment easily.

### Status for now -- 

we have Bash Scripts which will in future serve for API calls/base for this system.

These scripts will let you to create a proper docker setup for hosting Many PHP/HTML/Mysql sites in a server with 

##### a) Data Container for storing the persistent data like /var/lib/www and /var/www , /data , /backup
##### b) Utils container for ssh / backup / any tools you would like to have. 
##### c) all related containers properly linked together so they can see/talk .



You can run many website within the same server under different containers on their own Jails with our setup.

#### Our standard containers allow you to easily start web/mysql servers with various configuration Nginx-phpFPM, apache with php53, mysql individually,etc. They function independently as well so feel free to use them as necessary.

Standard Containers Available : 
##### https://github.com/paimpozhil/dPanel/tree/master/stdcontainers

You can also use dPanel now with CLI , Panel frontend is WIP.

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

## Need ssl? look at https://github.com/paimpozhil/nginx-ssl-reverse-proxy

```

This will start all containers. (Nginx or Apache / Mysql / Data / Utilities )

Data container on your [name] which holds all your important persistent data., be sure to back the volumes inside it.

This also starts a Utils container which has SSH facility on port random host port ( you can find with Docker ps ) and works ONLY via KEY and it is linked to ALL the containers so you can easily inspect every container/issue commands,etc and use this a general Proxy.

Once you get access to this Utils container you can find the SSH key to connect all other Apache/Nginx/Mysql containers on /root/sshkey if you d like to.



### WHY we need this ?

cPanel/Plesk is not free or Open!. 
They cause single point of failure, one site can bring down entire servers, one virus can easily kill 100s of sites.  
Migrating sites between servers are a huge pain.
They do not allow different websites/users to have different versions of softwares ex PHP/Mysql easily.
They take up lot of resources to provide you features you do not require.
We are tired of sites in cPanel / Plesk environment getting out of control and bringing down 50 sites with it.

