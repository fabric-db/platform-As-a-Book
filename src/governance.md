# Governance

Governance is the system that makes autonomy accountable.

The platform should be deny by default.

## Governance Layers

```text
Identity
  -> Authentication
  -> Authorization
  -> Policy
  -> Approval
  -> Execution
  -> Audit
  -> Evidence
```

## Policy Requirements

Policies should be:

- explicit
- versioned
- testable
- reviewable
- enforceable
- explainable

## Decision Log

Every meaningful decision should record:

- actor
- objective
- context
- inputs
- policy result
- approval state
- action taken
- timestamp
- evidence link

## Separation Of Duties

The same actor should not define, approve, execute, and audit a high-risk change alone.

The platform should model separation of duties as policy, not as informal process.
