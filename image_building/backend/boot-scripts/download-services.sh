#!/bin/bash

mkdir -p /temp

build_suffix=$1
package_storage_name=$2

services=("gateway" "offers" "identity" "carts" "orders" "notification")

for service in ${services[@]} ; do
        build_filename="${service}_${build_suffix}.zip"
        gsutil cp "gs://${package_storage_name}/${build_filename}" /temp
done