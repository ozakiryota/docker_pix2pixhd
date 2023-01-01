#!/bin/bash

python3 train.py \
    --name airsim_rgb2rgb_320p \
    --dataroot $HOME/dataset/airsim/sample_data \
    --loadSize 320 \
    --no_instance \
    --label_nc 0 \
    --data_type 32 \
    --batchSize 2
