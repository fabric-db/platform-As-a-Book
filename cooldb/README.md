# CoolDB

CoolDB is the platform-facing database contract for agent state.

It is not Coolify. Coolify deploys services. CoolDB stores and indexes the state those services produce.

## Role

CoolDB owns:

- agent state
- box records
- runtime evidence
- deployment evidence
- operational facts
- governed data snapshots

CoolDB does not own:

- deployment orchestration
- domains or SSL
- GitHub integration
- rollback execution
- platform UI operations

Those belong to Coolify and the platform operations layer.

## Default Backing Engine

The current Coolify deployment profile backs CoolDB with SurrealDB:

```text
cooldb
  -> surrealdb/surrealdb
  -> persistent volume cooldb-data
```

The service name remains `cooldb` so the agent platform has a stable contract even if the backing engine changes later.

## Contract

```text
Coolify deploys.
CoolDB stores.
Fabric gives meaning.
AGenNext governs.
```
