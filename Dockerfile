FROM maven:3.5.0-jdk-8

MAINTAINER zl1030 "zl1030@163.com"

ARG WORKSPACE="/usr/workspace"
ENV APP_PATH="/usr/app"
ENV JAR_NAME="DockerBuildTest-1.0-SNAPSHOT.jar"

RUN mkdir "$WORKSPACE" "$APP_PATH"

WORKDIR "$WORKSPACE"

COPY . .

RUN set -e \
    && RUN mvn install -DskipTests=true -Dmaven.javadoc.skip=true -B -V \
    && mvn clean package \
    && cp "$WORKSPACE"/target/"$JAR_NAME" "$APP_PATH"/ \
    && rm -rf "$WORKSPACE"

WORKDIR "$APP_PATH"

CMD ["java","-jar","$APP_PATH/$JAR_NAME"]
