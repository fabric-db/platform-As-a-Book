# Agent As Platform

An agent is not only a chatbot, worker, script, assistant, or automation.

In this book, an agent becomes a platform when it can hold a contract, expose capabilities, accept governed work, produce evidence, and remain accountable across its lifecycle.

```text
Agent
  -> identity
  -> purpose
  -> capability
  -> policy
  -> context
  -> action
  -> evidence
  -> reconciliation
```

The agent is not the platform because it is intelligent. The agent is the platform because it can become the accountable operating surface where people, tools, data, models, policies, and deployments meet.

## Definition

Agent as Platform means:

```text
A governed agent is a deployable platform unit that exposes capability, receives intent, acts through contracts, writes evidence, and can be operated, audited, repaired, suspended, or retired.
```

The agent is no longer just a runtime process. It is a governed product surface.

It has:

- identity
- owner
- objective
- scope
- tools
- memory
- policy
- context
- deployment
- lifecycle
- evidence
- commercial boundary
- trust score
- kill switch

## Why This Matters

Traditional platforms are built around applications. An application has users, screens, APIs, data, logs, and deployments.

Agent-era platforms are built around accountable actors. The agent can read, reason, call tools, coordinate services, ask for approval, write records, and explain what happened.

This changes the platform boundary.

```text
Old platform:
  application first
  user clicks
  API executes
  logs record

Agent platform:
  objective first
  agent proposes
  policy gates
  tool executes
  evidence records
```

The platform is not only where software runs. It is where decisions become governed action.

## The Agent Platform Unit

Every agent platform unit must be declared as a contract.

Required fields:

- `id`: stable platform identity
- `name`: human-readable name
- `objective`: what the agent is allowed to optimize for
- `owner`: accountable human or organization
- `tenant`: operating boundary
- `status`: lifecycle state
- `risk_class`: low, medium, high, or critical
- `capabilities`: what the agent can do
- `tools`: what the agent can invoke
- `resources`: what context the agent can read
- `models`: what models the agent can use
- `policies`: what gates the agent must pass
- `approvals`: when humans must intervene
- `deployment`: where the agent runs
- `evidence`: what the agent must record

An undeclared agent is not a platform unit. It is an experiment.

## The Four Planes

Agent as Platform has four planes.

| Plane | Purpose |
| --- | --- |
| Intent plane | Receives purpose, objectives, constraints, requests, and approvals |
| Capability plane | Exposes tools, MCP servers, APIs, skills, models, and workflows |
| Governance plane | Enforces identity, policy, access, budget, risk, and human gates |
| Evidence plane | Records decisions, tool calls, deployment events, outputs, and repair history |

These planes make the agent operable.

Without intent, the agent has no direction. Without capability, the agent has no action. Without governance, the agent has no trust. Without evidence, the agent has no accountability.

## Agent Platform Lifecycle

The lifecycle must be explicit.

```text
draft
  -> reviewed
  -> approved
  -> staged
  -> active
  -> probation
  -> suspended
  -> retired
  -> archived
```

Each state has meaning.

| State | Meaning |
| --- | --- |
| `draft` | Agent exists as an idea or contract |
| `reviewed` | Contract is complete enough for governance review |
| `approved` | Human or policy gate has accepted the agent |
| `staged` | Deployment is prepared but not fully active |
| `active` | Agent can receive governed work |
| `probation` | Agent is active but under elevated observation |
| `suspended` | Agent identity remains, but action is blocked |
| `retired` | Agent is intentionally removed from operation |
| `archived` | Agent record is preserved for history and audit |

No agent should jump from draft to production without a gate.

## Platform Contract

The agent platform contract has this shape:

```json
{
  "id": "agent:fabric-repair",
  "kind": "agent.platform.contract",
  "version": "0.1.0",
  "status": "draft",
  "objective": "Detect failed fabric deployments and propose governed repair actions.",
  "owner": "platform-ops",
  "risk_class": "high",
  "capabilities": [
    "observe-deployment",
    "read-evidence",
    "propose-repair",
    "write-evidence"
  ],
  "governance": {
    "identity_required": true,
    "policy_engine": "opa",
    "relationship_engine": "openfga",
    "human_gate_required": true
  },
  "delivery": {
    "framework": "coolify",
    "mode": "air-gapped-edge",
    "mcp_contract": "examples/mcp-coolify-edge-contract.json"
  },
  "evidence": {
    "decision_log_required": true,
    "tool_call_log_required": true,
    "deployment_log_required": true
  }
}
```

This contract turns the agent from a piece of code into an accountable unit of the platform.

## Agent As API Surface

The agent exposes work through protocol surfaces.

| Surface | Role |
| --- | --- |
| MCP | Tool, resource, and prompt access |
| A2A | Agent-to-agent handoff |
| REST or GraphQL | Application and admin integration |
| Event stream | Deployment, evidence, lifecycle, and repair events |
| UI | Operator control, review, approval, and replay |

MCP is the capability surface. A2A is the collaboration surface. Events are the evidence surface. UI is the human gate.

The agent may use all of them, but it must not bypass governance.

## Agent As Deployment Unit

An agent platform unit must be deployable.

For this book, Coolify is the delivery framework.

```text
Agent contract
  -> MCP contract
  -> container image
  -> Coolify app
  -> health check
  -> policy gate
  -> evidence sink
  -> operator handoff
```

An agent deployment is not complete when the container starts.

It is complete when:

- identity is issued
- policy is loaded
- tools are discoverable
- health checks pass
- evidence sink works
- rollback exists
- operator handoff is recorded

## Agent As Economic Unit

An agent platform unit can also become an economic unit.

It can be measured by:

- usage
- cost
- trust
- revenue
- settlement
- value delivered
- failures avoided
- time saved
- approvals required
- repair loops completed

But economics must follow governance. An agent should not be allowed to earn, spend, sell, or settle unless identity, policy, audit, and approval gates are in place.

```text
identity before account
policy before action
evidence before payment
trust before scale
```

## Agent As Store Item

If an agent is a platform unit, it can be published into a store.

The store item must include:

- agent contract
- publisher identity
- version
- capabilities
- required tools
- required data access
- risk class
- deployment modes
- pricing or settlement model
- support boundary
- audit requirements
- security review status
- rollback instructions

The store does not sell magic. The store publishes governed capability.

## Minimum Viable Governance

No production agent platform unit should run without:

- stable identity
- declared owner
- declared objective
- denied-by-default policy
- scoped tools
- scoped resources
- human gate for high-risk action
- trace id for every action
- evidence record for every action
- suspension path
- retirement path

Without these, the agent may be useful, but it is not yet platform-grade.

## Operating Principle

The operating principle is:

```text
Specification
  -> Action
  -> Verification
  -> Evidence
  -> Reconciliation
```

The agent is allowed to act only inside a specification. The action must be verified. The verification must become evidence. The evidence must feed reconciliation.

This is how Agent as Platform avoids becoming uncontrolled automation.

## Final Position

Agent as Platform is the bridge between idea and operation.

It lets a human define intent, lets the agent act through governed capabilities, lets the platform record evidence, and lets the organization scale without losing accountability.

The agent is not replacing the platform.

The agent is becoming the smallest accountable unit of the platform.
