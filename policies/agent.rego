package platform.agent

default allow := false

allow if {
  input.status == "active"
  input.risk_class != "critical"
}

requires_human_gate if {
  input.risk_class == "critical"
}
