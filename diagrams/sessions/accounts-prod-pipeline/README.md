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

## ✅ Files Involved in Making a Diagram (per session)

### 📁 `schema/sessions/accounts-prod-pipeline/`

| File            | Purpose                                                                                                    |
| --------------- | ---------------------------------------------------------------------------------------------------------- |
| `schema.sql`    | Defines entities (e.g. `accounts`, `ipos`, `skus`, etc.) and their relationships (via `FOREIGN KEY`, etc.) |
| `mock-data.sql` | Optional test inserts so you can query fake but meaningful data                                            |
| `README.md`     | Describes what the schema models and what diagram(s) should represent                                      |

---

### 📁 `diagrams/sessions/accounts-prod-pipeline/`

| File        | Purpose                                                                                                                         |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `flow.mmd`  | The actual Mermaid diagram generated from the schema and/or query output                                                        |
| `README.md` | Defines acceptance criteria, explains how the diagram is derived from the schema, and serves as a log of diagram intent/purpose |

---

## 🧠 Your Workflow (Confirmed + Clarified)

### To generate a meaningful Mermaid diagram:

1. ✅ Write or update `schema.sql`
   Define all tables and relationships for the current modeling goal.

2. (Optional) Add `mock-data.sql`
   Populate minimal but meaningful fake data so you can run example queries.

3. ✅ Write a SQL query that describes a data flow
   Example:

   ```sql
   SELECT a.name, i.name, s.name
   FROM accounts a
   JOIN ipos i ON i.account_id = a.id
   JOIN skus s ON s.ipo_id = i.id;
   ```

4. ✅ Translate the result or schema structure into a `.mmd` file
   (Eventually we can automate this, but manually is fine for now.)

5. ✅ Save the Mermaid chart as `flow.mmd`

6. ✅ Commit and push changes to GitHub

---

### 🗂️ Diagram Organization: Prompt-Driven vs Data-Driven

Diagrams in this session are organized into two categories:

* **`prompt-driven/`**
  Handcrafted based on operational understanding or system intent (e.g. how boards are linked in Monday). These don’t require database queries — just clarity about structure and flow.

* **`data-driven/`**
  Generated from SQL queries using mock or real data. These reflect actual states, relationships, or quantities (e.g. which IPOs are still open per account).

This split acknowledges that **effective architecture isn’t always data-bound**. Sometimes structure alone is enough to reason and plan.

Eventually, **prompt-driven diagrams may evolve into data-driven diagrams** as schema and data become available — creating a feedback loop between design and system state.

