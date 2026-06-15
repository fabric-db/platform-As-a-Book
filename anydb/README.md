# AnyDB

AnyDB is the platform-facing store contract at the gate.

It is not Coolify. Coolify deploys services. AnyDB stores and indexes the state, evidence, and AnyData envelopes those services produce.

AnyDB is the single store substrate for governed platform data at the gate.

```text
single store, multi-door
```

Many doors may admit data. One substrate stores it.

## Role

AnyDB owns:

- AnyData envelopes
- the single governed store substrate
- multivariate dimensions and variables
- agent state
- box records
- runtime evidence
- deployment evidence
- operational facts
- governed data snapshots

AnyDB does not own:

- deployment orchestration
- domains or SSL
- GitHub integration
- rollback execution
- platform UI operations

Those belong to Coolify and the platform operations layer.

## AnyData

AnyData is the gate envelope.

Every record entering the platform should carry:

- identity
- source
- type
- schema
- policy
- evidence
- door
- dimensions
- variables
- timestamp
- trust state

This allows the platform to store many kinds of data without losing governance.

AnyData is multivariate. It can carry many dimensions, such as tenant, actor, service, region, model, policy, time, and cost center, plus measured variables such as latency, spend, risk, trust, health, or maturity.

The substrate remains singular: AnyDB. Many variables, many doors, one governed store.

## Doors

Doors are controlled entry points into the store.

Examples:

- `deployment`
- `agent-state`
- `policy-decision`
- `identity`
- `payment`
- `evaluation`
- `runtime-event`
- `audit`
- `auth-author`

Each door can have its own validation rules, but all accepted records land in the same AnyDB substrate.

## Default Backing Engine

The current Coolify deployment profile backs AnyDB with SurrealDB:

```text
anydb
  -> surrealdb/surrealdb
  -> persistent volume anydb-data
```

The service name remains `anydb` so the agent platform has a stable store contract even if the backing engine changes later.

## Contract

```text
Coolify deploys.
AnyData enters at the gate.
AnyDB stores at the gate as the single store.
Fabric gives meaning.
AGenNext governs.
```
