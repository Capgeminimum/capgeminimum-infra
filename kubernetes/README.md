# Kubernetes Manifests

This directory contains Kubernetes deployment manifests for Capgeminimum services.

## Structure

Each service should have its own directory with Helm chart or YAML manifests:

```bash
kubernetes/
    frontend/          - Angular frontend
    backend/           - Node.js backend
    postgres/          - PostgreSQL database
    redis/             - Redis cache
```

## Guidelines

- Use Helm charts for consistency and reusability
- Each chart should have:
  - `Chart.yaml` - Chart metadata
  - `values.yaml` - Default values
  - `templates/` - Kubernetes manifests
- Update from the k3s cluster:

```bash
helm install <release-name> ./<chart-directory> -n capgeminimum
# or
kubectl apply -f <manifest.yml>
```
