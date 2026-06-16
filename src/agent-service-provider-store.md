# Agent Service Provider Store

The Agent Service Provider Store is the place where governed services become discoverable, comparable, deployable, measurable, and accountable.

It is not only a marketplace. A marketplace lists offers. A platform store must preserve identity, contract, permissions, delivery mode, evidence, pricing, support, lifecycle, and trust.

```text
service provider builder
  -> service contract
  -> store listing
  -> policy review
  -> buyer or operator selection
  -> deployment handoff
  -> runtime evidence
  -> trust update
```

## Definition

Agent Service Provider Store means:

```text
A governed store for publishing, discovering, validating, deploying, and operating service provider contracts created by agents, humans, teams, vendors, and managed providers.
```

The store is a trust surface. It must not allow unverified service claims to become production capability.

## What The Store Holds

Each store item must hold:

- service provider contract
- provider identity
- publisher identity
- service objective
- service category
- capability boundary
- required permissions
- required integrations
- delivery modes
- pricing or settlement terms
- support boundary
- risk class
- compliance status
- evidence requirements
- review status
- lifecycle state
- changelog
- retirement path

If a service cannot declare these, it can remain private or draft. It should not be promoted.

## Store Item Lifecycle

```text
draft
  -> submitted
  -> reviewed
  -> approved
  -> published
  -> active
  -> probation
  -> suspended
  -> retired
  -> archived
```

| State | Meaning |
| --- | --- |
| `draft` | Provider or builder agent is still forming the item |
| `submitted` | Item is ready for review |
| `reviewed` | Structure and required fields are complete |
| `approved` | Governance gate allows publication |
| `published` | Item is discoverable in the store |
| `active` | Item can be purchased, deployed, or invoked |
| `probation` | Item is watched because of risk, failures, or newness |
| `suspended` | Discovery may remain, but deployment and invocation are blocked |
| `retired` | Item is intentionally removed from active use |
| `archived` | History and evidence are preserved |

## Store Contract

The store item contract has this shape:

```json
{
  "id": "store-item:fabric-repair-ops",
  "kind": "agent.service-provider-store.item",
  "version": "0.1.0",
  "status": "draft",
  "provider_contract": "examples/agent-service-provider-builder-contract.json",
  "publisher": {
    "id": "provider:platform-ops",
    "verified": true
  },
  "listing": {
    "name": "Fabric Repair Operations",
    "category": "operations",
    "summary": "Governed repair workflow for Fabric deployments.",
    "risk_class": "high"
  },
  "delivery": {
    "modes": ["central", "edge", "air-gapped-edge"],
    "requires_operator_approval": true
  },
  "governance": {
    "review_required": true,
    "evidence_required": true,
    "default_decision": "deny"
  }
}
```

The store item points back to the provider contract. The listing is never the source of truth by itself.

## Store Planes

| Plane | Purpose |
| --- | --- |
| Catalog plane | Search, categories, tags, provider profiles, versions |
| Contract plane | Service provider contract, permissions, risk, lifecycle |
| Delivery plane | Coolify, MCP, API, workflow, private deployment, edge bundle |
| Governance plane | Review, approval, policy, identity, compliance |
| Evidence plane | Runtime logs, trust score, incidents, support history |
| Economic plane | Pricing, settlement, usage, payout, refund, dispute |

The store must connect all planes before a service is trusted.

## Publication Gate

Before publication, the platform must check:

- provider is identified
- publisher is authorized
- service contract exists
- required permissions are declared
- risk class is assigned
- delivery modes are declared
- support boundary is clear
- evidence requirements are present
- rollback or exit path exists
- high-risk services have human approval
- air-gapped claims include offline dependency declarations

The store should fail closed.

## Discovery Rules

Discovery is not only search.

Discovery must expose what the service does, who provides it, what it needs access to, what it costs, what risk class it carries, where it can run, what evidence it emits, what support is included, and what happens when it fails.

The buyer or operator should not need to reverse-engineer the contract.

## Runtime Binding

A published service may bind to:

- an MCP server
- a Coolify deployment contract
- an agent platform contract
- a private API
- an advisory workflow
- a managed operation
- an air-gapped bundle

The binding must be explicit. A store item without a binding is only a listing.

## Trust Update

The store must update trust from evidence.

Trust signals include:

- successful deployments
- failed deployments
- rollback frequency
- incident reports
- response time
- policy denials
- support completion
- customer approvals
- audit completeness
- version stability

Trust should be earned from operation, not claimed in marketing text.

## Final Position

Agent Service Provider Store is the publication layer for governed capability.

The builder agent helps form the service. The store makes the service discoverable and operable. The platform gates the service before it reaches users, data, tools, money, or production environments.

The store exists so that capability can scale without losing accountability.
