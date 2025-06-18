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
