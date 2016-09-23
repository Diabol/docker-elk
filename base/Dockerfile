FROM scratch
MAINTAINER diabol.se
ADD centos-7-docker.tar.xz /
RUN mkdir /opt/java
ADD jdk.tar.gz /opt/java/
RUN mv /opt/java/jdk[0-9].* /opt/java/jdk
LABEL name "Diabol Linux" \
      vendor "Diabol" \
      build-date "20160923"

CMD ["/bin/bash"]
