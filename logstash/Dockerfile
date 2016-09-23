FROM local/elkbase:v01
MAINTAINER Diabol.se
ADD logstash.tar.gz /opt/
RUN set -ex \
        && yum update -y \
        && groupadd logstash \
        && useradd -g logstash logstash \
        && mv /opt/logstash-[0-9].* /opt/logstash \
        && chmod 777 /opt/logstash
WORKDIR /opt/logstash
RUN set -ex \
	&& for path in \
		./data \
		./logs \
		./config \
		./config/scripts \
	; do \
		mkdir -p "$path"; \
		chown -R logstash:logstash "$path"; \
	done
USER logstash
ENV JAVA_HOME=/opt/java/jdk
ENV PATH=$PATH:JAVA_HOME/bin
CMD ["/opt/logstash/bin/logstash"]
