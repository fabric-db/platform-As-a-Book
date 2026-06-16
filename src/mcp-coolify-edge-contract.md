# MCP Coolify Edge Contract

MCP is the API contract. Coolify is the delivery framework. Edge is the runtime boundary. Air-gapped delivery is the discipline that makes the same contract work when the network is unavailable, restricted, or intentionally private.

This chapter defines the framework for deploying MCP servers as governed Coolify applications that can run on VPS, bare metal, private cloud, or edge nodes.

```text
Book
  -> MCP API contract
  -> Coolify delivery contract
  -> Edge bundle
  -> Air-gapped install
  -> Runtime evidence
  -> Book update
```

## Framework Definition

The framework is named:

```text
MCP Coolify Edge Delivery Framework
```

It binds four layers:

| Layer | Role |
| --- | --- |
| MCP contract | Defines tools, resources, prompts, lifecycle, transport, errors, and authorization expectations |
| AGenNext governance | Defines identity, policy, approvals, audit, trust, cost, data classification, and kill switch |
| Coolify delivery | Defines app, image, compose, env, domain, health, rollback, and deployment evidence |
| Edge runtime | Defines air-gapped bundle, local registry, local secrets, offline policy, local logs, and sync strategy |

The result is a single contract that can answer what the MCP server exposes, who can call it, what data it can read or write, how it is deployed, how it operates without internet access, what evidence proves it ran correctly, and what blocks release at the gate.

## Core Rule

Every MCP server must be declared before it is deployed.

The declaration must include:

- MCP protocol version
- server identity
- tools
- resources
- prompts
- transport
- authorization mode
- input and output schemas
- error semantics
- audit events
- policy checks
- Coolify service binding
- environment variables
- image digest or build source
- health endpoint
- edge bundle requirements
- air-gap validation

If any of these are missing, the deployment can exist only as a draft.

## MCP Layer

The MCP layer defines the interface between agents and capability servers.

Required MCP objects:

- `server`: name, version, owner, risk class
- `protocol`: MCP protocol version and supported capabilities
- `transport`: stdio, streamable HTTP, or both
- `tools`: executable actions with input and output schemas
- `resources`: contextual data with URI patterns and access rules
- `prompts`: reusable prompt templates, if provided
- `errors`: protocol errors and tool execution errors
- `notifications`: list change, progress, and audit-relevant events

The contract follows the MCP model: JSON-RPC messages, lifecycle negotiation, and server primitives for tools, resources, and prompts.

## Coolify Delivery Layer

Coolify is the deployment framework for MCP servers.

Each MCP server maps to a Coolify application or compose service:

```text
mcp.server
  -> container image
  -> Coolify application
  -> route/domain
  -> env contract
  -> health check
  -> logs
  -> rollback
```

Coolify must know how to deploy the server, but AGenNext must know why the server is allowed to exist.

Required Coolify fields:

- application name
- image or source repository
- pinned image tag or digest
- port
- health path
- required env variables
- persistent volumes
- deployment strategy
- rollback requirement
- deployment evidence

For production, image handoff is preferred:

```text
GitHub
  -> build image
  -> scan/sign/prove
  -> push to registry
  -> Coolify deploys pinned image
```

For air-gapped production, the registry is local:

```text
connected build zone
  -> signed image archive
  -> SBOM and provenance
  -> offline transfer
  -> local registry
  -> Coolify deploys local image
```

## Edge Delivery Layer

Edge delivery means the MCP server can run close to the user, device, data source, factory, branch, vehicle, clinic, school, or private tenant.

The edge node must carry:

- container images
- compose file
- env template
- sealed secret file or local secret reference
- policy bundle
- OpenFGA tuple snapshot, if authorization is local
- schema bundle
- migration bundle
- audit sink configuration
- rollback image
- verification manifest

No edge runtime should require public internet access to start, authorize, run, log, or roll back.

## Air-Gapped Delivery

Air-gapped delivery is not just offline installation. It is a complete release path.

The air-gapped bundle must include:

- `bundle.json`: release manifest
- `images/`: OCI image archives with digests
- `compose/`: Coolify-compatible compose files
- `schemas/`: MCP, input, output, and data schemas
- `policies/`: OPA bundles and policy metadata
- `authz/`: OpenFGA model and tuple snapshots when used
- `secrets/`: encrypted secret placeholders, never plaintext production secrets
- `evidence/`: SBOM, provenance, signatures, checksums
- `runbooks/`: install, verify, rollback, and repair steps

