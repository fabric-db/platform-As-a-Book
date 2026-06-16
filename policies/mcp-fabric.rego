package agennext.mcp.fabric

default allow := false
default approval_required := false

allow if {
	input.mcp.tool == "fabric.query"
	input.resource.classification != "restricted"
	input.subject.id != ""
	input.agent.trust_score >= 0.7
}

approval_required if {
	input.mcp.risk_class == "high"
}

approval_required if {
	input.mcp.risk_class == "critical"
}

allow if {
	input.mcp.tool == "fabric.writeEvidence"
	input.approval.status == "approved"
	input.agent.trust_score >= 0.85
}
