# Coolify Deployment Files

This folder contains the real Coolify-facing deployment contract for the agent platform.

The book defines the meaning. These files define the operational handoff.

## Files

- `deployment-contract.json` defines the required platform contract for a deployable agent service.
- `agennext-agent-stack.compose.yml` is a Coolify-ready Docker Compose stack.

## Boundary

Coolify runs the platform services.

It does not define agent identity, policy, trust, memory, or economics. Those are owned by the AGenNext and Fabric layers.

CoolDB is the named data and agent-state service inside the stack. In this deployment profile, CoolDB is backed by the `surrealdb/surrealdb` image, but the platform-facing contract name is `cooldb`.

## Deploy Pattern

```text
GitHub
  -> validation gate
  -> image or source handoff
  -> Coolify
  -> runtime evidence
  -> book update
```

## Required Runtime Variables

- `AGENT_API_IMAGE`
- `AGENT_WORKER_IMAGE`
- `IMAGE_TAG`
- `DATABASE_URL`
- `OPA_URL`
- `OPENFGA_API_URL`
- `AGENT_IDENTITY_ISSUER`
- `SURREAL_ROOT_USER`
- `SURREAL_ROOT_PASS`

## Services

- `agennext-agent-api` exposes the governed agent API.
- `agennext-agent-worker` executes background agent work.
- `cooldb` stores platform state, agent state, and operational records for this deployment profile.

## Coolify Rule

If a service is deployed through Coolify, it must have:

- a source or image reference
- explicit environment variables
- a health check
- named storage when stateful
- logs available for repair
- a rollback path
- a named runtime owner
- a named policy owner
