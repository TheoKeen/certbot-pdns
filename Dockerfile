FROM alpine:3.11
LABEL maintainer="theokeen"

ENTRYPOINT [ "certbot" ]
EXPOSE 80 443
VOLUME /etc/letsencrypt /var/lib/letsencrypt
WORKDIR /opt/certbot

ARG BUILD_DEPENDENCIES="build-base \
    libffi-dev \
    py3-pip \
    py3-cryptography"

ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

# Get dependencies
RUN apk add --no-cache ${BUILD_DEPENDENCIES} && \
    ln -s /usr/bin/pip3 /usr/bin/pip

RUN pip install certbot-dns-powerdns
