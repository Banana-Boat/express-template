import express from "express";
import cors from "cors";
import morgan from "morgan";

import { errorHandler } from "./error/errorHandler.js";
import userRouter from "./routes/users/user.router.js";

const app = express();

app.use(cors());

app.use(morgan("short"));

app.use(express.json());

app.use("/user", userRouter);

app.use(errorHandler);

export default app;
