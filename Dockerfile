# Dockerfile for Flash Attention Development
FROM nvcr.io/nvidia/pytorch:24.11-py3

# Avoid prompts during package installation
ARG DEBIAN_FRONTEND=noninteractive

# Install git and other development tools/dependencies needed for flash-attention
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    ninja-build \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create the mount point
WORKDIR /flash-attention

# Add the installation script with git safety configuration
RUN echo '#!/bin/bash\n\
# Configure git to trust the mounted directory\n\
git config --global --add safe.directory /flash-attention\n\
cd /flash-attention\n\
python setup.py install\n\
' > /usr/local/bin/install-flash-attention.sh \
    && chmod +x /usr/local/bin/install-flash-attention.sh

# Usage:
# docker build -t flashattn .
# docker run --gpus=all --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -it --rm --network=host -v ./:/flash-attention flashattn /bin/bash
# Then inside the container: install-flash-attention.sh