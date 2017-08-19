FROM java:8

MAINTAINER zl1030 "zl1030@163.com"

ENV JAR_NAME=DockerBuildTest-1.0-SNAPSHOT.jar
ENV WORKSPACE_PATH=/usr/workspace
ENV APP_PATH=/usr/target

RUN mkdir "$WORKSPACE_PATH"

WORKDIR "$WORKSPACE_PATH"

ADD /target/"$JAR_NAME" app.jar

ENTRYPOINT ["java","-jar","app.jar"]
