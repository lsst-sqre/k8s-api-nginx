#!/bin/sh
set -e

envsubst < /nginx.conf.template > /nginx.conf
exec nginx -c /nginx.conf -g 'daemon off;'
