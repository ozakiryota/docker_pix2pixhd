#!/bin/bash

python3 test.py \
    --name airsim_label2rgb_320p \
    --dataroot $HOME/dataset/airsim/sample_data \
    --loadSize 320 \
    --no_instance \
    --label_nc 256 \
    --input_nc 4 \
    --data_type 16
