#!/bin/sh
set -e
set_config() {
    KEY=$1
    VALUE=$(eval echo \$${KEY})
    if [ -z "${VALUE}" ]; then
        echo "${KEY} must be set" 1>&2
        exit 1
    fi
    sed -i "s/{{${KEY}}}/${VALUE}/g" /nginx.conf
}

set_config HOSTNAME
for i in BLDSTATUS CCUTTER LTDSTATUS METRICDEV STATUS LTDINDEXER GHSLACKER; do
    for j in HOST PORT; do
	set_config U_${i}_SERVICE_${j}
    done
done
echo "----nginx.conf----"
cat /nginx.conf
echo "------------------"
exec nginx -c /nginx.conf -g 'daemon off;'
