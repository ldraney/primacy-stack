-- Boards
INSERT INTO board (id, name, purpose)
VALUES 
  ('leads', 'Leads', 'Main workspace for managing inbound leads'),
  ('dev_deals', 'Dev Deals', 'Track development deal opportunities'),
  ('prod_deals', 'Prod Deals', 'Track production deal opportunities')
ON CONFLICT (id) DO NOTHING;

-- Links
INSERT INTO board_link (from_board_id, to_board_id, relationship_type)
VALUES 
  ('leads', 'dev_deals', 'linked-column'),
  ('leads', 'prod_deals', 'linked-column');
