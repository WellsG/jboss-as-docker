FROM jboss/base:latest

ENV jdk_repo http://vault.centos.org/centos/7.0.1406/updates/x86_64/Packages
ENV jdk_vr 1.7.0.71-2.5.3.1.el7_0
ENV jboss_version jboss-as-7.1.1.Final

User root

RUN yum -y install wget && \
    yum clean all

RUN wget -O /opt/java-1.7.0-openjdk-headless.x86_64.rpm ${jdk_repo}/java-1.7.0-openjdk-headless-${jdk_vr}.x86_64.rpm && \
    wget -O /opt/java-1.7.0-openjdk.x86_64.rpm ${jdk_repo}/java-1.7.0-openjdk-${jdk_vr}.x86_64.rpm && \
    wget -O /opt/java-1.7.0-openjdk-devel.x86_64.rpm ${jdk_repo}/java-1.7.0-openjdk-devel-${jdk_vr}.x86_64.rpm && \
    yum install -y /opt/java-1.7.0-openjdk-headless.x86_64.rpm && \
    yum install -y /opt/java-1.7.0-openjdk.x86_64.rpm && \
    yum install -y /opt/java-1.7.0-openjdk-devel.x86_64.rpm && \
    yum clean all && \
    rm /opt/java*.rpm

RUN wget -O /opt/${jboss_version}.zip http://download.jboss.org/jbossas/7.1/${jboss_version}/${jboss_version}.zip && \
    unzip /opt/${jboss_version}.zip && \
    rm /opt/${jboss_version}.zip

EXPOSE 80 8080 9990

CMD ["tail", "-f", "/dev/null"]
