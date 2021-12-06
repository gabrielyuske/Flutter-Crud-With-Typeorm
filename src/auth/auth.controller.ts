import {Request, Response} from "express";
import {getManager} from "typeorm";
import {UserRepository} from "./repository/user.repo";

export class AuthController{
    static async createUser(req:Request,res:Response){
        let manager = await getManager().getCustomRepository(UserRepository);
        await manager.createUser(req,res);
    }
    static async fetchUser(req:Request,res:Response){
        let manager = await getManager().getCustomRepository(UserRepository);
        await manager.fetchUser(req,res);
    }
    static async deleteUser(req:Request,res:Response){
        let manager = await getManager().getCustomRepository(UserRepository);
        await manager.deleteUser(req,res);
    }
    static async updateUser(req:Request,res:Response){
        let manager = await getManager().getCustomRepository(UserRepository);
        await manager.updateUser(req,res);
    }
}