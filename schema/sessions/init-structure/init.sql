DROP TABLE IF EXISTS board_link;
DROP TABLE IF EXISTS board_column;
DROP TABLE IF EXISTS board;

CREATE TABLE board (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  purpose TEXT,
  monday_board_id TEXT
);

CREATE TABLE board_column (
  id TEXT PRIMARY KEY,
  board_id TEXT REFERENCES board(id),
  name TEXT NOT NULL,
  type TEXT NOT NULL,
  settings JSONB
);

CREATE TABLE board_link (
  id SERIAL PRIMARY KEY,
  from_board_id TEXT REFERENCES board(id),
  to_board_id TEXT REFERENCES board(id),
  relationship_type TEXT
);
