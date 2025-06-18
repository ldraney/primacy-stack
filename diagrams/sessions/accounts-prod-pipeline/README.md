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
```# Session: Accounts to Production Pipeline

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
- Diagram must reflect the schema accurately.

## Next Step
Once this schema and its relationships are defined, generate:
1. SQL mock data for testing
2. Queries to simulate real-time board states
3. Mermaid diagrams from query outputs

The acceptance criteria are tracked in the diagram session README.


If multiple diagrams are needed (e.g. detailed vs high-level), they will be stored here with appropriate names.

---

## Notes
- This diagram represents the current best understanding of how internal operations flow from account initiation to vendor contact.
- Updates should follow updates to schema structure or feedback from usage.

---

## Next Step
Once this diagram is complete and committed, begin a new modeling session by copying the structure and evolving the schema.
