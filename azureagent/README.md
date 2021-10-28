# Run

```
docker run -e AZP_URL=<Azure Instance URL> -e AZP_TOKEN=<Azure User Token> -e AZP_AGENT_NAME=mydockeragent brandonmosher/devcontainer-azureagent:latest
```

# Variants

## dotnetcore

Depends on dotnet/utils and node/utils, so docker build must be run with PATH=..