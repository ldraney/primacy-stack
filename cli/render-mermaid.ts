/**
 * Render Mermaid from board link query result
 * Usage: tsx render-mermaid.ts input.json
 */

import fs from 'fs';

const data = JSON.parse(fs.readFileSync(process.argv[2], 'utf-8'));

console.log('graph TD');
for (const row of data) {
  const from = row.from_board.replace(/\s+/g, '');
  const to = row.to_board.replace(/\s+/g, '');
  const label = row.relationship_type;
  console.log(`  ${from}["Board: ${row.from_board}"] -->|"${label}"| ${to}["Board: ${row.to_board}"]`);
}
