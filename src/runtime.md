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
