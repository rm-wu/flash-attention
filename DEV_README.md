# Kernel Club: Flash Attention

## Installation
This examples was tested on a machine with Ubuntu 22.04 with 2 NVIDIA RTX 4090. 
The enviroment is created using NGC docker image for PyTorch (Pytorch 24.11).

```bash
git clone https://github.com/rm-wu/flash-attention.git
cd flash-attention/
git checkout dev

docker pull nvcr.io/nvidia/pytorch:24.11-py3
docker run --gpus=all \
	   --ipc=host \
	   --ulimit memlock=-1 --ulimit stack=67108864 \
	   -it --rm --network=host \
	   nvcr.io/nvidia/pytorch:24.11-py3 /bin/bash

# inside the the container:

git clone https://github.com/rm-wu/flash-attention.git
cd flash-attention
git checkout dev
```
>[!example] TODO:
> Consider having this into a single Dockerfile or provide a way to pull directly the image
