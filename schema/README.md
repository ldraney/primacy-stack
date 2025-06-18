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
