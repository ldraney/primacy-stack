#!/bin/bash

# ==============================================================================
# Script Name: organize-schema.sh
# Purpose: Organize existing schema files into a versioned session-based structure,
#          explain the pattern, and create a new modeling session directory.
# Author: Lucas Draney
# Date: 2025-06-18
# Usage: Run from root of primacy-stack repo
# ==============================================================================

set -e

# Step 1: Define paths
SCHEMA_DIR="./schema"
SESSION_DIR="$SCHEMA_DIR/sessions"
FIRST_SESSION="$SESSION_DIR/init-structure"

# Create sessions folder
mkdir -p "$SESSION_DIR"
mkdir -p "$FIRST_SESSION"

# Move existing schema files into the first session
mv "$SCHEMA_DIR/"*.sql "$FIRST_SESSION" 2>/dev/null || echo "No top-level .sql files found to move."

# Step 2: Create a top-level schema README
cat > "$SCHEMA_DIR/README.md" <<'EOF'
# Schema Directory – Structure and Usage

All SQL files are organized into sessions under `schema/sessions/`.

## 🔁 What is a Session?
Each session represents one focused modeling effort to map or extend an operational workflow at Pure Earth Labs. It includes:
- A `schema.sql` file defining tables and relationships
- An optional `mock-data.sql` for insertable test data
- A `README.md` explaining the purpose and scope

Each session links directly to a diagram session under `/diagrams/sessions/<name>/`.

## 📂 Structure
```
schema/
├── sessions/
│   ├── init-structure/
│   │   ├── schema.sql
│   │   ├── mock-data.sql (optional)
│   │   └── README.md
├── README.md
```

## 🧠 Why Sessions?
Sessions support iterative design and traceability. Each schema update is versioned, documented, and tied to visuals or prompts used for understanding and validation.
EOF

# Step 3: Start a new modeling session
NEW_SESSION="$SESSION_DIR/accounts-prod-pipeline"
mkdir -p "$NEW_SESSION"

touch "$NEW_SESSION/schema.sql"
touch "$NEW_SESSION/mock-data.sql"

cat > "$NEW_SESSION/README.md" <<'EOF'
# Session: Accounts to Production Pipeline

## Purpose
To model the flow of work from customer Accounts through IPOs, into SKUs in production, down to Purchasing, Vendors, and Contacts.

## Boards Covered
- Accounts
- Prod Deals
- PEL Production
- Purchasing
- Vendors
- Contacts

## Diagram
Will be created under `diagrams/sessions/accounts-prod-pipeline/flow.mmd`

## Prompts
```text
Generate a Mermaid diagram showing:
Accounts → IPOs → SKUs → EPOs → Vendors → Contacts
```

## Notes
- This session starts fresh and supersedes top-level schema drafts.
- Model real relationships and data evolution from Monday.
EOF

echo "✅ Schema files moved to: $FIRST_SESSION"
echo "✅ README.md created in schema/"
echo "✅ New session scaffold started at: $NEW_SESSION"
