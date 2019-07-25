FROM python:3.7-alpine3.9

MAINTAINER Mike Terzo <mike@terzo.org>

ENV ANSIBLE_HOST_KEY_CHECKING=False
ENV LANG C.UTF-8

RUN mkdir -p /src/
WORKDIR /src
COPY requirements.txt /src

RUN set -ex \
        && apk add --no-cache --virtual .build-deps  \
            gcc \
            libc-dev \
        && pip install --no-cache-dir -r requirements.txt \
        && apk del .build-deps

RUN ln -s /usr/local/bin/python /usr/bin/python
