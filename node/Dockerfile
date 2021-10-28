FROM brandonmosher/devcontainer-base

LABEL maintainer="code.brandon+docker@mosher.xyz"
LABEL LABEL version="1.0"
LABEL description="node development container image"

ENV NODE_VERSION node
ENV NPM_VERSION latest

COPY utils/* ${DEVCONTAINER_UTILS_PATH}/

RUN npm-install.sh --node-version ${NODE_VERSION} --npm-version ${NPM_VERSION}