#!/bin/bash

xhost +

image="pix2pixhd"
tag="latest"
home_dir="/home/user"

docker run \
	-it \
	--rm \
	-e local_uid=$(id -u $USER) \
	-e local_gid=$(id -g $USER) \
	-e "DISPLAY" \
	-v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--gpus all \
	-v $HOME/dataset:$home_dir/dataset \
	-v $(pwd)/mount/checkpoints:$home_dir/pix2pixHD/checkpoints \
	-v $(pwd)/mount/results:$home_dir/pix2pixHD/results \
	-v $(pwd)/mount/my_scripts:$home_dir/pix2pixHD/my_scripts \
	$image:$tag