Air-gapped validation must pass before promotion:

- all image digests resolve locally
- no `latest` tags in production
- no public registry dependency
- no public callback dependency
- health checks run locally
- policy decisions run locally
- audit events write locally
- rollback artifact exists locally
- operator approval is recorded

## Governance Gate

The governance gate decides whether a tool can be called.

Each tool call must carry or derive:

- subject identity
- agent identity
- workspace or tenant
- purpose
- data classification
- policy decision
- approval state
- cost budget
- trace id
- evidence id

The gate can deny a call before it reaches the MCP server.

```text
agent intent
  -> identity check
  -> relationship check
  -> policy check
  -> budget check
  -> approval check
  -> MCP tool call
  -> audit event
```

## Exact Design

The design has seven runtime components.

| Component | Runs in | Responsibility |
| --- | --- | --- |
| Agent host | AGenNext console, worker, CLI, or partner host | Decides that a capability is needed and requests MCP access |
| MCP client | Inside the host | Opens the MCP session, negotiates capabilities, calls tools, reads resources |
| Governance gateway | AGenNext edge control service | Enforces identity, policy, relationship, approval, budget, and audit gates |
| MCP server | Coolify application | Exposes tools, resources, prompts, and logs MCP-level events |
| Policy engine | Local OPA service | Returns allow, deny, or approve-required decisions |
| Relationship engine | Local OpenFGA or local snapshot | Checks subject, agent, workspace, resource, and action relationships |
| Evidence store | AnyDB, BookKeeper, file ledger, or local append log | Records request, decision, tool call, result, and deployment evidence |

The design is intentionally split. MCP is not the governance layer. MCP exposes capability. The governance gateway decides whether capability may be used.

## Runtime Topology

Central connected deployment:

```text
AGenNext host
  -> MCP client
  -> Governance gateway
  -> MCP server on Coolify
  -> OPA / OpenFGA / AnyDB
  -> evidence ledger
```

Edge connected deployment:

```text
Local AGenNext host
  -> local MCP client
  -> local governance gateway
  -> local Coolify MCP server
  -> local OPA / OpenFGA snapshot / local evidence
  -> optional upstream sync
```

Air-gapped deployment:

```text
Local AGenNext host
  -> local MCP client
  -> local governance gateway
  -> local Coolify MCP server
  -> local policy bundle
  -> local relationship snapshot
  -> local append-only evidence
```

Air-gapped mode must not call public registries, public identity providers, public policy services, public telemetry, or public webhooks during runtime.

## Request Execution Path

Every tool call follows the same path:

```text
1. Host receives user or agent intent.
2. MCP client discovers server capabilities.
3. Host selects a tool, resource, or prompt.
4. Governance gateway builds a decision context.
5. Identity is verified.
6. Relationship check runs.
7. Policy check runs.
8. Budget and rate limits run.
9. Human approval is requested when required.
10. MCP tool call is sent.
11. MCP server validates input schema.
12. Tool executes.
13. MCP server validates output schema.
14. Evidence is written.
15. Result returns to the host.
```

This sequence is the normal path. A failed check stops the call before execution.

## API Contract Shape

The API contract is not a REST-first contract. It is an MCP-first contract with an operational shell.

```text
MCP API contract
  server metadata
  protocol version
  lifecycle expectations
  tools
  resources
  prompts
  schema links
  error modes

Governance contract
  identity
  relationship model
  policy bundle
  approval rules
  audit requirements

Delivery contract
  Coolify app
  image or compose source
  env vars
  ports
  health checks
  rollback

Edge contract
  bundle manifest
  local registry
  offline dependencies
  checksums
  evidence
```

This is why the contract file is named `mcp.coolify.edge.contract`. It is one deployable promise across interface, governance, delivery, and runtime.

## Tool Design Rules

Each MCP tool must be small, typed, governed, and auditable.

Required tool fields:

- stable name
- human description
- input schema
- output schema
- risk class
- approval requirement
- timeout budget
- idempotency rule
- audit event name
- rollback or compensation rule, when mutation occurs

Tool names should use domain verbs:

```text
fabric.query
fabric.writeEvidence
agent.proposeRepair
agent.applyRepair
deployment.verify
deployment.rollback
```

Avoid vague tools:

```text
run
execute
doTask
adminAction
```

The tool name must tell the gate what kind of power is being requested.

## Resource Design Rules

Resources are context, not commands.

