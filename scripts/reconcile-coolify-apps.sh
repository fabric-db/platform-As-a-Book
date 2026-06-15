#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REGISTRY_PATH="${ROOT_DIR}/coolify/apps.registry.json"

COOLIFY_URL="${COOLIFY_URL:-}"
COOLIFY_TOKEN="${COOLIFY_TOKEN:-}"
COOLIFY_SERVER_UUID="${COOLIFY_SERVER_UUID:-}"
COOLIFY_PROJECT_UUID="${COOLIFY_PROJECT_UUID:-}"
COOLIFY_ENVIRONMENT_NAME="${COOLIFY_ENVIRONMENT_NAME:-production}"
COOLIFY_CREATE_DOCKER_COMPOSE_PATH="${COOLIFY_CREATE_DOCKER_COMPOSE_PATH:-/api/v1/applications/dockercompose}"
COOLIFY_DEPLOY_PATH="${COOLIFY_DEPLOY_PATH:-/api/v1/deploy}"
DRY_RUN="${DRY_RUN:-true}"

PAYLOADS_PATH="$(mktemp)"
trap 'rm -f "${PAYLOADS_PATH}"' EXIT

python3 - "${ROOT_DIR}" "${REGISTRY_PATH}" "${PAYLOADS_PATH}" "${COOLIFY_ENVIRONMENT_NAME}" "${COOLIFY_SERVER_UUID}" "${COOLIFY_PROJECT_UUID}" <<'PY'
import json
import sys
from pathlib import Path

root = Path(sys.argv[1])
registry_path = Path(sys.argv[2])
payloads_path = Path(sys.argv[3])
environment_name = sys.argv[4] or "production"
server_uuid = sys.argv[5]
project_uuid = sys.argv[6]

registry = json.loads(registry_path.read_text())
if registry.get("kind") != "coolify.apps.registry":
    raise SystemExit("Invalid app registry kind")

slugs = set()
payloads = []
for app in registry.get("apps", []):
    slug = app["slug"]
    if slug in slugs:
        raise SystemExit(f"Duplicate app slug: {slug}")
    slugs.add(slug)

    if not app.get("enabled", False):
        continue
    if app.get("store") != "anydb":
        raise SystemExit(f"{slug} must store at anydb")
    if app.get("ledger") != "bookkeeper":
        raise SystemExit(f"{slug} must use bookkeeper as ledger")
    if app.get("gate") != "release-gate":
        raise SystemExit(f"{slug} must hand off at release-gate")

    for key in ["compose_file", "contract_file", "env_config_file", "handoff_file"]:
        path = root / app[key]
        if not path.exists():
            raise SystemExit(f"{slug} missing {key}: {app[key]}")

    env_config = (root / app["env_config_file"]).read_text()
    missing_env = [
        name for name in app["required_env"]
        if f"{name}=" not in env_config and f"{name}:" not in env_config
    ]
    if missing_env:
        raise SystemExit(f"{slug} env config missing values: {missing_env}")

    handoff = json.loads((root / app["handoff_file"]).read_text())
    if handoff.get("gate") != app["gate"]:
        raise SystemExit(f"{slug} handoff gate mismatch")
    if handoff.get("store") != app["store"]:
        raise SystemExit(f"{slug} handoff store mismatch")
    if handoff.get("ledger") != app["ledger"]:
        raise SystemExit(f"{slug} handoff ledger mismatch")

    compose_raw = (root / app["compose_file"]).read_text()
    payloads.append({
        "slug": slug,
        "name": app["name"],
        "description": app.get("description", ""),
        "docker_compose_raw": compose_raw,
        "domains": app.get("domains", []),
        "build_pack": "dockercompose",
        "environment_name": environment_name,
        "server_uuid": server_uuid,
        "project_uuid": project_uuid,
        "required_env": app["required_env"],
        "gate_handoff": handoff["id"],
    })

if not payloads:
    raise SystemExit("No enabled apps to reconcile")

payloads_path.write_text("\n".join(json.dumps(item) for item in payloads) + "\n")
print(f"Validated {len(payloads)} Coolify app(s)")
PY

if [[ "${DRY_RUN}" == "true" ]]; then
  echo "Dry run: generated Coolify payloads"
  cat "${PAYLOADS_PATH}"
  exit 0
fi

for required in COOLIFY_URL COOLIFY_TOKEN COOLIFY_SERVER_UUID COOLIFY_PROJECT_UUID; do
  if [[ -z "${!required:-}" ]]; then
    echo "Missing required environment variable: ${required}" >&2
    exit 1
  fi
done

while IFS= read -r payload; do
  response="$(
    curl -fsS \
      -X POST \
      -H "Authorization: Bearer ${COOLIFY_TOKEN}" \
      -H "Content-Type: application/json" \
      --data "${payload}" \
      "${COOLIFY_URL%/}${COOLIFY_CREATE_DOCKER_COMPOSE_PATH}"
  )"
  uuid="$(
    python3 -c 'import json,sys; data=json.load(sys.stdin); print(data.get("uuid") or data.get("application_uuid") or data.get("id") or "")' <<<"${response}"
  )"
  if [[ -n "${uuid}" ]]; then
    curl -fsS \
      -X GET \
      -H "Authorization: Bearer ${COOLIFY_TOKEN}" \
      "${COOLIFY_URL%/}${COOLIFY_DEPLOY_PATH}?uuid=${uuid}" >/dev/null
  fi
done < "${PAYLOADS_PATH}"

echo "Coolify app reconcile completed"
