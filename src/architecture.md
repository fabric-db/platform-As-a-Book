# Architecture

Platform As A Book uses a layered architecture.

```text
Book Layer
  -> Knowledge, chapters, definitions, decisions

Artifact Layer
  -> Schemas, policies, examples, manifests

Control Layer
  -> Validation, approval, generation, publishing

Runtime Layer
  -> Fabric, agents, services, events, operators

Evidence Layer
  -> Observability, audit, evaluation, incidents
```

## Book Layer

The book gives the platform its language. It defines the meaning of Fabric, Box, Agent, Trust, Policy, Protocol, Runtime, and Operations.

## Artifact Layer

The artifact layer contains machine-checkable files derived from or referenced by the book.

Examples:

- JSON Schema
- schema.org JSON-LD
- OPA/Rego policy
- OpenFGA model
- Kubernetes manifest
- agent contract

## Control Layer

The control layer validates whether the platform artifacts still match the book.

It answers:

- Is the schema valid?
- Is the policy enforceable?
- Is the agent authorized?
- Is the deployment reproducible?
- Is the decision traceable?

## Runtime Layer

The runtime layer executes the platform.

For Fabric DB, the runtime includes data fabric, box model, agent lifecycle, identity, access, policies, events, and reconciliation.

## Evidence Layer

The evidence layer records what happened.

Runtime evidence updates the book through decisions, observations, incidents, evaluations, and maturity signals.
