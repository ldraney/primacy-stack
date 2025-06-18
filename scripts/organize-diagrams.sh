#!/bin/bash

# ==============================================================================
# Script Name: organize-diagrams.sh
# Purpose: Organize existing diagram files into versioned sessions
# Author: Lucas Draney
# Date: 2025-06-18
# ==============================================================================

set -e

# Paths (script runs from repo root)
DIAGRAM_DIR="./diagrams"
SESSION_DIR="$DIAGRAM_DIR/sessions"
INIT_SESSION="$SESSION_DIR/init-structure"
NEW_SESSION="$SESSION_DIR/accounts-prod-pipeline"

# Verify diagrams directory exists
if [ ! -d "$DIAGRAM_DIR" ]; then
    echo "Error: diagrams/ directory not found"
    echo "Please run this script from the repo root directory"
    exit 1
fi

# 1. Move top-level diagrams into init session
mkdir -p "$INIT_SESSION"
find "$DIAGRAM_DIR" -maxdepth 1 -type f -name "*.mmd" -exec mv {} "$INIT_SESSION/" \;

# 2. Make the current working session directory
mkdir -p "$NEW_SESSION"

# 3. Create README for current diagram session
cat > "$NEW_SESSION/README.md" <<'EOF'
# Diagrams: Accounts to Production Pipeline

## Purpose
This directory stores all diagrams generated during the modeling of the "Accounts to Production Pipeline" session.

The diagrams here visualize the relationships defined in:
```
schema/sessions/accounts-prod-pipeline/schema.sql
```

---

## ✅ Acceptance Criteria for This Session
- A meaningful Mermaid diagram was generated based on `schema.sql`
- The diagram accurately represents:
  - Account → IPO → SKU → EPO → Vendor → Contact
  - Relationships defined in SQL schema
- This diagram was versioned (committed to GitHub)
- This visual asset allows AI or team members to:
  - Understand current system state
  - Use it as the foundation for next session's modeling or queries

---

## Artifacts
```
diagrams/sessions/accounts-prod-pipeline/flow.mmd    # main flow diagram
```

If multiple diagrams are needed (e.g. detailed vs high-level), they will be stored here with appropriate names.

---

## Notes
- This diagram represents the current best understanding of how internal operations flow from account initiation to vendor contact.
- Updates should follow updates to schema structure or feedback from usage.

---

## Next Step
Once this diagram is complete and committed, begin a new modeling session by copying the structure and evolving the schema.
EOF

# 4. Open README in nvim
nvim "$NEW_SESSION/README.md"
