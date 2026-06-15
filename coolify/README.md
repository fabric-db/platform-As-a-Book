# Coolify Deployment Files

This folder contains the real Coolify-facing deployment contract for the agent platform.

The book defines the meaning. These files define the operational handoff.

## Files

- `deployment-contract.json` defines the required platform contract for a deployable agent service.
- `agennext-agent-stack.compose.yml` is a Coolify-ready Docker Compose stack.
- `apps.registry.json` lists every Coolify app that must be reconciled.
- `env/production.env.example` is the app environment config surface for Coolify.
- `env/gate.env.example` is the gate/reconciler environment config surface.
- `gate-handoff.json` defines the release-gate handoff from GitHub Actions to Coolify.

## Boundary

Coolify runs the platform services.

It does not define agent identity, policy, trust, memory, or economics. Those are owned by the AGenNext and Fabric layers.

AnyDB is the named store service inside the stack. In this deployment profile, AnyDB is backed by the `surrealdb/surrealdb` image, but the platform-facing contract name is `anydb`.

AnyData enters at the gate. AnyDB stores it at the gate.

## Deploy Pattern

```text
GitHub
  -> validation gate
  -> env-configured handoff
  -> Coolify
  -> runtime evidence
  -> book update
```

## Reconcile All Apps

The reconciler reads `apps.registry.json`, validates the compose file, contract, env config, and gate handoff, then generates the Coolify payload for every enabled app.

Run validation only:

```sh
DRY_RUN=true scripts/reconcile-coolify-apps.sh
```

Run the real handoff by setting the gate env config values:

```sh
COOLIFY_URL=
COOLIFY_TOKEN=
COOLIFY_SERVER_UUID=
COOLIFY_PROJECT_UUID=
DRY_RUN=false
scripts/reconcile-coolify-apps.sh
```

The GitHub Actions workflow `Reconcile Coolify Apps` uses the same gate. With `dry_run=true`, it validates and prints the payload. With `dry_run=false`, it hands the enabled apps to Coolify.

## Required Runtime Variables

These belong in the Coolify app environment.

- `AGENT_API_IMAGE`
- `AGENT_WORKER_IMAGE`
- `IMAGE_TAG`
- `DATABASE_URL`
- `OPA_URL`
- `OPENFGA_API_URL`
- `AGENT_IDENTITY_ISSUER`
- `SURREAL_ROOT_USER`
- `SURREAL_ROOT_PASS`

## Required Gate Variables

These belong in the deployment gate, usually as GitHub Actions secrets.

- `COOLIFY_URL`
- `COOLIFY_TOKEN`
- `COOLIFY_SERVER_UUID`
- `COOLIFY_PROJECT_UUID`
- `COOLIFY_ENVIRONMENT_NAME`

## Services

- `agennext-agent-api` exposes the governed agent API.
- `agennext-agent-worker` executes background agent work.
- `anydb` stores AnyData, platform state, agent state, and operational records for this deployment profile.

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
