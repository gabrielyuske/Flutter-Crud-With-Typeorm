import { Router } from "express";
import { AuthController } from "./auth/auth.controller";

const router = Router();

router.get("/",AuthController.fetchUser);
router.post("/add",AuthController.createUser);
router.delete("/delete",AuthController.deleteUser);
router.put("/update",AuthController.updateUser);

export {router};