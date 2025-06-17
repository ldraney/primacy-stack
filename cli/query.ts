// primacy-stack/cli/query.ts
import { Client } from 'pg';
import fs from 'fs';

async function main() {
  const client = new Client({
    user: 'lucas',
    password: 'devpass',
    host: 'localhost',
    port: 5432,
    database: 'primacy',
  });

  await client.connect();

  const res = await client.query(`
    SELECT b1.name AS from_board, b2.name AS to_board, l.relationship_type
    FROM board_link l
    JOIN board b1 ON l.from_board_id = b1.id
    JOIN board b2 ON l.to_board_id = b2.id
    WHERE b1.id = 'leads';
  `);

  await client.end();

  fs.writeFileSync(process.argv[2] || '/dev/stdout', JSON.stringify(res.rows, null, 2));
}

main();

