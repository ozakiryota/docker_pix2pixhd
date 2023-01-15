#!/bin/bash

image="pix2pixhd"
tag="latest"

docker build . \
    -t $image:$tag \
    --build-arg cachebust=$(date +%s)