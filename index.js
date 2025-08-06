import express from 'express';
import { fileURLToPath } from 'url';
import path from 'path';
import dotenv from 'dotenv';
import fs from 'fs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const envPath = path.join(__dirname, '.env');
if (fs.existsSync(envPath)) {
  dotenv.config({ path: envPath });
}
console.log(`Environment variables loaded from ${envPath}`);
console.log(`ENV: ${JSON.stringify(process.env, null, 2)}`);
const app = express();
const port = process.env.PORT || 3000;
const host = process.env.HOST || 'localhost';

// Define a route for the home page
app.get('/', (req, res) => {
  res.send('Hello, World!');
});

// Start the server
const server = app.listen(port, host, () => {
  console.log(`Server is running on http://${host}:${port}`);
});

function shutdown(signal) {
  console.log(`Received ${signal}. Shutting down gracefully...`);
  server.close(() => {
    console.log('Server closed');
    process.exit(0);
  });
}

// Handle graceful shutdown on SIGINT
process.on('SIGINT', () => {
  shutdown('SIGINT');
});

process.on('SIGTERM', () => {
  shutdown('SIGTERM');
})
