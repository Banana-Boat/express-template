import { Request, Response, NextFunction } from "express";

async function test(req: Request, res: Response, next: NextFunction) {
  try {
    res.status(200).json({
      code: "0",
      msg: "成功",
      data: {},
    });
  } catch (err) {
    console.error(err);
    next(err);
  }
}

export { test };
