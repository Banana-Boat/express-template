import { Prisma } from "@prisma/client";
import store from "../../store.js";

export async function createUser(user: Prisma.UserCreateInput) {
  return await store.user.create({
    data: user,
  });
}
