-- mock-data.sql for session: accounts-prod-pipeline
-- Inserts minimal example data to simulate Monday workflows
-- Created: 2025-06-18

-- Accounts
INSERT INTO accounts (name, status, manager, user_name) VALUES
  ('Brickell Brands', 'Active', 'Mariana', 'Mitch');

-- IPOs
INSERT INTO ipos (name, account_id, status, payment_status) VALUES
  ('IPO-001', 1, 'In Progress', 'Partial');

-- SKUs
INSERT INTO skus (name, ipo_id, status) VALUES
  ('Lavender Cream 2oz', 1, 'Batching'),
  ('Coconut Balm 1oz', 1, 'Queued');

-- Vendors
INSERT INTO vendors (name) VALUES
  ('Essential Oils Co'),
  ('Jar Masters Inc');

-- Contacts
INSERT INTO contacts (name, vendor_id, email, phone) VALUES
  ('Alice Vendor', 1, 'alice@essential.com', '555-1001'),
  ('Bob Jar', 2, 'bob@jars.com', '555-2002');

-- EPOs
INSERT INTO epos (name, sku_id, vendor_id, status) VALUES
  ('EPO-001', 1, 1, 'Ordered'),
  ('EPO-002', 2, 2, 'Received');

