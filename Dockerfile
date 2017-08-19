FROM centos:7

MAINTAINER zl1030 "zl1030@163.com"

RUN yum update

RUN yum -y install java maven

RUN mkdir /usr/app

WORKDIR /usr/app

ADD ./* ./

RUN ls -l

RUN mvn clean package

ENTRYPOINT ["java","-jar","-d64","-server","target/DockerBuildTest-1.0-SNAPSHOT.jar"]