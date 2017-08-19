FROM centos:7

MAINTAINER zl1030 "zl1030@163.com"

RUN yum -y install java

RUN mkdir /usr/app

WORKDIR /usr/app

ADD target/DockerBuildTest-1.0-SNAPSHOT.jar .

ENTRYPOINT ["java","-jar","-d64","-server","DockerBuildTest-1.0-SNAPSHOT.jar"]