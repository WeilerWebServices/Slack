FROM alpine

MAINTAINER Jason Hansen <jason@slack.io>

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/slack/aks-probe" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"

RUN apk add --update ca-certificates \
 && apk add bash curl netcat-openbsd bind-tools openssl \
 && rm /var/cache/apk/*

COPY checks /checks/
COPY check /check
