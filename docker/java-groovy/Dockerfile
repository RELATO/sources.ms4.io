FROM java:8-alpine
MAINTAINER Relato Consultoria <relato.consultoria@gmail.com>

ENV SRC_DIR /app/src
ENV BIN_DIR /app/bin
ENV GROOVY_VERSION 2.4.3
ENV SPRINGBOOT_VERSION 1.5.20.RELEASE

ENV SDKMAN_DIR=/root/.sdkman

RUN apk upgrade --update && \
    apk add --no-cache --update libstdc++ curl ca-certificates bash zip unzip openssl && \
    update-ca-certificates && \
    curl -s "https://get.sdkman.io" | bash && \
    rm -rf /var/lib/apt/lists/* && \
    echo "sdkman_auto_answer=true" > $SDKMAN_DIR/etc/config && \
    echo "sdkman_auto_selfupdate=false" >> $SDKMAN_DIR/etc/config && \
    echo "sdkman_insecure_ssl=true" >> $SDKMAN_DIR/etc/config

RUN bash -c "source /root/.sdkman/bin/sdkman-init.sh && sdk install groovy $GROOVY_VERSION && sdk install springboot $SPRINGBOOT_VERSION"

RUN mkdir -p $SRC_DIR
WORKDIR $SRC_DIR

EXPOSE 8080

CMD ["/bin/bash", "-c", "source $HOME/.bashrc && spring run $SRC_DIR -- -Djava.security.egd=file:/dev/urandom"]
