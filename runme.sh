#!/bin/sh
pkill -f mapproxy-util
rm -f ~/.cache/JOSM/mirror_http*localhost*
sleep 1
exec mapproxy-util serve-develop mapproxy.yaml
