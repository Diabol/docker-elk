FROM local/elkbase:v01
MAINTAINER Diabol.se
ADD kibana.tar.gz /opt/
RUN set -ex \
        && yum update -y \
        && groupadd kibana \
        && useradd -g kibana kibana \
        && mv /opt/kibana-[0-9].* /opt/kibana \
        && chmod 777 /opt/kibana
WORKDIR /opt/kibana
RUN set -ex \
	&& for path in \
		./data \
		./logs \
		./config \
		./config/scripts \
	; do \
		mkdir -p "$path"; \
		chown -R kibana:kibana "$path"; \
	done
VOLUME \ 
    /opt/kibana/data \
    /opt/kibana/logs \
    /opt/kibana/config
EXPOSE 5601
USER kibana
ENV JAVA_HOME=/opt/java/jdk
ENV PATH=$PATH:JAVA_HOME/bin
CMD ["/opt/kibana/bin/kibana"]
