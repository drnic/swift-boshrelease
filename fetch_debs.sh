#!/bin/bash

# http://mirrors.kernel.org/ubuntu/pool/main/j/jquery/libjs-jquery_1.7.2+dfsg-2ubuntu1_all.deb

for package in memcache swift_proxy swift_storage; do
  echo Package $package
  files=$(cat packages/${package}/spec | yaml2json | jq -r ".files[]")
  for file in ${files[@]}; do
    blobname=$(basename ${file})
    blobdir=$(dirname ${file})
    if [[ ! -f blobs/${blobdir}/${blobname} ]]; then
      basename=$(echo ${blobname} | sed -e "s/_.*//")
      echo missing ${blobname}, searching for $basename
    fi
  done
done
