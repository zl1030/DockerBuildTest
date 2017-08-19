FROM alpine:3.6

MAINTAINER zl1030 "zl1030@163.com"

RUN apk update

RUN apk add --no-cache openjdk8 maven

RUN export JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
RUN export JRE_HOME=${JAVA_HOME}/jre
RUN export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
RUN export PATH=${JAVA_HOME}/bin:$PATH

RUN mkdir /usr/workspace

WORKDIR /usr/workspace

ADD ./* ./

RUN mvn clean package

RUN mkdir /usr/target

RUN cp target/DockerBuildTest-1.0-SNAPSHOT.jar /usr/target/

RUN rm -rf /usr/workspace

ENTRYPOINT ["java","-jar","-d64","-server","/usr/target/DockerBuildTest-1.0-SNAPSHOT.jar"]