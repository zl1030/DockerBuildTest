FROM zl1030/centos7-jdk8-maven

MAINTAINER zl1030 "zl1030@163.com"

ARG WORKSPACE="/usr/workspace"
ENV APP_PATH="/usr/app"
ENV JAR_NAME="DockerBuildTest-1.0-SNAPSHOT.jar"

RUN mkdir "$WORKSPACE" "$APP_PATH"

WORKDIR "$WORKSPACE"

COPY . .

RUN set -e \
    && mvn install -DskipTests=true -Dmaven.javadoc.skip=true -B -V \
    && mvn clean package \
    && cp "$WORKSPACE"/target/*.* "$APP_PATH"/ \
    && rm -rf "$WORKSPACE" \

WORKDIR "$APP_PATH"

RUN mv "$JAR_NAME" app.jar

CMD ["java","-jar","-d64","-server","app.jar"]
