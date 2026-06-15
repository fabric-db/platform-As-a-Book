# Box Model

A Box is the atomic governed unit of the Fabric.

Each Box carries data plus meaning.

## Box Properties

A Box should include:

- stable identifier
- type
- source
- owner
- classification
- created time
- updated time
- provenance
- policy labels
- access scope
- integrity metadata

## Why Box Exists

Systems lose trust when data becomes detached from context.

The Box model keeps the context attached.

```text
Data + Identity + Time + Source + Policy + Provenance = Box
```

## Box Lifecycle

```text
Created
  -> Classified
  -> Linked
  -> Authorized
  -> Used
  -> Audited
  -> Archived
```

## Lossless By Default

The platform should preserve originals and create derived views separately.

Derived data must point back to the source Box.
