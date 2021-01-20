FROM ubuntu
LABEL maintainer="mosherbd@gmail.com"
LABEL LABEL version="1.0"
LABEL description=""

ARG USER_NAME="docker"
ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=America/New_York \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

RUN apt-get update && \
	apt-get install -y sudo && \
    apt-get dist-upgrade -y && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /tmp/* && \
	adduser --disabled-password --gecos '' ${USER_NAME} && \
    adduser ${USER_NAME} sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    echo 'USER="'${USER_NAME}'"; export USER' >> /home/${USER_NAME}/.bashrc && \
    echo 'USER="'${USER_NAME}'"; export USER' >> /home/${USER_NAME}/.profile