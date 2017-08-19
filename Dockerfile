FROM maven:3.5.0-jdk-8

MAINTAINER zl1030 "zl1030@163.com"

RUN mkdir /usr/app

WORKDIR /usr/app

ADD ./* ./

RUN mvn clean package

CMD ["java","jar","target/DockerBuildTest-1.0-SNAPSHOT.jar"]
