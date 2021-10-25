FROM brandonmosher/devcontainer-base

LABEL maintainer="code.brandon+docker@mosher.xyz"
LABEL LABEL version="1.0"
LABEL description="containerized gui development image"

ENV DISPLAY=host.docker.internal:0.0

RUN sudo apt-helper --no-install-recommends xorg libgl1-mesa-glx
