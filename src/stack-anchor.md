# Stack Anchor

This is the book stack anchor.

Everything in the platform binds back to one gate and one substrate:

```text
Book stack
  -> release gate
  -> AnyData envelope
  -> many doors
  -> AnyDB single store
  -> BookKeeper auth/author ledger
  -> Fabric meaning
  -> AGenNext governance
```

## Anchor Rule

```text
One stack. One gate. One store. Many doors.
```

The platform may accept many types of data and many operational paths, but it must not fragment its evidence, state, or governance.

## Stack Roles

- Coolify runs the platform services.
- AnyData wraps governed data entering the gate.
- AnyDB is the single store substrate.
- BookKeeper records ordered auth/author evidence.
- Fabric gives stored state semantic meaning.
- AGenNext governs agent behavior.
- The book explains and gates the release.

## Machine Anchor

The machine-readable anchor lives in:

- `anchors/stack-anchor.json`
- `schemas/stack-anchor.schema.json`

The platform binding lives in:

- `bindings/platform-binding.json`

The anchor is valid only when every required artifact exists and the release gate can prove the binding chain.

## Re-Anchor Decision

When the stack drifts, re-anchor it here.

```text
if stack language drifts:
  update book
  update anchor
  update binding
  update gate validation
else:
  release may continue
```

This keeps the book, deploy files, data envelope, ledger, store, and governance model aligned.
