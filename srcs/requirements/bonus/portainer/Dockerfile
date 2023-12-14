FROM debian:bullseye

ENV PORTAINER_VERSION=2.19.3 \
    PORTAINER_HOME=/var/lib/portainer

LABEL maintainer="ml@gmail.com" \
      org.label-schema.build-date="14.12.2023" \
      org.label-schema.name="portainer" \
      org.label-schema.description="portainer image" \
      org.label-schema.version="$PORTAINER_VERSION"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y bash dnsutils ca-certificates curl jq tar && \
    rm -rf /var/lib/apt/lists/*

RUN echo "PORTAINER_HOME: ${PORTAINER_HOME}" && \
    mkdir $PORTAINER_HOME && \
    groupadd -r portainer && \
    useradd -r -g portainer -s /bin/bash -m -d $PORTAINER_HOME portainer && \
    chown -R portainer:portainer $PORTAINER_HOME

RUN curl -sSL https://github.com/portainer/portainer/releases/download/${PORTAINER_VERSION}/portainer-${PORTAINER_VERSION}-linux-amd64.tar.gz | \
    tar -xzo -C /usr/local

CMD ["/usr/local/portainer/portainer"]
