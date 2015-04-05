#!/bin/bash

log() {
  echo "$(date) ${*}"
}

log "${0}: install packages"
export PKG_LOC=/var/vcap/packages/memcache
sudo dpkg -i ${PKG_LOC}/*.deb

log "${0}: copy configuration"
cp /var/vcap/jobs/memcache/config/memcached /etc/memcached.conf

log "${0}: done"
