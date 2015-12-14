#!/bin/bash

log() {
  echo "$(date) ${*}"
}

log "${0}: setup memcached profile"
source /var/vcap/packages/memcached/profile.sh

log "${0}: copy configuration"
cp /var/vcap/jobs/memcache/config/memcached /etc/memcached.conf

log "${0}: done"
