# Coolify Platform Contract

Coolify is the platform operations layer.

It is not the agent economy, not the identity authority, not the governance brain, and not the semantic runtime. It is the self-hosted platform surface that deploys, updates, rolls back, routes, and operates the services that make the higher platform real.

For Platform As A Book, Coolify becomes a contract boundary:

```text
Book
  -> Platform contract
  -> Git repository
  -> CI artifact
  -> Coolify deployment
  -> Runtime evidence
  -> Book update
```

## Position In The Stack

```text
AGenNext / Fabric Runtime
  -> agents, boxes, identity, policy, trust, economics

Coolify Platform Layer
  -> applications, services, databases, domains, SSL, deploys

Docker / Compose / Images
  -> containers, networks, volumes, health checks

Server Layer
  -> VPS, bare metal, private cloud, edge node
```

Coolify owns the deployment surface. AGenNext owns the meaning of what is deployed.

## What Coolify Must Guarantee

The Coolify contract should guarantee:

- a declared application can be deployed from a Git repository, container image, Dockerfile, or Docker Compose file
- a deployment can be repeated from the same source and environment contract
- domains and HTTPS can be bound to the deployed application
- environment variables and secrets can be provided without hard-coding them into source
- persistent volumes are explicit and named
- database and service resources are visible as managed platform resources
- deployment logs are available for audit and repair
- failed deployments do not silently become successful releases
- manual and automated deployment modes are both supported

The contract is operational, not philosophical. It must say exactly what is expected before a service is allowed to run.

## What Must Not Be Delegated To Coolify

Coolify should not be treated as the source of truth for:

- agent identity
- DID or verifiable credentials
- agent authorization
- OPA policy decisions
- OpenFGA relationship tuples
- business contracts
- trust scoring
- payment settlement
- marketplace discovery
- semantic schema governance
- agent memory
- runtime economics

Those belong to the AGenNext and Fabric layers.

Coolify can host those services. It must not define their meaning.

## Deployment Contract

Every deployable unit should have a contract.

```yaml
id: agennext-api
kind: application
platform: coolify
source:
  type: git
  repository: github.com/agennext/agennext-api
  branch: main
build:
  type: dockerfile
  dockerfile: Dockerfile
runtime:
  port: 8080
  health_path: /health
  restart_policy: unless-stopped
environment:
  required:
    - DATABASE_URL
    - OPA_URL
    - OPENFGA_API_URL
    - AGENT_IDENTITY_ISSUER
storage:
  volumes: []
release:
  strategy: rolling
  rollback_required: true
evidence:
  logs_required: true
  deployment_id_required: true
  commit_sha_required: true
```

This contract can be expressed as YAML, JSON Schema, a repository policy, or a generated deployment manifest. The important point is that deployment intent is not trapped in a UI click.

## Compose Contract

When Docker Compose is used, the compose file becomes the single operational source for the service graph.

```yaml
services:
  agennext-api:
    image: ghcr.io/agennext/agennext-api:${IMAGE_TAG}
    restart: unless-stopped
    environment:
      DATABASE_URL: ${DATABASE_URL}
      OPA_URL: ${OPA_URL}
      OPENFGA_API_URL: ${OPENFGA_API_URL}
    healthcheck:
      test: ["CMD", "wget", "-qO-", "http://localhost:8080/health"]
      interval: 30s
      timeout: 5s
      retries: 3
    depends_on:
      - surrealdb

  surrealdb:
    image: surrealdb/surrealdb:latest
    restart: unless-stopped
    volumes:
      - surrealdb-data:/data

volumes:
  surrealdb-data:
```

The contract rule is simple:

```text
If Compose is the deployment mode, Compose must describe runtime reality.
```

Environment, volumes, dependencies, exposed ports, and health checks should be visible in the compose contract.

## GitHub To Coolify Handoff

There are two valid handoff patterns.

### Source Handoff

```text
GitHub push
  -> Coolify pulls repository
  -> Coolify builds
  -> Coolify deploys
```

Use this when the repository is simple and Coolify is trusted to build directly.

### Image Handoff

```text
GitHub push
  -> GitHub Actions builds image
  -> Image pushed to registry
  -> Coolify deploys image
```

Use this when build provenance, SBOM, signing, or stronger release gates are required.

For enterprise agent systems, image handoff is the safer default because the build, scan, sign, and deploy gates are separated.

## Contract Gates

A service should not be promoted unless these gates pass:

- source repository is known
- branch or image tag is pinned
- required environment variables are declared
- health check exists
- persistent storage is named
- domain ownership is clear
- logs are available
- rollback path exists
- runtime owner is known
- policy owner is known
- data classification is known

If any of these are missing, the platform can still deploy, but the book must mark the deployment as immature.

## Evidence Back Into The Book

Coolify emits operational evidence:

- deployment status
- deployment time
- source commit or image tag
- build logs
- runtime logs
- domain binding
- service health
- rollback events
- operator actions

Platform As A Book consumes that evidence to update maturity, reliability, and operational readiness.

```text
Deployment event
  -> Evidence record
  -> Runtime maturity score
  -> Book decision update
```

## Contract Summary

Coolify is the platform for running the services.

AGenNext is the platform for agent meaning.

Fabric is the platform for governed data and state.

The contract between them is:

```text
Coolify runs it.
Fabric records it.
AGenNext governs it.
The book explains and gates it.
```

## References

- Coolify GitHub integration documentation: https://coolify.io/docs/applications/ci-cd/github/overview
- Coolify Docker Compose documentation: https://coolify.io/docs/knowledge-base/docker/compose
- Coolify Docker Compose build pack documentation: https://coolify.io/docs/applications/build-packs/docker-compose
- Coolify Dockerfile build pack documentation: https://coolify.io/docs/applications/build-packs/dockerfile
- Coolify project repository: https://github.com/coollabsio/coolify
