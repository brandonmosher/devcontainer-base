FROM ubuntu
LABEL maintainer="code.brandon+docker@mosher.xyz"
LABEL LABEL version="1.0"
LABEL description="base development container image"

ARG USERNAME="docker"

ENV DEVCONTAINER_UTILS_PATH=/usr/local/bin

COPY utils/*.sh ${DEVCONTAINER_UTILS_PATH}/

RUN apt-install.sh sudo && \
	adduser-nopasswd-sudo.sh ${USERNAME}

USER ${USERNAME}