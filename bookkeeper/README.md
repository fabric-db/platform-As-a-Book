# BookKeeper Auth/Author Ledger

Apache BookKeeper is bound into the book stack as the durable ledger for authentication and authorization evidence.

It is not the policy engine. It is not the identity provider. It records the ordered evidence of what happened at the gate.

## Stack Position

```text
Identity provider
  -> authenticates subject

Policy engine
  -> authorizes action

Release gate
  -> binds decision

BookKeeper
  -> records auth/authz evidence ledger

AnyDB
  -> stores AnyData projection

Fabric
  -> gives meaning
```

## Why BookKeeper

BookKeeper provides a ledger-oriented layer for append-only evidence. In this stack, it records:

- authentication attempt
- authorization decision
- policy version
- subject
- resource
- action
- decision result
- gate id
- evidence hash
- timestamp

## Installation Assumptions

The official BookKeeper installation path supports installing from a tarball, Docker image, or source clone. It requires a Unix environment and Java Development Kit 1.8 or later. Source builds use Maven.

## Gate Rule

```text
Authn/authz decision without ledger evidence is not complete.
```

At the gate, BookKeeper is the ordered evidence ledger. AnyDB stores the governed projection. Fabric gives the projection meaning.
