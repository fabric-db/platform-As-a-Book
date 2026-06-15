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
  -> stores AnyData, agent state, and evidence at the gate

Fabric
  -> gives stored state semantic meaning

AGenNext
  -> governs agent behavior

Policy
  -> enforces what may run
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

At the gate, evidence is not decoration. Evidence is what makes the binding auditable.

## Store At Gate

AnyData is accepted only through the gate.

```text
AnyData
  -> validate envelope
  -> bind source and policy
  -> store in AnyDB
  -> expose to Fabric
  -> govern through AGenNext
```

The gate is where arbitrary data becomes governed platform data.

## Release Decision

```text
if binding is complete:
  release may continue
else:
  release is blocked
```

This turns the book from documentation into an operating control.
