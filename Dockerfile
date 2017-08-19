FROM openjdk:8-jre-alpine

MAINTAINER zl1030 "zl1030@163.com"

RUN apk update

RUN apk add --no-cache \
    maven

RUN mkdir /usr/workspace

WORKDIR /usr/workspace

ADD ./* ./

RUN mvn clean package

RUN mkdir /usr/target

RUN cp target/DockerBuildTest-1.0-SNAPSHOT.jar /usr/target/

RUN rm -rf /usr/workspace

#ENTRYPOINT ["java","-jar","-d64","-server","/usr/target/DockerBuildTest-1.0-SNAPSHOT.jar"]

CMD ["java","-jar","-d64","-server","/usr/target/DockerBuildTest-1.0-SNAPSHOT.jar"]