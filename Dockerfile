FROM alpine:edge

MAINTAINER Val Rudi <mail.valik@gmail.com>

RUN mkdir /src
WORKDIR /src

ENV DEBIAN_FRONTEND noninteractive

RUN apk add --update supervisor ruby ruby-dev redis  && gem install --no-ri --no-rdoc redis

ADD . /src/

COPY redis-trib.rb /usr/bin/redis-trib.rb

COPY redis.ini /etc/supervisor.d/redis.ini

COPY redis-start.sh  /bin/redis-start.sh

RUN chmod +x /bin/redis-start.sh

EXPOSE 6379 6380 6381 6382 6383 6384

CMD . /bin/redis-start.sh