# Kernel Club: Flash Attention

## Installation
This examples was tested on a machine with Ubuntu 22.04 with 2 NVIDIA RTX 4090. 
The enviroment is created using NGC docker image for PyTorch (Pytorch 24.11).

The solution proposed here just uses the NGC image as a starting point and installs flashattention from source.
The following steps clone the repo and checkout the dev branch, build the docker image and run the container.


##### THIS PART IS NOT UP TO DATE

```bash
git clone https://github.com/rm-wu/flash-attention.git
cd flash-attention/
git checkout dev

# docker pull nvcr.io/nvidia/pytorch:24.11-py3
docker build -t flashattn .
docker run --gpus=all \
	   --ipc=host \
	   --ulimit memlock=-1 --ulimit stack=67108864 \
	   -it --rm --network=host \
	   -v ./:/flash-attention \
	   flashattn /bin/bash

# inside the the container:
cd flash-attention
python setup.py install

```
After that you can commit the image and start working from there.


>[!example] TODO:
> Consider having this into a single Dockerfile or provide a way to pull directly the image.
> Other option to consider add the info to work with Cursor within the container (DevContainer).
