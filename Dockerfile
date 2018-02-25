FROM alpine:3.7

RUN apk update && \
    apk upgrade && \
    apk add bash openjdk8-jre nodejs wget && \
    rm -rf /var/cache/apk/*

ENV APP_USER=kibana
ENV APP_HOME=/usr/share/kibana
ENV APP_VERSION=5.6.8

RUN addgroup -S ${APP_USER} && adduser -S -D -g '' -s /bin/bash -G ${APP_USER} ${APP_USER}

RUN wget "https://artifacts.elastic.co/downloads/kibana/kibana-${APP_VERSION}-linux-x86_64.tar.gz" -O /tmp/kibana.tar.gz && \
    tar -xvzf /tmp/kibana.tar.gz && \
    mv kibana-${APP_VERSION}-linux-x86_64 /usr/share/kibana && \
    rm -f /tmp/kibana.tar.gz

COPY conf/kibana.yml /usr/share/kibana/config/kibana.yml
COPY entrypoint.sh /usr/share/kibana

RUN chmod +x /usr/share/kibana/entrypoint.sh && \
    chmod +x /usr/share/kibana/bin/kibana && \
    chown -R ${APP_USER}:${APP_USER} ${APP_HOME} && \
    ln -sf /usr/bin/node /usr/share/kibana/node/bin/node && \
    ln -sf /usr/bin/npm /usr/share/kibana/node/bin/npm

ENV ELASTICSEARCH_URL="http://elasticsearch:9200"

USER ${APP_USER}

WORKDIR /usr/share/kibana

EXPOSE 5601
ENTRYPOINT ["/usr/share/kibana/entrypoint.sh"]

