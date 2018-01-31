#!/bin/sh

echo "${ACNG_CONF}" > /etc/apt-cacher-ng/zzz_override.conf

exec /usr/sbin/apt-cacher-ng -c /etc/apt-cacher-ng
