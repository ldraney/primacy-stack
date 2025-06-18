-- Ensure accounts board exists
INSERT INTO board (id, name, purpose)
VALUES ('accounts', 'Accounts', 'Track customer accounts and client handoff')
ON CONFLICT (id) DO NOTHING;

-- Leads Manager sets up accounts
INSERT INTO board_link (from_board_id, to_board_id, relationship_type)
VALUES ('leads', 'accounts', 'linked-column')
ON CONFLICT DO NOTHING;

-- Accounts Manager connects to dev + prod deals
INSERT INTO board_link (from_board_id, to_board_id, relationship_type)
VALUES 
  ('accounts', 'dev_deals', 'linked-column'),
  ('accounts', 'prod_deals', 'linked-column')
ON CONFLICT DO NOTHING;
