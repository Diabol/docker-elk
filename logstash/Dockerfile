FROM diabol/elkbase
MAINTAINER Diabol.se
RUN set -ex \
	&& curl -L -o /opt/logstash.tar.gz https://download.elastic.co/logstash/logstash/logstash-all-plugins-2.4.0.tar.gz \
	&& tar -xzf /opt/logstash.tar.gz -C /opt \
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
#ENTRYPOINT ["/opt/logstash/bin/logstash"]
CMD ["/opt/logstash/bin/logstash", "-f", "/opt/logstash/config/demo.conf"]
