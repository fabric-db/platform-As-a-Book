# BookKeeper Auth/Author Stack

BookKeeper is the auth/author evidence ledger in the book stack.

Authentication answers:

```text
Who is acting?
```

Authorization answers:

```text
May this actor perform this action on this resource?
```

BookKeeper records the ordered evidence that those answers happened at the gate.

## Stack Binding

```text
Identity
  -> subject is authenticated

Policy
  -> action is authorized

BookKeeper
  -> decision evidence is appended

AnyData
  -> decision is wrapped as governed data

AnyDB
  -> decision projection is stored at the gate

Fabric
  -> decision receives semantic meaning

AGenNext
  -> agent behavior is governed
```

## Installation Anchor

BookKeeper can be installed by downloading a release tarball, using a Docker image, or cloning the repository. The official requirements are a Unix environment and JDK 1.8 or later. Source builds use Maven.

For this book stack, that means the minimum platform assumption is:

```text
Unix-compatible runtime
JDK 1.8+
BookKeeper server/client package
Maven only when building from source
```

## Gate Evidence

The auth/author ledger event should include:

- subject
- resource
- action
- authentication result
- authorization result
- policy reference
- gate id
- ledger id
- timestamp
- evidence hash

The event then becomes AnyData and is stored at the gate in AnyDB.

## Rule

```text
No auth/author ledger, no governed release.
```

BookKeeper is the book stack's ordered memory for gate decisions.
