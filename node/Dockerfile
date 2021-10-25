FROM brandonmosher/devcontainer-base

LABEL maintainer="code.brandon+docker@mosher.xyz"
LABEL LABEL version="1.0"
LABEL description="node development container image"

ENV NODE_VERSION node

COPY utils/* ${DEVCONTAINER_UTILS_PATH}/

RUN sudo apt-helper --no-upgrade curl && \
    . nvm-install.sh && \
    . nvm-activate.sh && \
    nvm install ${NODE_VERSION} && \
    npm install -g npm@latest
