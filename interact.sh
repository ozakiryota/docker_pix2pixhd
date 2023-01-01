#!/bin/bash

xhost +

image="pix2pixhd"
tag="latest"

docker run \
	-it \
	--rm \
	-e "DISPLAY" \
	-v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--gpus all \
	-v $HOME/dataset:/root/dataset \
	-v $(pwd)/mount/checkpoints:/root/pix2pixHD/checkpoints \
	-v $(pwd)/mount/results:/root/pix2pixHD/results \
	-v $(pwd)/mount/my_scripts:/root/pix2pixHD/my_scripts \
	$image:$tag
