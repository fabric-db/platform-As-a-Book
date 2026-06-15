# Runtime

The runtime turns the book into an operating system for the platform.

## Runtime Responsibilities

The runtime should:

- load desired state
- validate schemas
- enforce policy
- reconcile resources
- execute agents
- emit events
- record decisions
- expose health
- update evidence

## Reconciliation

Runtime is reconciliation.

```text
Desired State
  -> Actual State
  -> Difference
  -> Action
  -> Evidence
  -> Desired State Update
```

## Kubernetes Native Runtime

The platform can map book-defined artifacts into Kubernetes resources:

- CRDs for agents and boxes
- controllers for reconciliation
- policies for admission
- secrets for controlled access
- events for evidence
- dashboards for operations

## Local First, Cloud Ready

The runtime should support:

- single-node baseline
- edge and air-gapped operation
- multi-cloud deployment
- open standards
- no forced tunnel dependency

## Coolify Runtime Boundary

Coolify can run the runtime, but it is not the runtime brain.

In the runtime contract:

- Coolify starts and updates services
- Docker or Compose defines process reality
- CoolDB stores state and events
- Fabric gives stored state semantic meaning
- policy services decide access
- identity services issue and verify credentials
- agents execute within governed boundaries

This keeps platform operations separate from agent governance.

## CoolDB Runtime Boundary

CoolDB is the stable database service name for the agent platform.

The backing engine may be SurrealDB, Postgres, or another approved store in future profiles, but agents should bind to the CoolDB contract rather than to an implementation name.

CoolDB must preserve:

- agent state
- box state
- decision evidence
- deployment evidence
- runtime events
- audit records
