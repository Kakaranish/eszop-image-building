#!/bin/bash

mkdir -p /temp

build_suffix=$1
package_storage_name=$2
service_name=$3

build_filename="${service_name}_${build_suffix}.zip"
gsutil cp "gs://${package_storage_name}/${build_filename}" /temp