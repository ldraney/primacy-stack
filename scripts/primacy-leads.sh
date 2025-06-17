#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

cd "$ROOT_DIR"

mkdir -p tmp diagrams

npx tsx cli/query.ts tmp/leads.json
npx tsx cli/render-mermaid.ts tmp/leads.json > diagrams/leads.mmd

echo "✅ Mermaid diagram generated at: diagrams/leads.mmd"
