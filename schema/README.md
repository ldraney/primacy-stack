# Schema Overview: Monday System Mapper

This directory defines the JSON-based schema used to model Monday.com boards.

## Models

### Board
- `id`: Local ID
- `name`: Display name
- `purpose`: Short description
- `columns`: Array of Column objects
- `connected_boards`: Array of BoardLink objects
- `monday_board_id`: Actual Monday board ID (if synced)

### Column
- `id`, `name`, `type`, `settings`

### BoardLink
- `from_board_id`, `to_board_id`, `relationship_type`
