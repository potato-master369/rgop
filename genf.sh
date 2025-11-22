#!/bin/bash

ffmpeg -i badapple.mp4 \
-filter_complex "[0:v] fps=18.2065124526,scale=96:72:flags=bicubic,format=gray" \
-f image2 \
src/output_%04d.pgm

