FROM ubuntu
LABEL maintainer="mosherbd@gmail.com"
LABEL LABEL version="1.0"
LABEL description=""

ARG USERNAME="docker"
ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=America/New_York
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
COPY scripts/*.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/apt-install-wrapper.sh /usr/local/bin/adduser-nopasswd-sudo.sh && \
    apt-install-wrapper.sh sudo && \
	adduser-nopasswd-sudo.sh ${USERNAME}

USER ${USERNAME}