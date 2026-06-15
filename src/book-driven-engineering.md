# Book Driven Engineering

Book Driven Engineering means every major chapter produces something executable or verifiable.

The book is readable by humans, but structured enough to generate and validate platform artifacts.

## Chapters Produce Artifacts

| Chapter | Produced artifacts |
| --- | --- |
| Identity | DID models, VC schemas, account lifecycle, access boundaries |
| Governance | OPA policies, approval rules, compliance evidence |
| Data | JSON Schema, schema.org models, graph models |
| Runtime | Kubernetes manifests, CRDs, operators, reconciliation loops |
| Agents | Agent cards, contracts, skills, capabilities, evaluation rules |
| Operations | Runbooks, SLOs, incident records, recovery procedures |

## Engineering Loop

```text
Chapter
  -> Structured Artifact
  -> Validation
  -> Build
  -> Deploy
  -> Observe
  -> Chapter Update
```

The book is not static. It evolves with the platform.

## Definition Of Done

A platform change is not done when code is merged.

It is done when:

- the book explains the change
- generated artifacts are valid
- policy impact is known
- operational impact is recorded
- the runtime can be reconciled
- evidence can be audited
