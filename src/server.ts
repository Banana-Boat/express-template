import http from "http";
import dotenv from "dotenv";
import path from "path";
import { fileURLToPath } from "url";

import app from "./app.js";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
dotenv.config({
  path: path.join(__dirname, "..", `.env`),
});

const { SERVER_HOST, SERVER_PORT } = process.env;

const server = http.createServer(app);

server.listen(SERVER_PORT, () => {
  console.log(`Server is running on http://${SERVER_HOST}:${SERVER_PORT}...`);
});
