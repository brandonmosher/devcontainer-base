FROM brandonmosher/devcontainer-base

ARG TARGETARCH=amd64
ARG AGENT_VERSION=2.185.1

WORKDIR /home/docker/azp

COPY utils/* ${DEVCONTAINER_UTILS_PATH}/

RUN curl -LsS https://aka.ms/InstallAzureCLIDeb | sudo bash && \
    if [ "$TARGETARCH" = "amd64" ]; then \
      AZP_AGENTPACKAGE_URL=https://vstsagentpackage.azureedge.net/agent/${AGENT_VERSION}/vsts-agent-linux-x64-${AGENT_VERSION}.tar.gz; \
    else \
      AZP_AGENTPACKAGE_URL=https://vstsagentpackage.azureedge.net/agent/${AGENT_VERSION}/vsts-agent-linux-${TARGETARCH}-${AGENT_VERSION}.tar.gz; \
    fi; \
    curl -LsS "$AZP_AGENTPACKAGE_URL" | tar -xz; \
    sudo ./bin/installdependencies.sh && \
    sudo apt-helper --clean

ENTRYPOINT [ "bash", "-c", "azureagent-start.sh" ]