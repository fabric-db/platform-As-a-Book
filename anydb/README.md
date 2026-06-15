# AnyDB

AnyDB is the platform-facing store contract at the gate.

It is not Coolify. Coolify deploys services. AnyDB stores and indexes the state, evidence, and AnyData envelopes those services produce.

## Role

AnyDB owns:

- AnyData envelopes
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
- timestamp
- trust state

This allows the platform to store many kinds of data without losing governance.

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
AnyDB stores at the gate.
Fabric gives meaning.
AGenNext governs.
```
