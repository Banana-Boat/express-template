import { Request, Response, NextFunction } from "express";
import { createUser } from "../../models/users/user.model.js";

export async function register(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const user = await createUser(req.body);

    res.status(200).json({
      code: "0",
      msg: "成功",
      data: {
        user,
      },
    });
  } catch (err) {
    next(err);
  }
}
