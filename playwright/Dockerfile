FROM brandonmosher/devcontainer-node

LABEL maintainer="code.brandon+docker@mosher.xyz"
LABEL LABEL version="1.0"
LABEL description="playwright development container image"

RUN . nvm-activate.sh && \
    npx playwright install-deps && \
    apt-helper --no-update --no-upgrade git