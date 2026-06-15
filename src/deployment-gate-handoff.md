# Deployment Gate Handoff

The deployment gate is where the book stops being only a specification and becomes an operating handoff.

The handoff is:

```text
GitHub Actions
  -> release-gate
  -> env config
  -> Coolify app registry
  -> Docker Compose payload
  -> Coolify deployment
  -> runtime evidence
  -> BookKeeper ledger
  -> AnyDB store
```

## All Apps Are Reconciled

Coolify apps are not deployed one by one by memory.

They are declared in:

```text
coolify/apps.registry.json
```

Each enabled app must name:

- its compose file
- its deployment contract
- its environment config
- its gate handoff file
- its required variables
- its store
- its ledger
- its release gate

That makes deployment a reconciled state, not an operator guess.

## Env Configs

Runtime app variables live in:

```text
coolify/env/production.env.example
```

Gate variables live in:

```text
coolify/env/gate.env.example
```

The split matters.

The app env config belongs to the running service.

The gate env config belongs to the deployment path that hands the app to Coolify.

## Hand Off At The Gate

The release gate requires:

- app registry validation
- env config presence
- compose payload generation
- Coolify app creation or update
- deployment trigger
- health evidence

Until those are present, the app is not fully handed off.

## Single Substrate, Multi Door

All deployment evidence lands on the same substrate:

```text
AnyDB
```

Evidence enters through multiple doors:

- deployment
- auth-author
- runtime-event
- audit

BookKeeper records the auth/author and handoff evidence, while AnyDB stores the operational state.
