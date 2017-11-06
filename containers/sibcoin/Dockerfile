FROM ubuntu:16.04

RUN apt-get update -y
RUN apt-get install make bsdmainutils g++ python-leveldb libboost-all-dev libssl-dev libdb++-dev pkg-config libevent-dev -y
RUN apt-get install wget -y

RUN adduser sibcoin --disabled-password

#RUN gem install gosu
#RUN apt-get autoremove -y; \
#	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;



#USER sibcoin
WORKDIR /root/sibcoin
RUN mkdir src
RUN wget https://github.com/ivansib/sibcoin/releases/download/v0.16.1.1/sibcoin-0.16.1-linux64.tar.gz
RUN tar xfz sibcoin-0.16.1-linux64.tar.gz
WORKDIR /root/sibcoin/sibcoin-0.16.1

RUN cp -r bin/ /usr/

COPY sibcoin.conf /root/.sibcoin/

RUN mkdir /home/sibcoin/data
VOLUME /home/sibcoin/data

RUN chown -R sibcoin:sibcoin /home/sibcoin

#USER sibcoin
WORKDIR /home/sibcoin
RUN echo $(ls)
COPY entrypoint.sh /home/sibcoin
RUN chmod +x /home/sibcoin/entrypoint.sh

#USER sibcoin

EXPOSE 8332
EXPOSE 8333
EXPOSE 1944

ENTRYPOINT ["./entrypoint.sh"]
