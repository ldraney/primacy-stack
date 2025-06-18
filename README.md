# Primacy Stack – Pure Earth Labs Ops Map

> **Purpose:** A living operational map of Pure Earth Labs' Monday.com environment. It models internal workflows (like IPOs, EPOs, SKU production, and vendor coordination) in a queryable, visual way using Postgres, Mermaid, and AI.

---

## 🧭 What This Repo Does (With or Without Postgres)
This repo is not generic. It is **Lucas Draney's source of truth** for mapping the workflows, personnel, and operational boards at Pure Earth Labs.

### It lets you use this repo in two ways:

#### Without Postgres (Zero Setup Required):
- Read and expand the schemas in `/schema` to model real Monday boards
- Use AI to reason about board connections and status logic
- Regenerate or update Mermaid diagrams in `/diagrams`
- Maintain system design over time

#### With Postgres (For Deeper Insight):
- Define how boards (Accounts, Prod Deals, Production, Purchasing, Vendors, Contacts) link together
- Populate real or example data into the schema to reflect live statuses of accounts and tickets in Monday
- Diagram those flows in Mermaid
- Store and query that structure using a local Postgres DB
- Regenerate or expand diagrams using prompts
- Iterate over time as workflows change (Accounts, Prod Deals, Production, Purchasing, Vendors, Contacts) link together
- Diagram those flows in Mermaid
- Store and query that structure using a local Postgres DB
- Regenerate or expand diagrams using prompts
- Iterate over time as workflows change

---

## 🛠️ How To Use This Repo (Choose Your Path)

### ✅ If you're just modeling and diagramming (no Postgres):
1. Clone and open the repo:
```bash
git clone https://github.com/YOUR_USERNAME/primacy-stack.git
cd primacy-stack
```
2. Open `/schema/` and `/diagrams/`
3. Ask GPT to generate or revise Mermaid charts based on your schema

---

### 🐘 If you want to simulate real data and queries:
```bash
git clone https://github.com/YOUR_USERNAME/primacy-stack.git
cd primacy-stack
```

### 2. Start Local Postgres
```bash
docker compose up -d
```

### 3. Rebuild Schema (if needed)
```bash
docker exec -it primacy-db psql -U postgres -f /schema/init.sql
```

### 4. Load Example Data (to preview diagrams)
```bash
docker exec -it primacy-db psql -U postgres -f /schema/example-production.sql
```

### 5. Prompt GPT to Regenerate a Diagram
```text
I’m using my `primacy-stack` repo. Look at the schema and regenerate the diagram that shows:
- Account → IPO → SKU → EPO → Vendor → Contact
Based on the latest schema and data.
```

---

## 🗺️ Boards and Entities Modeled
| Board          | Item Name | Purpose                                                                 |
|----------------|-----------|-------------------------------------------------------------------------|
| Accounts        | Account    | Represents a business customer or brand (e.g., Brickell Brands)         |
| Prod Deals      | IPO        | Internal purchase orders; payment + deal pipeline                       |
| PEL Production  | SKU        | Oversees fulfillment of IPOs (bulk, batching, linework)                 |
| Purchasing      | EPO        | Tracks external purchasing for raw materials or packaging               |
| Vendors         | Vendor     | Businesses we order from                                                |
| Contacts        | Contact    | People at those vendors (emails, phone, etc.)                           |


---

## 📐 Diagram Prompts You Can Reuse
Paste these to regenerate visuals as boards evolve:

### 🌱 Basic Flow Prompt
```text
Generate a Mermaid diagram showing:
Accounts → IPOs → SKUs → EPOs → Vendors → Contacts
```

Expected Output:
```
graph TD
  Account --> IPO
  IPO --> SKU
  SKU --> EPO
  EPO --> Vendor
  Vendor --> Contact
```

### 📊 Show All EPOs Blocking SKU Production
```sql
SELECT s.name AS sku, e.name AS epo, e.status
FROM skus s
JOIN epos e ON e.sku_id = s.id
WHERE e.status != 'Received';
```

Then prompt:
```text
Render a Mermaid diagram showing which SKUs are blocked by pending EPOs.
```

---

## 🧱 Project Structure
```
primacy-stack/
├── cli/                  # TypeScript tools (WIP)
├── data/                 # JSON board stubs
├── diagrams/             # Mermaid `.mmd` files by board or flow
├── schema/               # SQL schema for PEL operational entities
├── scripts/              # Bash automation
├── tmp/                  # Local output from scripts (JSON, intermediate)
├── docker-compose.yml    # Postgres container
```

---

## ✍️ How to Modify Schema
1. Add a new `.sql` file to `schema/` (e.g. `contact-links.sql`)
2. Include it in `init.sql`
3. Rerun Postgres init to reload the schema

---

## ❓ Do I Really Need Postgres?
Not always. Postgres is optional unless you want to:
- Run actual queries on data (e.g. open IPOs, blocked SKUs)
- Generate Mermaid diagrams from query results
- Sync real statuses from Monday exports

For most modeling and planning, the schema files and Mermaid are enough.

---

## 🧠 Design Philosophy: Schema + Query = Diagram

Every diagram you generate should be traceable to a table — whether that table is conceptual (from your schema) or actual (from live query results).

This means:
- You iterate on schemas to represent the real structure of your boards
- You create representative queries to simulate or extract current board states
- Diagrams are then a direct output of queries, giving you visual proof of operational truth

This is why Postgres is helpful — but only after you've designed your schema well.

---

## 🎯 Goal
To maintain a **working map of all Monday boards and how they’re used at Pure Earth Labs**, including:
- What entities exist
- Who owns them
- What relationships they track
- Where the bottlenecks are

This lets Lucas:
- Track all real accounts and projects across all teams
- Use AI to generate diagrams and queries for reporting
- Scale operational clarity as teams grow and workflows evolve

