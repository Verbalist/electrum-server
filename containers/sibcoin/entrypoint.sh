#!/bin/sh -ex

chown sibcoin:sibcoin -R /home/sibcoin/data

#exec gosu sibcoin:sibcoin
sibcoind -datadir=/home/sibcoin/data $@