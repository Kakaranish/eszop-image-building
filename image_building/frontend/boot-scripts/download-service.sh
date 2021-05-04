#!/bin/bash

mkdir -p /temp

build_suffix=$1
package_storage_name=$2

build_filename="frontend_${build_suffix}.zip"
gsutil cp "gs://${package_storage_name}/${build_filename}" /temp

mkdir -p /app
unzip -o "/temp/${build_filename}" -d /app > /dev/null 2>&1