Required resource fields:

- URI template
- description
- classification
- owner
- freshness rule
- cache rule
- offline availability
- access policy

Examples:

```text
fabric://schema/{name}
fabric://agent/{agent_id}
fabric://evidence/{trace_id}
deployment://coolify/{application}/latest
policy://opa/{bundle}
```

Resource access must be checked the same way tool access is checked.

## Prompt Design Rules

Prompts are reusable operating patterns. Prompts may propose action. They must not silently grant authority.

Examples:

```text
fabric.repair-plan
deployment.rollback-plan
policy.explain-denial
edge.sync-summary
```

## Coolify Design Rules

Every MCP server deployed through Coolify must include:

- one service name
- one internal port
- one health endpoint
- required env variables marked as required
- image tag pinned by release
- digest required for production and edge
- restart policy
- log collection
- rollback image
- operator owner

The compose file must be readable as the runtime truth. If the service depends on OPA, OpenFGA, AnyDB, BookKeeper, or a local registry, that dependency must be visible in the compose or deployment contract.

## Edge Bundle Layout

The edge bundle should have this layout:

```text
agennext-mcp-edge-bundle/
  bundle.json
  checksums.txt
  images/
    agennext-fabric-mcp.oci.tar
    opa.oci.tar
    openfga.oci.tar
  compose/
    agennext-mcp-edge.compose.yml
  env/
    edge.env.example
  schemas/
    mcp-coolify-edge-contract.schema.json
    tools/
  policies/
    mcp-fabric.tar.gz
  authz/
    fabric.fga
    tuples.snapshot.json
  evidence/
    sbom.spdx.json
    provenance.intoto.jsonl
    signatures/
  runbooks/
    install.md
    verify.md
    rollback.md
    repair.md
```

The bundle must be self-describing. An operator should be able to verify what it contains before running it.

## Execution Modes

| Mode | Use when | Network requirement | Delivery strategy |
| --- | --- | --- | --- |
| `central` | Normal server or SaaS deployment | Public or private network allowed | Coolify source or image handoff |
| `edge` | Local execution with optional upstream sync | Private network allowed | Coolify image handoff |
| `air-gapped-edge` | Offline or restricted runtime | No public runtime network | Offline bundle and local registry |

The same MCP contract should work across all three modes. Only the delivery and dependency bindings change.

## Build And Release Flow

```text
1. Write contract.
2. Validate contract schema.
3. Build MCP server image.
4. Run tool schema tests.
5. Run policy tests.
6. Generate SBOM.
7. Generate provenance.
8. Sign image and bundle.
9. Create Coolify deployment contract.
10. Create edge bundle.
11. Verify bundle offline.
12. Operator approves.
13. Deploy through Coolify.
14. Run health checks.
15. Write evidence.
```

The approval gate remains explicit for high and critical risk classes.

## Failure Modes

| Failure | Required behavior |
| --- | --- |
| Contract invalid | Block deployment |
| Tool schema missing | Block deployment |
| Policy bundle missing | Block deployment |
| Identity issuer unavailable in air-gap | Use local issuer or block |
| Image digest missing | Block edge promotion |
| Health check fails | Roll back or stay staged |
| Audit sink unavailable | Block high-risk tool calls |
| Approval missing | Return approve-required, do not execute |
| Public network required in air-gap | Block promotion |

The platform must fail closed. Draft is acceptable. Silent production drift is not.

## Contract Files

The concrete contract lives in:

- `schemas/mcp-coolify-edge-contract.schema.json`
- `examples/mcp-coolify-edge-contract.json`
- `coolify/agennext-mcp-edge.compose.yml`

These files define the deployable unit and the validation surface.

## Release States

| State | Meaning |
| --- | --- |
| `draft` | Contract exists but cannot deploy |
| `reviewed` | Contract is structurally complete |
| `approved` | Governance gate accepts release |
| `staged` | Coolify deployment is configured |
| `edge-bundled` | Air-gapped bundle is generated |
| `active` | Runtime is live |
| `probation` | Runtime is live but under watch |
| `suspended` | Calls are blocked |
| `retired` | Runtime is intentionally removed |

## Non-Negotiables

- MCP defines the interface.
- Coolify delivers the runtime.
- AGenNext governs identity, policy, trust, and evidence.
- Edge nodes must run without public network dependency.
- Air-gapped bundles must be verifiable before install.
- Every call must be auditable.
- Every deployment must have a rollback path.
