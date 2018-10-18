#
# Dockerfile for netflow collector
#

FROM alpine:3.5
MAINTAINER Gotes.org, scoop. <suport@gotes.org>

RUN set -xe \
    && mkdir -p /srv/netflow/ \
    && apk add --no-cache nfdump

VOLUME /srv/netflow

EXPOSE 9995/udp

ENTRYPOINT ["/usr/bin/nfcapd","-t","3600","-z","-w","-l","/srv/netflow/","-p","9995"]
