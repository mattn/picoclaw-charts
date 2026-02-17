# picoclaw

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/picoclaw)](https://artifacthub.io/packages/search?repo=picoclaw)

picoclaw gateway Helm chart for Kubernetes.

## Installation

```bash
helm repo add picoclaw https://mattn.github.io/picoclaw-charts
helm install picoclaw picoclaw/picoclaw
```

## Configuration

Copy `values.yaml` and customize:

```yaml
# my-values.yaml

# ConfigMap (configuration file)
configmap:
  enabled: true
  data:
    config.json: |
      {
        "agents": {
          "defaults": {
            "model": "glm-4.7"
          }
        },
        "channels": {
          "discord": {
            "enabled": true,
            "token": "YOUR_DISCORD_BOT_TOKEN",
            "allow_from": ["YOUR_USER_ID"]
          }
        },
        "providers": {
          "openrouter": {
            "api_key": "sk-or-v1-xxx"
          }
        }
      }

# Secret (environment variables)
secret:
  enabled: true
  data:
    OPENROUTER_API_KEY: sk-or-v1-xxx
    TZ: Asia/Tokyo
```

Available environment variables:
- `OPENROUTER_API_KEY`, `ZHIPU_API_KEY`, `ANTHROPIC_API_KEY`, `OPENAI_API_KEY`, `GEMINI_API_KEY`
- `TELEGRAM_BOT_TOKEN`, `DISCORD_BOT_TOKEN`, `LINE_CHANNEL_SECRET`, `LINE_CHANNEL_ACCESS_TOKEN`
- `BRAVE_SEARCH_API_KEY`

Apply with custom values:

```bash
helm install picoclaw picoclaw/picoclaw -f my-values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| namespace | string | `"picoclaw"` | Kubernetes namespace |
| image.repository | string | `"ghcr.io/mattn/picoclaw"` | Container image |
| image.tag | string | `"latest"` | Image tag |
| service.type | string | `"ClusterIP"` | Service type |
| service.port | int | `18790` | Service port |
| workspace.storage | string | `"1Gi"` | PVC storage size |
