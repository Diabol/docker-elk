FROM diabol/elkbase
MAINTAINER Diabol.se
RUN set -ex \
	&& curl -L -o /opt/elasticsearch.tar.gz \
            https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.4.0/elasticsearch-2.4.0.tar.gz \
	&& tar -xzf /opt/elasticsearch.tar.gz -C /opt \
        && yum update -y \
        && groupadd elasticsearch \
        && useradd -g elasticsearch elasticsearch \
        && mv /opt/elasticsearch-[0-9].* /opt/elasticsearch \
        && chmod 777 /opt/elasticsearch
WORKDIR /opt/elasticsearch
RUN set -ex \
	&& for path in \
		./data \
		./logs \
		./config \
		./config/scripts \
	; do \
		mkdir -p "$path"; \
		chown -R elasticsearch:elasticsearch "$path"; \
	done
EXPOSE 9200 9300
USER elasticsearch
ENV JAVA_HOME=/opt/java/jdk
ENV PATH=$PATH:JAVA_HOME/bin
CMD ["/opt/elasticsearch/bin/elasticsearch"]
