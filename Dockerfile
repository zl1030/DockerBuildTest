FROM openjdk:8u141-jre

MAINTAINER zl1030 "zl1030@163.com"

ENV JAR_NAME=DockerBuildTest-1.0-SNAPSHOT.jar
ENV WORKSPACE_PATH=/usr/workspace
ENV APP_PATH=/usr/target

RUN apt-get update

RUN apt-get install -y \
    maven

RUN mkdir "$WORKSPACE_PATH"

WORKDIR "$WORKSPACE_PATH"

ADD ./* ./

RUN set -eux \
    && mvn clean package \
    && mkdir "$APP_PATH" \
    && cp target/"$JAR_NAME" "$APP_PATH"/app.jar \
    && rm -rf "$WORKSPACE_PATH"

WORKDIR "$APP_PATH"

# ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
# ENV JRE_HOME ${JAVA_HOME}/jre
# ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
# ENV PATH ${JAVA_HOME}/bin:$PATH

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH=$JAVA_HOME/bin:$PATH
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

#ENTRYPOINT ["java","-jar","-d64","-server","app.jar"]

CMD ["java","-jar","app.jar"]