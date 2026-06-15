# Binding Gate

The binding gate is the release gate where the platform proves that its layers are connected.

The platform must not pass release because the book sounds coherent. It passes only when the book, deployment contract, database contract, policy, and runtime evidence are bound together.

## Gate Rule

```text
No binding, no release.
```

The gate is deny-by-default. If a required binding is missing, the release is immature and must not be promoted.

## Binding Chain

```text
Book
  -> explains release intent
  -> gates the release

Coolify
  -> deploys the services

AnyData
  -> enters at the gate

AnyDB
  -> stores AnyData, agent state, and evidence at the gate as one substrate

Fabric
  -> gives stored state semantic meaning

AGenNext
  -> governs agent behavior

Policy
  -> enforces what may run

BookKeeper
  -> records auth/author gate evidence
```

## Machine Binding

The machine-readable binding lives in:

- `bindings/platform-binding.json`
- `schemas/platform-binding.schema.json`

The binding file must prove:

- Coolify is bound to AnyDB through the compose stack
- AnyData is bound to AnyDB at the release gate
- AnyDB is bound to Fabric through the state contract
- Fabric is bound to AGenNext through semantic meaning
- AGenNext is bound to policy through governance
- policy is bound to BookKeeper for auth/author evidence
- BookKeeper is bound back to AnyData as ledger evidence
- the book is bound to the release gate

## Gate Evidence

Every binding must point to evidence.

Evidence can be:

- a compose file
- a schema
- a policy
- a book chapter
- a contract file
- a runtime record
- an AnyData envelope
- a BookKeeper auth/author ledger event

At the gate, evidence is not decoration. Evidence is what makes the binding auditable.

## Store At Gate

AnyData is accepted only through the gate.

```text
AnyData
  -> validate envelope
  -> validate dimensions and variables
  -> bind source and policy
  -> store in AnyDB
  -> expose to Fabric
  -> govern through AGenNext
```

The gate is where arbitrary data becomes governed platform data.

## Multivariate Gate

The gate must preserve more than a single event.

AnyData can carry many dimensions and variables at the same time:

- tenant
- actor
- service
- policy
- model
- region
- time
- cost
- latency
- health
- trust
- maturity

This is what allows AnyDB to store operational, economic, governance, and agent-state signals together without flattening away meaning.

## Single Substrate

The platform can accept many data shapes, but the gate binds them into one governed substrate.

```text
many data types
  -> AnyData envelopes
  -> many doors
  -> release gate
  -> AnyDB substrate
  -> Fabric meaning
```

The substrate rule is:

```text
Single store, multi-door.
```

This keeps the platform analyzable, governable, and replayable.

## Multi-Door Gate

Each door is an entry route into the same store.

```text
deployment door
agent-state door
policy-decision door
identity door
payment door
evaluation door
runtime-event door
audit door
auth-author door
  -> AnyData
  -> release gate
  -> AnyDB
```

The door may differ. The store does not fragment.

## Auth/Author Ledger At Gate

Authentication and authorization decisions must be ledgered before the release is considered governed.

```text
auth/author decision
  -> BookKeeper ledger append
  -> AnyData evidence envelope
  -> AnyDB store at gate
```

This makes the gate replayable: the platform can prove who acted, what was allowed, which policy applied, and what evidence was stored.

## Release Decision

```text
if binding is complete:
  release may continue
else:
  release is blocked
```

This turns the book from documentation into an operating control.
