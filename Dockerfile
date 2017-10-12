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
		git

RUN apk add --no-cache --virtual=build-dependencies \
	--repository http://nl.alpinelinux.org/alpine/edge/testing \
	leveldb leveldb-dev

RUN pip install jsonrpclib plyvel 'irc >= 11, <=14.0'

#RUN wget -O - "http://foundry.electrum.org/leveldb-dump/electrum-fulltree-100-latest.tar.gz" | tar --extract --gunzip --strip-components 1 --directory $path --file -

COPY . app/
WORKDIR /app
RUN chmod +x run_electrum_server.py
USER unprivileged

EXPOSE 50001
EXPOSE 8081
EXPOSE 50002
EXPOSE 8082

VOLUME /app
VOLUME /var/electrum-server

CMD ["python", "run_electrum_server.py"]
