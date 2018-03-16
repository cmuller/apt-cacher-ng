#!/bin/sh

if [ -d /etc/apt-cacher-ng.d ]; then
  for fl in /etc/apt-cacher-ng.d/*; do
    ln -s $fl /etc/apt-cacher-ng/$(basename $fl)
  done
fi

exec /usr/sbin/apt-cacher-ng -c /etc/apt-cacher-ng

