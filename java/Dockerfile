FROM brandonmosher/devcontainer-base

LABEL maintainer="code.brandon+docker@mosher.xyz"
LABEL LABEL version="1.0"
LABEL description="java development container image"

ARG JAVA_VERSION="java"
ARG ANT_VERSION="ant"
ARG MAVEN_VERSION="maven"
ARG GRADLE_VERSION="gradle"
ARG IVY_VERSION=2.5.0
ARG IVY_JAR_DEST_FILEPATH=~/.sdkman/candidates/ant/current/lib/
ARG VERSION_CONTROL=git

COPY utils/* ${DEVCONTAINER_UTILS_PATH}/

RUN sudo apt-helper --no-upgrade zip unzip curl gpg ${VERSION_CONTROL} && \
    sdk-install.sh ${JAVA_VERSION} ${ANT_VERSION} ${MAVEN_VERSION} ${GRADLE_VERSION} && \
    ivy-install.sh ${IVY_VERSION} ${IVY_JAR_DEST_FILEPATH}
