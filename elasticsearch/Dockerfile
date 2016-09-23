FROM local/elkbase:v01
MAINTAINER Diabol.se
ADD elasticsearch.tar.gz /opt/
RUN set -ex \
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
VOLUME \ 
    /opt/elasticsearch/data \
    /opt/elasticsearch/logs \
    /opt/elasticsearch/config
EXPOSE 9200 9300
USER elasticsearch
ENV JAVA_HOME=/opt/java/jdk
ENV PATH=$PATH:JAVA_HOME/bin
CMD ["/opt/elasticsearch/bin/elasticsearch"]
