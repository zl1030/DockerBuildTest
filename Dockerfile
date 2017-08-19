FROM maven:3.5.0-jdk-8

MAINTAINER zl1030 "zl1030@163.com"

#ENV JAR_NAME=DockerBuildTest-1.0-SNAPSHOT.jar
#ENV WORKSPACE_PATH=/usr/workspace
#
#RUN mkdir "$WORKSPACE_PATH"
#
#WORKDIR "$WORKSPACE_PATH"
#
#ADD /target/"$JAR_NAME" app.jar
#
#ENTRYPOINT ["java","-jar","app.jar"]

CMD ["/usr/bin/mvn","clean","package"]

CMD ["java","jar","target/DockerBuildTest-1.0-SNAPSHOT.jar"]
