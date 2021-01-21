FROM ubuntu
LABEL maintainer="mosherbd@gmail.com"
LABEL LABEL version="1.0"
LABEL description="base development image"

ARG USERNAME="docker"
ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=America/New_York
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV DEV_BASE_UTILS_PATH=/usr/local/bin
#ENV PATH="${DEV_BASE_UTILS_PATH}:${PATH}"

COPY utils/*.sh ${DEV_BASE_UTILS_PATH}/

RUN apt-install.sh sudo && \
	adduser-nopasswd-sudo.sh ${USERNAME}

USER ${USERNAME}