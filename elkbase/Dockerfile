FROM centos:7
MAINTAINER diabol.se
RUN set -ex \
    && mkdir /opt/java \
    && curl -L -H "Cookie: oraclelicense=accept-securebackup-cookie" \
        -o /opt/java/jdk.tar.gz \
        http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz \
    && tar -xzf /opt/java/jdk.tar.gz -C /opt/java/ \
    && mv /opt/java/jdk[0-9].* /opt/java/jdk
LABEL name "Diabol Linux" \
      vendor "Diabol" \
      build-date "20160925"

CMD ["/bin/bash"]
