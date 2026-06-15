# Agent Model

An agent is an accountable runtime actor.

It has identity, objective, permissions, tools, memory, policy, evaluation, and lifecycle state.

## Agent Contract

An agent contract defines:

- name
- objective
- owner
- identity
- allowed tools
- allowed data
- approval gates
- budget limits
- risk class
- evaluation rules
- shutdown conditions

## Agent Lifecycle

```text
Draft
  -> Reviewed
  -> Approved
  -> Active
  -> Probation
  -> Suspended
  -> Retired
  -> Archived
```

## Agent As Data

The platform treats agents as governed records, not invisible scripts.

That means every agent can be:

- inspected
- versioned
- evaluated
- authorized
- revoked
- audited
- replayed

## Human Gate

Agents can propose, generate, and execute within scope.

Humans remain at the gate for critical authority, high-risk action, external commitments, money movement, identity issuance, and policy changes.
