#!/usr/bin/env bash
docker-compose stop electrum-server
docker-compose build electrum-server
docker-compose start electrum-server