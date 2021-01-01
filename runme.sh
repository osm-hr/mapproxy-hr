#!/bin/sh
pkill -f mapproxy-util
sleep 1
exec mapproxy-util serve-develop mapproxy.yaml
