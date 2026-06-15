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

Store Gate Layer
  -> AnyDB single store, multi-door AnyData, agent state, box records, evidence records

Platform Operations Layer
  -> Coolify, Docker, Compose, domains, SSL, deploys, rollback

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

## Store Gate Layer

The store gate layer accepts, validates, and stores platform facts that must survive a deployment.

AnyDB is the named store contract and single substrate for this layer. In the default Coolify deployment profile, AnyDB is backed by SurrealDB, but the platform-facing service name remains AnyDB.

AnyData is the governed multivariate envelope that enters at the gate through many doors. AnyDB stores AnyData, agent state, box records, runtime evidence, deployment evidence, and governed data snapshots as one store.

## Platform Operations Layer

The platform operations layer makes the runtime deployable.

Coolify is the default contract for this layer. It owns application deployment, service deployment, domains, SSL, environment injection, logs, and rollback. It does not own agent meaning, identity, policy, trust, or economics.

The rule is:

```text
Coolify runs platform services.
AnyData enters at the gate.
AnyDB stores platform state at the gate as one store.
Fabric gives platform state meaning.
AGenNext governs agent behavior.
The book gates the release.
```

## Evidence Layer

The evidence layer records what happened.

Runtime evidence updates the book through decisions, observations, incidents, evaluations, and maturity signals.
