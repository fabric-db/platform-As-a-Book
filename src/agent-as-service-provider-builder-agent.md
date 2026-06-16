# Agent As Service Provider Builder Agent

An agent becomes a service provider builder when it can turn a provider's capability into a governed, deployable, auditable service.

This is not a marketplace listing script. It is not a form filler. It is an operating agent that helps a person, team, vendor, maintainer, consultant, managed service provider, or internal platform group package what they can do into a service that can be trusted by others.

```text
provider capability
  -> service contract
  -> delivery model
  -> pricing or settlement model
  -> policy gate
  -> evidence model
  -> published service
  -> runtime support loop
```

## Definition

Agent as Service Provider Builder Agent means:

```text
A governed builder agent that helps convert a provider's skill, tool, product, workflow, API, dataset, or operational capability into a service contract that can be published, deployed, governed, measured, supported, and retired.
```

The builder agent does not replace the provider. It helps the provider become legible to the platform.

## Why This Exists

Most providers do not fail because they lack capability.

They fail because their capability is not packaged clearly enough for others to trust, buy, deploy, govern, or operate.

The missing layer is not only marketing. It is contract formation.

```text
skill without contract -> informal work
tool without policy -> unmanaged risk
service without evidence -> weak trust
provider without lifecycle -> operational drift
```

The Service Provider Builder Agent closes that gap.

## What It Builds

The builder agent creates service provider units.

Each unit must define:

- provider identity
- service name
- service objective
- audience
- capability boundary
- required tools
- required data access
- delivery model
- support boundary
- pricing or settlement model
- risk class
- compliance posture
- evidence requirements
- rollback or exit path
- lifecycle state

The output is not a brochure. The output is an enforceable service contract.

## Provider Types

The framework supports many provider types.

| Provider type | Example |
| --- | --- |
| Individual expert | Architect, engineer, analyst, designer, advisor |
| Team provider | DevOps team, data team, compliance team |
| Vendor | Software company or tool provider |
| Managed service provider | Operator of customer environments |
| Marketplace provider | Packaged service seller |
| Internal platform provider | Shared service team inside an enterprise |
| Community maintainer | Open source project or foundation group |

Each provider can publish capability, but every provider must be governed.

## Builder Workflow

The builder agent follows this loop:

```text
1. Discover provider capability.
2. Classify the service.
3. Define the service objective.
4. Declare users and buyers.
5. Define inputs and outputs.
6. Define tools and data access.
7. Assign risk class.
8. Attach policy gates.
9. Define delivery and support.
10. Define evidence and audit.
11. Generate service contract.
12. Validate contract.
13. Publish to store or keep private.
14. Monitor runtime evidence.
15. Reconcile changes back into the contract.
```

The builder agent must not publish a service that it cannot explain.

## Service Contract

A service provider unit is declared through a contract.

```json
{
  "id": "service-provider:fabric-repair-ops",
  "kind": "agent.service-provider-builder.contract",
  "version": "0.1.0",
  "status": "draft",
  "provider": {
    "id": "provider:platform-ops",
    "name": "Platform Ops",
    "type": "internal-platform-provider"
  },
  "service": {
    "name": "Fabric Repair Operations",
    "objective": "Diagnose failed Fabric deployments and propose governed repair actions.",
    "risk_class": "high",
    "delivery_modes": ["central", "edge", "air-gapped-edge"]
  },
  "builder_agent": {
    "id": "agent:service-provider-builder",
    "requires_human_approval": true
  },
  "governance": {
    "policy_engine": "opa",
    "relationship_engine": "openfga",
    "identity_required": true,
    "evidence_required": true
  }
}
```

This contract makes the provider visible to the platform and accountable to the user.

## Builder Agent Capabilities

Required capabilities:

- provider discovery
- service classification
- offer drafting
- contract generation
- policy mapping
- risk classification
- delivery mapping
- evidence design
- store packaging
- versioning
- support handoff
- retirement planning

High-risk capabilities must require approval before publication.

## Service Planes

The service provider unit has five planes.

| Plane | Purpose |
| --- | --- |
| Identity plane | Who provides the service and who is accountable |
| Capability plane | What the provider can actually do |
| Contract plane | What is promised, scoped, priced, and governed |
| Delivery plane | How the service is deployed or performed |
| Evidence plane | How trust is proven after action |

The builder agent must fill all five.

## Store Publication

When published to a store, the service must include:

- provider profile
- service contract
- version
- categories
- required integrations
- required permissions
- delivery modes
- support terms
- price or settlement terms
- risk class
- compliance notes
- evidence samples
- changelog
- retirement policy

The store is not only a catalog. It is a trust boundary.

## Governance Rules

The builder agent must enforce these rules:

- no anonymous provider for production service
- no service without owner
- no high-risk service without human approval
- no service without evidence requirements
- no service without support boundary
- no service without exit or rollback path
- no public listing if required permissions are unclear
- no air-gapped claim unless offline dependencies are declared

The agent can help write the service. It cannot erase the responsibility of the provider.

## Delivery Binding

For this book, Coolify remains the delivery framework.

```text
service provider contract
  -> agent platform contract
  -> MCP contract
  -> Coolify delivery contract
  -> edge or central deployment
  -> evidence loop
```

The service may be delivered as advisory work, managed operation, API, MCP server, agent workflow, private deployment, store-published package, or air-gapped edge bundle.

Each delivery mode must declare its own evidence path.

## Operating Principle

```text
Capability
  -> Contract
  -> Delivery
  -> Evidence
  -> Trust
```

Capability alone is not enough. The platform must know what is promised, how it is delivered, and how truth is recorded after action.

## Final Position

Agent as Service Provider Builder Agent is the bridge between human capability and platform-grade service.

It helps people and organizations turn what they know, build, operate, maintain, and support into governed services that others can safely discover, use, pay for, audit, and trust.

The provider remains accountable.

The agent makes the provider operationally complete.
