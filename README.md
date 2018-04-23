# jboss-as-docker
jboss as 7.1.1.Final

````
sudo docker build -t wguo/jboss-7.1.1:0.1 .
````

````
.
├── Dockerfile
├── jboss
│   └── jboss-as-7.1.1.Final.zip
├── jdk
│   ├── java-1.7.0-openjdk-1.7.0.71-2.5.3.1.el7_0.x86_64.rpm
│   ├── java-1.7.0-openjdk-devel-1.7.0.71-2.5.3.1.el7_0.x86_64.rpm
│   └── java-1.7.0-openjdk-headless-1.7.0.71-2.5.3.1.el7_0.x86_64.rpm
└── README.md

````

[jdk rpm](http://vault.centos.org/centos/7.0.1406/updates/x86_64/Packages/)  
[jboss](http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.zip)  
[CentOS Dockerfiles](https://github.com/CentOS/CentOS-Dockerfiles)
