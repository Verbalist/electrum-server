FROM alpine:3.6
MAINTAINER Sergey Berebko <serbernar1@gmail.com>


RUN addgroup -S unprivileged -g 1000 && adduser -S unprivileged -u 1000

RUN apk update
RUN apk add --no-cache --update python py-pip \
	&& apk add --no-cache --update --virtual .build-deps\
		alpine-sdk \
		make \
		g++ \
		musl-dev \
		autoconf \
		automake \
		libtool \
		libffi-dev \
		gmp-dev \
		python-dev \
		openssl-dev \
		git \
		curl

RUN apk add --no-cache --virtual=build-dependencies \
	--repository http://nl.alpinelinux.org/alpine/edge/testing \
	leveldb leveldb-dev

RUN pip install jsonrpclib plyvel 'irc >= 11, <=14.0'

VOLUME /app
RUN mkdir /var/electrum-server
VOLUME /var/electrum-server

EXPOSE 50001
EXPOSE 8081
EXPOSE 50002
EXPOSE 8082

COPY electrum_sib.conf /etc/
COPY entrypoint.sh /
RUN chmod +x entrypoint.sh
USER unprivileged

CMD ["./entrypoint.sh"]
