FROM jboss/base:latest

ENV jdk_repo http://vault.centos.org/centos/7.0.1406/updates/x86_64/Packages 

User root

RUN yum -y install wget httpd openssh-clients vim && \
yum clean all

#COPY jdk/*.rpm /opt/
RUN wget -O /opt/java-1.7.0-openjdk-headless.x86_64.rpm ${jdk_repo}/java-1.7.0-openjdk-headless-1.7.0.71-2.5.3.1.el7_0.x86_64.rpm && \
wget -O /opt/java-1.7.0-openjdk.x86_64.rpm ${jdk_repo}/java-1.7.0-openjdk-1.7.0.71-2.5.3.1.el7_0.x86_64.rpm && \
wget -O /opt/java-1.7.0-openjdk-devel.x86_64.rpm ${jdk_repo}/java-1.7.0-openjdk-devel-1.7.0.71-2.5.3.1.el7_0.x86_64.rpm

RUN yum install -y /opt/java-1.7.0-openjdk-headless.x86_64.rpm && \
yum install -y /opt/java-1.7.0-openjdk.x86_64.rpm && \
yum install -y /opt/java-1.7.0-openjdk-devel.x86_64.rpm && \
rm /opt/java*.rpm

#COPY jboss/* /opt/
RUN wget -O /opt/jboss-as-7.1.1.Final.zip http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.zip
RUN unzip /opt/jboss-as-7.1.1.Final.zip

EXPOSE 80
EXPOSE 8080
EXPOSE 9990

#CMD ["/opt/jboss/jboss-as-7.1.1.Final/bin/standalone.sh", "-b", "0.0.0.0"]
#CMD ["tail", "-f", "/dev/null"]

ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]
