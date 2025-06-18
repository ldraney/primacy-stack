-- schema.sql for session: accounts-prod-pipeline
-- Models Accounts → IPOs → SKUs → EPOs → Vendors → Contacts
-- Created: 2025-06-18

CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  status TEXT,
  manager TEXT,
  user_name TEXT
);

CREATE TABLE ipos (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  account_id INTEGER REFERENCES accounts(id),
  status TEXT,
  payment_status TEXT
);

CREATE TABLE skus (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  ipo_id INTEGER REFERENCES ipos(id),
  status TEXT
);

CREATE TABLE vendors (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE contacts (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  vendor_id INTEGER REFERENCES vendors(id),
  email TEXT,
  phone TEXT
);

CREATE TABLE epos (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  sku_id INTEGER REFERENCES skus(id),
  vendor_id INTEGER REFERENCES vendors(id),
  status TEXT
);

