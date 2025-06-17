INSERT INTO board (id, name, purpose, monday_board_id)
VALUES ('leads_board', 'Leads', 'Track incoming sales leads', '123456789');

INSERT INTO board (id, name, purpose, monday_board_id)
VALUES ('deals_board', 'Deals', 'Track active deals and conversions', '987654321');

INSERT INTO board_column (id, board_id, name, type, settings)
VALUES
  ('col1', 'leads_board', 'Status', 'status', '{"labels": ["New", "Contacted", "Qualified"]}'),
  ('col2', 'leads_board', 'Owner', 'person', '{}');

INSERT INTO board_link (from_board_id, to_board_id, relationship_type)
VALUES ('leads_board', 'deals_board', 'linked-column');
