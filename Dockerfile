FROM maven:3.5.0-jdk-8

MAINTAINER zl1030 "zl1030@163.com"

CMD ["/usr/bin/mvn","clean","package"]

CMD ["java","jar","target/DockerBuildTest-1.0-SNAPSHOT.jar"]
